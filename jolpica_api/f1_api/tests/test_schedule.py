"""Tests for the schedule endpoint and marshalling."""

from __future__ import annotations

import datetime

import pytest
from django.urls import reverse
from pydantic import HttpUrl, ValidationError

from jolpica_api.f1_api.marshalling.schedules.loader import ScheduleData, ScheduleRoundData
from jolpica_api.f1_api.marshalling.schedules.orchestrator import ScheduleOrchestrator
from jolpica_schemas.f1_api.alpha import shared
from jolpica_schemas.f1_api.alpha.schedule import (
    ListSchedulesResponse,
    Schedule,
    ScheduleResponse,
)


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


def _make_round_data(
    *,
    session_types: list[str],
    date: datetime.date | None = None,
    round_number: int | None = 1,
    round_api_id: str = "round_1",
) -> ScheduleRoundData:
    base_timestamp = None
    if date is not None:
        base_timestamp = datetime.datetime.combine(date, datetime.time(12, 0))

    sessions = []
    for i, session_type in enumerate(session_types):
        session = _make_session(session_type, i + 1)
        if base_timestamp is not None:
            session = session.model_copy(update={"timestamp": base_timestamp + datetime.timedelta(hours=i)})
        sessions.append(session)

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


@pytest.mark.django_db
def test_schedule_list_schema_conformance(api_client, sample_season_data):
    """Verify the schedule list response conforms to schema."""
    url = reverse("schedules-list")
    response = api_client.get(url)

    assert response.status_code == 200
    response_data = response.json()

    try:
        ListSchedulesResponse.model_validate(response_data)
    except ValidationError as e:
        pytest.fail(f"schedule list response does not conform to schema:\n{e}")


@pytest.mark.django_db
def test_schedule_detail_schema_conformance(api_client, sample_season_data):
    """Verify the schedule detail response conforms to RetrievedScheduleDetail."""
    year = sample_season_data.year
    url = reverse("schedules-detail", kwargs={"year": year})
    response = api_client.get(url)

    assert response.status_code == 200
    response_data = response.json()

    try:
        ScheduleResponse.model_validate(response_data)
    except ValidationError as e:
        pytest.fail(f"schedule detail response does not conform to schema:\n{e}")


@pytest.mark.django_db
def test_schedule_detail_not_found(api_client):
    """Verify 404 for a non-existent season."""
    url = reverse("schedules-detail", kwargs={"year": 9999})
    response = api_client.get(url)
    assert response.status_code == 404


@pytest.mark.django_db
def test_schedule_list_query_count(api_client, django_assert_max_num_queries, sample_season_data):
    """Verify the schedule list endpoint makes fewer than 10 database queries."""
    url = reverse("schedules-list")

    with django_assert_max_num_queries(10):
        response = api_client.get(url)

    assert response.status_code == 200


@pytest.mark.django_db
def test_schedule_detail_query_count(api_client, django_assert_max_num_queries, sample_season_data):
    """Verify the schedule detail endpoint makes fewer than 10 database queries."""
    year = sample_season_data.year
    url = reverse("schedules-detail", kwargs={"year": year})

    with django_assert_max_num_queries(10):
        response = api_client.get(url)

    assert response.status_code == 200
    assert len(response.json()["data"]["events"]) == sample_season_data.rounds.count()


# --- Unit tests for orchestrator ---


class TestSessionConsolidation:
    def test_qualifying_sessions_consolidated(self):
        """Q1, Q2, Q3 should be consolidated into a single FullSession with code='Q'."""
        round_data = _make_round_data(session_types=["FP1", "Q1", "Q2", "Q3", "R"])
        data = _make_schedule_data([round_data])
        result = ScheduleOrchestrator(data).render()

        codes = [s.code for s in result.events[0].schedule]
        assert codes == ["FP1", "Q", "R"]

        q_session = next(s for s in result.events[0].schedule if s.code == "Q")
        assert q_session.title == "Qualifying"
        assert len(q_session.sessions) == 3

    def test_sprint_qualifying_sessions_consolidated(self):
        """SQ1, SQ2, SQ3 should be consolidated into a single FullSession with code='SQ'."""
        round_data = _make_round_data(session_types=["SQ1", "SQ2", "SQ3", "SR"])
        data = _make_schedule_data([round_data])
        result = ScheduleOrchestrator(data).render()

        codes = [s.code for s in result.events[0].schedule]
        assert codes == ["SQ", "SR"]

        sq_session = next(s for s in result.events[0].schedule if s.code == "SQ")
        assert sq_session.title == "Sprint Qualifying"
        assert len(sq_session.sessions) == 3

    def test_standalone_sessions_not_consolidated(self):
        """FP1, FP2, R should each be their own FullSession."""
        round_data = _make_round_data(session_types=["FP1", "FP2", "R"])
        data = _make_schedule_data([round_data])
        result = ScheduleOrchestrator(data).render()

        codes = [s.code for s in result.events[0].schedule]
        assert codes == ["FP1", "FP2", "R"]
        for fs in result.events[0].schedule:
            assert len(fs.sessions) == 1


class TestRoundOrdering:
    def test_rounds_sorted_by_round_number_then_date_with_cancelled_last(self):
        rounds = [
            _make_round_data(session_types=["R"], round_number=None, date=datetime.date(2023, 4, 1), round_api_id="c1"),
            _make_round_data(session_types=["R"], round_number=2, date=datetime.date(2023, 6, 1), round_api_id="r2"),
            _make_round_data(session_types=["R"], round_number=3, date=datetime.date(2023, 7, 1), round_api_id="r3"),
            _make_round_data(session_types=["R"], round_number=1, date=datetime.date(2023, 3, 1), round_api_id="r1a"),
            _make_round_data(session_types=["R"], round_number=None, date=datetime.date(2023, 2, 1), round_api_id="c0"),
        ]
        data = _make_schedule_data(rounds)

        result = ScheduleOrchestrator(data).render()

        assert [event.round.id for event in result.events] == ["r1a", "r2", "r3", "c0", "c1"]


class TestRoundsInfoCalculation:
    def test_previous_round_found(self):
        """Previous round should be the last round with a race before today."""
        today = datetime.datetime(2023, 6, 1)
        rounds = [
            _make_round_data(session_types=["R"], date=datetime.date(2023, 3, 1), round_number=1, round_api_id="r1"),
            _make_round_data(session_types=["R"], date=datetime.date(2023, 5, 1), round_number=2, round_api_id="r2"),
            _make_round_data(session_types=["R"], date=datetime.date(2023, 7, 1), round_number=3, round_api_id="r3"),
        ]
        data = _make_schedule_data(rounds)
        result = ScheduleOrchestrator(data, current_timestamp=today).render()

        assert result.rounds_info is not None
        assert result.rounds_info.previous is not None
        assert result.rounds_info.previous.number == 2
        assert result.rounds_info.previous.index == 1

    def test_next_round_found(self):
        """Next round should be the first round with a race after the previous."""
        today = datetime.datetime(2023, 6, 1)
        rounds = [
            _make_round_data(session_types=["R"], date=datetime.date(2023, 5, 1), round_number=1, round_api_id="r1"),
            _make_round_data(session_types=["R"], date=datetime.date(2023, 7, 1), round_number=2, round_api_id="r2"),
        ]
        data = _make_schedule_data(rounds)
        result = ScheduleOrchestrator(data, current_timestamp=today).render()

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
        result = ScheduleOrchestrator(data, current_timestamp=datetime.datetime(2023, 6, 1)).render()

        assert result.rounds_info is None

    def test_all_rounds_in_future(self):
        """Only next should be set when all rounds are in the future."""
        today = datetime.datetime(2023, 1, 1)
        rounds = [
            _make_round_data(session_types=["R"], date=datetime.date(2023, 3, 1), round_number=1, round_api_id="r1"),
            _make_round_data(session_types=["R"], date=datetime.date(2023, 5, 1), round_number=2, round_api_id="r2"),
        ]
        data = _make_schedule_data(rounds)
        result = ScheduleOrchestrator(data, current_timestamp=today).render()

        assert result.rounds_info is not None
        assert result.rounds_info.previous is None
        assert result.rounds_info.next is not None
        assert result.rounds_info.next.number == 1

    def test_all_rounds_in_past(self):
        """Only previous should be set when all rounds are in the past."""
        today = datetime.datetime(2023, 12, 31)
        rounds = [
            _make_round_data(session_types=["R"], date=datetime.date(2023, 3, 1), round_number=1, round_api_id="r1"),
            _make_round_data(session_types=["R"], date=datetime.date(2023, 5, 1), round_number=2, round_api_id="r2"),
        ]
        data = _make_schedule_data(rounds)
        result = ScheduleOrchestrator(data, current_timestamp=today).render()

        assert result.rounds_info is not None
        assert result.rounds_info.previous is not None
        assert result.rounds_info.previous.number == 2
        assert result.rounds_info.next is None

    def test_no_rounds(self):
        """rounds_info should be None when there are no rounds."""
        data = _make_schedule_data([])
        result = ScheduleOrchestrator(data).render()
        assert result.rounds_info is None

    def test_round_date_equals_today_is_not_previous(self):
        """A round whose date equals today should NOT be counted as previous (uses strict < today)."""
        today = datetime.datetime(2023, 5, 1)
        rounds = [
            _make_round_data(session_types=["R"], date=datetime.date(2023, 5, 1), round_number=1, round_api_id="r1"),
            _make_round_data(session_types=["R"], date=datetime.date(2023, 7, 1), round_number=2, round_api_id="r2"),
        ]
        data = _make_schedule_data(rounds)
        result = ScheduleOrchestrator(data, current_timestamp=today).render()

        assert result.rounds_info is not None
        assert result.rounds_info.previous is None
        assert result.rounds_info.next is not None
        assert result.rounds_info.next.number == 1


class TestStandaloneQualifyingSessions:
    """Test that aggregate/order/best qualifying types are handled as standalone sessions."""

    def test_qualifying_aggregate(self):
        """QA should produce a standalone FullSession with code='Q' and title='Qualifying'."""
        round_data = _make_round_data(session_types=["QA", "R"])
        data = _make_schedule_data([round_data])
        result = ScheduleOrchestrator(data).render()

        codes = [s.code for s in result.events[0].schedule]
        assert codes == ["Q", "R"]
        q = next(s for s in result.events[0].schedule if s.code == "Q")
        assert q.title == "Qualifying"
        assert len(q.sessions) == 1

    def test_qualifying_order(self):
        """QO should produce a standalone FullSession with code='Q' and title='Qualifying'."""
        round_data = _make_round_data(session_types=["QO", "R"])
        data = _make_schedule_data([round_data])
        result = ScheduleOrchestrator(data).render()

        codes = [s.code for s in result.events[0].schedule]
        assert codes == ["Q", "R"]
        q = next(s for s in result.events[0].schedule if s.code == "Q")
        assert q.title == "Qualifying"
        assert len(q.sessions) == 1

    def test_qualifying_best(self):
        """QB should produce a standalone FullSession with code='Q' and title='Qualifying'."""
        round_data = _make_round_data(session_types=["QB", "R"])
        data = _make_schedule_data([round_data])
        result = ScheduleOrchestrator(data).render()

        codes = [s.code for s in result.events[0].schedule]
        assert codes == ["Q", "R"]
        q = next(s for s in result.events[0].schedule if s.code == "Q")
        assert q.title == "Qualifying"
        assert len(q.sessions) == 1
