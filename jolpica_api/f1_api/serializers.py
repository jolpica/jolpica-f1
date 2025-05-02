from rest_framework import serializers

from jolpica.formula_one.models import Circuit, Round, Season, Session


class CircuitLocationSerializer(serializers.ModelSerializer):
    class Meta:
        model = Circuit
        fields = ["latitude", "longitude", "altitude", "locality", "country", "country_code"]


class CircuitScheduleSerializer(serializers.ModelSerializer):
    location = CircuitLocationSerializer(source="*", read_only=True)

    class Meta:
        model = Circuit
        fields = ["name", "reference", "wikipedia", "location"]


class SessionSerializer(serializers.ModelSerializer):
    type_display = serializers.CharField(source="get_type_display", read_only=True)

    class Meta:
        model = Session
        fields = ["type", "type_display", "date", "time"]


class RoundScheduleSerializer(serializers.ModelSerializer):
    sessions = SessionSerializer(source="sessions_for_serializer", many=True, read_only=True)
    circuit = CircuitScheduleSerializer(read_only=True)

    class Meta:
        model = Round
        fields = ["number", "name", "circuit", "date", "sessions"]


class SeasonScheduleSerializer(serializers.ModelSerializer):
    year = serializers.IntegerField()
    url = serializers.HyperlinkedIdentityField(
        view_name="season-schedule-detail",
        lookup_field="year",
    )

    class Meta:
        model = Season
        fields = ["url", "year", "wikipedia"]  # Only include the year and season_url in the list view


class SeasonScheduleDetailSerializer(SeasonScheduleSerializer):
    rounds = RoundScheduleSerializer(source="rounds_for_serializer", many=True, read_only=True)
    rounds_info = serializers.SerializerMethodField()

    def get_rounds_info(self, obj):
        # Calculated in the retrieve view
        return self.context.get("rounds_info") 

    class Meta:
        model = Season
        fields = ["url", "year", "wikipedia", "rounds_info", "rounds"]

