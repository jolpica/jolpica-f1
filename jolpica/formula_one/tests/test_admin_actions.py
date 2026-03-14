import pytest
from django.contrib import admin as django_admin

from jolpica.formula_one import models as f1
from jolpica.formula_one.admin import RoundAdmin, SessionAdmin


@pytest.fixture
def circuit():
    return f1.Circuit.objects.create(api_id="circuit-test", name="Test Circuit")


@pytest.fixture
def point_system():
    return f1.PointSystem.objects.create(
        api_id="pointsystem-test",
        reference="pointsystem-test",
        name="Test Point System",
        driver_position_points=f1.PositionPointScheme.RACE_2010,
        driver_fastest_lap=f1.FastestLapPointScheme.NONE,
        team_position_points=f1.PositionPointScheme.RACE_2010,
        team_fastest_lap=f1.FastestLapPointScheme.NONE,
        partial=f1.PartialPointScheme.NONE,
        shared_drive=f1.SharedDrivePointScheme.NONE,
        is_double_points=False,
    )


@pytest.mark.django_db
def test_round_admin_mark_as_cancelled_resequences_and_aligns_race_number(circuit, point_system):
    season = f1.Season.objects.create(api_id="season-test", year=2128)
    rounds = [
        f1.Round.objects.create(
            api_id=f"round-test-{number}",
            season=season,
            circuit=circuit,
            number=number,
            race_number=number + 9,
            name=f"Round {number}",
        )
        for number in range(1, 6)
    ]

    for round_obj in rounds:
        f1.Session.objects.create(
            api_id=f"session-round-{round_obj.number}-1",
            round=round_obj,
            number=1,
            point_system=point_system,
            type=f1.SessionType.PRACTICE_ONE,
        )
        f1.Session.objects.create(
            api_id=f"session-round-{round_obj.number}-2",
            round=round_obj,
            number=2,
            point_system=point_system,
            type=f1.SessionType.PRACTICE_TWO,
        )

    round_admin = RoundAdmin(f1.Round, django_admin.site)
    queryset = f1.Round.objects.filter(id__in=[rounds[3].id, rounds[1].id]).order_by("-number")

    round_admin.mark_as_cancelled(None, queryset)

    season_rounds = list(f1.Round.objects.filter(season=season).order_by("id"))
    cancelled_rounds = [round_obj for round_obj in season_rounds if round_obj.is_cancelled]
    active_rounds = [round_obj for round_obj in season_rounds if not round_obj.is_cancelled]

    assert {round_obj.api_id for round_obj in cancelled_rounds} == {"round-test-2", "round-test-4"}
    assert all(round_obj.number is None for round_obj in cancelled_rounds)
    assert all(round_obj.race_number is None for round_obj in cancelled_rounds)

    assert [round_obj.api_id for round_obj in sorted(active_rounds, key=lambda value: value.number or 0)] == [
        "round-test-1",
        "round-test-3",
        "round-test-5",
    ]
    assert [round_obj.number for round_obj in sorted(active_rounds, key=lambda value: value.number or 0)] == [1, 2, 3]
    assert [round_obj.race_number for round_obj in sorted(active_rounds, key=lambda value: value.number or 0)] == [
        10,
        11,
        12,
    ]

    cancelled_round_sessions = f1.Session.objects.filter(round__api_id__in={"round-test-2", "round-test-4"})
    active_round_sessions = f1.Session.objects.filter(
        round__api_id__in={"round-test-1", "round-test-3", "round-test-5"}
    )

    assert cancelled_round_sessions.count() == 4
    assert cancelled_round_sessions.filter(is_cancelled=True, number__isnull=True).count() == 4
    assert active_round_sessions.filter(is_cancelled=False).count() == 6


@pytest.mark.django_db
def test_round_admin_mark_as_cancelled_skips_already_cancelled(circuit):
    season = f1.Season.objects.create(api_id="season-test-skip", year=2129)
    round_one = f1.Round.objects.create(
        api_id="round-skip-1",
        season=season,
        circuit=circuit,
        number=1,
        race_number=1,
        name="Round 1",
    )
    round_two = f1.Round.objects.create(
        api_id="round-skip-2",
        season=season,
        circuit=circuit,
        number=2,
        race_number=2,
        name="Round 2",
        is_cancelled=True,
    )

    round_admin = RoundAdmin(f1.Round, django_admin.site)
    queryset = f1.Round.objects.filter(id__in=[round_one.id, round_two.id])

    round_admin.mark_as_cancelled(None, queryset)

    round_one.refresh_from_db()
    round_two.refresh_from_db()

    assert round_one.is_cancelled is True
    assert round_one.number is None
    assert round_one.race_number is None
    assert round_two.is_cancelled is True


@pytest.mark.django_db
def test_session_admin_mark_as_cancelled_resequences_per_round(point_system, circuit):
    season = f1.Season.objects.create(api_id="season-session-test", year=2130)
    round_obj = f1.Round.objects.create(
        api_id="round-session-test",
        season=season,
        circuit=circuit,
        number=1,
        race_number=1,
        name="Round Session",
    )
    sessions = [
        f1.Session.objects.create(
            api_id=f"session-test-{number}",
            round=round_obj,
            number=number,
            point_system=point_system,
            type=f1.SessionType.PRACTICE_ONE,
        )
        for number in range(1, 6)
    ]

    session_admin = SessionAdmin(f1.Session, django_admin.site)
    queryset = f1.Session.objects.filter(id__in=[sessions[4].id, sessions[1].id]).order_by("-number")

    session_admin.mark_as_cancelled(None, queryset)

    round_sessions = list(f1.Session.objects.filter(round=round_obj).order_by("id"))
    cancelled_sessions = [session for session in round_sessions if session.is_cancelled]
    active_sessions = [session for session in round_sessions if not session.is_cancelled]

    assert {session.api_id for session in cancelled_sessions} == {"session-test-2", "session-test-5"}
    assert all(session.number is None for session in cancelled_sessions)

    assert [session.api_id for session in sorted(active_sessions, key=lambda value: value.number or 0)] == [
        "session-test-1",
        "session-test-3",
        "session-test-4",
    ]
    assert [session.number for session in sorted(active_sessions, key=lambda value: value.number or 0)] == [1, 2, 3]


@pytest.mark.django_db
def test_session_admin_mark_as_cancelled_skips_already_cancelled(point_system, circuit):
    season = f1.Season.objects.create(api_id="season-session-skip", year=2131)
    round_obj = f1.Round.objects.create(
        api_id="round-session-skip",
        season=season,
        circuit=circuit,
        number=1,
        race_number=1,
        name="Round Session Skip",
    )
    session_one = f1.Session.objects.create(
        api_id="session-skip-1",
        round=round_obj,
        number=1,
        point_system=point_system,
        type=f1.SessionType.PRACTICE_ONE,
    )
    session_two = f1.Session.objects.create(
        api_id="session-skip-2",
        round=round_obj,
        number=2,
        point_system=point_system,
        type=f1.SessionType.PRACTICE_TWO,
        is_cancelled=True,
    )

    session_admin = SessionAdmin(f1.Session, django_admin.site)
    queryset = f1.Session.objects.filter(id__in=[session_one.id, session_two.id])

    session_admin.mark_as_cancelled(None, queryset)

    session_one.refresh_from_db()
    session_two.refresh_from_db()

    assert session_one.is_cancelled is True
    assert session_one.number is None
    assert session_two.is_cancelled is True
