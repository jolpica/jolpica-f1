"""Schedule V2 API views."""

from __future__ import annotations

import logging

from django.utils import timezone
from drf_spectacular.utils import extend_schema, extend_schema_view
from rest_framework import permissions, request, response, viewsets

from jolpica_schemas.f1_api.alpha.metadata import DetailMetadata, DetailResponse
from jolpica_schemas.f1_api.alpha.schedule_v2 import (
    ListSchedulesResponse,
    Schedule,
    ScheduleResponse,
)

from ..marshalling.schedules import NoSeasonFoundError, ScheduleDataLoader, ScheduleOrchestrator

logger = logging.getLogger(__name__)


@extend_schema_view(
    list=extend_schema(
        summary="List all F1 Season Schedules (V2)",
        description="Returns all available F1 seasons.",
        responses={200: ListSchedulesResponse},
    ),
    retrieve=extend_schema(
        summary="Get Detailed F1 Season Schedule (V2)",
        description="Provides the full schedule for a given season year, "
        "including rounds, sessions, and circuit details.",
        responses={200: ScheduleResponse},
    ),
)
class SeasonScheduleV2ViewSet(viewsets.ViewSet):
    """
    API endpoint for F1 season schedules.
    Uses marshalling pattern — no DRF serializers.
    """

    permission_classes = [permissions.AllowAny]
    lookup_field = "year"

    def list(self, req: request.Request) -> response.Response:
        seasons = ScheduleDataLoader.load_list(req)
        metadata = DetailMetadata(timestamp=timezone.now())
        return response.Response(
            DetailResponse(metadata=metadata, data=seasons).model_dump(mode="json", exclude_none=True)
        )

    def retrieve(self, req: request.Request, year: str | None = None) -> response.Response:
        if year is None:
            return response.Response({"error": "Year is required"}, status=400)

        try:
            year_int = int(year)
        except ValueError:
            return response.Response({"error": "Year must be a number"}, status=400)

        try:
            schedule_data = ScheduleDataLoader.load_detail(req, year_int)
        except NoSeasonFoundError:
            return response.Response({"error": "Season not found"}, status=404)

        orchestrator = ScheduleOrchestrator(
            schedule_data,
            current_timestamp=timezone.now(),
        )
        data = orchestrator.render()
        metadata = DetailMetadata(timestamp=timezone.now())
        return response.Response(
            DetailResponse[Schedule](metadata=metadata, data=data).model_dump(mode="json", exclude_none=True)
        )
