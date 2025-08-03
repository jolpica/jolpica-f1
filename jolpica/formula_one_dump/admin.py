from django.contrib import admin

from .models import DumpConfiguration, DumpDownload, DumpRecord


@admin.register(DumpConfiguration)
class DumpConfigurationAdmin(admin.ModelAdmin):
    list_display = ["delay_type", "delay_days", "is_enabled", "updated_at"]
    list_filter = ["delay_type", "is_enabled"]
    fields = ["is_enabled", "delay_type", "delay_days", "slack_webhook_url", "s3_bucket_public", "s3_bucket_private"]
    readonly_fields = ["created_at", "updated_at"]

    def has_add_permission(self, request):
        # Only allow one configuration instance
        return not DumpConfiguration.objects.exists()

    def has_delete_permission(self, request, obj=None):
        # Don't allow deletion of the configuration
        return False


@admin.register(DumpRecord)
class DumpRecordAdmin(admin.ModelAdmin):
    list_display = [
        "dump_type",
        "status",
        "has_changes",
        "file_size_display",
        "started_at",
        "completed_at",
        "triggered_by",
    ]
    list_filter = ["dump_type", "status", "has_changes", "triggered_by", "started_at"]
    search_fields = ["file_hash", "s3_key"]
    readonly_fields = [
        "dump_type",
        "status",
        "started_at",
        "completed_at",
        "file_hash",
        "file_size",
        "s3_key",
        "s3_url",
        "has_changes",
        "previous_hash",
        "error_message",
        "triggered_by",
    ]

    def file_size_display(self, obj):
        if obj.file_size:
            return f"{obj.file_size_mb} MB"
        return "-"

    file_size_display.short_description = "File Size"  # type: ignore[attr-defined]

    def has_add_permission(self, request):
        # Records are created by the management command only
        return False

    def has_change_permission(self, request, obj=None):
        # Records are read-only
        return False

    def has_delete_permission(self, request, obj=None):
        # Allow deletion of old records for cleanup
        return True


@admin.register(DumpDownload)
class DumpDownloadAdmin(admin.ModelAdmin):
    list_display = ["dump_record", "downloaded_at", "ip_address", "donator_id", "country_code"]
    list_filter = ["downloaded_at", "dump_record__dump_type", "country_code"]
    search_fields = ["ip_address", "donator_id", "user_agent"]
    readonly_fields = [
        "dump_record",
        "downloaded_at",
        "ip_address",
        "user_agent",
        "donator_id",
        "referer",
        "country_code",
    ]

    def has_add_permission(self, request):
        # Downloads are tracked automatically
        return False

    def has_change_permission(self, request, obj=None):
        # Downloads are read-only
        return False
