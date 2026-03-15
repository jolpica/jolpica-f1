"""Tests for the schedule V2 endpoint and marshalling."""

from __future__ import annotations

import datetime

import pytest
from django.urls import reverse
from pydantic import HttpUrl, ValidationError
from rest_framework.test import APIClient

from jolpica_api.f1_api.marshalling.schedules.loader import ScheduleData, ScheduleRoundData
from jolpica_api.f1_api.marshalling.schedules.orchestrator import ScheduleOrchestrator
from jolpica_schemas.f1_api.alpha import shared
from jolpica_schemas.f1_api.alpha.metadata import DetailResponse
from jolpica_schemas.f1_api.alpha.schedule_v2 import (
    RetrievedScheduleDetail,
    ScheduleSummary,
)

# --- Integration tests ---


@pytest.fixture
def api_client():
    return APIClient()


@pytest.fixture
def sample_season_data():
    from jolpica.formula_one import models as f1

    return f1.Season.objects.get(year=2023)


@pytest.mark.django_db
def test_v2_schedule_list_schema_conformance(api_client, sample_season_data):
    """Verify the v2 schedule list response conforms to schema."""
    url = reverse("v2-schedules-list")
    response = api_client.get(url)

    assert response.status_code == 200
    response_data = response.json()

    try:
        DetailResponse[list[ScheduleSummary]].model_validate(response_data)
    except ValidationError as e:
        pytest.fail(f"V2 schedule list response does not conform to schema:\n{e}")


@pytest.mark.django_db
def test_v2_schedule_detail_schema_conformance(api_client, sample_season_data):
    """Verify the v2 schedule detail response conforms to RetrievedScheduleDetail."""
    year = sample_season_data.year
    url = reverse("v2-schedules-detail", kwargs={"year": year})
    response = api_client.get(url)

    assert response.status_code == 200
    response_data = response.json()

    try:
        RetrievedScheduleDetail.model_validate(response_data)
    except ValidationError as e:
        pytest.fail(f"V2 schedule detail response does not conform to schema:\n{e}")


@pytest.mark.django_db
def test_v2_schedule_detail_not_found(api_client):
    """Verify 404 for a non-existent season."""
    url = reverse("v2-schedules-detail", kwargs={"year": 9999})
    response = api_client.get(url)
    assert response.status_code == 404


# --- Unit tests for orchestrator ---


def _make_session(session_type: str, number: int = 1) -> shared.Session:
    return shared.Session(
        id=f"session_{session_type}_{number}",
        url=HttpUrl("http://test/sessions/1"),
        number=number,
        type=session_type,
        type_display=session_type,
        timestamp=None,
        missing_time_data=None,
        local_timestamp=None,
        timezone=None,
        scheduled_laps=None,
        is_cancelled=False,
    )


def _make_round_data(
    *,
    session_types: list[str],
    date: datetime.date | None = None,
    round_number: int = 1,
    round_api_id: str = "round_1",
) -> ScheduleRoundData:
    sessions = [_make_session(st, i + 1) for i, st in enumerate(session_types)]
    return ScheduleRoundData(
        round=shared.Round(
            id=round_api_id,
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
        date=date,
        session_types=session_types,
        sessions=sessions,
    )


def _make_schedule_data(rounds: list[ScheduleRoundData]) -> ScheduleData:
    return ScheduleData(
        season=shared.Season(
            id="season_2023",
            url=HttpUrl("http://test/schedules/2023"),
            year=2023,
            wikipedia=None,
        ),
        rounds=rounds,
    )


def _dummy_url_builder(round_api_id: str, session_code: str) -> str:
    return f"http://test/results/{round_api_id}/{session_code}"


class TestSessionConsolidation:
    def test_qualifying_sessions_consolidated(self):
        """Q1, Q2, Q3 should be consolidated into a single FullSession with code='Q'."""
        round_data = _make_round_data(session_types=["FP1", "Q1", "Q2", "Q3", "R"])
        data = _make_schedule_data([round_data])
        result = ScheduleOrchestrator(data, _dummy_url_builder).render()

        codes = [s.code for s in result.events[0].schedule]
        assert codes == ["FP1", "Q", "R"]

        q_session = next(s for s in result.events[0].schedule if s.code == "Q")
        assert q_session.title == "Qualifying"
        assert len(q_session.sessions) == 3
        assert q_session.results_url is not None
        assert "round_1/Q" in str(q_session.results_url)

    def test_sprint_qualifying_sessions_consolidated(self):
        """SQ1, SQ2, SQ3 should be consolidated into a single FullSession with code='SQ'."""
        round_data = _make_round_data(session_types=["SQ1", "SQ2", "SQ3", "SR"])
        data = _make_schedule_data([round_data])
        result = ScheduleOrchestrator(data, _dummy_url_builder).render()

        codes = [s.code for s in result.events[0].schedule]
        assert codes == ["SQ", "SR"]

        sq_session = next(s for s in result.events[0].schedule if s.code == "SQ")
        assert sq_session.title == "Sprint Qualifying"
        assert len(sq_session.sessions) == 3

    def test_standalone_sessions_not_consolidated(self):
        """FP1, FP2, R should each be their own FullSession."""
        round_data = _make_round_data(session_types=["FP1", "FP2", "R"])
        data = _make_schedule_data([round_data])
        result = ScheduleOrchestrator(data, _dummy_url_builder).render()

        codes = [s.code for s in result.events[0].schedule]
        assert codes == ["FP1", "FP2", "R"]
        for fs in result.events[0].schedule:
            assert len(fs.sessions) == 1

    def test_results_url_uses_consolidated_code(self):
        """results_url should use the consolidated code, not the sub-session type."""
        round_data = _make_round_data(session_types=["Q1", "Q2", "Q3"])
        data = _make_schedule_data([round_data])
        result = ScheduleOrchestrator(data, _dummy_url_builder).render()

        q_session = result.events[0].schedule[0]
        assert "round_1/Q" in str(q_session.results_url)


class TestRoundsInfoCalculation:
    def test_previous_round_found(self):
        """Previous round should be the last round with a race before today."""
        today = datetime.date(2023, 6, 1)
        rounds = [
            _make_round_data(session_types=["R"], date=datetime.date(2023, 3, 1), round_number=1, round_api_id="r1"),
            _make_round_data(session_types=["R"], date=datetime.date(2023, 5, 1), round_number=2, round_api_id="r2"),
            _make_round_data(session_types=["R"], date=datetime.date(2023, 7, 1), round_number=3, round_api_id="r3"),
        ]
        data = _make_schedule_data(rounds)
        result = ScheduleOrchestrator(data, _dummy_url_builder, today=today).render()

        assert result.rounds_info is not None
        assert result.rounds_info.previous is not None
        assert result.rounds_info.previous.number == 2
        assert result.rounds_info.previous.index == 1

    def test_next_round_found(self):
        """Next round should be the first round with a race after the previous."""
        today = datetime.date(2023, 6, 1)
        rounds = [
            _make_round_data(session_types=["R"], date=datetime.date(2023, 5, 1), round_number=1, round_api_id="r1"),
            _make_round_data(session_types=["R"], date=datetime.date(2023, 7, 1), round_number=2, round_api_id="r2"),
        ]
        data = _make_schedule_data(rounds)
        result = ScheduleOrchestrator(data, _dummy_url_builder, today=today).render()

        assert result.rounds_info is not None
        assert result.rounds_info.next is not None
        assert result.rounds_info.next.number == 2
        assert result.rounds_info.next.index == 1

    def test_no_rounds_info_when_no_race_sessions(self):
        """rounds_info should be None when no rounds have race sessions."""
        rounds = [
            _make_round_data(session_types=["FP1"], date=datetime.date(2023, 3, 1), round_number=1),
        ]
        data = _make_schedule_data(rounds)
        result = ScheduleOrchestrator(data, _dummy_url_builder, today=datetime.date(2023, 6, 1)).render()

        assert result.rounds_info is None

    def test_all_rounds_in_future(self):
        """Only next should be set when all rounds are in the future."""
        today = datetime.date(2023, 1, 1)
        rounds = [
            _make_round_data(session_types=["R"], date=datetime.date(2023, 3, 1), round_number=1, round_api_id="r1"),
            _make_round_data(session_types=["R"], date=datetime.date(2023, 5, 1), round_number=2, round_api_id="r2"),
        ]
        data = _make_schedule_data(rounds)
        result = ScheduleOrchestrator(data, _dummy_url_builder, today=today).render()

        assert result.rounds_info is not None
        assert result.rounds_info.previous is None
        assert result.rounds_info.next is not None
        assert result.rounds_info.next.number == 1

    def test_all_rounds_in_past(self):
        """Only previous should be set when all rounds are in the past."""
        today = datetime.date(2023, 12, 31)
        rounds = [
            _make_round_data(session_types=["R"], date=datetime.date(2023, 3, 1), round_number=1, round_api_id="r1"),
            _make_round_data(session_types=["R"], date=datetime.date(2023, 5, 1), round_number=2, round_api_id="r2"),
        ]
        data = _make_schedule_data(rounds)
        result = ScheduleOrchestrator(data, _dummy_url_builder, today=today).render()

        assert result.rounds_info is not None
        assert result.rounds_info.previous is not None
        assert result.rounds_info.previous.number == 2
        assert result.rounds_info.next is None

    def test_no_rounds(self):
        """rounds_info should be None when there are no rounds."""
        data = _make_schedule_data([])
        result = ScheduleOrchestrator(data, _dummy_url_builder).render()
        assert result.rounds_info is None
