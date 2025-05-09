from django.urls import reverse
from rest_framework import serializers

from jolpica.formula_one import models as f1


class SessionSerializer(serializers.Serializer):
    type = serializers.CharField(read_only=True)
    type_display = serializers.CharField(source="get_type_display", read_only=True)
    date = serializers.DateField(read_only=True)
    time = serializers.TimeField(read_only=True)

    def to_representation(self, instance):
        """
        Modify representation for consolidated qualifying sessions.
        """
        representation = super().to_representation(instance)
        if getattr(instance, "_is_consolidated_session", False):
            representation["type"], representation["type_display"] = instance._consolidated_session_type
        return representation


class CircuitScheduleSerializer(serializers.ModelSerializer):
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


class RoundScheduleSerializer(serializers.ModelSerializer):
    circuit = CircuitScheduleSerializer(read_only=True)
    sessions = SessionSerializer(many=True, read_only=True, source="sessions_for_serializer")

    class Meta:
        model = f1.Round
        fields = ["number", "name", "circuit", "date", "sessions"]


class SeasonScheduleSerializer(serializers.HyperlinkedModelSerializer):
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


class FastestLapSerializer(serializers.ModelSerializer):
    rank = serializers.IntegerField(source="position")
    lap_number = serializers.IntegerField(source="number")
    time = serializers.SerializerMethodField()

    class Meta:
        model = f1.Lap
        fields = ["rank", "lap_number", "time"]

    def get_time(self, obj):
        if obj.time:
            return {"milliseconds": int(obj.time.total_seconds() * 1000)}
        return None


class ResultDriverSerializer(serializers.ModelSerializer):
    class Meta:
        model = f1.Driver
        fields = ["reference", "forename", "surname", "abbreviation", "country_code"]


class ResultTeamSerializer(serializers.ModelSerializer):
    class Meta:
        model = f1.Team
        fields = ["reference", "name", "country_code"]


class RoundInfoSerializer(serializers.ModelSerializer):
    class Meta:
        model = f1.Round
        fields = ["number", "name"]


class SessionResultSerializer(serializers.ModelSerializer):
    driver = ResultDriverSerializer(source="round_entry.team_driver.driver")
    team = ResultTeamSerializer(source="round_entry.team_driver.team")
    fastest_lap = serializers.SerializerMethodField()
    time = serializers.SerializerMethodField()
    position = serializers.SerializerMethodField()
    grid_position = serializers.IntegerField(source="grid")
    completed_laps = serializers.IntegerField(source="laps_completed")
    classification = serializers.SerializerMethodField()
    car_number = serializers.CharField(source="round_entry.car_number", read_only=True)

    class Meta:
        model = f1.SessionEntry
        fields = [
            "position",
            "points",
            "grid_position",
            "completed_laps",
            "is_classified",
            "classification",
            "time",
            "fastest_lap",
            "car_number",
            "driver",
            "team",
        ]

    def get_fastest_lap(self, obj):
        # Get the fastest lap from prefetched list
        if hasattr(obj, "fastest_lap_list") and obj.fastest_lap_list:
            return FastestLapSerializer(obj.fastest_lap_list[0]).data
        return None

    def get_time(self, obj):
        if obj.time:
            return {"milliseconds": int(obj.time.total_seconds() * 1000)}
        return None

    def get_position(self, obj):
        return {
            "order": obj.position,
            "display": str(obj.position) if obj.position and obj.is_classified else "-",
        }

    def get_classification(self, obj):
        return f1.SessionStatus(obj.status).name if obj.status is not None else None


class SessionListSerializer(serializers.HyperlinkedModelSerializer):
    url = serializers.SerializerMethodField()
    round = RoundInfoSerializer()
    type_display = serializers.CharField(source="get_type_display", read_only=True)
    season_year = serializers.IntegerField(source="round.season.year", read_only=True)

    class Meta:
        model = f1.Session
        fields = [
            "url",
            "season_year",
            "round",
            "type",
            "type_display",
            "date",
            "time",
        ]

    def get_url(self, obj):
        return self.context["request"].build_absolute_uri(
            reverse(
                "results-detail",
                kwargs={"year": obj.round.season.year, "round_number": obj.round.number, "session_type": obj.type},
            )
        )


class SessionDetailSerializer(SessionListSerializer):
    circuit = CircuitScheduleSerializer(source="round.circuit")
    results = SessionResultSerializer(source="session_entries", many=True)

    class Meta(SessionListSerializer.Meta):
        fields = [*SessionListSerializer.Meta.fields, "circuit", "results"]
