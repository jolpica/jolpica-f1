from __future__ import annotations

from django.urls import reverse
from rest_framework import serializers

from .models import Dump


class DumpUploadStartRequestSerializer(serializers.Serializer):
    """Serializer for requesting dump upload."""

    dump_type = serializers.ChoiceField(choices=Dump.DUMP_TYPES, help_text="Type of dump being uploaded")
    file_hash = serializers.CharField(
        max_length=64, min_length=64, help_text="SHA256 hash of the dump file (64 hex characters)"
    )
    file_size = serializers.IntegerField(min_value=1, help_text="Size of the dump file in bytes")
    metadata = serializers.JSONField(required=False, default=dict, help_text="Optional metadata about the dump")

    def validate_file_hash(self, value: str) -> str:
        """Validate that file_hash is a valid SHA256 hex string."""
        if not all(c in "0123456789abcdef" for c in value.lower()):
            raise serializers.ValidationError("file_hash must be a valid SHA256 hash (64 hexadecimal characters)")
        return value.lower()


class DumpUploadStartResponseSerializer(serializers.Serializer):
    """Serializer for dump upload response."""

    exists = serializers.BooleanField(help_text="Whether this dump already exists")
    upload_url = serializers.URLField(required=False, help_text="Pre-signed S3 URL for upload (only if exists=False)")
    key = serializers.CharField(required=False, help_text="S3 key for the dump (only if exists=False)")
    dump_id = serializers.IntegerField(required=False, help_text="ID of the dump record")


class DumpUploadCompleteRequestSerializer(serializers.Serializer):
    """Serializer for confirming dump upload completion."""

    dump_type = serializers.ChoiceField(choices=Dump.DUMP_TYPES, help_text="Type of dump that was uploaded")
    file_hash = serializers.CharField(max_length=64, min_length=64, help_text="SHA256 hash of the uploaded dump file")

    def validate_file_hash(self, value: str) -> str:
        """Validate that file_hash is a valid SHA256 hex string."""
        if not all(c in "0123456789abcdef" for c in value.lower()):
            raise serializers.ValidationError("file_hash must be a valid SHA256 hash (64 hexadecimal characters)")
        return value.lower()


class DumpUploadCompleteResponseSerializer(serializers.Serializer):
    """Serializer for dump upload confirmation response."""

    success = serializers.BooleanField(help_text="Whether the confirmation was successful")
    message = serializers.CharField(help_text="Status message")
    dump_id = serializers.IntegerField(required=False, help_text="ID of the confirmed dump record")


class DumpOverviewInfoSerializer(serializers.ModelSerializer):
    """Serializer for dump information in overview with download link."""

    download_url = serializers.SerializerMethodField()

    class Meta:
        model = Dump
        fields = ["dump_type", "file_hash", "file_size", "uploaded_at", "download_url"]

    def get_download_url(self, obj) -> str:
        dump_type = obj.dump_type
        context = self.context.get("dump_category", "latest")
        request = self.context.get("request")

        if context == "latest":
            url = reverse("dump-download-latest")
        else:  # delayed
            url = reverse("dump-download-delayed")
        full_url = f"{url}?dump_type={dump_type}"

        # Build full URL with domain if request is available
        if request:
            return request.build_absolute_uri(full_url)
        else:
            return full_url


class DumpsOverviewResponseSerializer(serializers.Serializer):
    """Serializer for dumps overview response."""

    available_types = serializers.ListField(
        child=serializers.CharField(), help_text="List of available dump types with completed uploads"
    )
    latest_dumps = serializers.DictField(help_text="Latest dump for each available type")
    delayed_dumps = serializers.DictField(
        help_text="Latest delayed dump (older than configured delay) for each available type",
        required=False,
    )
    delay_days = serializers.IntegerField(
        help_text="Number of days a dump must be old to be available for delayed download"
    )
