from collections import Counter

import pytest
from django.db.models import prefetch_related_objects

from jolpica.formula_one.models.managed_views import DriverChampionship

from .. import models as f1
from ..standings import EntryData, Group, SeasonData, SessionData, Stats, update_championship_standings_in_db


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
        session_type=f1.SessionType.RACE,
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
        session_type=f1.SessionType.RACE,
        session_id=0,
        round_id=0,
    )


def test_entry_data_by_group_driver(session_data: SessionData):
    output = session_data.group_data_by(Group.DRIVER)

    assert set(output.keys()) == set([1, 2, 3, 4])

    assert len(output[1]) == 3
    assert len(output[2]) == 1
    assert len(output[3]) == 2
    assert len(output[4]) == 1


def test_entry_data_by_group_team(session_data: SessionData):
    output = session_data.group_data_by(Group.TEAM)

    assert set(output.keys()) == set([101, 102, 103, 104])

    assert len(output[101]) == 3
    assert len(output[102]) == 2
    assert len(output[103]) == 1
    assert len(output[104]) == 1


def test_points_by_group_driver_sum(session_data: SessionData):
    output = session_data.stats_by_group(Group.DRIVER, "SUM")
    clean_output = {key: stat.points for key, stat in output.items()}

    assert clean_output == {1: 3, 2: 2, 3: 6, 4: 0}


def test_points_by_group_team_sum(session_data: SessionData):
    output = session_data.stats_by_group(Group.TEAM, "SUM")
    clean_output = {key: stat.points for key, stat in output.items()}

    assert clean_output == {101: 5, 102: 3, 103: 3, 104: 0}


def test_points_by_group_driver_best(session_data: SessionData):
    output = session_data.stats_by_group(Group.DRIVER, "BEST")
    clean_output = {key: stat.points for key, stat in output.items()}

    assert clean_output == {1: 1, 2: 2, 3: 3, 4: 0}


def test_points_by_group_team_best(session_data: SessionData):
    output = session_data.stats_by_group(Group.TEAM, "BEST")
    clean_output = {key: stat.points for key, stat in output.items()}

    assert clean_output == {101: 3, 102: 2, 103: 3, 104: 0}


def test_position_by_group_driver_sum(session_data: SessionData):
    output = session_data.stats_by_group(Group.DRIVER, "SUM")

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
    output = session_data.stats_by_group(Group.TEAM, "SUM")

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
    output = session_data.stats_by_group(Group.DRIVER, "BEST")

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
    output = session_data.stats_by_group(Group.TEAM, "BEST")

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
        season = f1.Season.objects.get(year=2023)
        season_data = SeasonData.from_season(season)
        standings = season_data.generate_standings()
        prefetch_related_objects(standings, Group.DRIVER, "session")
    return standings


@pytest.mark.parametrize(
    ["adjust_type"],
    [
        ("leave as is",),
        ("delete",),
        ("change",),
    ],
)
@pytest.mark.django_db
def test_update_in_db(django_assert_max_num_queries, adjust_type):
    before = list(DriverChampionship.objects.filter(year=2023).all().order_by("driver_id", "session_id"))

    if adjust_type == "delete":
        DriverChampionship.objects.filter(year=2023).delete()
    elif adjust_type == "change":
        DriverChampionship.objects.filter(year=2023, round__isnull=False).update(points=99)
        DriverChampionship.objects.filter(year=2023, season__isnull=False).delete()

    with django_assert_max_num_queries(7):
        update_championship_standings_in_db({2023})

    after = list(DriverChampionship.objects.filter(year=2023).all().order_by("driver_id", "session_id"))

    assert len(before) == len(after)
    for champ1, champ2 in zip(before, after):
        for field in DriverChampionship._meta.get_fields():
            if field.name != "id":
                assert getattr(champ1, field.name) == getattr(champ2, field.name)


@pytest.mark.django_db
def test_from_season_whole_year(monkeypatch):
    season = f1.Season.objects.get(year=2023)
    monkeypatch.setattr(SessionData, "from_session", lambda *args, **kwargs: None)

    season_data = SeasonData.from_season(season)

    assert season_data.season_year == 2023
    assert len(season_data.session_datas) == 28  # 22 races, 6 sprints sessions in 2023 season


@pytest.mark.django_db
def test_from_season_last_round_has_quali_but_no_race(monkeypatch):
    season = f1.Season.objects.get(year=2023)
    # Removing session entries from a race session should result in no entries in the season data
    f1.SessionEntry.objects.filter(
        session__round__season=season,
        session__round__number=22,
        session__type="R",
    ).delete()
    monkeypatch.setattr(SessionData, "from_session", lambda *args, **kwargs: None)

    season_data = SeasonData.from_season(season)

    assert season_data.season_year == 2023
    assert len(season_data.session_datas) == 27  # 21/22 races, 6 sprints sessions in 2023 season
