from __future__ import annotations

import logging
from datetime import datetime, timedelta

import boto3
from django.conf import settings
from django.db import transaction
from django.utils import timezone

from .models import Dump

logger = logging.getLogger(__name__)


def check_duplicate_dump(file_hash: str) -> tuple[bool, Dump | None]:
    """Check if a dump with the given hash already exists.

    Returns:
        Tuple of (is_duplicate, existing_dump_or_none)
    """
    existing_dump = Dump.objects.filter(file_hash=file_hash).first()

    if existing_dump and existing_dump.is_completed:
        return True, existing_dump

    return False, existing_dump


def create_or_update_dump(
    dump_type: str, file_hash: str, file_size: int, s3_key: str, metadata: dict, existing_dump: Dump | None = None
) -> Dump:
    """Create a new dump record or update an existing pending one.

    Args:
        existing_dump: Optional existing dump to update instead of creating new one
    """
    with transaction.atomic():
        if existing_dump:
            # Update existing pending dump
            dump = existing_dump
            dump.key = s3_key
            dump.file_size = file_size
            dump.metadata = metadata
            dump.upload_status = "pending"
            dump.save()
        else:
            # Create new dump record
            dump = Dump.objects.create(
                dump_type=dump_type,
                file_hash=file_hash,
                key=s3_key,
                file_size=file_size,
                metadata=metadata,
                upload_status="pending",
            )

    return dump


def confirm_dump_upload(dump_type: str, file_hash: str) -> tuple[bool, str, Dump | None]:
    """Returns:
    Tuple of (success, message, dump_instance_or_none)
    """
    try:
        dump = Dump.objects.get(dump_type=dump_type, file_hash=file_hash, upload_status="pending")
        dump.mark_completed()

        return True, "Upload confirmed successfully", dump

    except Dump.DoesNotExist:
        return False, "No pending dump found with the provided details", None


def get_latest_delayed_dump(delay_days: int, dump_type: str | None = None) -> Dump | None:
    queryset = Dump.objects.filter(upload_status="completed")

    if delay_days > 0:
        cutoff_date = timezone.now() - timedelta(days=delay_days)
        delayed_queryset = queryset.filter(uploaded_at__lt=cutoff_date)

        if dump_type:
            delayed_queryset = delayed_queryset.filter(dump_type=dump_type)

        # Try to get a delayed dump first
        delayed_dump = delayed_queryset.order_by("-uploaded_at").first()
        if delayed_dump:
            return delayed_dump

        # If no delayed dump available, fallback to oldest dump for the type
        if dump_type:
            oldest_queryset = queryset.filter(dump_type=dump_type)
            return oldest_queryset.order_by("uploaded_at").first()

        return None

    # For delay_days = 0 (latest dump), original logic
    if dump_type:
        queryset = queryset.filter(dump_type=dump_type)

    return queryset.order_by("-uploaded_at").first()


def get_available_dump_types() -> list[str]:
    return list(
        Dump.objects.filter(upload_status="completed")
        .values_list("dump_type", flat=True)
        .distinct()
        .order_by("dump_type")
    )


def generate_s3_key(dump_type: str, file_hash: str) -> str:
    date = datetime.now().strftime("%Y-%m-%d")
    return f"dumps/{date}/{dump_type}_{file_hash[:8]}/jolpica-f1-{dump_type}.zip"


def _get_authenticated_s3_client():
    aws_access_key_id = getattr(settings, "AWS_ACCESS_KEY_ID", None)
    aws_secret_access_key = getattr(settings, "AWS_SECRET_ACCESS_KEY", None)

    if aws_access_key_id and aws_secret_access_key:
        # Use explicit credentials if provided
        logger.info(f"Using explicit credentials for S3: {aws_access_key_id}")
        return boto3.client(
            "s3",
            aws_access_key_id=aws_access_key_id,
            aws_secret_access_key=aws_secret_access_key,
            region_name=getattr(settings, "AWS_S3_REGION_NAME", ""),
        )
    else:
        # Use instance profile or default credential chain
        logger.info("Using instance profile or default credential chain for S3")
        return boto3.client(
            "s3",
            region_name=getattr(settings, "AWS_S3_REGION_NAME", ""),
        )


def generate_upload_presigned_url(s3_key: str, file_size: int) -> str:
    """Generate a pre-signed URL for S3 upload.

    Args:
        s3_key: The S3 key for the object
        file_size: The expected size of the file in bytes

    Raises:
        Exception: If AWS credentials or settings are missing
    """
    bucket_name = getattr(settings, "AWS_DUMPS_S3_BUCKET", "")
    s3_client = _get_authenticated_s3_client()

    presigned_url = s3_client.generate_presigned_url(
        "put_object",
        Params={
            "Bucket": bucket_name,
            "Key": s3_key,
            "ContentType": "application/octet-stream",
            "ContentLength": file_size,
        },
        ExpiresIn=5 * 60,  # 5 minutes
    )

    return presigned_url


def generate_download_presigned_url(s3_key: str) -> str:
    """Generate a pre-signed URL for S3 download.

    Uses AWS credentials from settings or instance profile.
    URL expires after 1 hour.

    Raises:
        Exception: If AWS credentials or settings are missing
    """
    bucket_name = getattr(settings, "AWS_DUMPS_S3_BUCKET", "")
    s3_client = _get_authenticated_s3_client()

    presigned_url = s3_client.generate_presigned_url(
        "get_object",
        Params={
            "Bucket": bucket_name,
            "Key": s3_key,
        },
        ExpiresIn=60 * 60,  # 1 hour
    )

    return presigned_url
