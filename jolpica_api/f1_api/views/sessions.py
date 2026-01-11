from drf_spectacular.utils import extend_schema, extend_schema_view

from jolpica.formula_one import models as f1
from jolpica_schemas.f1_api.alpha.session import (
    RetrievedSessionDetail,
    SessionQueryParams,
    SessionSummary,
)

from ..serializers import SessionSerializer
from ..utils import pydantic_to_open_api_parameters
from .base_viewset import BaseFilterableViewSet


@extend_schema_view(
    list=extend_schema(
        summary="List all F1 Sessions",
        description="Provides a paginated list of all F1 sessions with round information.",
        parameters=pydantic_to_open_api_parameters(SessionQueryParams),
        responses={200: SessionSummary},
    ),
    retrieve=extend_schema(
        summary="Get F1 Session Detail",
        description="Provides detailed information for a specific session, including round information.",
        responses={200: RetrievedSessionDetail},
    ),
)
class SessionViewSet(BaseFilterableViewSet):
    """
    API endpoint for viewing F1 sessions with round details.
    Uses standard metadata/data response format. (Alpha Version)
    """

    serializer_class = SessionSerializer
    query_params_class = SessionQueryParams
    response_schema_class = SessionSummary

    def get_queryset(self):
        """Optimize database queries with select_related and prefetch_related."""
        queryset = f1.Session.objects.select_related("round")

        # Get validated query parameters
        params = self._get_validated_query_params(self.query_params_class)

        # Apply filters
        if params.year is not None:
            queryset = queryset.filter(round__season__year=params.year)

        if params.session_type is not None:
            queryset = queryset.filter(type=params.session_type)

        if params.round_id is not None:
            queryset = queryset.filter(round__api_id=params.round_id)

        if params.circuit_id is not None:
            queryset = queryset.filter(round__circuit__api_id=params.circuit_id)

        return queryset.order_by("timestamp", "number")
