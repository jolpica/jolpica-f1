"""Orchestrator for results marshalling."""

from __future__ import annotations

from jolpica_schemas.f1_api.alpha.results import ResultItem, Results

from ..logger import logger
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
        result_renderer: ResultRenderingStrategy
        if self._session_filter in ["Q", "SQ"]:
            session_types = {s.type for s in self._result_data.sessions}
            if "QA" in session_types:
                result_renderer = AggregateQualifyingStrategy(self._result_data.sessions)
            elif "QB" in session_types:
                result_renderer = BestLapQualifyingStrategy(self._result_data.sessions)
            else:
                if "QO" in session_types:
                    # No support for QO sessions currently, but this isn't an issue currently as we don't have this data
                    logger.error(
                        "No qualifying strategy for QO session type, falling back to KnockoutQualifyingStrategy"
                    )
                result_renderer = KnockoutQualifyingStrategy(self._result_data.sessions, self._session_filter)
        elif self._session_filter in ["FP", "FP1", "FP2", "FP3"]:
            result_renderer = PracticeResultStrategy(self._result_data.sessions, self._session_filter)
        else:
            result_renderer = RaceResultStrategy(self._session_filter)

        results: list[ResultItem] = []
        for result_data_row in self._result_data.rows:
            if not result_renderer.should_render(result_data_row):
                continue
            results.append(result_renderer.render(result_data_row))

        results = sorted(results, key=lambda r: (r.position if r.position is not None else float("inf")))

        component_keys = [renderer.get_component_key() for renderer in result_renderer.get_component_renderers()]

        title = RESULT_TYPE_TITLES.get(self._session_filter)
        if title is None:
            logger.error("Missing result type title for session filter", extra={"session_filter": self._session_filter})
            title = self._session_filter  # Fallback to using the session filter as the title if not found in mapping
        return Results(
            title=title,
            code=self._session_filter,
            season=self._result_data.season,
            circuit=self._result_data.circuit,
            round=self._result_data.round,
            sessions=self._result_data.sessions,
            component_keys=component_keys,
            results=results,
        )
