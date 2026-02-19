"""Result rendering strategies for results marshalling."""

from __future__ import annotations

from abc import ABC, abstractmethod
from collections.abc import Sequence
from datetime import timedelta

from jolpica.formula_one.utils import format_timedelta
from jolpica_schemas.f1_api.alpha import shared
from jolpica_schemas.f1_api.alpha.results import ResultComponent, ResultItem

from .component_strategies import (
    ComponentRenderingStrategy,
    GridComponent,
    SingleSessionComponent,
)
from .loader import (
    ResultRowData,
    ResultRowSessionEntryData,
)


class ResultRenderingStrategy(ABC):
    """Abstract base class for result rendering strategies."""

    def __init__(self, component_renderers: Sequence[ComponentRenderingStrategy]):
        self._component_renderers = component_renderers

    def get_component_renderers(self) -> Sequence[ComponentRenderingStrategy]:
        return self._component_renderers

    @abstractmethod
    def should_render(self, result_data: ResultRowData) -> bool:
        """Determine if this result should be rendered for the given result data."""

    @abstractmethod
    def render(self, result_data: ResultRowData) -> ResultItem:
        """Render the result item for the given result data."""

    def _render_components(self, result_data: ResultRowData) -> dict[str, ResultComponent]:
        components: dict[str, ResultComponent] = {}
        for renderer in self._component_renderers:
            if not renderer.should_render(result_data):
                continue
            component = renderer.render(result_data)
            components[component.key] = component
        return components

    def _get_result_item_for_session(
        self,
        time: timedelta | None,
        result_data: ResultRowData,
        race_session_entry: ResultRowSessionEntryData,
    ) -> ResultItem:
        components = self._render_components(result_data)

        position_text = ""
        if race_session_entry.is_classified is False:
            position_text = "NC"
        elif race_session_entry.position is not None:
            position_text = str(race_session_entry.position)

        return ResultItem(
            position=race_session_entry.position,
            position_text=position_text,
            time=format_timedelta(time) if time else None,
            is_classified=race_session_entry.is_classified,
            status=race_session_entry.status if race_session_entry.status is not None else None,
            points=race_session_entry.points if race_session_entry.is_eligible_for_points else None,
            laps=race_session_entry.laps_completed,
            components=components,
            car_number=result_data.car_number,
            driver=result_data.driver,
            team=result_data.team,
        )


class RaceResultStrategy(ResultRenderingStrategy):
    """Renders race results (main race or sprint race)."""

    def __init__(self, session_type_startswith: str):
        super().__init__([GridComponent(session_type_startswith)])
        self._session_type_startswith = session_type_startswith

    def _get_race_session_entry(self, result_data: ResultRowData) -> ResultRowSessionEntryData | None:
        race_session_entry: ResultRowSessionEntryData | None = None
        for se in result_data.session_entries:
            if se.session_type.startswith(self._session_type_startswith):
                if race_session_entry is None:
                    race_session_entry = se
                else:
                    raise ValueError("Multiple session entries matching race session type found")
        return race_session_entry

    def should_render(self, result_data: ResultRowData) -> bool:
        race_session_entry = self._get_race_session_entry(result_data)
        return race_session_entry is not None

    def render(self, result_data: ResultRowData) -> ResultItem:
        race_session_entry = self._get_race_session_entry(result_data)
        if race_session_entry is None:
            raise ValueError("No valid session entry found for rendering result")

        return self._get_result_item_for_session(
            race_session_entry.time,
            result_data,
            race_session_entry,
        )


class KnockoutQualifyingStrategy(ResultRenderingStrategy):
    """Renders knockout qualifying results (Q1, Q2, Q3 or SQ1, SQ2, SQ3)."""

    def __init__(self, sessions: Sequence[shared.BasicSession], session_type_startswith: str):
        if session_type_startswith not in ["Q", "SQ"]:
            raise ValueError("Invalid session type for KnockoutQualifyingStrategy, must start with Q or SQ")
        filtered_sessions = [s for s in sessions if s.type.startswith(session_type_startswith)]
        if len(filtered_sessions) == 0:
            raise ValueError(
                f"No sessions found matching session type {session_type_startswith} for KnockoutQualifyingStrategy"
            )
        component_renderers = [
            SingleSessionComponent(f"{session_type_startswith}{i + 1}", sess.id)
            for i, sess in enumerate(filtered_sessions)
        ]
        super().__init__(component_renderers)
        self._session_type_startswith = session_type_startswith

    def _get_best_knockout_session_entry(self, result_data: ResultRowData) -> ResultRowSessionEntryData | None:
        best_session_entry: ResultRowSessionEntryData | None = None
        for se in result_data.session_entries:
            if not se.session_type.startswith(self._session_type_startswith):
                continue

            if se.session_order_number is None or se.session_type is None:
                # Session did not occur
                continue

            if best_session_entry is None:
                best_session_entry = se
                continue

            if se.session_order_number > (best_session_entry.session_order_number or 0):
                best_session_entry = se
        return best_session_entry

    def should_render(self, result_data: ResultRowData) -> bool:
        best_session_entry = self._get_best_knockout_session_entry(result_data)
        return best_session_entry is not None

    def render(self, result_data: ResultRowData) -> ResultItem:
        best_session_entry = self._get_best_knockout_session_entry(result_data)
        if best_session_entry is None:
            raise ValueError("No valid session entry found for rendering result")

        return self._get_result_item_for_session(
            best_session_entry.fastest_lap_time,
            result_data,
            best_session_entry,
        )


class BestLapQualifyingStrategy(ResultRenderingStrategy):
    """Renders best single lap qualifying results over all qualifying sessions."""

    def __init__(self, sessions: Sequence[shared.BasicSession]):
        self._session_type_startswith = "QB"
        filtered_sessions = [s for s in sessions if s.type == self._session_type_startswith]
        component_renderers = [SingleSessionComponent(f"Q{i + 1}", sess.id) for i, sess in enumerate(filtered_sessions)]
        super().__init__(component_renderers)

    def should_render(self, result_data: ResultRowData) -> bool:
        entries = [s for s in result_data.session_entries if s.session_type.startswith(self._session_type_startswith)]
        return len(entries) > 0

    def render(self, result_data: ResultRowData) -> ResultItem:
        entries = [s for s in result_data.session_entries if s.session_type.startswith(self._session_type_startswith)]
        if len(entries) > 1:
            raise NotImplementedError("Multiple session entries matching best lap qualifying session type found")
        session_entry = entries[0]

        return self._get_result_item_for_session(
            session_entry.fastest_lap_time,
            result_data,
            session_entry,
        )


class AggregateQualifyingStrategy(ResultRenderingStrategy):
    """Renders aggregate qualifying results (sum of lap times over multiple sessions)."""

    def __init__(self, sessions: Sequence[shared.BasicSession]):
        self._session_type_startswith = "QA"
        filtered_sessions = [s for s in sessions if s.type == self._session_type_startswith]
        component_renderers = [SingleSessionComponent(f"Q{i + 1}", sess.id) for i, sess in enumerate(filtered_sessions)]
        super().__init__(component_renderers)

    def should_render(self, result_data: ResultRowData) -> bool:
        entries = [s for s in result_data.session_entries if s.session_type.startswith(self._session_type_startswith)]
        return len(entries) > 0

    def render(self, result_data: ResultRowData) -> ResultItem:
        entries = [s for s in result_data.session_entries if s.session_type.startswith(self._session_type_startswith)]

        lap_time = entries[0].fastest_lap_time
        for entry in entries[1:]:
            if entry.fastest_lap_time is not None:
                if lap_time is None:
                    lap_time = entry.fastest_lap_time
                else:
                    lap_time = lap_time + entry.fastest_lap_time

        for entry in entries[1:]:
            if entry.position != entries[0].position:
                raise NotImplementedError(
                    "data error: multiple entries with different positions for aggregate qualifying"
                )
        return self._get_result_item_for_session(
            lap_time,
            result_data,
            entries[0],
        )


class PracticeResultStrategy(ResultRenderingStrategy):
    """Renders practice session results."""

    def __init__(self, sessions: Sequence[shared.BasicSession], session_type_startswith: str):
        self._number_of_sessions = len(sessions)
        component_renderers: list[ComponentRenderingStrategy] = [
            SingleSessionComponent(sess.type, sess.id) for sess in sessions
        ]
        if self._number_of_sessions == 1:
            component_renderers = []
        super().__init__(component_renderers)

    def should_render(self, result_data: ResultRowData) -> bool:
        return True

    def render(self, result_data: ResultRowData) -> ResultItem:
        if self._number_of_sessions == 1 and result_data.session_entries:
            session_entry = result_data.session_entries[0]
            return self._get_result_item_for_session(
                session_entry.time if session_entry else None,
                result_data,
                session_entry,
            )
        components = self._render_components(result_data)
        return ResultItem(
            position=None,
            position_text=None,
            time=None,
            is_classified=None,
            status=None,
            points=None,
            laps=None,
            components=components,
            car_number=result_data.car_number,
            driver=result_data.driver,
            team=result_data.team,
        )
