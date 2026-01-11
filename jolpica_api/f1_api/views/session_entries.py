from drf_spectacular.utils import extend_schema, extend_schema_view

from jolpica.formula_one import models as f1
from jolpica_schemas.f1_api.alpha.session_entry import (
    RetrievedSessionEntryDetail,
    SessionEntryQueryParams,
    SessionEntrySummary,
)

from ..serializers.session_entry import SessionEntrySerializer
from ..utils import pydantic_to_open_api_parameters
from .base_viewset import BaseFilterableViewSet


@extend_schema_view(
    list=extend_schema(
        summary="List all F1 Session Entries",
        description=(
            "Provides a paginated list of all F1 session entries with session, round, driver, and team information."
        ),
        parameters=pydantic_to_open_api_parameters(SessionEntryQueryParams),
        responses={200: SessionEntrySummary},
    ),
    retrieve=extend_schema(
        summary="Get F1 Session Entry Detail",
        description="Provides detailed information for a specific session entry, including all performance data.",
        responses={200: RetrievedSessionEntryDetail},
    ),
)
class SessionEntryViewSet(BaseFilterableViewSet):
    """
    API endpoint for viewing F1 session entries with complete performance data.
    Uses standard metadata/data response format. (Alpha Version)
    """

    serializer_class = SessionEntrySerializer
    query_params_class = SessionEntryQueryParams
    response_schema_class = SessionEntrySummary

    def get_queryset(self):
        """Optimize database queries with select_related and prefetch_related."""
        queryset = f1.SessionEntry.objects.select_related(
            "session__round",
            "round_entry__team_driver__driver",
            "round_entry__team_driver__team",
        )

        # Get validated query parameters
        params = self._get_validated_query_params(self.query_params_class)

        # Apply filters
        if params.year is not None:
            queryset = queryset.filter(session__round__season__year=params.year)

        if params.session_id is not None:
            queryset = queryset.filter(session__api_id=params.session_id)

        if params.driver_id is not None:
            queryset = queryset.filter(round_entry__team_driver__driver__api_id=params.driver_id)

        if params.team_id is not None:
            queryset = queryset.filter(round_entry__team_driver__team__api_id=params.team_id)

        if params.position is not None:
            queryset = queryset.filter(position=params.position)

        if params.round_id is not None:
            queryset = queryset.filter(session__round__api_id=params.round_id)

        if params.session_type is not None and len(params.session_type) > 0:
            queryset = queryset.filter(session__type__in=params.session_type)

        if params.has_session_points is not None:
            if params.has_session_points:
                queryset = queryset.filter(session__point_system_id__gt=1)
            else:
                queryset = queryset.filter(session__point_system_id=1)

        return queryset.order_by("session__timestamp", "position")
