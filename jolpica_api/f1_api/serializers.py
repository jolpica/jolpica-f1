from __future__ import annotations

from rest_framework import serializers

from jolpica.formula_one import models as f1


class OmitNullMixin:
    """Mixin to omit null/None values from serializer output."""

    def to_representation(self, instance):
        representation = super().to_representation(instance)
        return {key: value for key, value in representation.items() if value is not None}


class BaseAPISerializer(OmitNullMixin, serializers.ModelSerializer):
    """
    Base serializer for F1 API endpoints.

    Provides common fields:
    - id: Maps model's api_id to id for API response
    - url: Self-referencing hyperlinked field (auto-generated if view_name is set)

    Subclasses must define:
    - view_name: The DRF view name for the url field (e.g., 'rounds-detail')
    - Meta.model: The Django model
    - Meta.fields: List of fields to include (must include 'id' and 'url')

    Usage:
        class MySerializer(BaseAPISerializer):
            view_name = "myresources-detail"

            class Meta:
                model = MyModel
                fields = ["id", "url", "field1", "field2"]
    """

    id = serializers.CharField(read_only=True, source="api_id")

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        # Dynamically add url field with correct view_name if not explicitly declared
        # Check both the declared fields (from class definition) and instance fields
        if hasattr(self.__class__, "view_name") and "url" not in self._declared_fields:
            self.fields["url"] = serializers.HyperlinkedIdentityField(
                view_name=self.__class__.view_name, lookup_field="api_id", read_only=True
            )


class SessionSerializer(OmitNullMixin, serializers.Serializer):
    type = serializers.CharField(read_only=True)
    type_display = serializers.CharField(source="get_type_display", read_only=True)
    timestamp = serializers.DateTimeField(read_only=True)
    timezone = serializers.CharField(read_only=True)
    has_time_data = serializers.BooleanField(read_only=True)
    # Must use CharField instead of DateTimeField as otherwise it will display as UTC
    local_timestamp = serializers.CharField(read_only=True)

    def to_representation(self, instance):
        """
        Modify representation for consolidated qualifying sessions.
        """
        representation = super().to_representation(instance)
        if getattr(instance, "_is_consolidated_session", False):
            representation["type"], representation["type_display"] = instance._consolidated_session_type
        return representation


class CircuitScheduleSerializer(OmitNullMixin, serializers.ModelSerializer):
    latitude = serializers.FloatField(read_only=True)
    longitude = serializers.FloatField(read_only=True)
    altitude = serializers.FloatField(read_only=True)
    locality = serializers.CharField(read_only=True)
    country_code = serializers.CharField(read_only=True)

    class Meta:
        model = f1.Circuit
        fields = [
            "name",
            "reference",
            "wikipedia",
            "latitude",
            "longitude",
            "altitude",
            "locality",
            "country_code",
        ]


class RoundScheduleSerializer(OmitNullMixin, serializers.ModelSerializer):
    circuit = CircuitScheduleSerializer(read_only=True)
    sessions = SessionSerializer(many=True, read_only=True, source="sessions_for_serializer")

    class Meta:
        model = f1.Round
        fields = ["number", "name", "circuit", "date", "sessions"]


class SeasonScheduleSerializer(OmitNullMixin, serializers.HyperlinkedModelSerializer):
    url = serializers.HyperlinkedIdentityField(view_name="schedules-detail", lookup_field="year", read_only=True)

    class Meta:
        model = f1.Season
        fields = ["url", "year", "wikipedia"]


class SeasonScheduleDetailSerializer(SeasonScheduleSerializer):
    rounds = RoundScheduleSerializer(many=True, read_only=True, source="rounds_for_serializer")
    rounds_info = serializers.SerializerMethodField()

    class Meta:
        model = f1.Season
        fields = ["url", "year", "wikipedia", "rounds_info", "rounds"]

    def get_rounds_info(self, obj):
        return self.context.get("rounds_info")


class RoundInfoSerializer(OmitNullMixin, serializers.ModelSerializer):
    class Meta:
        model = f1.Round
        fields = ["number", "name"]


class RoundCircuitSerializer(OmitNullMixin, serializers.ModelSerializer):
    """
    Serializer for Circuit information in Round context.

    Required prefetches: None
    """

    id = serializers.CharField(read_only=True, source="api_id")
    url = serializers.HyperlinkedIdentityField(view_name="circuits-detail", lookup_field="api_id", read_only=True)

    class Meta:
        model = f1.Circuit
        fields = ["id", "url", "name", "locality", "country_code"]


class RoundSeasonSerializer(OmitNullMixin, serializers.HyperlinkedModelSerializer):
    """
    Serializer for Season information in Round context.

    Required prefetches: None
    """

    id = serializers.CharField(read_only=True, source="api_id")
    url = serializers.HyperlinkedIdentityField(view_name="schedules-detail", lookup_field="year", read_only=True)

    class Meta:
        model = f1.Season
        fields = ["id", "url", "year"]


class RoundSessionSerializer(OmitNullMixin, serializers.ModelSerializer):
    """
    Serializer for Session information in Round context.

    Required prefetches: None
    Note: local_timestamp is a property that requires timezone and timestamp to be populated
    """

    id = serializers.CharField(read_only=True, source="api_id")
    url = serializers.SerializerMethodField()
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


class CircuitSerializer(BaseAPISerializer):
    """
    Serializer for Circuit information.

    Required prefetches: None
    """

    view_name = "circuits-detail"

    class Meta:
        model = f1.Circuit
        fields = [
            "id",
            "url",
            "name",
            "reference",
            "locality",
            "country",
            "country_code",
            "latitude",
            "longitude",
            "altitude",
            "wikipedia",
        ]


class DriverTeamSerializer(BaseAPISerializer):
    """
    Serializer for Team information in Driver context.

    Required prefetches: None
    """

    # view_name = "teams-detail"  # TODO: implement this endpoint

    class Meta:
        model = f1.Team
        fields = ["id", "name", "country_code"]


class DriverSeasonSerializer(BaseAPISerializer):
    """
    Serializer for Season information in Driver context.

    Required prefetches: None
    """

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


class TeamSeasonSerializer(BaseAPISerializer):
    """
    Serializer for Season information in Team context.

    Required prefetches: None
    """

    # view_name = "seasons-detail"  # TODO: implement this endpoint

    class Meta:
        model = f1.Season
        fields = ["id", "year"]


class TeamSerializer(BaseAPISerializer):
    """
    Serializer for Team with nested season information.

    Required prefetches:
    - prefetch_related('seasons')
    """

    view_name = "teams-detail"
    seasons = TeamSeasonSerializer(many=True, read_only=True)
    nationality = serializers.CharField(read_only=True)  # TODO: Generate nationality from country_code

    class Meta:
        model = f1.Team
        fields = [
            "id",
            "url",
            "name",
            "nationality",
            "country_code",
            "wikipedia",
            "seasons",
        ]
