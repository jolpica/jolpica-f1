from __future__ import annotations

from rest_framework import serializers

from jolpica.formula_one import models as f1
from jolpica_api.f1_api.utils import safe_get_country_flag
from jolpica_schemas.f1_api.alpha.core.team import TeamSeason, TeamSummary

from .base_serializer import BaseAPISerializer


class TeamSeasonSerializer(BaseAPISerializer):
    """
    Serializer for Season information in Team context.

    Required prefetches: None
    """

    pydantic_schema_class = TeamSeason
    view_name = "core-seasons-detail"

    class Meta:
        model = f1.Season


class TeamSerializer(BaseAPISerializer):
    """
    Serializer for Team with nested season information.

    Required prefetches:
    - prefetch_related('seasons')
    """

    pydantic_schema_class = TeamSummary
    view_name = "core-teams-detail"

    seasons = TeamSeasonSerializer(many=True, read_only=True)
    nationality = serializers.CharField(read_only=True)
    country_flag = serializers.SerializerMethodField()

    class Meta:
        model = f1.Team

    def get_country_flag(self, obj: f1.Team) -> str | None:
        return safe_get_country_flag(obj.country_code)
