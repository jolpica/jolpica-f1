from collections import Counter

import pytest

from ..standings import EntryData, PositionData, SeasonData, SessionData


@pytest.fixture(scope="module")
def entry_datas():
    return [
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


@pytest.fixture(scope="module")
def session_data(entry_datas: list[EntryData]):
    return SessionData(
        round_number=1,
        session_number=5,
        entry_datas=entry_datas,
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
        session_data.group_data_by("akdlf")


def test_points_by_group_driver_sum(session_data: SessionData):
    output = session_data.points_by_group("DRIVER", "SUM")

    assert output == {1: 3, 2: 2, 3: 6, 4: 0}


def test_points_by_group_team_sum(session_data: SessionData):
    output = session_data.points_by_group("TEAM", "SUM")

    assert output == {101: 5, 102: 3, 103: 3, 104: 0}


def test_points_by_group_driver_best(session_data: SessionData):
    output = session_data.points_by_group("DRIVER", "BEST")

    assert output == {1: 1, 2: 2, 3: 3, 4: 0}


def test_points_by_group_team_best(session_data: SessionData):
    output = session_data.points_by_group("TEAM", "BEST")

    assert output == {101: 3, 102: 2, 103: 3, 104: 0}


def test_points_by_group_invalid(session_data: SessionData):
    with pytest.raises(ValueError):
        session_data.points_by_group("invalid", "SUM")
    with pytest.raises(ValueError):
        session_data.points_by_group("DRIVER", "invalid")
    with pytest.raises(ValueError):
        session_data.points_by_group("invalid", "invalid")
    with pytest.raises(ValueError):
        session_data.points_by_group("SUM", "DRIVER")


def test_position_by_group_driver_sum(session_data: SessionData):
    output = session_data.position_by_group("DRIVER", "SUM")

    clean_output = {}
    for key, position_data in output.items():
        assert position_data.unclassified_map == {}
        clean_output[key] = position_data.finish_map

    assert clean_output == {
        1: (Counter([1, 2, 3])),
        2: (Counter([4])),
        3: (Counter([5, 6])),
        4: ({}),
    }
