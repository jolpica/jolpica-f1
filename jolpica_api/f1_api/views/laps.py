"""Laps API view."""

from __future__ import annotations

import logging

from django.utils import timezone
from drf_spectacular.utils import extend_schema, extend_schema_view
from rest_framework import permissions, request, response, viewsets
from rest_framework.decorators import action

from jolpica.formula_one import models as f1
from jolpica_api.f1_api.views.utils import get_available_full_session_codes
from jolpica_schemas.f1_api.alpha.laps import LapsResponse
from jolpica_schemas.f1_api.alpha.metadata import DetailMetadata

from ..marshalling.laps import LapDataLoader, LapDataOrchestrator

logger = logging.getLogger(__name__)


@extend_schema_view(
    results=extend_schema(
        summary="Get results for a round",
        responses={200: LapsResponse},
    ),
)
class LapsView(viewsets.ViewSet):
    """ViewSet for listing laps."""

    permission_classes = [permissions.AllowAny]
    lookup_field = "round_id"

    def list(self, req: request.Request) -> response.Response:
        return response.Response(
            {"error": "round_id and full_session_code required, check schedules for round ids"},
            status=400,
        )

    def retrieve(self, req: request.Request, round_id: str) -> response.Response:
        return response.Response(
            {"error": "full_session_code required, check schedules for available codes"},
            status=400,
        )

    @action(methods=["get"], url_path="(?P<full_session_code>[A-Z0-9]+)", detail=True)
    def laps(self, req: request.Request, round_id: str, full_session_code: str) -> response.Response:
        round = f1.Round.objects.filter(api_id=round_id).prefetch_related("sessions").first()
        if round is None:
            return response.Response({"error": "Round not found"}, status=404)

        if full_session_code not in get_available_full_session_codes(round):
            return response.Response(
                {"error": "Invalid full_session_code for this round, check schedules for available codes"},
                status=404,
            )

        lap_data = LapDataLoader.load(req, round_id, full_session_code)
        if not lap_data.sessions:
            return response.Response(
                {"error": "No sessions found for this round and session code"},
                status=404,
            )
        try:
            rendered = LapDataOrchestrator(lap_data).render()
        except ValueError:
            logger.exception(
                "Failed to render lap data",
                extra={"round_api_id": round_id, "full_session_code": full_session_code},
            )
            return response.Response({"error": "Failed to render lap data"}, status=500)

        return response.Response(
            LapsResponse(
                metadata=DetailMetadata(timestamp=timezone.now()),
                data=rendered,
            ).model_dump(exclude_none=True, mode="json"),
        )
