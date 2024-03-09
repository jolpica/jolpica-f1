import pytest
from django.core.management import call_command
from django.db.models import prefetch_related_objects

from ..models import ChampionshipAdjustmentType, Season, SessionType
from ..models.managed_views import DriverChampionship, TeamChampionship
from ..standings import Group, SeasonData


@pytest.fixture(scope="module")
def championship_adjustments(django_db_setup, django_db_blocker):
    with django_db_blocker.unblock():
        call_command("loaddata", "jolpica/formula_one/fixtures/championship_adjustments.json")


@pytest.fixture(scope="module")
def driver_standings_from_year(django_db_setup, django_db_blocker, championship_adjustments):
    def from_year(year) -> list[DriverChampionship]:
        with django_db_blocker.unblock():
            season_data = SeasonData.from_season(Season.objects.get(year=year))
            standings = season_data.generate_standings(Group.DRIVER)
            prefetch_related_objects(standings, "driver", "session")
        return standings

    return from_year


@pytest.fixture(scope="module")
def team_standings_from_year(django_db_setup, django_db_blocker, championship_adjustments):
    def from_year(year) -> list[TeamChampionship]:
        with django_db_blocker.unblock():
            season_data = SeasonData.from_season(Season.objects.get(year=year))
            standings = season_data.generate_standings(Group.TEAM)
            prefetch_related_objects(standings, "team", "session")
        return standings

    return from_year


def check_expected_in_standings(standings, round, reference, expected):
    if isinstance(round, str) and round.startswith("s"):
        session_type = SessionType.SPRINT_RACE
        round = int(round[1:])
    else:
        session_type = SessionType.RACE
    if isinstance(standings[0], DriverChampionship):
        ref_attr = "driver"
    else:
        ref_attr = "team"
    standings = filter(
        lambda x: x.round_number == round
        and x.session.type == session_type
        and getattr(x, ref_attr).reference == reference,
        standings,
    )
    standing = next(standings, False)
    if expected is None:
        assert standing is False, "Standing exists when it should not"
        return
    assert standing, "Standing does not exist"
    assert next(standings, False) is False, "Standing is not unique"
    assert standing.points == expected.get("points")
    assert standing.position == expected.get("position")
    assert ChampionshipAdjustmentType(standing.adjustment_type) == expected.get(
        "adjustment", ChampionshipAdjustmentType.NONE
    )
    assert standing.is_eligible == expected.get("is_eligible", True)
    if "win_count" in expected:
        assert standing.win_count == expected["win_count"]


@pytest.fixture(scope="module")
def driver_standings_2023(driver_standings_from_year):
    return driver_standings_from_year(2023)


@pytest.mark.parametrize(
    ["round", "reference", "expected"],
    [
        (22, "max_verstappen", {"position": 1, "points": 575, "win_count": 19}),
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
def test_2023_driver_standings(driver_standings_2023: list[DriverChampionship], round, reference, expected):
    check_expected_in_standings(driver_standings_2023, round, reference, expected)


@pytest.fixture(scope="module")
def driver_standings_1997(driver_standings_from_year):
    return driver_standings_from_year(1997)


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


@pytest.fixture(scope="module")
def driver_standings_1980(driver_standings_from_year):
    return driver_standings_from_year(1980)


@pytest.mark.parametrize(
    ["round", "reference", "expected"],
    [
        (14, "jones", {"position": 1, "points": 67}),
        (14, "piquet", {"position": 2, "points": 54}),
        (14, "reutemann", {"position": 3, "points": 42}),
    ],
)
def test_1980_driver_standings(driver_standings_1980: list[DriverChampionship], round, reference, expected):
    check_expected_in_standings(driver_standings_1980, round, reference, expected)


@pytest.fixture(scope="module")
def team_standings_2023(team_standings_from_year):
    return team_standings_from_year(2023)


@pytest.mark.parametrize(
    ["round", "reference", "expected"],
    [
        (22, "red_bull", {"position": 1, "points": 860}),
        (22, "mercedes", {"position": 2, "points": 409}),
        (22, "alphatauri", {"position": 8, "points": 25}),
        (20, "red_bull", {"position": 1, "points": 782}),
        ("s20", "red_bull", {"position": 1, "points": 745}),
        (19, "red_bull", {"position": 1, "points": 731}),
        (15, "aston_martin", {"position": 4, "points": 217}),
        (1, "red_bull", {"position": 1, "points": 43}),
    ],
)
def test_2023_team_standings(team_standings_2023: list[TeamChampionship], round, reference, expected):
    check_expected_in_standings(team_standings_2023, round, reference, expected)


@pytest.fixture(scope="module")
def team_standings_2020(team_standings_from_year):
    return team_standings_from_year(2020)


@pytest.mark.parametrize(
    ["round", "reference", "expected"],
    [
        (17, "mercedes", {"position": 1, "points": 573}),
        (17, "red_bull", {"position": 2, "points": 319}),
        (17, "mclaren", {"position": 3, "points": 202}),
        (
            17,
            "racing_point",
            {"position": 4, "points": 195, "adjustment": ChampionshipAdjustmentType.POINT_DEDUCTION},
        ),
        (17, "williams", {"position": 10, "points": 0, "is_eligible": True}),
    ],
)
def test_2020_team_standings(team_standings_2020, round, reference, expected):
    check_expected_in_standings(team_standings_2020, round, reference, expected)


@pytest.fixture(scope="module")
def team_standings_2007(team_standings_from_year):
    return team_standings_from_year(2007)


@pytest.mark.parametrize(
    ["round", "reference", "expected"],
    [
        (17, "ferrari", {"position": 1, "points": 204}),
        (
            17,
            "mclaren",
            {"position": None, "points": 0, "is_eligible": True, "adjustment": ChampionshipAdjustmentType.EXCLUDED},
        ),
    ],
)
def test_2007_team_standings(team_standings_2007, round, reference, expected):
    check_expected_in_standings(team_standings_2007, round, reference, expected)


@pytest.fixture(scope="module")
def team_standings_1997(team_standings_from_year):
    return team_standings_from_year(1997)


@pytest.mark.parametrize(
    ["round", "reference", "expected"],
    [
        (17, "williams", {"position": 1, "points": 123, "win_count": 8}),
        (17, "ferrari", {"position": 2, "points": 102, "win_count": 5}),
        (17, "lola", {"position": None, "points": 0, "is_eligible": False}),
    ],
)
def test_1997_team_standings(team_standings_1997, round, reference, expected):
    check_expected_in_standings(team_standings_1997, round, reference, expected)


@pytest.fixture(scope="module")
def team_standings_1979(team_standings_from_year):
    return team_standings_from_year(1979)


@pytest.mark.parametrize(
    ["round", "reference", "expected"],
    [
        (15, "ferrari", {"position": 1, "points": 113, "win_count": 6}),
        (15, "williams", {"position": 2, "points": 75, "win_count": 5}),
        (15, "merzario", {"position": None, "points": 0, "is_eligible": False}),
        (5, "kauhsen", {"position": None, "points": 0, "is_eligible": False}),
        (4, "kauhsen", None),
    ],
)
def test_1979_team_standings(team_standings_1979, round, reference, expected):
    check_expected_in_standings(team_standings_1979, round, reference, expected)
