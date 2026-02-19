"""Results API view."""

from __future__ import annotations

import logging

from django.urls import reverse
from django.utils import timezone
from drf_spectacular.utils import extend_schema, extend_schema_view
from pydantic import HttpUrl
from rest_framework import permissions, request, response, viewsets
from rest_framework.decorators import action

from jolpica.formula_one import models as f1
from jolpica_schemas.f1_api.alpha.metadata import DetailMetadata
from jolpica_schemas.f1_api.alpha.results import (
    AvailableResultsForRound,
    AvailableResultsForRoundResponse,
    AvailableResultsItem,
    ResultsResponse,
)

from ..marshalling.results import RESULT_TYPE_TITLES, ResultDataLoader, ResultsOrchestrator

logger = logging.getLogger(__name__)


def get_available_result_types(round: f1.Round) -> list[str]:
    """Get the list of result type codes available for a round."""
    session_types = {sess.type for sess in round.sessions.all()}

    results_for_round = [
        "R",
        "Q",
    ]
    for result_type in ["SQ", "SR", "FP", "FP1", "FP2", "FP3"]:
        if any(sess_type.startswith(result_type) for sess_type in session_types):
            results_for_round.append(result_type)
    return results_for_round


@extend_schema_view(
    retrieve=extend_schema(
        summary="Get available types of result for a round",
        responses={200: AvailableResultsForRoundResponse},
    ),
    results=extend_schema(
        summary="Get results for a round",
        responses={200: ResultsResponse},
    ),
)
class ResultsView(viewsets.ViewSet):
    """ViewSet for listing results."""

    permission_classes = [permissions.AllowAny]
    lookup_field = "round_id"

    def retrieve(self, req: request.Request, round_id: str | None = None) -> response.Response:
        """Return available result types for this round with URLs."""
        round = f1.Round.objects.filter(api_id=round_id).prefetch_related("sessions").first()
        if round is None:
            return response.Response({"error": "Round not found"}, status=404)

        result_types = get_available_result_types(round)
        available_results = [
            AvailableResultsItem(
                url=HttpUrl(req.build_absolute_uri(reverse("results-results", args=[round_id, result_type]))),
                type=result_type,
                title=RESULT_TYPE_TITLES.get(result_type, result_type),
            )
            for result_type in result_types
        ]
        return response.Response(
            AvailableResultsForRoundResponse(
                metadata=DetailMetadata(timestamp=timezone.now()),
                data=AvailableResultsForRound(
                    available_results=available_results,
                ),
            ).model_dump(exclude_none=True, mode="json")
        )

    @action(methods=["get"], url_path="(?P<session_filter>[A-Z0-9]+)", detail=True)
    def results(
        self, req: request.Request, session_filter: str | None = None, round_id: str | None = None
    ) -> response.Response:
        if round_id is None or session_filter is None:
            return response.Response({"error": "Round and session filter required"}, status=400)

        round = f1.Round.objects.filter(api_id=round_id).prefetch_related("sessions").first()
        if round is None:
            return response.Response({"error": "Round not found"}, status=404)

        if session_filter not in get_available_result_types(round):
            return response.Response({"error": "Invalid session filter for this round"}, status=404)

        loader = ResultDataLoader(round_id)
        result_data = loader.load(req, session_filter)
        try:
            results = ResultsOrchestrator(session_filter, result_data).render()
        except ValueError:
            logger.exception(
                "Failed to render results", extra={"round_api_id": round_id, "session_filter": session_filter}
            )
            return response.Response({"error": "Failed to render results"}, status=500)

        return response.Response(
            ResultsResponse(
                metadata=DetailMetadata(timestamp=timezone.now()),
                data=results,
            ).model_dump(exclude_none=True, mode="json"),
        )
