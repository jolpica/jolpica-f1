from __future__ import annotations

from django.urls import reverse
from rest_framework import serializers

from jolpica.formula_one import models as f1
from jolpica_schemas.f1_api.alpha.schedule import (
    ScheduleCircuit,
    ScheduleDetail,
    ScheduleRound,
    ScheduleSummary,
)

from .base_serializer import BaseAPISerializer, OmitNullMixin


class SessionSerializer(OmitNullMixin, serializers.Serializer):
    type = serializers.CharField(read_only=True)
    type_display = serializers.CharField(source="get_type_display", read_only=True)
    timestamp = serializers.DateTimeField(read_only=True)
    timezone = serializers.CharField(read_only=True)
    missing_time_data = serializers.SerializerMethodField(read_only=True)
    # Must use CharField instead of DateTimeField as otherwise it will display as UTC
    local_timestamp = serializers.CharField(read_only=True)
    results_url = serializers.SerializerMethodField(read_only=True)

    def get_missing_time_data(self, obj: f1.Session) -> bool | None:
        if obj.has_time_data:
            return None
        return True

    def get_results_url(self, obj: f1.Session) -> str | None:
        request = self.context.get("request")
        if not request:
            return None

        if getattr(obj, "_is_consolidated_session", False):
            effective_type = obj._consolidated_session_type[0]  # type: ignore[attr-defined]
        else:
            effective_type = obj.type

        round_api_id = obj.round.api_id
        url = reverse("results-results", args=[round_api_id, effective_type])
        return request.build_absolute_uri(url)

    def to_representation(self, instance: f1.Session) -> dict:
        """Modify representation for consolidated qualifying sessions."""
        representation = super().to_representation(instance)
        if getattr(instance, "_is_consolidated_session", False):
            representation["type"], representation["type_display"] = instance._consolidated_session_type  # type: ignore[attr-defined]
        return representation


class CircuitScheduleSerializer(BaseAPISerializer):
    """Serializer for Circuit in schedule context.

    Required prefetches: select_related('circuit') on Round
    """

    pydantic_schema_class = ScheduleCircuit
    view_name = "circuits-detail"

    reference = serializers.CharField(read_only=True)

    class Meta:
        model = f1.Circuit
        fields = list(ScheduleCircuit.model_fields.keys())


class RoundScheduleSerializer(BaseAPISerializer):
    """Serializer for Round in schedule context.

    Required prefetches: select_related('circuit'), prefetch_related('sessions')
    """

    pydantic_schema_class = ScheduleRound
    view_name = "rounds-detail"

    circuit = CircuitScheduleSerializer(read_only=True)
    sessions = SessionSerializer(many=True, read_only=True, source="sessions_for_serializer")

    class Meta:
        model = f1.Round
        fields = list(ScheduleRound.model_fields.keys())


class SeasonScheduleSerializer(OmitNullMixin, serializers.HyperlinkedModelSerializer):
    id = serializers.CharField(source="api_id", read_only=True)
    url = serializers.HyperlinkedIdentityField(view_name="schedules-detail", lookup_field="year", read_only=True)

    class Meta:
        model = f1.Season
        fields = list(ScheduleSummary.model_fields.keys())


class SeasonScheduleDetailSerializer(SeasonScheduleSerializer):
    rounds = RoundScheduleSerializer(many=True, read_only=True, source="rounds_for_serializer")
    rounds_info = serializers.SerializerMethodField()

    class Meta:
        model = f1.Season
        fields = list(ScheduleDetail.model_fields.keys())

    def get_rounds_info(self, obj: f1.Season) -> dict | None:
        return self.context.get("rounds_info")
