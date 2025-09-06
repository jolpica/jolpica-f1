from __future__ import annotations

import logging

from drf_spectacular.utils import extend_schema
from rest_framework import response, status
from rest_framework.views import APIView

from .permissions import CanUploadDumpsPermission
from .serializers import (
    DumpUploadCompleteRequestSerializer,
    DumpUploadCompleteResponseSerializer,
    DumpUploadStartRequestSerializer,
    DumpUploadStartResponseSerializer,
)
from .services import (
    check_duplicate_dump,
    confirm_dump_upload,
    create_or_update_dump,
    generate_presigned_url,
    generate_s3_key,
)

logger = logging.getLogger(__name__)


@extend_schema(
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
        if request.user.is_anonymous:
            return response.Response(
                {"detail": "Authentication credentials were not provided."}, status=status.HTTP_401_UNAUTHORIZED
            )

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

            upload_url = generate_presigned_url(s3_key)

            logger.info(f"Generated upload URL for dump {dump.id}: {s3_key}")

            return response.Response(
                DumpUploadStartResponseSerializer(
                    {
                        "exists": False,
                        "upload_url": upload_url,
                        "s3_key": s3_key,
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
        if request.user.is_anonymous:
            return response.Response(
                {"detail": "Authentication credentials were not provided."}, status=status.HTTP_401_UNAUTHORIZED
            )

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
