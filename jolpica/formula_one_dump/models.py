from __future__ import annotations

from django.db import models
from django.utils import timezone


class DumpConfiguration(models.Model):
    """Configuration for automated database dumps"""

    class DelayType(models.TextChoices):
        FIXED_DAYS = "fixed", "Fixed Days"
        SEASON_END = "season", "End of Season"
        MILESTONE = "milestone", "Milestone Based"

    delay_type = models.CharField(
        max_length=10,
        choices=DelayType.choices,
        default=DelayType.FIXED_DAYS,
        help_text="How to calculate delay for public dumps",
    )
    delay_days = models.PositiveIntegerField(default=30, help_text="Number of days to delay public dumps")
    is_enabled = models.BooleanField(default=True, help_text="Enable/disable automatic dump generation")
    slack_webhook_url = models.URLField(blank=True, help_text="Slack webhook URL for notifications")

    # S3 Configuration
    s3_bucket_public = models.CharField(
        max_length=255, default="jolpica-dumps-public", help_text="S3 bucket for public (delayed) dumps"
    )
    s3_bucket_private = models.CharField(
        max_length=255, default="jolpica-dumps-private", help_text="S3 bucket for private (latest) dumps"
    )

    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    class Meta:
        verbose_name = "Dump Configuration"
        verbose_name_plural = "Dump Configurations"

    def __str__(self):
        return f"Dump Config - {self.get_delay_type_display()} ({self.delay_days} days)"


class DumpRecord(models.Model):
    """Track individual dump executions and their metadata"""

    class DumpType(models.TextChoices):
        LATEST = "latest", "Latest (Paid)"
        DELAYED = "delayed", "Delayed (Public)"

    class Status(models.TextChoices):
        PENDING = "pending", "Pending"
        GENERATING = "generating", "Generating"
        UPLOADING = "uploading", "Uploading"
        COMPLETED = "completed", "Completed"
        FAILED = "failed", "Failed"

    dump_type = models.CharField(max_length=10, choices=DumpType.choices, help_text="Type of dump (latest or delayed)")
    status = models.CharField(max_length=15, choices=Status.choices, default=Status.PENDING, db_index=True)

    # Execution metadata
    started_at = models.DateTimeField(auto_now_add=True, db_index=True)
    completed_at = models.DateTimeField(null=True, blank=True)

    # File information
    file_hash = models.CharField(max_length=64, blank=True, help_text="SHA256 hash of the dump file")
    file_size = models.PositiveBigIntegerField(null=True, blank=True, help_text="File size in bytes")
    s3_key = models.CharField(max_length=500, blank=True, help_text="S3 object key for the dump file")
    s3_url = models.URLField(blank=True, help_text="S3 URL for the dump file")

    # Change detection
    has_changes = models.BooleanField(
        default=False, help_text="Whether this dump contains changes from the previous one"
    )
    previous_hash = models.CharField(max_length=64, blank=True, help_text="Hash of the previous dump for comparison")

    # Error tracking
    error_message = models.TextField(blank=True, help_text="Error message if dump failed")

    # Manual vs automated
    triggered_by = models.CharField(
        max_length=50, default="scheduled", help_text="How this dump was triggered: scheduled, manual, data_import"
    )

    class Meta:
        ordering = ["-started_at"]
        indexes = [
            models.Index(fields=["dump_type", "status"]),
            models.Index(fields=["started_at"]),
            models.Index(fields=["status", "completed_at"]),
        ]
        verbose_name = "Dump Record"
        verbose_name_plural = "Dump Records"

    def __str__(self):
        return f"{self.get_dump_type_display()} - {self.get_status_display()} ({self.started_at.date()})"

    @property
    def duration(self):
        """Calculate duration of dump generation"""
        if self.completed_at and self.started_at:
            return self.completed_at - self.started_at
        elif self.status in [self.Status.GENERATING, self.Status.UPLOADING]:
            return timezone.now() - self.started_at
        return None

    @property
    def file_size_mb(self):
        """File size in MB for display"""
        if self.file_size:
            return round(self.file_size / 1024 / 1024, 2)
        return None


class DumpDownload(models.Model):
    """Track dump downloads for analytics and monitoring"""

    dump_record = models.ForeignKey(DumpRecord, on_delete=models.CASCADE, related_name="downloads")
    downloaded_at = models.DateTimeField(auto_now_add=True, db_index=True)
    ip_address = models.GenericIPAddressField()
    user_agent = models.TextField(blank=True)

    # For future donator integration
    donator_id = models.CharField(max_length=100, blank=True, help_text="External donator ID (Ko-fi, Patreon, etc.)")

    # Request metadata
    referer = models.URLField(blank=True)
    country_code = models.CharField(max_length=2, blank=True)

    class Meta:
        indexes = [
            models.Index(fields=["downloaded_at"]),
            models.Index(fields=["dump_record", "donator_id"]),
            models.Index(fields=["ip_address", "downloaded_at"]),
        ]
        verbose_name = "Dump Download"
        verbose_name_plural = "Dump Downloads"

    def __str__(self):
        return f"Download of {self.dump_record} at {self.downloaded_at}"
