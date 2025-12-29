from drf_spectacular.utils import extend_schema, extend_schema_view

from jolpica.formula_one import models as f1
from jolpica_schemas.f1_api.alpha.circuit import CircuitQueryParams, CircuitSummary, RetrievedCircuitDetail

from ..serializers import CircuitSerializer
from ..utils import pydantic_to_open_api_parameters
from .base_viewset import BaseFilterableViewSet


@extend_schema_view(
    list=extend_schema(
        summary="List all F1 Circuits",
        description="Provides a paginated list of all F1 circuits. "
        + "Can be filtered by year (circuits used in a specific season) and country code.",
        parameters=pydantic_to_open_api_parameters(CircuitQueryParams),
        responses={200: CircuitSummary},
    ),
    retrieve=extend_schema(
        summary="Get F1 Circuit Detail",
        description="Provides detailed information for a specific circuit.",
        responses={200: RetrievedCircuitDetail},
    ),
)
class CircuitViewSet(BaseFilterableViewSet):
    """
    API endpoint for viewing F1 circuits.
    Uses standard metadata/data response format. (Alpha Version)
    """

    serializer_class = CircuitSerializer
    query_params_class = CircuitQueryParams
    response_schema_class = CircuitSummary

    def get_queryset(self):
        """Optimize database queries with filters."""
        queryset = f1.Circuit.objects.all()

        # Get validated query parameters
        params = self._get_validated_query_params()

        # Apply filters
        if params.year is not None:
            queryset = queryset.filter(rounds__season__year=params.year).distinct()

        if params.country_code is not None:
            queryset = queryset.filter(country_code=params.country_code)

        return queryset.order_by("name")
