from __future__ import annotations

from rest_framework import serializers

from jolpica.formula_one import models as f1

from .base_serializer import BaseAPISerializer


class RoundCircuitSerializer(BaseAPISerializer):
    """
    Serializer for Circuit information in Round context.

    Required prefetches: None
    """

    view_name = "circuits-detail"

    class Meta:
        model = f1.Circuit
        fields = ["id", "name", "locality", "country_code"]


class RoundSeasonSerializer(BaseAPISerializer):
    """
    Serializer for Season information in Round context.

    Required prefetches: None
    """

    # view_name = "seasons-detail"  # TODO: implement this endpoint

    class Meta:
        model = f1.Season
        fields = ["id", "year"]


class RoundSessionSerializer(BaseAPISerializer):
    """
    Serializer for Session information in Round context.

    Required prefetches: None
    Note: local_timestamp is a property that requires timezone and timestamp to be populated
    """

    # view_name = "sessions-detail"  # TODO: implement this endpoint

    type_display = serializers.CharField(source="get_type_display", read_only=True)
    # Must use CharField instead of DateTimeField as otherwise it will display as UTC
    local_timestamp = serializers.CharField(read_only=True)
    timezone = serializers.CharField(read_only=True)

    class Meta:
        model = f1.Session
        fields = [
            "id",
            "number",
            "type",
            "type_display",
            "timestamp",
            "has_time_data",
            "local_timestamp",
            "timezone",
        ]

    def get_url(self, obj):
        # TODO: We first need to implement the sessions-detail endpoint
        pass


class RoundSerializer(BaseAPISerializer):
    """
    Serializer for Round with nested circuit, season, and session information.

    Required prefetches:
    - select_related('season', 'circuit')
    - prefetch_related('sessions')
    """

    view_name = "rounds-detail"

    circuit = RoundCircuitSerializer(read_only=True)
    season = RoundSeasonSerializer(read_only=True)
    sessions = RoundSessionSerializer(many=True, read_only=True)

    class Meta:
        model = f1.Round
        fields = [
            "id",
            "url",
            "number",
            "name",
            "race_number",
            "wikipedia",
            "is_cancelled",
            "circuit",
            "season",
            "sessions",
        ]
