from drf_spectacular.utils import extend_schema, extend_schema_view

from jolpica.formula_one import models as f1
from jolpica_schemas.f1_api.alpha.round import RetrievedRoundDetail, RoundQueryParams, RoundSummary

from ..serializers import RoundSerializer
from ..utils import pydantic_to_open_api_parameters
from .base_viewset import BaseFilterableViewSet


@extend_schema_view(
    list=extend_schema(
        summary="List all F1 Rounds",
        description="Provides a paginated list of all F1 rounds with circuit, season, and session information.",
        parameters=pydantic_to_open_api_parameters(RoundQueryParams),
        responses={200: RoundSummary},
    ),
    retrieve=extend_schema(
        summary="Get F1 Round Detail",
        description="Provides detailed information for a specific round, including circuit, season, and all sessions.",
        responses={200: RetrievedRoundDetail},
    ),
)
class RoundViewSet(BaseFilterableViewSet):
    """
    API endpoint for viewing F1 rounds with circuit, season, and session details.
    Uses standard metadata/data response format. (Alpha Version)
    """

    serializer_class = RoundSerializer
    query_params_class = RoundQueryParams
    response_schema_class = RoundSummary

    def get_queryset(self):
        """Optimize database queries with select_related and prefetch_related."""
        queryset = f1.Round.objects.select_related("season", "circuit").prefetch_related("sessions")

        # Get validated query parameters
        params = self._get_validated_query_params(self.query_params_class)

        if params.year is not None:
            queryset = queryset.filter(season__year=params.year)

        if params.round_number is not None:
            queryset = queryset.filter(number=params.round_number)

        if params.race_number is not None:
            queryset = queryset.filter(race_number=params.race_number)

        if params.is_cancelled is not None:
            queryset = queryset.filter(is_cancelled=params.is_cancelled)

        if params.driver_id is not None:
            queryset = queryset.filter(round_entries__team_driver__driver__api_id=params.driver_id)

        if params.team_id is not None:
            queryset = queryset.filter(round_entries__team_driver__team__api_id=params.team_id)

        # Use distinct() when filtering on many-to-many relationships
        if params.driver_id or params.team_id:
            queryset = queryset.distinct()

        return queryset.order_by("season__year", "number")
