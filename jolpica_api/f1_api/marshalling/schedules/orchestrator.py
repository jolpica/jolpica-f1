"""Orchestrator for schedule marshalling."""

from __future__ import annotations

import datetime

from jolpica.formula_one.models import SessionType
from jolpica_schemas.f1_api.alpha import shared
from jolpica_schemas.f1_api.alpha.schedule import (
    Schedule,
    ScheduleEvent,
    ScheduleFullSession,
    ScheduleRoundInfoDetail,
    ScheduleRoundsInfo,
)

from ..logger import logger
from .constants import SESSION_CONFIG
from .loader import ScheduleData, ScheduleRoundData


class ScheduleOrchestrator:
    """Orchestrates the rendering of schedule data into the ScheduleDetail schema."""

    def __init__(
        self,
        schedule_data: ScheduleData,
        current_timestamp: datetime.datetime | None = None,
    ):
        self._data = schedule_data
        # timestamp used to determine next/previous rounds
        self._current_timestamp = current_timestamp or datetime.datetime.now()

    def render(self) -> Schedule:
        sorted_rounds = self._sort_rounds(self._data.rounds)
        events: list[ScheduleEvent] = []
        for round_data in sorted_rounds:
            full_sessions = self._get_full_sessions(round_data)
            events.append(
                ScheduleEvent(
                    round=round_data.round,
                    circuit=round_data.circuit,
                    schedule=full_sessions,
                )
            )

        rounds_info = self._calculate_rounds_info(sorted_rounds)

        return Schedule(
            id=self._data.season.id,
            url=self._data.season.url,
            year=self._data.season.year,
            wikipedia=self._data.season.wikipedia,
            rounds_info=rounds_info,
            events=events,
        )

    @classmethod
    def _sort_rounds(cls, rounds: list[ScheduleRoundData]) -> list[ScheduleRoundData]:
        def sort_key(round_data: ScheduleRoundData) -> tuple[float, float]:
            round_number = round_data.round.number
            return (
                round_number or float("inf"),
                # # We only sort by timestamp if round numbers are missing
                cls._round_timestamp_sort_key(round_data) if round_number is None else 0,
            )

        return sorted(rounds, key=sort_key)

    @staticmethod
    def _round_timestamp_sort_key(round_data: ScheduleRoundData) -> float:
        timestamps = [session.timestamp for session in round_data.sessions if session.timestamp is not None]
        if not timestamps:
            return float("inf")
        return min(timestamps).timestamp()

    def _get_full_sessions(self, round_data: ScheduleRoundData) -> list[ScheduleFullSession]:
        """Build full sessions and then index qualifying sessions when needed."""
        full_sessions = self._build_full_sessions(round_data)
        return self._index_qualifying_full_sessions(full_sessions)

    def _build_full_sessions(self, round_data: ScheduleRoundData) -> list[ScheduleFullSession]:
        """Build FullSession objects from raw sessions, including grouped consolidation."""
        full_sessions: list[ScheduleFullSession] = []
        consumed_types: set[str] = set()

        for session in round_data.sessions:
            if session.type in consumed_types:
                continue

            code = session.type
            title = session.type
            group_types = None
            config = SESSION_CONFIG.get(session.type)
            if config is None:
                logger.warning(
                    "Unknown session type %r in round %s, using type as title",
                    session.type,
                    round_data.round.id,
                )
            else:
                code = config.code
                title = config.title
                group_types = config.group_types

            if group_types is None:
                full_sessions.append(
                    ScheduleFullSession(
                        code=code,
                        title=title,
                        sessions=[session.to_basic_session()],
                        timestamp=session.timestamp,
                        missing_time_data=session.missing_time_data,
                        local_timestamp=session.local_timestamp,
                        timezone=session.timezone,
                    )
                )
                continue

            group_sessions = [s for s in round_data.sessions if s.type in group_types]
            if not group_sessions:
                raise ValueError(
                    f"No sessions found for consolidation group {group_types} in round {round_data.round.id}"
                )

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
                    sessions=[group_session.to_basic_session() for group_session in group_sessions],
                    timestamp=group_sessions[0].timestamp,
                    missing_time_data=group_sessions[0].missing_time_data,
                    local_timestamp=group_sessions[0].local_timestamp,
                    timezone=group_sessions[0].timezone,
                )
            )

        return full_sessions

    @staticmethod
    def _get_full_session_sequence_group(full_session: ScheduleFullSession) -> str | None:
        sequence_group = None
        for session in full_session.sessions:
            session_config = SESSION_CONFIG.get(session.type)
            if session_config is None:
                raise ValueError("No session config found", session.type)
            if sequence_group is not None and session_config.sequence_group != sequence_group:
                raise ValueError(
                    "Inconsistent sequence group within full session",
                    sequence_group,
                    session_config.sequence_group,
                )
            sequence_group = session_config.sequence_group
        return sequence_group

    @classmethod
    def _index_qualifying_full_sessions(cls, full_sessions: list[ScheduleFullSession]) -> list[ScheduleFullSession]:
        """Index grouped FullSessions as Code1/Code2 and Title 1/Title 2 when a group repeats."""
        grouped_indices: dict[str, list[int]] = {}
        for index, full_session in enumerate(full_sessions):
            sequence_group = cls._get_full_session_sequence_group(full_session)
            if sequence_group is None:
                continue
            grouped_indices.setdefault(sequence_group, []).append(index)

        sequence_groups_to_index = {group: indices for group, indices in grouped_indices.items() if len(indices) > 1}

        if not sequence_groups_to_index:
            return full_sessions

        for group_indices in sequence_groups_to_index.values():
            for sequence_number, session_index in enumerate(group_indices, start=1):
                full_session = full_sessions[session_index]
                full_sessions[session_index] = ScheduleFullSession(
                    code=f"{full_session.code}{sequence_number}",
                    title=f"{full_session.title} {sequence_number}",
                    sessions=full_session.sessions,
                    timestamp=full_session.timestamp,
                    missing_time_data=full_session.missing_time_data,
                    local_timestamp=full_session.local_timestamp,
                    timezone=full_session.timezone,
                )

        return full_sessions

    @staticmethod
    def _get_race(round_data: ScheduleRoundData) -> shared.Session | None:
        for s in round_data.sessions:
            if s.type == SessionType.RACE:
                return s
        return None

    def _calculate_rounds_info(self, rounds: list[ScheduleRoundData]) -> ScheduleRoundsInfo | None:
        """Calculate next/previous round info based on today's date."""
        if not rounds:
            return None

        last_valid_previous_index = -1

        for i, round_data in enumerate(rounds):
            if race_sess := self._get_race(round_data):
                if race_sess.timestamp and race_sess.timestamp < self._current_timestamp:
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
            if self._get_race(next_round) and next_round.round.number is not None:
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
