from __future__ import annotations

from rest_framework import serializers

from jolpica.formula_one import models as f1
from jolpica.formula_one.utils import format_timedelta, timedelta_to_iso8601
from jolpica_schemas.f1_api.alpha.pit_stop import (
    PitStopLap,
    PitStopRound,
    PitStopSummary,
)

from .base_serializer import BaseAPISerializer
from .round import RoundSeasonSerializer
from .session_entry import (
    SessionEntryDriverSerializer,
    SessionEntrySessionSerializer,
    SessionEntryTeamSerializer,
)


class PitStopLapSerializer(BaseAPISerializer):
    """
    Serializer for Lap information in PitStop context.

    Required prefetches: None
    """

    pydantic_schema_class = PitStopLap
    view_name = "laps-detail"

    time = serializers.SerializerMethodField()

    class Meta:
        model = f1.Lap

    def get_time(self, obj: f1.Lap) -> str | None:
        """Convert lap time to ISO 8601 format (e.g., PT2M49.888S)"""
        return timedelta_to_iso8601(obj.time)


class PitStopRoundSerializer(BaseAPISerializer):
    """
    Serializer for Round information in PitStop context (with nested season).

    Required prefetches:
    - select_related('season')
    """

    pydantic_schema_class = PitStopRound
    view_name = "rounds-detail"

    class Meta:
        model = f1.Round


class PitStopSerializer(BaseAPISerializer):
    """
    Serializer for PitStop with nested driver, team, session, round, and lap information.

    Required prefetches:
    - select_related('session_entry__session__round__season')
    - select_related('session_entry__round_entry__team_driver__driver')
    - select_related('session_entry__round_entry__team_driver__team')
    - select_related('lap')
    """

    pydantic_schema_class = PitStopSummary
    view_name = "pit-stops-detail"

    driver = SessionEntryDriverSerializer(read_only=True, source="session_entry.round_entry.team_driver.driver")
    team = SessionEntryTeamSerializer(read_only=True, source="session_entry.round_entry.team_driver.team")
    session = SessionEntrySessionSerializer(read_only=True, source="session_entry.session")
    round = PitStopRoundSerializer(read_only=True, source="session_entry.session.round")
    season = RoundSeasonSerializer(read_only=True, source="session_entry.session.round.season")
    lap = PitStopLapSerializer(read_only=True)
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
