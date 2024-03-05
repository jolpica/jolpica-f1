from collections import Counter

import pytest
from django.core.management import call_command
from django.db.models import prefetch_related_objects

from ..generate_standings import generate_season_driver_standings
from ..models import ChampionshipAdjustmentType, Season, SessionType
from ..models.managed_views import DriverChampionship
from ..standings import ChampionshipAdjustmentType, EntryData, SeasonData, SessionData, Stats


@pytest.fixture(scope="module")
def entry_datas():
    output = [
        EntryData(
            round_number=1,
            session_number=5,
            driver_id=i,
            team_id=j,
            points=i,
            position=pos + 1,
            is_classified=True,
        )
        for pos, (i, j) in enumerate([(1, 101), (1, 101), (1, 102), (2, 102), (3, 103), (3, 101)])
    ] + [
        EntryData(
            round_number=1,
            session_number=5,
            driver_id=4,
            team_id=104,
            points=None,
            position=None,
            is_classified=None,
        )
    ]
    return output[::-1]


@pytest.fixture(scope="module")
def session_data(entry_datas: list[EntryData]):
    return SessionData(
        round_number=1,
        session_number=5,
        entry_datas=entry_datas,
        session_id=0,
        round_id=0,
    )


@pytest.fixture(scope="module")
def entry_datas2():
    output = [
        EntryData(
            round_number=2,
            session_number=2,
            driver_id=i,
            team_id=j,
            points=6 - pos,
            position=pos + 1,
            is_classified=True,
        )
        for pos, (i, j) in enumerate([(1, 101), (2, 101), (3, 102), (4, 102), (5, 103), (6, 103)])
    ]
    output2 = [
        EntryData(
            round_number=2,
            session_number=2,
            driver_id=i,
            team_id=j,
            points=0,
            position=pos + 1,
            is_classified=False,
        )
        for pos, (i, j) in enumerate([(7, 104), (8, 104)])
    ]

    return output2 + output


@pytest.fixture(scope="module")
def session_data2(entry_datas2: list[EntryData]):
    return SessionData(
        round_number=2,
        session_number=2,
        entry_datas=entry_datas2,
        session_id=0,
        round_id=0,
    )


@pytest.fixture(scope="module")
def season_data(session_data: SessionData, session_data2: SessionData):
    return SeasonData(
        season_year=2099,
        session_datas=[session_data2, session_data],
        season_id=0,
    )


def test_entry_data_by_group_driver(session_data: SessionData):
    output = session_data.group_data_by("DRIVER")

    assert set(output.keys()) == set([1, 2, 3, 4])

    assert len(output[1]) == 3
    assert len(output[2]) == 1
    assert len(output[3]) == 2
    assert len(output[4]) == 1


def test_entry_data_by_group_team(session_data: SessionData):
    output = session_data.group_data_by("TEAM")

    assert set(output.keys()) == set([101, 102, 103, 104])

    assert len(output[101]) == 3
    assert len(output[102]) == 2
    assert len(output[103]) == 1
    assert len(output[104]) == 1


def test_entry_data_by_group_invalid(session_data: SessionData):
    with pytest.raises(ValueError):
        session_data.group_data_by("akdlf")  # type: ignore


def test_points_by_group_driver_sum(session_data: SessionData):
    output = session_data.stats_by_group("DRIVER", "SUM")
    clean_output = {key: stat.points for key, stat in output.items()}

    assert clean_output == {1: 3, 2: 2, 3: 6, 4: 0}


def test_points_by_group_team_sum(session_data: SessionData):
    output = session_data.stats_by_group("TEAM", "SUM")
    clean_output = {key: stat.points for key, stat in output.items()}

    assert clean_output == {101: 5, 102: 3, 103: 3, 104: 0}


def test_points_by_group_driver_best(session_data: SessionData):
    output = session_data.stats_by_group("DRIVER", "BEST")
    clean_output = {key: stat.points for key, stat in output.items()}

    assert clean_output == {1: 1, 2: 2, 3: 3, 4: 0}


def test_points_by_group_team_best(session_data: SessionData):
    output = session_data.stats_by_group("TEAM", "BEST")
    clean_output = {key: stat.points for key, stat in output.items()}

    assert clean_output == {101: 3, 102: 2, 103: 3, 104: 0}


def test_points_by_group_invalid(session_data: SessionData):
    with pytest.raises(ValueError):
        session_data.stats_by_group("invalid", "SUM")  # type: ignore
    with pytest.raises(ValueError):
        session_data.stats_by_group("DRIVER", "invalid")  # type: ignore
    with pytest.raises(ValueError):
        session_data.stats_by_group("invalid", "invalid")  # type: ignore
    with pytest.raises(ValueError):
        session_data.stats_by_group("SUM", "DRIVER")  # type: ignore


def test_position_by_group_driver_sum(session_data: SessionData):
    output = session_data.stats_by_group("DRIVER", "SUM")

    clean_output = {}
    for key, position_data in output.items():
        assert position_data.unclassified_counts == {}
        clean_output[key] = position_data.finish_counts

    assert clean_output == {
        1: (Counter([1, 2, 3])),
        2: (Counter([4])),
        3: (Counter([5, 6])),
        4: ({}),
    }


def test_position_by_group_team_sum(session_data: SessionData):
    output = session_data.stats_by_group("TEAM", "SUM")

    clean_output = {}
    for key, position_data in output.items():
        assert position_data.unclassified_counts == {}
        clean_output[key] = position_data.finish_counts

    assert clean_output == {
        101: (Counter([1, 2, 6])),
        102: (Counter([3, 4])),
        103: (Counter([5])),
        104: ({}),
    }


def test_position_by_group_driver_best(session_data: SessionData):
    output = session_data.stats_by_group("DRIVER", "BEST")

    clean_output = {}
    for key, position_data in output.items():
        assert position_data.unclassified_counts == {}
        clean_output[key] = position_data.finish_counts

    assert clean_output == {
        1: (Counter([1])),
        2: (Counter([4])),
        3: (Counter([5])),
        4: ({}),
    }


def test_position_by_group_team_best(session_data: SessionData):
    for entry in session_data.entry_datas:
        entry.points = 0
    output = session_data.stats_by_group("TEAM", "BEST")

    clean_output = {}
    for key, position_data in output.items():
        assert position_data.unclassified_counts == {}
        clean_output[key] = position_data.finish_counts

    assert clean_output == {
        101: (Counter([1])),
        102: (Counter([3])),
        103: (Counter([5])),
        104: ({}),
    }


@pytest.mark.parametrize(
    ["args1", "args2", "expected"],
    [
        (([1, 1, 1], [1]), ([], [1]), ({1: 3}, {1: 2})),
        (([1, 1, 1], []), ([], [1]), ({1: 3}, {1: 1})),
        (({1: 0}, []), ([], []), ({1: 0}, {})),
        (({1: -1}, {1: -1}), ({1: 1}, []), ({1: 0}, {1: -1})),
    ],
)
def test_position_count_add(args1, args2, expected):
    pc1 = Stats(0, *args1)
    pc2 = Stats(0, *args2)

    added = pc1 + pc2
    assert dict(added.finish_counts) == expected[0]
    assert dict(added.unclassified_counts) == expected[1]


@pytest.fixture(scope="module")
def driver_standings_2023(django_db_setup, django_db_blocker):
    with django_db_blocker.unblock():
        season = Season.objects.get(year=2023)
        season_data = SeasonData.from_season(season)
        standings = season_data.generate_standings()
        prefetch_related_objects(standings, "driver", "session")
    return standings


@pytest.fixture(scope="module")
def championship_adjustments(django_db_setup, django_db_blocker):
    with django_db_blocker.unblock():
        call_command("loaddata", "jolpica/formula_one/fixtures/championship_adjustments.json")


@pytest.fixture(scope="module")
def old_driver_standings_2023(django_db_setup, django_db_blocker, championship_adjustments):
    with django_db_blocker.unblock():
        standings = generate_season_driver_standings(Season.objects.get(year=2023))
        prefetch_related_objects(standings, "driver", "session")
    return standings


def test_season_data_stats_to_driver_standings(driver_standings_2023, old_driver_standings_2023):
    def clean_thing(standing):
        return {
            key: val for key, val in vars(standing).items() if not (key.startswith("_") or key in {"finish_string"})
        }

    driver_standings_2023 = sorted(
        driver_standings_2023, key=lambda x: (x.year, x.round_number, x.session_id, x.driver_id)
    )
    old_driver_standings_2023 = sorted(
        old_driver_standings_2023, key=lambda x: (x.year, x.round_number, x.session_id, x.driver_id)
    )
    driver_standings_2023 = filter(lambda x: x.round_number == 3, driver_standings_2023)
    old_driver_standings_2023 = filter(lambda x: x.round_number == 3, old_driver_standings_2023)

    assert list(map(clean_thing, driver_standings_2023)) == list(map(clean_thing, old_driver_standings_2023))

    # stats_by_driver = season_data.session_datas[0].stats_by_group("DRIVER", "SUM")
    # first = season_data.stats_to_driver_standings(stats_by_driver)[0]
    # print(vars(first))
    # assert (first) == (
    #     DriverChampionship(
    #         driver_id=1,
    #         year=2099,
    #         position=1,
    #         points=6,
    #         win_count=1,
    #         highest_finish=1,
    #         finish_string="",
    #         is_eligible=True,
    #         adjustment_type=ChampionshipAdjustmentType.NONE,
    #     )
    # )
