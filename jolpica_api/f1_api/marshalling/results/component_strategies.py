"""Component rendering strategies for results marshalling."""

from __future__ import annotations

from abc import ABC, abstractmethod

from jolpica.formula_one.utils import format_timedelta
from jolpica_schemas.f1_api.alpha.results import ResultComponent

from ..logger import logger
from .constants import COMPONENT_DISPLAY_NAMES
from .loader import (
    ResultRowData,
    ResultRowSessionEntryData,
)


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

    def _get_component_display_name(self) -> str:
        """Get the display name for a component key, with error handling."""
        component_key = self.get_component_key()
        name = COMPONENT_DISPLAY_NAMES.get(component_key)
        if name is None:
            logger.error("missing component display name for key", extra={"component_key": component_key})
            return component_key  # Fallback to using the key as the name if not found in mapping
        return name


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
        session_entry: ResultRowSessionEntryData | None = None
        for se in result_data.session_entries:
            if se.session_api_id == self._session_api_id:
                session_entry = se
                break

        if session_entry is None:
            raise ValueError(f"No session entry found for component session api_id: {self._session_api_id}")

        if session_entry.session_type == "R":
            time = session_entry.time
        else:
            time = session_entry.fastest_lap_time

        return ResultComponent(
            key=self.get_component_key(),
            name=self._get_component_display_name(),
            position=session_entry.position,
            time=format_timedelta(time) if time else None,
        )


class GridComponent(ComponentRenderingStrategy):
    """Renders the grid position component for race results."""

    def __init__(self, session_type_startswith: str):
        if session_type_startswith not in ["R", "SR"]:
            raise ValueError(
                f"GridComponent must be initialized with a race session type, not {session_type_startswith}",
            )
        self._session_type_startswith = session_type_startswith

    def get_component_key(self) -> str:
        if self._session_type_startswith == "SR":
            return "SGRID"
        return "GRID"

    def should_render(self, result_data: ResultRowData) -> bool:
        return any(
            se.grid_position is not None
            for se in result_data.session_entries
            if se.session_type.startswith(self._session_type_startswith)
        )

    def render(self, result_data: ResultRowData) -> ResultComponent:
        grid_position = None
        session_entries = [
            se for se in result_data.session_entries if se.session_type.startswith(self._session_type_startswith)
        ]
        if len(session_entries) > 1:
            logger.error(
                "found multiple session entries matching grid session filter, when expected at most one",
                extra={"session_entries": [se.session_api_id for se in session_entries]},
            )
            # Fallback to using the first session entry with a grid position if multiple are found
            session_entries = sorted(
                session_entries,
                key=lambda se: se.session_order_number if se.session_order_number is not None else float("-inf"),
                reverse=True,
            )
        for se in session_entries:
            if se.grid_position is not None:
                grid_position = se.grid_position
                break

        return ResultComponent(
            key=self.get_component_key(),
            name=self._get_component_display_name(),
            position=grid_position,
        )
