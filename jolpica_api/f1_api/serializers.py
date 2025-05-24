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


class SessionDriverSerializer(serializers.ModelSerializer):
    first_name = serializers.CharField(source="forename")
    last_name = serializers.CharField(source="surname")

    class Meta:
        model = f1.Driver
        fields = ["first_name", "last_name", "abbreviation", "country_code"]


class SessionTeamSerializer(serializers.ModelSerializer):
    class Meta:
        model = f1.Team
        fields = ["name", "country_code"]


class RoundInfoSerializer(serializers.ModelSerializer):
    class Meta:
        model = f1.Round
        fields = ["number", "name"]


class SessionEntrySerializer(serializers.ModelSerializer):
    driver = SessionDriverSerializer(source="round_entry.team_driver.driver")
    team = SessionTeamSerializer(source="round_entry.team_driver.team")
    time = serializers.SerializerMethodField()
    position_order = serializers.IntegerField(source="position")
    position_display = serializers.SerializerMethodField()
    grid_order = serializers.IntegerField(source="grid")
    completed_laps = serializers.IntegerField(source="laps_completed")
    classification = serializers.SerializerMethodField()
    car_number = serializers.CharField(source="round_entry.car_number", read_only=True)
    fastest_laps = serializers.SerializerMethodField()

    class Meta:
        model = f1.SessionEntry
        fields = [
            "position_order",
            "position_display",
            "points",
            "grid_order",
            "completed_laps",
            "is_classified",
            "classification",
            "time",
            "fastest_laps",
            "car_number",
            "driver",
            "team",
        ]

    def get_time(self, obj):
        if obj.time:
            return {"milliseconds": int(obj.time.total_seconds() * 1000)}
        return None

    def get_position_display(self, obj):
        return str(obj.position) if obj.position and obj.is_classified else "-"

    def get_classification(self, obj):
        return f1.SessionStatus(obj.status).name if obj.status is not None else None

    def get_fastest_laps(self, obj):
        if not hasattr(obj, "fastest_laps"):
            return None

        return [
            {
                "session_type": lap.session_entry.session.type,
                "lap_number": lap.number,
                "time": {"milliseconds": int(lap.time.total_seconds() * 1000)} if lap.time else None,
                "rank": lap.position,
            }
            for lap in obj.fastest_laps
        ]


class SessionListSerializer(serializers.HyperlinkedModelSerializer):
    url = serializers.SerializerMethodField()
    round = RoundInfoSerializer()
    type = serializers.SerializerMethodField()
    type_display = serializers.SerializerMethodField()
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
                "sessions-detail",
                kwargs={"year": obj.round.season.year, "round_number": obj.round.number, "session_type": obj.type},
            )
        )

    def get_type(self, instance):
        if hasattr(instance, "_consolidated_session_type"):
            return instance._consolidated_session_type[0]
        return instance.type

    def get_type_display(self, instance):
        if hasattr(instance, "_consolidated_session_type"):
            return instance._consolidated_session_type[1]
        return instance.get_type_display()


class SessionDetailSerializer(SessionListSerializer):
    circuit = CircuitScheduleSerializer(source="round.circuit")
    results = serializers.SerializerMethodField()

    class Meta(SessionListSerializer.Meta):
        fields = [*SessionListSerializer.Meta.fields, "circuit", "results"]

    def get_results(self, obj):
        """Get either consolidated or regular session results."""
        if hasattr(obj, "_consolidated_results"):
            entries = obj._consolidated_results
        else:
            entries = obj.session_entries.all()
        return SessionEntrySerializer(entries, many=True).data
