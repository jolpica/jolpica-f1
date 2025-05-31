import pytest
from django.db.models import prefetch_related_objects

from ..models import ChampionshipAdjustmentType, Season, SessionType
from ..models.managed_views import DriverChampionship, TeamChampionship
from ..standings import Group, SeasonData


@pytest.fixture(scope="module")
def driver_standings_from_year(django_db_setup):
    def from_year(year) -> list[DriverChampionship]:
        season_data = SeasonData.from_season(Season.objects.get(year=year))
        standings = season_data.generate_standings(Group.DRIVER)
        prefetch_related_objects(standings, "driver", "session")
        return standings

    return from_year


@pytest.fixture(scope="module")
def team_standings_from_year(django_db_setup):
    def from_year(year) -> list[TeamChampionship]:
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
@pytest.mark.django_db
def test_2023_driver_standings(driver_standings_from_year: list[DriverChampionship], round, reference, expected):
    check_expected_in_standings(driver_standings_from_year(2023), round, reference, expected)


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
@pytest.mark.django_db
def test_1997_driver_standings(driver_standings_from_year, round, reference, expected):
    check_expected_in_standings(driver_standings_from_year(1997), round, reference, expected)


@pytest.mark.parametrize(
    ["round", "reference", "expected"],
    [
        (14, "jones", {"position": 1, "points": 67}),
        (14, "piquet", {"position": 2, "points": 54}),
        (14, "reutemann", {"position": 3, "points": 42}),
        (14, "surer", {"position": None, "points": 0, "is_eligible": False}),
    ],
)
@pytest.mark.django_db
def test_1980_driver_standings(driver_standings_from_year: list[DriverChampionship], round, reference, expected):
    check_expected_in_standings(driver_standings_from_year(1980), round, reference, expected)


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
@pytest.mark.django_db
def test_2023_team_standings(team_standings_from_year: list[TeamChampionship], round, reference, expected):
    check_expected_in_standings(team_standings_from_year(2023), round, reference, expected)


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
@pytest.mark.django_db
def test_2020_team_standings(team_standings_from_year, round, reference, expected):
    check_expected_in_standings(team_standings_from_year(2020), round, reference, expected)


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
@pytest.mark.django_db
def test_2007_team_standings(team_standings_from_year, round, reference, expected):
    check_expected_in_standings(team_standings_from_year(2007), round, reference, expected)


@pytest.mark.parametrize(
    ["round", "reference", "expected"],
    [
        (17, "williams", {"position": 1, "points": 123, "win_count": 8}),
        (17, "ferrari", {"position": 2, "points": 102, "win_count": 5}),
        (17, "lola", {"position": None, "points": 0, "is_eligible": False}),
    ],
)
@pytest.mark.django_db
def test_1997_team_standings(team_standings_from_year, round, reference, expected):
    check_expected_in_standings(team_standings_from_year(1997), round, reference, expected)


@pytest.mark.parametrize(
    ["round", "reference", "expected"],
    [
        (15, "ferrari", {"position": 1, "points": 113, "win_count": 6}),
        (15, "williams", {"position": 2, "points": 75, "win_count": 5}),
        (15, "merzario", {"position": None, "points": 0, "is_eligible": False}),
        (15, "brabham-ford", {"position": None, "points": 0, "is_eligible": False}),
        (5, "kauhsen", {"position": None, "points": 0, "is_eligible": False}),
        (4, "kauhsen", None),
    ],
)
@pytest.mark.django_db
def test_1979_team_standings(team_standings_from_year, round, reference, expected):
    check_expected_in_standings(team_standings_from_year(1979), round, reference, expected)


@pytest.mark.parametrize(
    ["round", "reference", "expected"],
    [
        (1, "maserati", {"position": 3, "points": 3, "win_count": 0}),
        (1, "ferrari", {"position": 2, "points": 6, "win_count": 0}),
        (2, "ferrari", {"position": 2, "points": 12, "win_count": 0}),
        (3, "ferrari", {"position": 2, "points": 14, "win_count": 0}),
        (4, "ferrari", {"position": 2, "points": 14, "win_count": 0}),  # indy500 no points
        (4, "epperly", None),  # Teams in Indy 500 not counted
        (5, "ferrari", {"position": 1, "points": 20, "win_count": 0}),
        (6, "ferrari", {"position": 1, "points": 28, "win_count": 1}),
        (7, "ferrari", {"position": 1, "points": 36, "win_count": 2}),
        (8, "ferrari", {"position": 1, "points": 37, "win_count": 2}),
        (9, "ferrari", {"position": 2, "points": 40, "win_count": 2}),
        (10, "ferrari", {"position": 2, "points": 40, "win_count": 2}),
        (11, "ferrari", {"position": 2, "points": 40, "win_count": 2}),
    ],
)
@pytest.mark.django_db
def test_1958_team_standings(team_standings_from_year, round, reference, expected):
    check_expected_in_standings(team_standings_from_year(1958), round, reference, expected)


@pytest.mark.parametrize(
    ["round", "reference", "expected"],
    [
        (1, "fangio", {"position": 4, "points": 4, "is_eligible": True}),
        (1, "brooks", None),
        (1, "collins", {"position": None, "points": 0, "is_eligible": False}),
        (3, "bryan", None),
        (4, "bryan", {"position": 4, "points": 8, "is_eligible": True}),
        (4, "fangio", {"position": 11, "points": 4, "is_eligible": True}),
        (11, "hawthorn", {"position": 1, "points": 42}),
        (11, "moss", {"position": 2, "points": 41}),
        (11, "phil_hill", {"position": 10, "points": 9}),
        (11, "behra", {"position": 12, "points": 9}),  # TODO: issue #239 - Should be joint 10th
    ],
)
@pytest.mark.django_db
def test_1958_driver_standings(driver_standings_from_year: list[DriverChampionship], round, reference, expected):
    check_expected_in_standings(driver_standings_from_year(1958), round, reference, expected)
