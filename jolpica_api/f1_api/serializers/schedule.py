from __future__ import annotations

from rest_framework import serializers

from jolpica.formula_one import models as f1

from .base_serializer import OmitNullMixin


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
