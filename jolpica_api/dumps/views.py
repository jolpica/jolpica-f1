from __future__ import annotations

import logging

from django.http import HttpResponse, HttpResponseRedirect
from drf_spectacular.utils import OpenApiParameter, extend_schema
from rest_framework import response, status
from rest_framework.views import APIView

from .permissions import CanDownloadLatestDumpPermission, CanUploadDumpsPermission
from .serializers import (
    DumpOverviewInfoSerializer,
    DumpsOverviewResponseSerializer,
    DumpUploadCompleteRequestSerializer,
    DumpUploadCompleteResponseSerializer,
    DumpUploadStartRequestSerializer,
    DumpUploadStartResponseSerializer,
)
from .services import (
    check_duplicate_dump,
    confirm_dump_upload,
    create_or_update_dump,
    generate_download_presigned_url,
    generate_s3_key,
    generate_upload_presigned_url,
    get_available_dump_types,
    get_latest_delayed_dump,
)

DUMP_DOWNLOAD_DELAY_DAYS = 14

logger = logging.getLogger(__name__)


@extend_schema(
    tags=["dumps"],
    summary="Request dump upload URL",
    description=(
        "Request to upload a new database dump. "
        "Requires authentication and 'can_upload_dumps' permission. "
        "If a dump with the same hash already exists, returns exists=true. "
        "Otherwise, creates a new dump record and returns an upload URL."
    ),
    request=DumpUploadStartRequestSerializer,
    responses={200: DumpUploadStartResponseSerializer},
)
class DumpUploadStartView(APIView):
    """API endpoint for requesting dump upload URLs."""

    permission_classes = [CanUploadDumpsPermission]

    def post(self, request) -> response.Response:
        """Request an upload URL for a dump file.

        Checks if a dump with the same type and hash already exists.
        If not, creates a new dump record and returns an upload URL.

        Returns:
            Response with upload URL or exists=True if duplicate
        """
        serializer = DumpUploadStartRequestSerializer(data=request.data)
        serializer.is_valid(raise_exception=True)

        dump_type = serializer.validated_data["dump_type"]
        file_hash = serializer.validated_data["file_hash"]
        file_size = serializer.validated_data["file_size"]
        metadata = serializer.validated_data.get("metadata", {})

        # Check if dump already exists
        is_duplicate, existing_dump = check_duplicate_dump(file_hash)

        if is_duplicate and existing_dump:
            logger.info(f"Dump already exists: {existing_dump.dump_type}/{file_hash}")
            return response.Response(
                DumpUploadStartResponseSerializer(
                    {
                        "exists": True,
                        "dump_id": existing_dump.id,
                    }
                ).data
            )

        # Validate dump type consistency for existing pending dumps
        if existing_dump and existing_dump.dump_type != dump_type:
            logger.error(f"Dump type mismatch: {existing_dump.dump_type} != {dump_type}")
            return response.Response({"error": "Dump type mismatch"}, status=status.HTTP_400_BAD_REQUEST)

        try:
            # Generate S3 key and create/update dump record
            s3_key = generate_s3_key(dump_type, file_hash)
            dump = create_or_update_dump(
                dump_type=dump_type,
                file_hash=file_hash,
                file_size=file_size,
                s3_key=s3_key,
                metadata=metadata,
                existing_dump=existing_dump,
            )

            upload_url = generate_upload_presigned_url(s3_key)

            logger.info(f"Generated upload URL for dump {dump.id}: {s3_key}")

            return response.Response(
                DumpUploadStartResponseSerializer(
                    {
                        "exists": False,
                        "upload_url": upload_url,
                        "key": s3_key,
                        "dump_id": dump.id,
                    }
                ).data
            )

        except Exception:
            logger.exception("Failed to create dump upload request")
            return response.Response(
                {"error": "Failed to generate upload URL"}, status=status.HTTP_500_INTERNAL_SERVER_ERROR
            )


@extend_schema(
    tags=["dumps"],
    summary="Confirm dump upload completion",
    description=(
        "Confirm that a dump file has been successfully uploaded to S3. "
        "Requires authentication and 'can_upload_dumps' permission. "
        "This marks the dump as completed and sets the upload timestamp."
    ),
    request=DumpUploadCompleteRequestSerializer,
    responses={200: DumpUploadCompleteResponseSerializer},
)
class DumpUploadCompleteView(APIView):
    """API endpoint for confirming dump upload completion."""

    permission_classes = [CanUploadDumpsPermission]

    def post(self, request) -> response.Response:
        """Confirm that a dump file has been successfully uploaded.

        Marks the dump record as completed and sets the upload timestamp.
        """
        serializer = DumpUploadCompleteRequestSerializer(data=request.data)
        serializer.is_valid(raise_exception=True)

        dump_type = serializer.validated_data["dump_type"]
        file_hash = serializer.validated_data["file_hash"]

        try:
            success, message, dump = confirm_dump_upload(dump_type, file_hash)

            if success and dump:
                logger.info(f"Confirmed upload for dump {dump.id}: {dump_type}/{file_hash}")
                return response.Response(
                    DumpUploadCompleteResponseSerializer(
                        {
                            "success": True,
                            "message": message,
                            "dump_id": dump.id,
                        }
                    ).data
                )
            else:
                logger.warning(f"No pending dump found: {dump_type}/{file_hash}")
                return response.Response(
                    DumpUploadCompleteResponseSerializer(
                        {
                            "success": False,
                            "message": message,
                        }
                    ).data,
                    status=status.HTTP_404_NOT_FOUND,
                )

        except Exception:
            logger.exception("Failed to confirm upload")
            return response.Response(
                {"error": "Failed to confirm upload"}, status=status.HTTP_500_INTERNAL_SERVER_ERROR
            )


@extend_schema(
    tags=["dumps"],
    summary="Download delayed database dump",
    description=(
        f"Automatically redirects to download a database dump that is at least {DUMP_DOWNLOAD_DELAY_DAYS} days old. "
        "This endpoint is public and requires no authentication. "
        f"If no dumps older than {DUMP_DOWNLOAD_DELAY_DAYS} days exist, "
        "returns the oldest available dump of the specified type."
    ),
    parameters=[
        OpenApiParameter(
            name="dump_type",
            description="Type of database dump to download (e.g., 'csv', 'sql'). Defaults to 'csv'.",
            required=False,
            type=str,
            location=OpenApiParameter.QUERY,
        ),
    ],
    responses={302: "Redirect to S3 download URL", 404: "No dumps available"},
)
class DumpDownloadDelayedView(APIView):
    """API endpoint for downloading delayed database dumps (public access)."""

    permission_classes = []  # Public endpoint

    delay_days: int = DUMP_DOWNLOAD_DELAY_DAYS

    def get_error_message(self, dump_type: str | None) -> str:
        """Get error message when no dump found."""
        dump_type_msg = f" of type '{dump_type}'" if dump_type else ""
        if self.delay_days == 0:
            return f"No completed dumps found{dump_type_msg}"
        else:
            return f"No dumps found older than {self.delay_days} days{dump_type_msg}"

    def get(self, request) -> HttpResponse:
        dump_type = request.query_params.get("dump_type", "csv")
        dump = get_latest_delayed_dump(self.delay_days, dump_type)

        if not dump:
            return response.Response(
                {"error": self.get_error_message(dump_type)},
                status=status.HTTP_404_NOT_FOUND,
            )

        try:
            download_url = generate_download_presigned_url(dump.key)
            logger.info(f"Generated download URL for dump {dump.id}: {dump.key}")
            return HttpResponseRedirect(download_url)
        except Exception:
            logger.exception("Failed to generate download URL")
            return response.Response(
                {"error": "Failed to generate download URL"}, status=status.HTTP_500_INTERNAL_SERVER_ERROR
            )


@extend_schema(
    tags=["dumps"],
    summary="Download latest database dump",
    description=(
        "Automatically redirects to download the most recent completed database dump. "
        "Requires authentication and 'can_download_latest_dump' permission. "
        "Optionally specify dump_type to get the latest dump of a specific type."
    ),
    parameters=[
        OpenApiParameter(
            name="dump_type",
            description=(
                "Type of database dump to download (e.g., 'csv', 'sql'). "
                "If not specified, returns the latest dump of any type."
            ),
            required=False,
            type=str,
            location=OpenApiParameter.QUERY,
        ),
    ],
    responses={302: "Redirect to S3 download URL", 404: "No dumps available"},
)
class DumpDownloadLatestView(DumpDownloadDelayedView):
    """API endpoint for downloading the latest database dump."""

    permission_classes = [CanDownloadLatestDumpPermission]
    delay_days = 0  # Latest dump - no delay

    def get(self, request) -> HttpResponse:
        # Extract dump_type from query parameters for latest view
        return super().get(request)


@extend_schema(
    tags=["dumps"],
    summary="Get dumps overview",
    description=(
        "Get an overview of available database dumps including available types, "
        "the latest dump for each type, delayed dumps, and delay configuration. "
        "This endpoint is public and requires no authentication."
    ),
    responses={200: DumpsOverviewResponseSerializer},
)
class DumpsOverviewView(APIView):
    """API endpoint for getting an overview of available dumps."""

    permission_classes = []  # Public endpoint

    def get(self, request) -> response.Response:
        try:
            available_types = get_available_dump_types()
            latest_dumps = {}
            delayed_dumps = {}

            # Serialize dumps using DumpOverviewInfoSerializer
            for dump_type in available_types:
                latest_dump = get_latest_delayed_dump(0, dump_type)
                if latest_dump:
                    serializer = DumpOverviewInfoSerializer(
                        latest_dump, context={"dump_category": "latest", "request": request}
                    )
                    latest_dumps[dump_type] = serializer.data

                delayed_dump = get_latest_delayed_dump(DUMP_DOWNLOAD_DELAY_DAYS, dump_type)
                if delayed_dump:
                    serializer = DumpOverviewInfoSerializer(
                        delayed_dump, context={"dump_category": "delayed", "request": request}
                    )
                    delayed_dumps[dump_type] = serializer.data

            return response.Response(
                DumpsOverviewResponseSerializer(
                    {
                        "available_types": available_types,
                        "latest_dumps": latest_dumps,
                        "delayed_dumps": delayed_dumps,
                        "delay_days": DUMP_DOWNLOAD_DELAY_DAYS,
                    }
                ).data
            )
        except Exception:
            logger.exception("Failed to get dumps overview")
            return response.Response(
                {"error": "Failed to get dumps overview"}, status=status.HTTP_500_INTERNAL_SERVER_ERROR
            )
