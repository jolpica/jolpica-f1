from __future__ import annotations

import json
from collections.abc import Callable
from datetime import timedelta
from pathlib import Path
from typing import Any

import pytest
from django.urls import reverse
from pydantic import HttpUrl
from rest_framework.test import APIClient

from jolpica_api.f1_api.marshalling.results.loader import ResultRowData, ResultRowSessionEntryData
from jolpica_api.f1_api.marshalling.results.result_strategies import (
    AggregateQualifyingStrategy,
    BestLapQualifyingStrategy,
    KnockoutQualifyingStrategy,
    PracticeResultStrategy,
    RaceResultStrategy,
)
from jolpica_schemas.f1_api.alpha import shared
from jolpica_schemas.f1_api.alpha.results import ResultItem


@pytest.mark.django_db
@pytest.mark.parametrize("session_code", ["R", "Q"])
def test_results_view(
    api_client: APIClient, django_assert_max_num_queries: Callable[[int], Any], session_code: str
) -> None:
    """Test filtering rounds with valid parameters."""

    url = reverse("results-results", args=["round_0hYZFLEe", session_code])
    with django_assert_max_num_queries(10):
        response = api_client.get(url)

    assert response.status_code == 200
    response_data = response.json()

    expected_path = Path(__file__).parent / "fixtures" / "results" / f"results-round_0hYZFLEe-{session_code}.json"
    if expected_path.exists():
        expected_data = json.loads(expected_path.read_text())
    else:
        expected_path.parent.mkdir(parents=True, exist_ok=True)
        expected_path.write_text(json.dumps(response_data, indent=2))
        expected_data = response_data
        pytest.fail(f"No fixture found, created new fixture at {expected_path}")
    assert response_data["data"] == expected_data["data"]


# ============================================================================
# Snapshot helper
# ============================================================================


def assert_result_matches_snapshot(result: ResultItem, snapshot_name: str) -> None:
    """Compare result to snapshot, creating snapshot if missing."""
    snapshot_path = Path(__file__).parent / "fixtures" / "strategies" / f"{snapshot_name}.json"
    result_data = result.model_dump(mode="json")

    if snapshot_path.exists():
        expected_data = json.loads(snapshot_path.read_text())
        assert result_data == expected_data, f"Result does not match snapshot {snapshot_name}"
    else:
        snapshot_path.parent.mkdir(parents=True, exist_ok=True)
        snapshot_path.write_text(json.dumps(result_data, indent=2))
        pytest.fail(f"No snapshot found, created new snapshot at {snapshot_path}")


# ============================================================================
# Session fixtures for strategy tests
# ============================================================================


@pytest.fixture
def knockout_quali_sessions() -> list[shared.BasicSession]:
    return [
        shared.BasicSession(
            id="session_Q1",
            url=HttpUrl("http://api.example.com/sessions/Q1"),
            number=1,
            type="Q1",
            type_display="Qualifying 1",
        ),
        shared.BasicSession(
            id="session_Q2",
            url=HttpUrl("http://api.example.com/sessions/Q2"),
            number=2,
            type="Q2",
            type_display="Qualifying 2",
        ),
        shared.BasicSession(
            id="session_Q3",
            url=HttpUrl("http://api.example.com/sessions/Q3"),
            number=3,
            type="Q3",
            type_display="Qualifying 3",
        ),
    ]


@pytest.fixture
def aggregate_quali_sessions() -> list[shared.BasicSession]:
    return [
        shared.BasicSession(
            id="session_QA1",
            url=HttpUrl("http://api.example.com/sessions/QA1"),
            number=1,
            type="QA",
            type_display="Aggregate Qualifying 1",
        ),
        shared.BasicSession(
            id="session_QA2",
            url=HttpUrl("http://api.example.com/sessions/QA2"),
            number=2,
            type="QA",
            type_display="Aggregate Qualifying 2",
        ),
    ]


@pytest.fixture
def best_lap_quali_sessions() -> list[shared.BasicSession]:
    return [
        shared.BasicSession(
            id="session_QB1",
            url=HttpUrl("http://api.example.com/sessions/QB1"),
            number=1,
            type="QB",
            type_display="Best Lap Qualifying",
        ),
    ]


@pytest.fixture
def practice_sessions_single() -> list[shared.BasicSession]:
    return [
        shared.BasicSession(
            id="session_FP1",
            url=HttpUrl("http://api.example.com/sessions/FP1"),
            number=1,
            type="FP1",
            type_display="Practice 1",
        ),
    ]


@pytest.fixture
def practice_sessions_multiple() -> list[shared.BasicSession]:
    return [
        shared.BasicSession(
            id="session_FP1",
            url=HttpUrl("http://api.example.com/sessions/FP1"),
            number=1,
            type="FP1",
            type_display="Practice 1",
        ),
        shared.BasicSession(
            id="session_FP2",
            url=HttpUrl("http://api.example.com/sessions/FP2"),
            number=2,
            type="FP2",
            type_display="Practice 2",
        ),
    ]


# ============================================================================
# ResultRowData fixtures for strategy tests
# ============================================================================


@pytest.fixture
def race_winner_data() -> ResultRowData:
    """Max Verstappen wins the race from pole position."""
    return ResultRowData(
        row_key=(1, "Max", "entry_verstappen_2024"),
        session_entries=[
            ResultRowSessionEntryData(
                session_type="R",
                session_api_id="session_race_2024_monza",
                session_order_number=1,
                position=1,
                grid_position=1,
                is_classified=True,
                is_eligible_for_points=True,
                status=None,
                points=25.0,
                laps_completed=53,
                time=timedelta(hours=1, minutes=20, seconds=48, milliseconds=233),
                fastest_lap_time=timedelta(minutes=1, seconds=24, milliseconds=319),
                car_number=1,
            )
        ],
        driver=shared.BasicDriver(
            id="verstappen",
            given_name="Max",
            family_name="Verstappen",
            url=HttpUrl("http://api.example.com/drivers/verstappen"),
            abbreviation="VER",
        ),
        team=shared.BasicTeam(
            id="red_bull",
            name="Red Bull Racing",
            url=HttpUrl("http://api.example.com/teams/red_bull"),
            primary_color="#3671C6",
        ),
    )


@pytest.fixture
def race_retired_data() -> ResultRowData:
    """Fernando Alonso retires from the race with engine failure."""
    return ResultRowData(
        row_key=(14, "Fernando", "entry_alonso_2024"),
        session_entries=[
            ResultRowSessionEntryData(
                session_type="R",
                session_api_id="session_race_2024_monza",
                session_order_number=1,
                position=None,
                grid_position=8,
                is_classified=False,
                is_eligible_for_points=False,
                status="Engine",
                points=None,
                laps_completed=32,
                time=None,
                fastest_lap_time=timedelta(minutes=1, seconds=25, milliseconds=102),
                car_number=14,
            )
        ],
        driver=shared.BasicDriver(
            id="alonso",
            given_name="Fernando",
            family_name="Alonso",
            url=HttpUrl("http://api.example.com/drivers/alonso"),
            abbreviation="ALO",
        ),
        team=shared.BasicTeam(
            id="aston_martin",
            name="Aston Martin",
            url=HttpUrl("http://api.example.com/teams/aston_martin"),
            primary_color="#358C75",
        ),
    )


@pytest.fixture
def sprint_winner_data() -> ResultRowData:
    """Charles Leclerc wins the sprint race."""
    return ResultRowData(
        row_key=(16, "Charles", "entry_leclerc_2024"),
        session_entries=[
            ResultRowSessionEntryData(
                session_type="SR",
                session_api_id="session_sprint_2024_miami",
                session_order_number=1,
                position=1,
                grid_position=2,
                is_classified=True,
                is_eligible_for_points=True,
                status=None,
                points=8.0,
                laps_completed=19,
                time=timedelta(minutes=26, seconds=31, milliseconds=445),
                fastest_lap_time=timedelta(minutes=1, seconds=29, milliseconds=876),
                car_number=16,
            )
        ],
        driver=shared.BasicDriver(
            id="leclerc",
            given_name="Charles",
            family_name="Leclerc",
            url=HttpUrl("http://api.example.com/drivers/leclerc"),
            abbreviation="LEC",
        ),
        team=shared.BasicTeam(
            id="ferrari",
            name="Ferrari",
            url=HttpUrl("http://api.example.com/teams/ferrari"),
            primary_color="#E8002D",
        ),
    )


@pytest.fixture
def knockout_q1_exit_data() -> ResultRowData:
    """Logan Sargeant is eliminated in Q1."""
    return ResultRowData(
        row_key=(2, "Logan", "entry_sargeant_2024"),
        session_entries=[
            ResultRowSessionEntryData(
                session_type="Q1",
                session_api_id="session_Q1",
                session_order_number=1,
                position=18,
                grid_position=None,
                is_classified=True,
                is_eligible_for_points=False,
                status=None,
                points=None,
                laps_completed=None,
                time=None,
                fastest_lap_time=timedelta(minutes=1, seconds=31, milliseconds=892),
                car_number=2,
            )
        ],
        driver=shared.BasicDriver(
            id="sargeant",
            given_name="Logan",
            family_name="Sargeant",
            url=HttpUrl("http://api.example.com/drivers/sargeant"),
            abbreviation="SAR",
        ),
        team=shared.BasicTeam(
            id="williams",
            name="Williams",
            url=HttpUrl("http://api.example.com/teams/williams"),
            primary_color="#64C4FF",
        ),
    )


@pytest.fixture
def knockout_q2_exit_data() -> ResultRowData:
    """Valtteri Bottas progresses through Q1 but is eliminated in Q2."""
    return ResultRowData(
        row_key=(77, "Valtteri", "entry_bottas_2024"),
        session_entries=[
            ResultRowSessionEntryData(
                session_type="Q1",
                session_api_id="session_Q1",
                session_order_number=1,
                position=12,
                grid_position=None,
                is_classified=True,
                is_eligible_for_points=False,
                status=None,
                points=None,
                laps_completed=None,
                time=None,
                fastest_lap_time=timedelta(minutes=1, seconds=30, milliseconds=245),
                car_number=77,
            ),
            ResultRowSessionEntryData(
                session_type="Q2",
                session_api_id="session_Q2",
                session_order_number=2,
                position=13,
                grid_position=None,
                is_classified=True,
                is_eligible_for_points=False,
                status=None,
                points=None,
                laps_completed=None,
                time=None,
                fastest_lap_time=timedelta(minutes=1, seconds=29, milliseconds=876),
                car_number=77,
            ),
        ],
        driver=shared.BasicDriver(
            id="bottas",
            given_name="Valtteri",
            family_name="Bottas",
            url=HttpUrl("http://api.example.com/drivers/bottas"),
            abbreviation="BOT",
        ),
        team=shared.BasicTeam(
            id="sauber",
            name="Stake F1 Team Kick Sauber",
            url=HttpUrl("http://api.example.com/teams/sauber"),
            primary_color="#52E252",
        ),
    )


@pytest.fixture
def knockout_pole_position_data() -> ResultRowData:
    """Lando Norris takes pole position after progressing through all sessions."""
    return ResultRowData(
        row_key=(4, "Lando", "entry_norris_2024"),
        session_entries=[
            ResultRowSessionEntryData(
                session_type="Q1",
                session_api_id="session_Q1",
                session_order_number=1,
                position=3,
                grid_position=None,
                is_classified=True,
                is_eligible_for_points=False,
                status=None,
                points=None,
                laps_completed=None,
                time=None,
                fastest_lap_time=timedelta(minutes=1, seconds=29, milliseconds=456),
                car_number=4,
            ),
            ResultRowSessionEntryData(
                session_type="Q2",
                session_api_id="session_Q2",
                session_order_number=2,
                position=2,
                grid_position=None,
                is_classified=True,
                is_eligible_for_points=False,
                status=None,
                points=None,
                laps_completed=None,
                time=None,
                fastest_lap_time=timedelta(minutes=1, seconds=28, milliseconds=789),
                car_number=4,
            ),
            ResultRowSessionEntryData(
                session_type="Q3",
                session_api_id="session_Q3",
                session_order_number=3,
                position=1,
                grid_position=None,
                is_classified=True,
                is_eligible_for_points=False,
                status=None,
                points=None,
                laps_completed=None,
                time=None,
                fastest_lap_time=timedelta(minutes=1, seconds=27, milliseconds=654),
                car_number=4,
            ),
        ],
        driver=shared.BasicDriver(
            id="norris",
            given_name="Lando",
            family_name="Norris",
            url=HttpUrl("http://api.example.com/drivers/norris"),
            abbreviation="NOR",
        ),
        team=shared.BasicTeam(
            id="mclaren",
            name="McLaren",
            url=HttpUrl("http://api.example.com/teams/mclaren"),
            primary_color="#FF8000",
        ),
    )


@pytest.fixture
def aggregate_quali_data() -> ResultRowData:
    """Kimi Raikkonen qualifies with aggregate time from two sessions (1950s style)."""
    return ResultRowData(
        row_key=(2, "Kimi", "entry_raikkonen_1950"),
        session_entries=[
            ResultRowSessionEntryData(
                session_type="QA",
                session_api_id="session_QA1",
                session_order_number=1,
                position=1,
                grid_position=None,
                is_classified=True,
                is_eligible_for_points=False,
                status=None,
                points=None,
                laps_completed=None,
                time=None,
                fastest_lap_time=timedelta(minutes=2, seconds=45, milliseconds=600),
                car_number=2,
            ),
            ResultRowSessionEntryData(
                session_type="QA",
                session_api_id="session_QA2",
                session_order_number=2,
                position=1,
                grid_position=None,
                is_classified=True,
                is_eligible_for_points=False,
                status=None,
                points=None,
                laps_completed=None,
                time=None,
                fastest_lap_time=timedelta(minutes=2, seconds=44, milliseconds=200),
                car_number=2,
            ),
        ],
        driver=shared.BasicDriver(
            id="raikkonen",
            given_name="Kimi",
            family_name="Raikkonen",
            url=HttpUrl("http://api.example.com/drivers/raikkonen"),
            abbreviation="RAI",
        ),
        team=shared.BasicTeam(
            id="alfa_romeo",
            name="Alfa Romeo",
            url=HttpUrl("http://api.example.com/teams/alfa_romeo"),
            primary_color="#900000",
        ),
    )


@pytest.fixture
def best_lap_pole_data() -> ResultRowData:
    """Ayrton Senna takes pole with best lap qualifying (1980s style)."""
    return ResultRowData(
        row_key=(12, "Ayrton", "entry_senna_1988"),
        session_entries=[
            ResultRowSessionEntryData(
                session_type="QB",
                session_api_id="session_QB1",
                session_order_number=1,
                position=1,
                grid_position=None,
                is_classified=True,
                is_eligible_for_points=False,
                status=None,
                points=None,
                laps_completed=None,
                time=None,
                fastest_lap_time=timedelta(minutes=1, seconds=25, milliseconds=501),
                car_number=12,
            )
        ],
        driver=shared.BasicDriver(
            id="senna",
            given_name="Ayrton",
            family_name="Senna",
            url=HttpUrl("http://api.example.com/drivers/senna"),
            abbreviation="SEN",
        ),
        team=shared.BasicTeam(
            id="mclaren",
            name="McLaren",
            url=HttpUrl("http://api.example.com/teams/mclaren"),
            primary_color="#FF8000",
        ),
    )


@pytest.fixture
def best_lap_p10_data() -> ResultRowData:
    """Andrea de Cesaris qualifies P10 with best lap qualifying."""
    return ResultRowData(
        row_key=(22, "Andrea", "entry_decesaris_1988"),
        session_entries=[
            ResultRowSessionEntryData(
                session_type="QB",
                session_api_id="session_QB1",
                session_order_number=1,
                position=10,
                grid_position=None,
                is_classified=True,
                is_eligible_for_points=False,
                status=None,
                points=None,
                laps_completed=None,
                time=None,
                fastest_lap_time=timedelta(minutes=1, seconds=27, milliseconds=892),
                car_number=22,
            )
        ],
        driver=shared.BasicDriver(
            id="decesaris",
            given_name="Andrea",
            family_name="de Cesaris",
            url=HttpUrl("http://api.example.com/drivers/decesaris"),
            abbreviation="CES",
        ),
        team=shared.BasicTeam(
            id="rial",
            name="Rial",
            url=HttpUrl("http://api.example.com/teams/rial"),
            primary_color="#000080",
        ),
    )


@pytest.fixture
def practice_single_session_data() -> ResultRowData:
    """Lewis Hamilton's single practice session result."""
    return ResultRowData(
        row_key=(44, "Lewis", "entry_hamilton_2024"),
        session_entries=[
            ResultRowSessionEntryData(
                session_type="FP1",
                session_api_id="session_FP1",
                session_order_number=1,
                position=3,
                grid_position=None,
                is_classified=True,
                is_eligible_for_points=False,
                status=None,
                points=None,
                laps_completed=22,
                time=timedelta(minutes=1, seconds=32, milliseconds=456),
                fastest_lap_time=timedelta(minutes=1, seconds=32, milliseconds=456),
                car_number=44,
            )
        ],
        driver=shared.BasicDriver(
            id="hamilton",
            given_name="Lewis",
            family_name="Hamilton",
            url=HttpUrl("http://api.example.com/drivers/hamilton"),
            abbreviation="HAM",
        ),
        team=shared.BasicTeam(
            id="mercedes",
            name="Mercedes",
            url=HttpUrl("http://api.example.com/teams/mercedes"),
            primary_color="#27F4D2",
        ),
    )


@pytest.fixture
def practice_multiple_sessions_data() -> ResultRowData:
    """Oscar Piastri's results across multiple practice sessions."""
    return ResultRowData(
        row_key=(81, "Oscar", "entry_piastri_2024"),
        session_entries=[
            ResultRowSessionEntryData(
                session_type="FP1",
                session_api_id="session_FP1",
                session_order_number=1,
                position=5,
                grid_position=None,
                is_classified=True,
                is_eligible_for_points=False,
                status=None,
                points=None,
                laps_completed=25,
                time=timedelta(minutes=1, seconds=33, milliseconds=102),
                fastest_lap_time=timedelta(minutes=1, seconds=33, milliseconds=102),
                car_number=81,
            ),
            ResultRowSessionEntryData(
                session_type="FP2",
                session_api_id="session_FP2",
                session_order_number=2,
                position=2,
                grid_position=None,
                is_classified=True,
                is_eligible_for_points=False,
                status=None,
                points=None,
                laps_completed=28,
                time=timedelta(minutes=1, seconds=31, milliseconds=876),
                fastest_lap_time=timedelta(minutes=1, seconds=31, milliseconds=876),
                car_number=81,
            ),
        ],
        driver=shared.BasicDriver(
            id="piastri",
            given_name="Oscar",
            family_name="Piastri",
            url=HttpUrl("http://api.example.com/drivers/piastri"),
            abbreviation="PIA",
        ),
        team=shared.BasicTeam(
            id="mclaren",
            name="McLaren",
            url=HttpUrl("http://api.example.com/teams/mclaren"),
            primary_color="#FF8000",
        ),
    )


# ============================================================================
# RaceResultStrategy tests
# ============================================================================


@pytest.mark.parametrize(
    "fixture_name,session_type,snapshot_name",
    [
        pytest.param("race_winner_data", "R", "race-winner", id="race-winner"),
        pytest.param("race_retired_data", "R", "race-retired-nc", id="race-retired-nc"),
        pytest.param("sprint_winner_data", "SR", "sprint-race-winner", id="sprint-race-winner"),
    ],
)
def test_race_result_strategy_render(
    fixture_name: str,
    session_type: str,
    snapshot_name: str,
    request: pytest.FixtureRequest,
) -> None:
    result_data: ResultRowData = request.getfixturevalue(fixture_name)
    strategy = RaceResultStrategy(session_type)
    result = strategy.render(result_data)
    assert_result_matches_snapshot(result, snapshot_name)


# ============================================================================
# KnockoutQualifyingStrategy tests
# ============================================================================


@pytest.mark.parametrize(
    "fixture_name,snapshot_name",
    [
        pytest.param("knockout_q1_exit_data", "knockout-q1-exit", id="knockout-q1-exit"),
        pytest.param("knockout_q2_exit_data", "knockout-q2-exit", id="knockout-q2-exit"),
        pytest.param("knockout_pole_position_data", "knockout-pole-position", id="knockout-pole-position"),
    ],
)
def test_knockout_qualifying_strategy_render(
    fixture_name: str,
    snapshot_name: str,
    knockout_quali_sessions: list[shared.BasicSession],
    request: pytest.FixtureRequest,
) -> None:
    result_data: ResultRowData = request.getfixturevalue(fixture_name)
    strategy = KnockoutQualifyingStrategy(knockout_quali_sessions, "Q")
    result = strategy.render(result_data)
    assert_result_matches_snapshot(result, snapshot_name)


# ============================================================================
# AggregateQualifyingStrategy tests
# ============================================================================


@pytest.mark.parametrize(
    "fixture_name,snapshot_name",
    [
        pytest.param("aggregate_quali_data", "aggregate-two-sessions", id="aggregate-two-sessions"),
    ],
)
def test_aggregate_qualifying_strategy_render(
    fixture_name: str,
    snapshot_name: str,
    aggregate_quali_sessions: list[shared.BasicSession],
    request: pytest.FixtureRequest,
) -> None:
    result_data: ResultRowData = request.getfixturevalue(fixture_name)
    strategy = AggregateQualifyingStrategy(aggregate_quali_sessions)
    result = strategy.render(result_data)
    assert_result_matches_snapshot(result, snapshot_name)


# ============================================================================
# BestLapQualifyingStrategy tests
# ============================================================================


@pytest.mark.parametrize(
    "fixture_name,snapshot_name",
    [
        pytest.param("best_lap_pole_data", "best-lap-pole", id="best-lap-pole"),
        pytest.param("best_lap_p10_data", "best-lap-p10", id="best-lap-p10"),
    ],
)
def test_best_lap_qualifying_strategy_render(
    fixture_name: str,
    snapshot_name: str,
    best_lap_quali_sessions: list[shared.BasicSession],
    request: pytest.FixtureRequest,
) -> None:
    result_data: ResultRowData = request.getfixturevalue(fixture_name)
    strategy = BestLapQualifyingStrategy(best_lap_quali_sessions)
    result = strategy.render(result_data)
    assert_result_matches_snapshot(result, snapshot_name)


# ============================================================================
# PracticeResultStrategy tests
# ============================================================================


@pytest.mark.parametrize(
    "fixture_name,sessions_fixture,snapshot_name",
    [
        pytest.param(
            "practice_single_session_data",
            "practice_sessions_single",
            "practice-single-session",
            id="practice-single-session",
        ),
        pytest.param(
            "practice_multiple_sessions_data",
            "practice_sessions_multiple",
            "practice-multiple-sessions",
            id="practice-multiple-sessions",
        ),
    ],
)
def test_practice_result_strategy_render(
    fixture_name: str,
    sessions_fixture: str,
    snapshot_name: str,
    request: pytest.FixtureRequest,
) -> None:
    result_data: ResultRowData = request.getfixturevalue(fixture_name)
    sessions: list[shared.BasicSession] = request.getfixturevalue(sessions_fixture)
    strategy = PracticeResultStrategy(sessions, "FP")
    result = strategy.render(result_data)
    assert_result_matches_snapshot(result, snapshot_name)
