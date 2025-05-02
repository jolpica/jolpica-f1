from rest_framework import serializers

from jolpica.formula_one import models as f1


class SessionSerializer(serializers.ModelSerializer):
    type_display = serializers.CharField(source="get_type_display")

    class Meta:
        model = f1.Session
        fields = ["type", "type_display", "date", "time"]


class CircuitScheduleSerializer(serializers.ModelSerializer):
    latitude = serializers.FloatField(read_only=True, allow_null=True)
    longitude = serializers.FloatField(read_only=True, allow_null=True)
    altitude = serializers.FloatField(read_only=True, allow_null=True)
    locality = serializers.CharField(read_only=True, allow_null=True)
    country = serializers.CharField(read_only=True, allow_null=True)
    country_code = serializers.CharField(read_only=True, allow_null=True)

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
            "country",
            "country_code",
        ]


class RoundScheduleSerializer(serializers.ModelSerializer):
    circuit = CircuitScheduleSerializer(read_only=True)
    sessions = SessionSerializer(many=True, read_only=True, source="sessions_for_serializer")

    class Meta:
        model = f1.Round
        fields = ["number", "name", "circuit", "date", "sessions"]


class SeasonScheduleSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = f1.Season
        fields = ["url", "year", "wikipedia"]
        extra_kwargs = {"url": {"view_name": "season-schedule-detail", "lookup_field": "year"}}


class SeasonScheduleDetailSerializer(serializers.HyperlinkedModelSerializer):
    rounds = RoundScheduleSerializer(many=True, read_only=True, source="rounds_for_serializer")
    rounds_info = serializers.SerializerMethodField()

    class Meta:
        model = f1.Season
        fields = ["url", "year", "wikipedia", "rounds_info", "rounds"]
        extra_kwargs = {"url": {"view_name": "season-schedule-detail", "lookup_field": "year"}}

    def get_rounds_info(self, obj):
        return self.context.get("rounds_info")
