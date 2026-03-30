"""Unit tests for order-independent qualifying sequencing in schedule v2 marshalling."""

from __future__ import annotations

import datetime

from pydantic import HttpUrl

from jolpica_api.f1_api.marshalling.schedules.loader import ScheduleData, ScheduleRoundData
from jolpica_api.f1_api.marshalling.schedules.orchestrator import ScheduleOrchestrator
from jolpica_schemas.f1_api.alpha import shared
from jolpica_schemas.f1_api.alpha.schedule_v2 import Schedule


def _make_session(session_type: str, number: int = 1) -> shared.Session:
    return shared.Session(
        id=f"session_{session_type}_{number}",
        url=HttpUrl("http://test/sessions/1"),
        number=number,
        type=session_type,
        type_display=session_type,
        timestamp=datetime.datetime(2000, 1, 1, 12, 0) + datetime.timedelta(hours=number),
        missing_time_data=None,
        local_timestamp=None,
        timezone=None,
        scheduled_laps=None,
        is_cancelled=False,
    )


def _make_round_data(*, session_types: list[str], round_number: int | None = 1) -> ScheduleRoundData:
    sessions = [_make_session(st, i + 1) for i, st in enumerate(session_types)]
    return ScheduleRoundData(
        round=shared.Round(
            id=f"round_{round_number}",
            url=HttpUrl("http://test/rounds/1"),
            name=f"Round {round_number}",
            number=round_number,
            race_number=round_number,
            wikipedia=None,
            is_cancelled=False,
        ),
        circuit=shared.Circuit(
            id="circuit_1",
            url=HttpUrl("http://test/circuits/1"),
            name="Test Circuit",
            locality="Test City",
            country_code="TST",
            country="Testland",
            latitude=0.0,
            longitude=0.0,
            altitude=0.0,
            wikipedia=None,
        ),
        sessions=sessions,
    )


def _make_schedule_data(rounds: list[ScheduleRoundData]) -> ScheduleData:
    return ScheduleData(
        season=shared.Season(
            id="season_2003",
            url=HttpUrl("http://test/schedules/2003"),
            year=2003,
            wikipedia=None,
        ),
        rounds=rounds,
    )


def _qualifying_labels(result: Schedule) -> list[tuple[str, str]]:
    return [
        (session.code, session.title)
        for session in result.events[0].schedule
        if session.code.startswith("Q") and not session.code.startswith("SQ")
    ]


def test_two_qb_sessions_are_q1_q2():
    data = _make_schedule_data([_make_round_data(session_types=["QB", "QB", "R"])])

    result = ScheduleOrchestrator(data).render()

    assert _qualifying_labels(result) == [("Q1", "Qualifying 1"), ("Q2", "Qualifying 2")]


def test_qo_and_qb_are_q1_q2():
    data = _make_schedule_data([_make_round_data(session_types=["QO", "QB", "R"])])

    result = ScheduleOrchestrator(data).render()

    assert _qualifying_labels(result) == [("Q1", "Qualifying 1"), ("Q2", "Qualifying 2")]


def test_qo_qb_qb_are_q1_q2_q3():
    data = _make_schedule_data([_make_round_data(session_types=["QO", "QB", "QB", "R"])])

    result = ScheduleOrchestrator(data).render()

    assert _qualifying_labels(result) == [
        ("Q1", "Qualifying 1"),
        ("Q2", "Qualifying 2"),
        ("Q3", "Qualifying 3"),
    ]


def test_qo_plus_consolidated_q_group_are_q1_q2():
    data = _make_schedule_data([_make_round_data(session_types=["QO", "Q1", "Q2", "Q3", "R"])])

    result = ScheduleOrchestrator(data).render()

    assert _qualifying_labels(result) == [("Q1", "Qualifying 1"), ("Q2", "Qualifying 2")]


def test_single_consolidated_group_remains_q():
    data = _make_schedule_data([_make_round_data(session_types=["Q1", "Q2", "Q3", "R"])])

    result = ScheduleOrchestrator(data).render()

    assert _qualifying_labels(result) == [("Q", "Qualifying")]


def test_single_standalone_qualifying_remains_q():
    data = _make_schedule_data([_make_round_data(session_types=["QB", "R"])])

    result = ScheduleOrchestrator(data).render()

    assert _qualifying_labels(result) == [("Q", "Qualifying")]
