from __future__ import annotations

from drf_spectacular.utils import extend_schema, extend_schema_view

from jolpica.formula_one import models as f1
from jolpica_schemas.f1_api.alpha.pit_stop import (
    PitStopQueryParams,
    PitStopSummary,
    RetrievedPitStopDetail,
)

from ..serializers.pit_stop import PitStopSerializer
from ..utils import pydantic_to_open_api_parameters
from .base_viewset import BaseFilterableViewSet


@extend_schema_view(
    list=extend_schema(
        summary="List all F1 Pit Stops",
        description=(
            "Provides a paginated list of all F1 pit stops with driver, team, session, round, and lap information. "
            "Includes pit stop duration in three formats: ISO 8601 duration, human-readable string, and milliseconds."
        ),
        parameters=pydantic_to_open_api_parameters(PitStopQueryParams),
        responses={200: PitStopSummary},
    ),
    retrieve=extend_schema(
        summary="Get F1 Pit Stop Detail",
        description=(
            "Provides detailed information for a specific pit stop, including timing data and context "
            "(driver, team, session, round, and lap)."
        ),
        responses={200: RetrievedPitStopDetail},
    ),
)
class PitStopViewSet(BaseFilterableViewSet):
    """
    API endpoint for viewing F1 pit stops with complete context and timing data.
    Uses standard metadata/data response format. (Alpha Version)
    """

    serializer_class = PitStopSerializer
    query_params_class = PitStopQueryParams
    response_schema_class = PitStopSummary

    def get_queryset(self):
        """Optimize database queries with select_related and prefetch_related."""
        queryset = f1.PitStop.objects.select_related(
            "session_entry__session__round__season",
            "session_entry__round_entry__team_driver__driver",
            "session_entry__round_entry__team_driver__team",
            "lap",
        )

        # Get validated query parameters
        params = self._get_validated_query_params()

        # Apply filters
        if params.year is not None:
            queryset = queryset.filter(session_entry__session__round__season__year=params.year)

        if params.session_id is not None:
            queryset = queryset.filter(session_entry__session__api_id=params.session_id)

        if params.driver_id is not None:
            queryset = queryset.filter(session_entry__round_entry__team_driver__driver__api_id=params.driver_id)

        if params.team_id is not None:
            queryset = queryset.filter(session_entry__round_entry__team_driver__team__api_id=params.team_id)

        if params.round_id is not None:
            queryset = queryset.filter(session_entry__session__round__api_id=params.round_id)

        if params.lap_number is not None:
            queryset = queryset.filter(lap__number=params.lap_number)

        if params.stop_number is not None:
            queryset = queryset.filter(number=params.stop_number)

        return queryset.order_by("session_entry__session__timestamp", "number")
