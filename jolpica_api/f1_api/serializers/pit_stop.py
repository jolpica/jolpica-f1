from __future__ import annotations

from rest_framework import serializers

from jolpica.formula_one import models as f1
from jolpica.formula_one.utils import format_timedelta, timedelta_to_iso8601

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

    view_name = "laps-detail"

    time = serializers.SerializerMethodField()

    class Meta:
        model = f1.Lap
        fields = ["id", "url", "number", "position", "time"]

    def get_time(self, obj: f1.Lap) -> str | None:
        """Convert lap time to ISO 8601 format (e.g., PT2M49.888S)"""
        return timedelta_to_iso8601(obj.time)


class PitStopRoundSerializer(BaseAPISerializer):
    """
    Serializer for Round information in PitStop context (with nested season).

    Required prefetches:
    - select_related('season')
    """

    view_name = "rounds-detail"

    season = RoundSeasonSerializer(read_only=True)

    class Meta:
        model = f1.Round
        fields = ["id", "url", "number", "name", "season"]


class PitStopSerializer(BaseAPISerializer):
    """
    Serializer for PitStop with nested driver, team, session, round, and lap information.

    Required prefetches:
    - select_related('session_entry__session__round__season')
    - select_related('session_entry__round_entry__team_driver__driver')
    - select_related('session_entry__round_entry__team_driver__team')
    - select_related('lap')
    """

    view_name = "pit-stops-detail"

    driver = serializers.SerializerMethodField()
    team = serializers.SerializerMethodField()
    session = serializers.SerializerMethodField()
    round = serializers.SerializerMethodField()
    lap = serializers.SerializerMethodField()
    duration = serializers.SerializerMethodField()
    duration_display = serializers.SerializerMethodField()
    duration_milliseconds = serializers.SerializerMethodField()

    class Meta:
        model = f1.PitStop
        fields = [
            "id",
            "url",
            "number",
            "duration",
            "duration_display",
            "duration_milliseconds",
            "local_timestamp",
            "driver",
            "team",
            "session",
            "round",
            "lap",
        ]

    def get_driver(self, obj: f1.PitStop) -> dict:
        """Get driver data from session_entry.round_entry.team_driver.driver"""
        driver = obj.session_entry.round_entry.team_driver.driver
        return SessionEntryDriverSerializer(driver, context=self.context).data

    def get_team(self, obj: f1.PitStop) -> dict:
        """Get team data from session_entry.round_entry.team_driver.team"""
        team = obj.session_entry.round_entry.team_driver.team
        return SessionEntryTeamSerializer(team, context=self.context).data

    def get_session(self, obj: f1.PitStop) -> dict:
        """Get session data from session_entry.session"""
        session = obj.session_entry.session
        return SessionEntrySessionSerializer(session, context=self.context).data

    def get_round(self, obj: f1.PitStop) -> dict:
        """Get round data from session_entry.session.round"""
        round_obj = obj.session_entry.session.round
        return PitStopRoundSerializer(round_obj, context=self.context).data

    def get_lap(self, obj: f1.PitStop) -> dict | None:
        """Get lap data if exists"""
        if hasattr(obj, "lap") and obj.lap:
            return PitStopLapSerializer(obj.lap, context=self.context).data
        return None

    def get_duration(self, obj: f1.PitStop) -> str | None:
        """Convert duration to ISO 8601 format (e.g., PT13.341S)"""
        return timedelta_to_iso8601(obj.duration)

    def get_duration_display(self, obj: f1.PitStop) -> str | None:
        """Format duration as human-readable string (MM:SS.mmm or SS.mmm)"""
        return format_timedelta(obj.duration) if obj.duration else None

    def get_duration_milliseconds(self, obj: f1.PitStop) -> int | None:
        """Convert duration to integer milliseconds"""
        return int(obj.duration.total_seconds() * 1000) if obj.duration else None
