from __future__ import annotations

from rest_framework import serializers

from jolpica.formula_one import models as f1
from jolpica.schemas.f1_api.alpha.driver import (
    DriverSeason,
    DriverSummary,
    DriverTeam,
    DriverTeamDriver,
)

from .base_serializer import BaseAPISerializer


class DriverTeamSerializer(BaseAPISerializer):
    """
    Serializer for Team information in Driver context.

    Required prefetches: None
    """

    pydantic_schema_class = DriverTeam
    view_name = "teams-detail"

    class Meta:
        model = f1.Team
        fields = ["id", "url", "name", "country_code"]


class DriverSeasonSerializer(BaseAPISerializer):
    """
    Serializer for Season information in Driver context.

    Required prefetches: None
    """

    pydantic_schema_class = DriverSeason
    # view_name = "seasons-detail"  # TODO: implement this endpoint

    class Meta:
        model = f1.Season
        fields = ["id", "year"]


class DriverTeamDriverSerializer(BaseAPISerializer):
    """
    Serializer for TeamDriver (team/season stint) information in Driver context.

    Required prefetches:
    - select_related('team', 'season')
    """

    pydantic_schema_class = DriverTeamDriver
    # view_name = "teamdrivers-detail"  # TODO: implement this endpoint
    team = DriverTeamSerializer(read_only=True)
    season = DriverSeasonSerializer(read_only=True)
    role_display = serializers.CharField(source="get_role_display", read_only=True)

    class Meta:
        model = f1.TeamDriver
        fields = ["id", "team", "season", "role", "role_display"]


class DriverSerializer(BaseAPISerializer):
    """
    Serializer for Driver with nested team history.

    Required prefetches:
    - prefetch_related('team_drivers__team', 'team_drivers__season')
    """

    pydantic_schema_class = DriverSummary
    view_name = "drivers-detail"
    first_name = serializers.CharField(read_only=True, source="forename")
    last_name = serializers.CharField(read_only=True, source="surname")
    teams = DriverTeamDriverSerializer(many=True, read_only=True, source="team_drivers")
    nationality = serializers.CharField(read_only=True)  # TODO: Generate from country_code

    class Meta:
        model = f1.Driver
        fields = [
            "id",
            "url",
            "first_name",
            "last_name",
            "abbreviation",
            "nationality",
            "country_code",
            "permanent_car_number",
            "date_of_birth",
            "wikipedia",
            "teams",
        ]
