"""Shared session mapping constants for schedule marshalling."""

from __future__ import annotations

from dataclasses import dataclass

from jolpica.formula_one.models import SessionType


@dataclass(frozen=True)
class SessionConfig:
    code: str
    title: str
    group_types: tuple[str, ...] | None


QUALIFYING_SESSION_TYPES: tuple[str, ...] = (
    SessionType.QUALIFYING_ONE,
    SessionType.QUALIFYING_TWO,
    SessionType.QUALIFYING_THREE,
)

SPRINT_QUALIFYING_SESSION_TYPES: tuple[str, ...] = (
    SessionType.SPRINT_QUALIFYING_ONE,
    SessionType.SPRINT_QUALIFYING_TWO,
    SessionType.SPRINT_QUALIFYING_THREE,
)

# Maps a session type to its output (code, title) and optional consolidation group.
SESSION_CONFIG: dict[str, SessionConfig] = {
    SessionType.RACE: SessionConfig(code=SessionType.RACE, title="Race", group_types=None),
    SessionType.SPRINT_RACE: SessionConfig(code=SessionType.SPRINT_RACE, title="Sprint Race", group_types=None),
    SessionType.PRACTICE_ONE: SessionConfig(code=SessionType.PRACTICE_ONE, title="Practice 1", group_types=None),
    SessionType.PRACTICE_TWO: SessionConfig(code=SessionType.PRACTICE_TWO, title="Practice 2", group_types=None),
    SessionType.PRACTICE_THREE: SessionConfig(code=SessionType.PRACTICE_THREE, title="Practice 3", group_types=None),
    SessionType.PREQUALIFYING: SessionConfig(code=SessionType.PREQUALIFYING, title="Pre-Qualifying", group_types=None),
    SessionType.QUALIFYING_AGGREGATE: SessionConfig(code="Q", title="Qualifying", group_types=None),
    SessionType.QUALIFYING_ORDER: SessionConfig(code="Q", title="Qualifying", group_types=None),
    SessionType.QUALIFYING_BEST: SessionConfig(code="Q", title="Qualifying", group_types=None),
    SessionType.QUALIFYING_ONE: SessionConfig(code="Q", title="Qualifying", group_types=QUALIFYING_SESSION_TYPES),
    SessionType.QUALIFYING_TWO: SessionConfig(code="Q", title="Qualifying", group_types=QUALIFYING_SESSION_TYPES),
    SessionType.QUALIFYING_THREE: SessionConfig(code="Q", title="Qualifying", group_types=QUALIFYING_SESSION_TYPES),
    SessionType.SPRINT_QUALIFYING_ONE: SessionConfig(
        code="SQ",
        title="Sprint Qualifying",
        group_types=SPRINT_QUALIFYING_SESSION_TYPES,
    ),
    SessionType.SPRINT_QUALIFYING_TWO: SessionConfig(
        code="SQ",
        title="Sprint Qualifying",
        group_types=SPRINT_QUALIFYING_SESSION_TYPES,
    ),
    SessionType.SPRINT_QUALIFYING_THREE: SessionConfig(
        code="SQ",
        title="Sprint Qualifying",
        group_types=SPRINT_QUALIFYING_SESSION_TYPES,
    ),
}
