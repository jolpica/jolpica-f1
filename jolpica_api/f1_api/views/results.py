"""Results API view."""

from __future__ import annotations

import logging

from django.urls import reverse
from rest_framework import permissions, request, response, viewsets
from rest_framework.decorators import action

from jolpica.formula_one import models as f1

from ..marshalling.results import (
    ResultDataLoader,
    ResultsOrchestrator,
)

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


class ResultsView(viewsets.ViewSet):
    """ViewSet for listing results."""

    permission_classes = [permissions.AllowAny]
    lookup_field = "api_id"

    def retrieve(self, req: request.Request, pk: str | None = None) -> response.Response:
        """Return available result types for this round with URLs."""
        round = f1.Round.objects.filter(api_id=pk).prefetch_related("sessions").first()
        if round is None:
            return response.Response({"error": "Round not found"}, status=404)

        result_types = get_available_result_types(round)
        output = {
            result_type: req.build_absolute_uri(reverse("results-results", args=[pk, result_type]))
            for result_type in result_types
        }
        return response.Response(output)

    @action(methods=["get"], url_path="(?P<session_filter>[A-Z0-9]+)", detail=True)
    def results(
        self, req: request.Request, session_filter: str | None = None, api_id: str | None = None
    ) -> response.Response:
        if api_id is None or session_filter is None:
            return response.Response({"error": "Round and session filter required"}, status=400)

        round = f1.Round.objects.filter(api_id=api_id).prefetch_related("sessions").first()
        if round is None:
            return response.Response({"error": "Round not found"}, status=404)

        if session_filter not in get_available_result_types(round):
            return response.Response({"error": "Invalid session filter for this round"}, status=404)

        loader = ResultDataLoader(api_id)
        result_data = loader.load(req, session_filter)
        try:
            results = ResultsOrchestrator(session_filter, result_data).render()
        except ValueError:
            logger.exception(
                "Failed to render results", extra={"round_api_id": api_id, "session_filter": session_filter}
            )
            return response.Response({"error": "Failed to render results"}, status=500)

        return response.Response({"data": results.model_dump(exclude_none=True, mode="json")})
