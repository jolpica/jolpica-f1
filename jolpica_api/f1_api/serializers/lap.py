from __future__ import annotations

from rest_framework import serializers

from jolpica.formula_one import models as f1
from jolpica.formula_one.utils import format_timedelta, timedelta_to_iso8601
from jolpica_schemas.f1_api.alpha.lap import LapPitStop, LapSessionEntry, LapSummary

from .base_serializer import BaseAPISerializer


class LapSessionEntrySerializer(BaseAPISerializer):
    """
    Minimal serializer for SessionEntry information in Lap context.

    Required prefetches: None
    """

    pydantic_schema_class = LapSessionEntry
    view_name = "session-entries-detail"

    class Meta:
        model = f1.SessionEntry


class LapPitStopSerializer(BaseAPISerializer):
    """
    Serializer for PitStop information in Lap context.

    Required prefetches: None
    """

    pydantic_schema_class = LapPitStop
    view_name = "pit-stops-detail"

    duration = serializers.SerializerMethodField()
    duration_display = serializers.SerializerMethodField()
    duration_milliseconds = serializers.SerializerMethodField()

    class Meta:
        model = f1.PitStop

    def get_duration(self, obj: f1.PitStop) -> str | None:
        """Convert duration to ISO 8601 format (e.g., PT13.341S)"""
        return timedelta_to_iso8601(obj.duration)

    def get_duration_display(self, obj: f1.PitStop) -> str | None:
        """Format duration as human-readable string (MM:SS.mmm or SS.mmm)"""
        return format_timedelta(obj.duration) if obj.duration else None

    def get_duration_milliseconds(self, obj: f1.PitStop) -> int | None:
        """Convert duration to integer milliseconds"""
        return int(obj.duration.total_seconds() * 1000) if obj.duration else None


class LapSerializer(BaseAPISerializer):
    """
    Serializer for Lap with nested session_entry and pit_stop information.

    Required prefetches:
    - select_related('session_entry')
    - prefetch_related('pit_stop')
    """

    pydantic_schema_class = LapSummary
    view_name = "laps-detail"

    session_entry = LapSessionEntrySerializer(read_only=True)
    pit_stop = serializers.SerializerMethodField()
    time = serializers.SerializerMethodField()
    time_display = serializers.SerializerMethodField()
    time_milliseconds = serializers.SerializerMethodField()

    class Meta:
        model = f1.Lap

    def get_pit_stop(self, obj: f1.Lap) -> dict | None:
        """Get pit stop data if exists"""
        if hasattr(obj, "pit_stop") and obj.pit_stop:
            return LapPitStopSerializer(obj.pit_stop, context=self.context).data
        return None

    def get_time(self, obj: f1.Lap) -> str | None:
        """Convert lap time to ISO 8601 format (e.g., PT2M49.888S)"""
        return timedelta_to_iso8601(obj.time)

    def get_time_display(self, obj: f1.Lap) -> str | None:
        """Format lap time as human-readable string (M:SS.mmm)"""
        return format_timedelta(obj.time) if obj.time else None

    def get_time_milliseconds(self, obj: f1.Lap) -> int | None:
        """Convert lap time to integer milliseconds"""
        return int(obj.time.total_seconds() * 1000) if obj.time else None
