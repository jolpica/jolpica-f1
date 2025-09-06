from __future__ import annotations

from django.db import models
from django.utils import timezone


class Dump(models.Model):
    """Model for tracking database dumps of various types.

    This model supports multiple dump formats (CSV, SQL, etc.) and tracks
    their upload status to object storage (S3). Uses file hash for deduplication
    within each dump type.
    """

    DUMP_TYPES = [
        ("csv", "CSV"),
        ("sql", "SQL"),
    ]

    UPLOAD_STATUS = [
        ("pending", "Pending"),
        ("completed", "Completed"),
        ("failed", "Failed"),
    ]

    id = models.BigAutoField(primary_key=True)
    dump_type = models.CharField(max_length=20, choices=DUMP_TYPES, help_text="Type of database dump (csv, sql, etc.)")
    key = models.CharField(max_length=500, help_text="Path / key to where file is stored")
    file_hash = models.CharField(max_length=64, unique=True, help_text="SHA256 hash of the dump file")
    file_size = models.BigIntegerField(help_text="Size of dump file in bytes")
    upload_status = models.CharField(
        max_length=20, choices=UPLOAD_STATUS, default="pending", help_text="Current upload status"
    )
    created_at = models.DateTimeField(auto_now_add=True, help_text="When this dump record was created")
    uploaded_at = models.DateTimeField(null=True, blank=True, help_text="When upload was completed successfully")
    metadata = models.JSONField(default=dict, blank=True, help_text="Additional dump-specific metadata")

    class Meta:
        ordering = ["-created_at"]
        indexes = [
            models.Index(fields=["dump_type", "upload_status"]),
            models.Index(fields=["file_hash"]),
            models.Index(fields=["created_at"]),
        ]
        permissions = [
            ("can_upload_dumps", "Can upload database dumps"),
        ]

    def __str__(self) -> str:
        string = f"{self.dump_type} dump {self.file_hash[:6]}"
        if self.upload_status != "completed":
            string += f" ({self.upload_status})"
        return string

    def mark_completed(self) -> None:
        self.upload_status = "completed"
        self.uploaded_at = timezone.now()
        self.save(update_fields=["upload_status", "uploaded_at"])

    @property
    def is_completed(self) -> bool:
        return self.upload_status == "completed"
