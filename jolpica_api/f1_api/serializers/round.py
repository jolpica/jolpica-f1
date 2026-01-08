from __future__ import annotations

from rest_framework import serializers

from jolpica.formula_one import models as f1
from jolpica_schemas.f1_api.alpha.round import (
    RoundCircuit,
    RoundSeason,
    RoundSession,
    RoundSummary,
)

from .base_serializer import BaseAPISerializer


class RoundCircuitSerializer(BaseAPISerializer):
    """
    Serializer for Circuit information in Round context.

    Required prefetches: None
    """

    pydantic_schema_class = RoundCircuit
    view_name = "circuits-detail"

    class Meta:
        model = f1.Circuit


class RoundSeasonSerializer(BaseAPISerializer):
    """
    Serializer for Season information in Round context.

    Required prefetches: None
    """

    pydantic_schema_class = RoundSeason
    # view_name = "seasons-detail"  # TODO: implement this endpoint

    class Meta:
        model = f1.Season


class RoundSessionSerializer(BaseAPISerializer):
    """
    Serializer for Session information in Round context.

    Required prefetches: None
    Note: local_timestamp is a property that requires timezone and timestamp to be populated
    """

    pydantic_schema_class = RoundSession
    # view_name = "sessions-detail"  # TODO: Schema expects url: None

    type_display = serializers.CharField(source="get_type_display", read_only=True)
    # Must use CharField instead of DateTimeField as otherwise it will display as UTC
    local_timestamp = serializers.CharField(read_only=True)
    timezone = serializers.CharField(read_only=True)

    class Meta:
        model = f1.Session


class RoundSerializer(BaseAPISerializer):
    """
    Serializer for Round with nested circuit, season, and session information.

    Required prefetches:
    - select_related('season', 'circuit')
    - prefetch_related('sessions')
    """

    pydantic_schema_class = RoundSummary
    view_name = "rounds-detail"

    circuit = RoundCircuitSerializer(read_only=True)
    season = RoundSeasonSerializer(read_only=True)
    sessions = RoundSessionSerializer(many=True, read_only=True)

    class Meta:
        model = f1.Round
