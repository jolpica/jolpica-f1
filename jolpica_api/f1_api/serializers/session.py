from __future__ import annotations

from rest_framework import serializers

from jolpica.formula_one import models as f1
from jolpica_schemas.f1_api.alpha.session import SessionRound, SessionSummary

from .base_serializer import BaseAPISerializer


class SessionRoundSerializer(BaseAPISerializer):
    """
    Serializer for Round information in Session context.

    Required prefetches: None
    """

    pydantic_schema_class = SessionRound
    view_name = "rounds-detail"

    class Meta:
        model = f1.Round
        fields = ["id", "url", "number", "name"]


class SessionSerializer(BaseAPISerializer):
    """
    Serializer for Session with nested round information.

    Required prefetches:
    - select_related('round')
    """

    pydantic_schema_class = SessionSummary
    view_name = "sessions-detail"

    round = SessionRoundSerializer(read_only=True)
    type_display = serializers.CharField(source="get_type_display", read_only=True)
    # Must use CharField instead of DateTimeField as otherwise it will display as UTC
    local_timestamp = serializers.CharField(read_only=True)
    timezone = serializers.CharField(read_only=True)

    class Meta:
        model = f1.Session
        fields = [
            "id",
            "url",
            "number",
            "type",
            "type_display",
            "timestamp",
            "has_time_data",
            "local_timestamp",
            "timezone",
            "scheduled_laps",
            "is_cancelled",
            "round",
        ]
