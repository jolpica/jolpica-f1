"""Orchestrator for results marshalling."""

from __future__ import annotations

from jolpica_schemas.f1_api.alpha.results import ResultItem, Results

from .constants import RESULT_TYPE_TITLES
from .loader import (
    ResultData,
)
from .result_strategies import (
    AggregateQualifyingStrategy,
    BestLapQualifyingStrategy,
    KnockoutQualifyingStrategy,
    PracticeResultStrategy,
    RaceResultStrategy,
    ResultRenderingStrategy,
)


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
            session_types = {s.type for s in self._result_data.sessions}
            if "QA" in session_types:
                result_renderer = AggregateQualifyingStrategy(self._result_data.sessions)
            elif "QB" in session_types:
                result_renderer = BestLapQualifyingStrategy(self._result_data.sessions)
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
