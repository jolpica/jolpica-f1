from drf_spectacular.utils import extend_schema, extend_schema_view

from jolpica.formula_one import models as f1
from jolpica_schemas.f1_api.alpha.season import RetrievedSeasonDetail, SeasonQueryParams, SeasonSummary

from ..serializers.season import SeasonSerializer
from ..utils import pydantic_to_open_api_parameters
from .base_viewset import BaseFilterableViewSet


@extend_schema_view(
    list=extend_schema(
        summary="List all F1 Seasons",
        description="Provides a paginated list of all F1 circuits. "
        + "Can be filtered by year (circuits used in a specific season) and country code.",
        parameters=pydantic_to_open_api_parameters(SeasonQueryParams),
        responses={200: SeasonSummary},
    ),
    retrieve=extend_schema(
        summary="Get F1 Season Detail",
        description="Provides detailed information for a specific circuit.",
        responses={200: RetrievedSeasonDetail},
    ),
)
class SeasonViewSet(BaseFilterableViewSet):
    """
    API endpoint for viewing F1 circuits.
    Uses standard metadata/data response format. (Alpha Version)
    """

    serializer_class = SeasonSerializer
    query_params_class = SeasonQueryParams
    response_schema_class = SeasonSummary

    def get_queryset(self):
        """Optimize database queries with filters."""
        queryset = f1.Season.objects.all()

        # Get validated query parameters
        params = self._get_validated_query_params(self.query_params_class)

        # Apply filters
        if params.country_code is not None:
            queryset = queryset.filter(rounds__circuit__country_code=params.country_code)

        if params.circuit_id is not None:
            queryset = queryset.filter(rounds__circuit__api_id=params.circuit_id)

        if params.driver_id is not None:
            queryset = queryset.filter(rounds__round_entries__team_driver__driver__api_id=params.driver_id)

        if params.team_id is not None:
            queryset = queryset.filter(rounds__round_entries__team_driver__team__api_id=params.team_id)

        return queryset.order_by("year").distinct()
