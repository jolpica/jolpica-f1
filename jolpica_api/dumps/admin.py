from __future__ import annotations

from django.contrib import admin
from django.utils.html import format_html

from .models import Dump


@admin.register(Dump)
class DumpAdmin(admin.ModelAdmin):
    """Admin interface for managing database dumps."""

    list_display = [
        "id",
        "dump_type",
        "key",
        "file_hash_short",
        "file_size_mb",
        "upload_status_colored",
        "created_at",
        "uploaded_at",
    ]

    list_filter = [
        "dump_type",
        "upload_status",
        "created_at",
    ]

    search_fields = [
        "file_hash",
        "key",
    ]

    readonly_fields = [
        "created_at",
        "uploaded_at",
        "file_hash",
        "file_size",
        "key",
    ]

    ordering = ["-created_at"]

    fieldsets = [
        ("Dump Information", {"fields": ["dump_type", "file_hash", "key", "file_size"]}),
        ("Upload Status", {"fields": ["upload_status", "created_at", "uploaded_at"]}),
        ("Metadata", {"fields": ["metadata"], "classes": ["collapse"]}),
    ]

    @admin.display(description="Hash")
    def file_hash_short(self, obj: Dump) -> str:
        return f"{obj.file_hash[:12]}..."

    @admin.display(description="Size")
    def file_size_mb(self, obj: Dump) -> str:
        mb = obj.file_size / (1024 * 1024)
        return f"{mb:.1f} MB"

    @admin.display(description="Status", ordering="upload_status")
    def upload_status_colored(self, obj: Dump) -> str:
        colors = {
            "pending": "#ffc107",
            "completed": "#28a745",
            "failed": "#dc3545",
        }
        color = colors.get(obj.upload_status, "#6c757d")
        return format_html(
            '<span style="color: {}; font-weight: bold;">{}</span>', color, obj.get_upload_status_display()
        )
