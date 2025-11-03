from django.db.models import Prefetch
from drf_spectacular.utils import extend_schema, extend_schema_view

from jolpica.formula_one import models as f1
from jolpica.schemas.f1_api.alpha.team import RetrievedTeamDetail, TeamQueryParams, TeamSummary
from jolpica_api.metrics_mixin import MetricsInstrumentationMixin

from ..serializers import TeamSerializer
from ..utils import pydantic_to_open_api_parameters
from .base_viewset import BaseFilterableViewSet


@extend_schema_view(
    list=extend_schema(
        summary="List all F1 Teams",
        description="Provides a paginated list of all F1 teams with their season history. ",
        parameters=pydantic_to_open_api_parameters(TeamQueryParams),
        responses={200: TeamSummary},
    ),
    retrieve=extend_schema(
        summary="Get F1 Team Detail",
        description="Provides detailed information for a specific team, including all seasons they competed in.",
        responses={200: RetrievedTeamDetail},
    ),
)
class TeamViewSet(MetricsInstrumentationMixin, BaseFilterableViewSet):
    """
    API endpoint for viewing F1 teams (constructors) with season history.
    Uses standard metadata/data response format.
    """

    serializer_class = TeamSerializer
    query_params_class = TeamQueryParams
    response_schema_class = TeamSummary

    def get_queryset(self):
        """Optimize database queries with prefetch_related and filters."""
        from django.db.models import Min

        # Prefetch seasons with distinct to avoid duplicates (a team can have multiple drivers in same season)
        queryset = f1.Team.objects.prefetch_related(
            Prefetch("seasons", queryset=f1.Season.objects.distinct()),
        )

        # Get validated query parameters
        params = self._get_validated_query_params()

        # Apply filters
        if params.year is not None:
            queryset = queryset.filter(seasons__year=params.year)

        if params.country_code is not None:
            queryset = queryset.filter(country_code=params.country_code)

        # Use distinct() when filtering on many-to-many relationships
        if params.year:
            queryset = queryset.distinct()

        # Order by first round appearance, then alphabetically
        return queryset.annotate(
            first_round_number=Min("team_drivers__round_entries__round__race_number"),
        ).order_by("first_round_number", "name")
