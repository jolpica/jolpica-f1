"""Orchestrator for results marshalling."""

from __future__ import annotations

from django.urls import reverse
from pydantic import HttpUrl
from rest_framework import request

from jolpica.formula_one import models as f1
from jolpica_api.f1_api.marshalling.results.constants import RESULT_TYPE_TITLES
from jolpica_api.f1_api.marshalling.results.data_transfer import (
    ResultData,
    ResultRowData,
)
from jolpica_api.f1_api.marshalling.results.result_strategies import (
    AggregateQualifyingStrategy,
    KnockoutQualifyingStrategy,
    PracticeResultStrategy,
    RaceResultStrategy,
    ResultRenderingStrategy,
)
from jolpica_schemas.f1_api.alpha import shared
from jolpica_schemas.f1_api.alpha.results import ResultItem, Results


class ResultsOrchestrator:
    """Orchestrates the rendering of results by selecting and running appropriate strategies."""

    def __init__(self, session_filter: str, result_data: ResultData):
        self._session_filter = session_filter
        self._result_data = result_data

    def render(self) -> Results:
        # TODO: Way to calculate result positions based on session entries
        result_renderer: ResultRenderingStrategy = RaceResultStrategy(self._session_filter)
        if self._session_filter in ["Q", "SQ"]:
            # TODO: quali renderers for different seasons
            if "QA" in [s.type for s in self._result_data.sessions]:
                result_renderer = AggregateQualifyingStrategy(self._result_data.sessions)
            else:
                result_renderer = KnockoutQualifyingStrategy(self._result_data.sessions, self._session_filter)
        elif self._session_filter in ["FP", "FP1", "FP2", "FP3"]:
            result_renderer = PracticeResultStrategy(self._result_data.sessions, self._session_filter)

        results: list[ResultItem] = []
        for result_data_row in self._result_data.rows:
            if not result_renderer.should_render(result_data_row):
                continue
            results.append(result_renderer.render(result_data_row))

        results = sorted(results, key=lambda r: (r.position if r.position is not None else float("inf")))

        component_keys = [renderer.get_component_key() for renderer in result_renderer.get_component_renderers()]

        return Results(
            title=RESULT_TYPE_TITLES.get(self._session_filter, "Unknown"),
            code=self._session_filter,
            season=self._result_data.season,
            circuit=self._result_data.circuit,
            round=self._result_data.round,
            sessions=self._result_data.sessions,
            component_keys=component_keys,
            results=results,
        )


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


class ResultDataLoader:
    """Loads result data from ORM models into ResultData DTO."""

    def __init__(self, round_api_id: str):
        self._round_id = round_api_id

    def load(self, req: request.Request, session_filter: str) -> ResultData:
        """Build ResultData for the given session filter."""
        round = f1.Round.objects.filter(api_id=self._round_id).select_related("season", "circuit").first()

        if round is None:
            raise ValueError(f"Round not found: {self._round_id}")

        sessions = f1.Session.objects.filter(round=round, type__startswith=session_filter).order_by("timestamp")

        round_entries = f1.RoundEntry.objects.filter(sessions__in=sessions).distinct()

        if len(round_entries) == 0:
            raise ValueError("No round entries found for sessions")

        row_data: list[ResultRowData] = []
        for rentry in round_entries:
            key = (rentry.car_number, rentry.team_driver.driver.forename, rentry.api_id)
            driver = rentry.team_driver.driver
            team = rentry.team_driver.team
            session_entries = rentry.session_entries.filter(session__in=sessions)
            row_data.append(ResultRowData.from_orm(req, key, driver, team, session_entries))

        return ResultData(
            rows=row_data,
            round=shared.Round(
                id=round.api_id,
                url=HttpUrl(req.build_absolute_uri(reverse("rounds-detail", args=[round.api_id]))),
                name=round.name,
                number=round.number,
                race_number=round.race_number,
                wikipedia=HttpUrl(round.wikipedia) if round.wikipedia else None,
            ),
            season=shared.Season(
                id=round.season.api_id,
                url=HttpUrl(req.build_absolute_uri(reverse("seasons-detail", args=[round.season.api_id]))),
                year=round.season.year,
                wikipedia=HttpUrl(round.season.wikipedia) if round.season.wikipedia else None,
            ),
            circuit=shared.Circuit(
                id=round.circuit.api_id,
                url=HttpUrl(req.build_absolute_uri(reverse("circuits-detail", args=[round.circuit.api_id]))),
                name=round.circuit.name,
                locality=round.circuit.locality,
                country_code=round.circuit.country_code,
                latitude=round.circuit.latitude,
                longitude=round.circuit.longitude,
                altitude=round.circuit.altitude,
                wikipedia=HttpUrl(round.circuit.wikipedia) if round.circuit.wikipedia else None,
            ),
            sessions=[
                shared.BasicSession(
                    id=s.api_id,
                    url=HttpUrl(req.build_absolute_uri(reverse("sessions-detail", args=[s.api_id]))),
                    number=s.number,
                    type=s.type,
                    type_display=f1.SessionType(s.type).name,
                )
                for s in sessions
            ],
        )
