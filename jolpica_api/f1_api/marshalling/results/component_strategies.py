"""Component rendering strategies for results marshalling."""

from __future__ import annotations

from abc import ABC, abstractmethod

from jolpica.formula_one.utils import format_timedelta
from jolpica_api.f1_api.marshalling.results.constants import COMPONENT_DISPLAY_NAMES
from jolpica_api.f1_api.marshalling.results.data_transfer import (
    ResultRowData,
    ResultRowSessionEntryData,
)
from jolpica_schemas.f1_api.alpha.results import ResultComponent


class ComponentRenderingStrategy(ABC):
    """Abstract base class for component rendering strategies."""

    @abstractmethod
    def get_component_key(self) -> str:
        """Return the unique key identifying this component."""

    @abstractmethod
    def should_render(self, result_data: ResultRowData) -> bool:
        """Determine if this component should be rendered for the given result data."""

    @abstractmethod
    def render(self, result_data: ResultRowData) -> ResultComponent:
        """Render the component for the given result data."""


class SingleSessionComponent(ComponentRenderingStrategy):
    """Renders a component for a single session (e.g., Q1, Q2, Q3, FP1, etc.)."""

    def __init__(self, component_key: str, session_api_id: str):
        self._component_key = component_key
        self._session_api_id = session_api_id

    def get_component_key(self) -> str:
        return self._component_key

    def should_render(self, result_data: ResultRowData) -> bool:
        return any(se.session_api_id == self._session_api_id for se in result_data.session_entries)

    def render(self, result_data: ResultRowData) -> ResultComponent:
        name = COMPONENT_DISPLAY_NAMES.get(self._component_key)
        if name is None:
            name = self._component_key  # Fallback to using the key as the name if not found in mapping

        session_entry: ResultRowSessionEntryData | None = None
        for se in result_data.session_entries:
            if se.session_api_id == self._session_api_id:
                session_entry = se
                break

        if session_entry is None:
            raise ValueError(f"No session entry found for session API ID {self._session_api_id}")
        if session_entry.session_type == "R":
            time = session_entry.time if session_entry.time else None
        else:
            time = session_entry.fastest_lap_time if session_entry.fastest_lap_time else None

        return ResultComponent(
            key=self._component_key,
            name=name,
            position=session_entry.position,
            time=format_timedelta(time) if time else None,
        )


class GridComponent(ComponentRenderingStrategy):
    """Renders the grid position component for race results."""

    def __init__(self, session_type_startswith: str):
        self._session_type_startswith = session_type_startswith

    def get_component_key(self) -> str:
        return "GRID"

    def should_render(self, result_data: ResultRowData) -> bool:
        return any(se.grid_position is not None for se in result_data.session_entries)

    def render(self, result_data: ResultRowData) -> ResultComponent:
        grid_position = None
        sorted_session_entries = sorted(
            result_data.session_entries,
            key=lambda se: se.session_order_number if se.session_order_number is not None else float("-inf"),
            reverse=True,
        )
        for se in sorted_session_entries:
            if se.grid_position is not None:
                grid_position = se.grid_position
                break

        return ResultComponent(
            key=self.get_component_key(),
            name=COMPONENT_DISPLAY_NAMES["GRID"],
            position=grid_position,
        )
