import pytest
from django.core.management import call_command
from django.db.models import prefetch_related_objects

from ..models import ChampionshipAdjustmentType, Season, SessionType
from ..standings import SeasonData


@pytest.fixture(scope="module")
def championship_adjustments(django_db_setup, django_db_blocker):
    with django_db_blocker.unblock():
        call_command("loaddata", "jolpica/formula_one/fixtures/championship_adjustments.json")


@pytest.fixture(scope="module")
def driver_standings_1997(django_db_setup, django_db_blocker, championship_adjustments):
    with django_db_blocker.unblock():
        season_data = SeasonData.from_season(Season.objects.get(year=1997))
        standings = season_data.generate_standings()
        prefetch_related_objects(standings, "driver", "session")
    return standings


@pytest.fixture(scope="module")
def driver_standings_2023(django_db_setup, django_db_blocker, championship_adjustments):
    with django_db_blocker.unblock():
        season_data = SeasonData.from_season(Season.objects.get(year=2023))
        standings = season_data.generate_standings()
        prefetch_related_objects(standings, "driver", "session")
    return standings


def check_expected_in_standings(standings, round, reference, expected, session_type=SessionType.RACE):
    if isinstance(round, str) and round.startswith("s"):
        session_type = SessionType.SPRINT_RACE
        round = int(round[1:])
    standings = filter(
        lambda x: x.round_number == round and x.session.type == session_type and x.driver.reference == reference,
        standings,
    )
    standing = next(standings, False)
    if expected is None:
        assert standing is False, "Standing exists when it should not"
        return
    assert standing, "Standing does not exist"
    assert next(standings, False) is False, "Standing is not unique"
    assert standing.position == expected.get("position")
    assert standing.points == expected.get("points")
    assert standing.adjustment_type == expected.get("adjustment", 0)
    assert standing.is_eligible == expected.get("is_eligible", True)


@pytest.mark.parametrize(
    ["round", "reference", "expected"],
    [
        (22, "max_verstappen", {"position": 1, "points": 575}),
        (22, "perez", {"position": 2, "points": 285}),
        (22, "ricciardo", {"position": 17, "points": 6}),
        (22, "de_vries", {"position": 22, "points": 0, "is_eligible": True}),
        (17, "hamilton", {"position": 3, "points": 194}),
        ("s17", "hamilton", {"position": 3, "points": 194}),
        (2, "max_verstappen", {"position": 1, "points": 44}),
        (2, "perez", {"position": 2, "points": 43}),
        (2, "ricciardo", None),
        (1, "leclerc", {"position": None, "points": 0, "is_eligible": False}),
    ],
)
def test_2023_driver_standings(driver_standings_2023, round, reference, expected):
    check_expected_in_standings(driver_standings_2023, round, reference, expected)


@pytest.mark.parametrize(
    ["round", "reference", "expected"],
    [
        (17, "villeneuve", {"position": 1, "points": 81}),
        (
            17,
            "michael_schumacher",
            {"position": None, "points": 78, "adjustment": ChampionshipAdjustmentType.DISQUALIFIED},
        ),
        (17, "frentzen", {"position": 2, "points": 42}),
        (17, "rosset", {"position": None, "points": 0, "is_eligible": False}),
        (
            2,
            "michael_schumacher",
            {"position": None, "points": 8, "adjustment": ChampionshipAdjustmentType.DISQUALIFIED},
        ),
        (
            1,
            "michael_schumacher",
            {"position": None, "points": 6, "adjustment": ChampionshipAdjustmentType.DISQUALIFIED},
        ),
        (1, "coulthard", {"position": 1, "points": 10}),
    ],
)
def test_1997_driver_standings(driver_standings_1997, round, reference, expected):
    check_expected_in_standings(driver_standings_1997, round, reference, expected)
