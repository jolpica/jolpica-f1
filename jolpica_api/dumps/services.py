from __future__ import annotations

import logging
from datetime import datetime

import boto3
from django.conf import settings
from django.db import transaction

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


def generate_s3_key(dump_type: str, file_hash: str) -> str:
    date = datetime.now().strftime("%Y-%m-%d")
    return f"dumps/{date}/{dump_type}_{file_hash[:8]}/jolpica-f1-{dump_type}.zip"


def generate_presigned_url(s3_key: str) -> str:
    """Generate a pre-signed URL for S3 upload.

    Raises:
        Exception: If AWS credentials or settings are missing
    """
    bucket_name = getattr(settings, "AWS_DUMPS_S3_BUCKET", "")

    # Use boto3 client with instance profile credentials (preferred for EC2)
    # If AWS_ACCESS_KEY_ID is not set, boto3 will automatically use instance profile
    aws_access_key_id = getattr(settings, "AWS_ACCESS_KEY_ID", None)
    aws_secret_access_key = getattr(settings, "AWS_SECRET_ACCESS_KEY", None)

    if aws_access_key_id and aws_secret_access_key:
        # Use explicit credentials if provided
        logger.info(f"Using explicit credentials for S3 upload: {aws_access_key_id}")
        s3_client = boto3.client(
            "s3",
            aws_access_key_id=aws_access_key_id,
            aws_secret_access_key=aws_secret_access_key,
            region_name=getattr(settings, "AWS_S3_REGION_NAME", ""),
        )
    else:
        # Use instance profile or default credential chain
        logger.info("Using instance profile or default credential chain for S3 upload")
        s3_client = boto3.client(
            "s3",
            region_name=getattr(settings, "AWS_S3_REGION_NAME", ""),
        )

    presigned_url = s3_client.generate_presigned_url(
        "put_object",
        Params={
            "Bucket": bucket_name,
            "Key": s3_key,
            "ContentType": "application/octet-stream",
        },
        ExpiresIn=5 * 60,  # 5 minutes
    )

    return presigned_url


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
