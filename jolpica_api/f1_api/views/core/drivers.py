from django.db.models import Min
from django.urls import reverse
from django.utils import timezone
from drf_spectacular.utils import extend_schema, extend_schema_view
from rest_framework.decorators import action
from rest_framework.response import Response

from jolpica.formula_one import models as f1
from jolpica.formula_one.driver_stats import get_driver_career_stats
from jolpica_schemas.f1_api.alpha.core.driver import (
    DriverQueryParams,
    DriverStats,
    DriverSummary,
    RetrievedDriverDetail,
    RetrievedDriverStats,
)
from jolpica_schemas.f1_api.alpha.metadata import DetailMetadata, DetailResponse
from jolpica_schemas.f1_api.alpha.shared import BasicDriver

from ...serializers import DriverSerializer
from ...utils import pydantic_to_open_api_parameters
from .base_viewset import BaseFilterableViewSet


@extend_schema_view(
    list=extend_schema(
        summary="List all F1 Drivers",
        description="Provides a paginated list of all F1 drivers with their team history. "
        + "Can be filtered by season year, team, country code, and driver role.",
        parameters=pydantic_to_open_api_parameters(DriverQueryParams),
        responses={200: DriverSummary},
    ),
    retrieve=extend_schema(
        summary="Get F1 Driver Detail",
        description="Provides detailed information for a specific driver, "
        + "including complete team history across all seasons.",
        responses={200: RetrievedDriverDetail},
    ),
    stats=extend_schema(
        summary="Get F1 Driver Career Stats",
        description="Provides career statistics for a specific F1 driver.",
        responses={200: RetrievedDriverStats},
    ),
)
class DriverViewSet(BaseFilterableViewSet):
    """
    API endpoint for viewing F1 drivers with team history.
    Uses standard metadata/data response format. (Alpha Version)
    """

    serializer_class = DriverSerializer
    query_params_class = DriverQueryParams
    response_schema_class = DriverSummary

    @action(detail=True, methods=["get"], url_path="stats")
    def stats(self, request, *args, **kwargs):
        driver = self.get_object()
        driver_stats = get_driver_career_stats(driver)
        data = DriverStats(
            driver=BasicDriver(
                id=driver.api_id,
                url=request.build_absolute_uri(reverse("core-drivers-detail", args=[driver.api_id])),
                abbreviation=driver.abbreviation,
                given_name=driver.forename,
                family_name=driver.surname,
            ),
            **driver_stats,
        )
        return Response(
            DetailResponse(
                metadata=DetailMetadata(timestamp=timezone.now()),
                data=data,
            ).model_dump(mode="json", exclude_none=True)
        )

    def get_queryset(self):
        """Optimize database queries with prefetch_related and filters."""
        queryset = f1.Driver.objects.prefetch_related("team_drivers__team", "team_drivers__season")

        # Get validated query parameters
        params = self._get_validated_query_params(self.query_params_class)

        # Apply filters
        if params.year is not None:
            queryset = queryset.filter(team_drivers__season__year=params.year)

        if params.team_id is not None:
            queryset = queryset.filter(team_drivers__team__api_id=params.team_id)

        if params.country_code is not None:
            queryset = queryset.filter(country_code=params.country_code)

        if params.role is not None:
            queryset = queryset.filter(team_drivers__role=params.role)

        # Use distinct() when filtering on many-to-many relationships
        if params.year or params.team_id or params.role:
            queryset = queryset.distinct()

        # Order by first round appearance, then alphabetically
        return queryset.annotate(
            first_round_number=Min("team_drivers__round_entries__round__race_number"),
        ).order_by("first_round_number", "surname", "forename")
