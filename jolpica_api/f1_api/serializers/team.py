from __future__ import annotations

from rest_framework import serializers

from jolpica.formula_one import models as f1
from jolpica_schemas.f1_api.alpha.team import TeamSeason, TeamSummary

from .base_serializer import BaseAPISerializer


class TeamSeasonSerializer(BaseAPISerializer):
    """
    Serializer for Season information in Team context.

    Required prefetches: None
    """

    pydantic_schema_class = TeamSeason
    # view_name = "seasons-detail"  # TODO: implement this endpoint

    class Meta:
        model = f1.Season


class TeamSerializer(BaseAPISerializer):
    """
    Serializer for Team with nested season information.

    Required prefetches:
    - prefetch_related('seasons')
    """

    pydantic_schema_class = TeamSummary
    view_name = "teams-detail"

    seasons = TeamSeasonSerializer(many=True, read_only=True)
    nationality = serializers.CharField(read_only=True)  # TODO: Generate nationality from country_code

    class Meta:
        model = f1.Team
