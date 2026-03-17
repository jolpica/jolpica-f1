"""Orchestrator for schedule marshalling."""

from __future__ import annotations

import datetime

from jolpica.formula_one.models import SessionType
from jolpica_schemas.f1_api.alpha.schedule_v2 import (
    ScheduleDetail,
    ScheduleEntry,
    ScheduleFullSession,
    ScheduleRoundInfoDetail,
    ScheduleRoundsInfo,
)

from ..logger import logger
from .loader import ScheduleData, ScheduleRoundData

# Maps groups of session types to their consolidated (code, title)
CONSOLIDATED_SESSIONS: dict[tuple[str, ...], tuple[str, str]] = {
    (SessionType.QUALIFYING_ONE, SessionType.QUALIFYING_TWO, SessionType.QUALIFYING_THREE): ("Q", "Qualifying"),
    (
        SessionType.SPRINT_QUALIFYING_ONE,
        SessionType.SPRINT_QUALIFYING_TWO,
        SessionType.SPRINT_QUALIFYING_THREE,
    ): ("SQ", "Sprint Qualifying"),
}

# Session types that map directly to a FullSession without consolidation
STANDALONE_SESSION_TITLES: dict[str, str] = {
    SessionType.RACE: "Race",
    SessionType.SPRINT_RACE: "Sprint Race",
    SessionType.PRACTICE_ONE: "Practice 1",
    SessionType.PRACTICE_TWO: "Practice 2",
    SessionType.PRACTICE_THREE: "Practice 3",
    SessionType.QUALIFYING_AGGREGATE: "Qualifying",
    SessionType.QUALIFYING_ORDER: "Qualifying",
    SessionType.QUALIFYING_BEST: "Qualifying",
    SessionType.PREQUALIFYING: "Pre-Qualifying",
}


class ScheduleOrchestrator:
    """Orchestrates the rendering of schedule data into the ScheduleDetail schema."""

    def __init__(
        self,
        schedule_data: ScheduleData,
        today: datetime.date | None = None,
    ):
        self._data = schedule_data
        self._today = today or datetime.date.today()

    def render(self) -> ScheduleDetail:
        sorted_rounds = self._sort_rounds(self._data.rounds)
        entries: list[ScheduleEntry] = []
        for round_data in sorted_rounds:
            full_sessions = self._consolidate_sessions(round_data)
            entries.append(
                ScheduleEntry(
                    round=round_data.round,
                    circuit=round_data.circuit,
                    date=round_data.date,
                    schedule=full_sessions,
                )
            )

        rounds_info = self._calculate_rounds_info(sorted_rounds)

        return ScheduleDetail(
            id=self._data.season.id,
            url=self._data.season.url,
            year=self._data.season.year,
            wikipedia=self._data.season.wikipedia,
            rounds_info=rounds_info,
            events=entries,
        )

    @staticmethod
    def _sort_rounds(rounds: list[ScheduleRoundData]) -> list[ScheduleRoundData]:
        def sort_key(round_data: ScheduleRoundData) -> tuple[bool, int, datetime.date]:
            round_number = round_data.round.number
            return (
                round_number is None,
                round_number or 0,
                round_data.date or datetime.date.max,
            )

        return sorted(rounds, key=sort_key)

    def _consolidate_sessions(self, round_data: ScheduleRoundData) -> list[ScheduleFullSession]:
        """Group sessions into FullSession objects, consolidating qualifying sub-sessions."""
        full_sessions: list[ScheduleFullSession] = []
        consumed_types: set[str] = set()

        for session in round_data.sessions:
            if session.type in consumed_types:
                continue

            # Check if this session belongs to a consolidation group
            consolidated = False
            for group_types, (code, title) in CONSOLIDATED_SESSIONS.items():
                if session.type in group_types:
                    group_sessions = [s for s in round_data.sessions if s.type in group_types]
                    consumed_types.update(group_types)
                    if len(group_sessions) != len(group_types):
                        logger.warning(
                            "Incomplete consolidation group for %s in round %s: expected %d sessions, got %d",
                            code,
                            round_data.round.id,
                            len(group_types),
                            len(group_sessions),
                        )
                    full_sessions.append(
                        ScheduleFullSession(
                            code=code,
                            title=title,
                            sessions=group_sessions,
                        )
                    )
                    consolidated = True
                    break

            if not consolidated:
                code = self._get_standalone_code(session.type)
                standalone_title = STANDALONE_SESSION_TITLES.get(session.type)
                if standalone_title is None:
                    logger.warning(
                        "Unknown session type %r in round %s, using type as title",
                        session.type,
                        round_data.round.id,
                    )
                    standalone_title = session.type
                full_sessions.append(
                    ScheduleFullSession(
                        code=code,
                        title=standalone_title,
                        sessions=[session],
                    )
                )

        return full_sessions

    def _get_standalone_code(self, session_type: str) -> str:
        """Get the results code for a standalone (non-consolidated) session type."""
        # For standalone sessions, the type itself is the code
        # e.g., "R" -> "R", "SR" -> "SR", "FP1" -> "FP1"
        # For aggregate/order/best qualifying, map to "Q"
        if session_type in (
            SessionType.QUALIFYING_AGGREGATE,
            SessionType.QUALIFYING_ORDER,
            SessionType.QUALIFYING_BEST,
        ):
            return "Q"
        return session_type

    @staticmethod
    def _has_race(round_data: ScheduleRoundData) -> bool:
        return any(s.type == SessionType.RACE for s in round_data.sessions)

    def _calculate_rounds_info(self, rounds: list[ScheduleRoundData]) -> ScheduleRoundsInfo | None:
        """Calculate next/previous round info based on today's date."""
        if not rounds:
            return None

        last_valid_previous_index = -1

        for i, round_data in enumerate(rounds):
            if self._has_race(round_data) and round_data.date:
                if round_data.date < self._today:
                    last_valid_previous_index = i

        previous_info = None
        if last_valid_previous_index != -1:
            prev_round = rounds[last_valid_previous_index]
            if prev_round.round.number is not None:
                previous_info = ScheduleRoundInfoDetail(
                    number=prev_round.round.number,
                    index=last_valid_previous_index,
                )

        next_info = None
        potential_next_index = last_valid_previous_index + 1
        while potential_next_index < len(rounds):
            next_round = rounds[potential_next_index]
            if self._has_race(next_round) and next_round.round.number is not None:
                next_info = ScheduleRoundInfoDetail(
                    number=next_round.round.number,
                    index=potential_next_index,
                )
                break
            potential_next_index += 1

        if previous_info is None and next_info is None:
            return None

        return ScheduleRoundsInfo(
            next=next_info,
            previous=previous_info,
        )
