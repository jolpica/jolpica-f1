from __future__ import annotations

from rest_framework import serializers

from jolpica.formula_one import models as f1
from jolpica.formula_one.utils import format_timedelta
from jolpica.schemas.f1_api.alpha.session_entry import (
    SessionEntryDriver,
    SessionEntryRound,
    SessionEntrySession,
    SessionEntrySummary,
    SessionEntryTeam,
)

from .base_serializer import PydanticValidatedSerializer


class SessionEntrySessionSerializer(PydanticValidatedSerializer):
    """
    Serializer for Session information in SessionEntry context.

    Required prefetches: None
    """

    pydantic_schema_class = SessionEntrySession
    view_name = "sessions-detail"

    type_display = serializers.CharField(source="get_type_display", read_only=True)

    class Meta:
        model = f1.Session
        fields = ["id", "url", "type", "type_display"]


class SessionEntryRoundSerializer(PydanticValidatedSerializer):
    """
    Serializer for Round information in SessionEntry context.

    Required prefetches: None
    """

    pydantic_schema_class = SessionEntryRound
    view_name = "rounds-detail"

    class Meta:
        model = f1.Round
        fields = ["id", "url", "number", "name"]


class SessionEntryDriverSerializer(PydanticValidatedSerializer):
    """
    Serializer for Driver information in SessionEntry context.

    Required prefetches: None
    """

    pydantic_schema_class = SessionEntryDriver
    view_name = "drivers-detail"

    class Meta:
        model = f1.Driver
        fields = ["id", "url", "abbreviation", "forename", "surname"]


class SessionEntryTeamSerializer(PydanticValidatedSerializer):
    """
    Serializer for Team information in SessionEntry context.

    Required prefetches: None
    """

    pydantic_schema_class = SessionEntryTeam
    view_name = "teams-detail"

    class Meta:
        model = f1.Team
        fields = ["id", "url", "name", "reference"]


class SessionEntrySerializer(PydanticValidatedSerializer):
    """
    Serializer for SessionEntry with nested session, round, driver, and team information.

    Required prefetches:
    - select_related('session__round', 'round_entry__team_driver__driver', 'round_entry__team_driver__team')
    """

    pydantic_schema_class = SessionEntrySummary
    view_name = "session-entries-detail"

    session = SessionEntrySessionSerializer(read_only=True)
    round = serializers.SerializerMethodField()
    driver = serializers.SerializerMethodField()
    team = serializers.SerializerMethodField()
    status_display = serializers.CharField(source="get_status_display", read_only=True)
    car_number = serializers.IntegerField(source="round_entry.car_number", read_only=True)
    time_display = serializers.SerializerMethodField()

    class Meta:
        model = f1.SessionEntry
        fields = [
            "id",
            "url",
            "position",
            "is_classified",
            "status",
            "status_display",
            "points",
            "grid",
            "time",
            "time_display",
            "fastest_lap_rank",
            "laps_completed",
            "car_number",
            "session",
            "round",
            "driver",
            "team",
        ]

    def get_round(self, obj: f1.SessionEntry) -> dict:
        """Get round data from session.round"""
        return SessionEntryRoundSerializer(obj.session.round, context=self.context).data

    def get_driver(self, obj: f1.SessionEntry) -> dict:
        """Get driver data from round_entry.team_driver.driver"""
        return SessionEntryDriverSerializer(obj.round_entry.team_driver.driver, context=self.context).data

    def get_team(self, obj: f1.SessionEntry) -> dict:
        """Get team data from round_entry.team_driver.team"""
        return SessionEntryTeamSerializer(obj.round_entry.team_driver.team, context=self.context).data

    def get_time_display(self, obj: f1.SessionEntry) -> str | None:
        """Format timedelta as human-readable string (H:MM:SS.mmm)"""
        return format_timedelta(obj.time) if obj.time else None
