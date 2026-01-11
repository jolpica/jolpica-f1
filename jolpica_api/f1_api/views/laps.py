from __future__ import annotations

from drf_spectacular.utils import extend_schema, extend_schema_view

from jolpica.formula_one import models as f1
from jolpica_schemas.f1_api.alpha.lap import (
    LapQueryParams,
    LapSummary,
    RetrievedLapDetail,
)

from ..serializers.lap import LapSerializer
from ..utils import pydantic_to_open_api_parameters
from .base_viewset import BaseFilterableViewSet


@extend_schema_view(
    list=extend_schema(
        summary="List all F1 Laps",
        description=(
            "Provides a paginated list of all F1 laps with session entry and pit stop information. "
            "Includes lap times in three formats: ISO 8601 duration, human-readable string, and milliseconds."
        ),
        parameters=pydantic_to_open_api_parameters(LapQueryParams),
        responses={200: LapSummary},
    ),
    retrieve=extend_schema(
        summary="Get F1 Lap Detail",
        description=(
            "Provides detailed information for a specific lap, including timing data and pit stop information."
        ),
        responses={200: RetrievedLapDetail},
    ),
)
class LapViewSet(BaseFilterableViewSet):
    """
    API endpoint for viewing F1 laps with timing and pit stop data.
    Uses standard metadata/data response format. (Alpha Version)
    """

    serializer_class = LapSerializer
    query_params_class = LapQueryParams
    response_schema_class = LapSummary

    def get_queryset(self):
        """Optimize database queries with select_related and prefetch_related."""
        queryset = f1.Lap.objects.select_related(
            "session_entry",
            "session_entry__session__round__season",
            "session_entry__round_entry__team_driver__driver",
            "session_entry__round_entry__team_driver__team",
        ).prefetch_related("pit_stop")

        # Get validated query parameters
        params = self._get_validated_query_params(self.query_params_class)

        # Apply filters
        if params.year is not None:
            queryset = queryset.filter(session_entry__session__round__season__year=params.year)

        if params.session_id is not None:
            queryset = queryset.filter(session_entry__session__api_id=params.session_id)

        if params.session_type is not None and len(params.session_type) > 0:
            queryset = queryset.filter(session_entry__session__type__in=params.session_type)

        if params.session_entry_id is not None:
            queryset = queryset.filter(session_entry__api_id=params.session_entry_id)

        if params.driver_id is not None:
            queryset = queryset.filter(session_entry__round_entry__team_driver__driver__api_id=params.driver_id)

        if params.team_id is not None:
            queryset = queryset.filter(session_entry__round_entry__team_driver__team__api_id=params.team_id)

        if params.is_fastest_lap is not None:
            queryset = queryset.filter(is_entry_fastest_lap=params.is_fastest_lap)

        if params.has_pit_stop is not None:
            if params.has_pit_stop:
                queryset = queryset.filter(pit_stop__isnull=False)
            else:
                queryset = queryset.filter(pit_stop__isnull=True)

        return queryset.order_by("session_entry__session__timestamp", "number")
