import pytest

from ..utils import races_to_championship_points


@pytest.mark.parametrize(
    ["year", "race_points", "expected"],
    (
        # 1991+ All races are included
        (2023, {}, 0),
        (2023, {5: None}, 0),
        (2023, {1: 25.0, 2: 1, 5: None, 17: 12.5}, 38.5),
        (1991, {22: 0.0}, 0),
        # 1981 - 1990 Best 11 races
        (1985, {}, 0),
        (1990, {1: 1, 2: 5}, 6),
        (1981, {(i + 1): i % 2 + 1 for i in range(20)}, 21),  # 20 alternating scores of 1 and 2
        # 1980 Best 5 from both first and last 7
        (1980, {}, 0),
        (1980, {1: 1, 2: 1, 3: 1, 4: 1, 5: 1, 6: 5, 7: 1, 8: 1}, 10),
        (1980, {i + 1: 1 for i in range(7)}, 5),
        (1980, {i + 1: 1 for i in range(8)}, 6),
        (1980, {i + 8: 1 for i in range(8)}, 5),
        (1980, {i + 7: 1 for i in range(7)}, 6),
        # 1979 Best 4 from first 7 and last 8
        (1979, {1: 1, 2: 1, 3: 1, 4: 1, 5: 1, 6: 5, 7: 1, 8: 1}, 9),
        (1979, {i + 1: 1 for i in range(8)}, 5),
        # 1967 - 1978, best n-1 of each half of season
        # 1978, 1976 16 rounds
        (1978, {1: 1, 2: 1, 3: 1, 4: 1, 5: 1, 6: 5, 7: 1, 8: 1}, 11),
        (1976, {1: 1, 2: 1, 3: 1, 6: 5, 7: 1, 8: 1, 11: 5}, 15),
        (1976, {i + 1: 1 for i in range(16)}, 14),
        # 1977 17 rounds
        (1977, {i + 1: 1 for i in range(9)}, 8),  
        (1977, {i + 1: 1 for i in range(10)}, 9),  
        (1977, {i + 1: 1 for i in range(17)}, 15),
        # 1966 Best 5
        (1966, {1: 0, 2: 3,	3:9,4: 9, 5: 9, 6: 9, 7:0,	8:0,9:6}, 42),
        # 1958 Best 6
        (1958, {1: 4, 3:2, 5:7, 7:7, 9:7,10:6,11:6, 6:9}, 42),
    ),
)
def test_races_to_championship_points(year, race_points, expected):
    assert races_to_championship_points(year, race_points) == expected

@pytest.mark.parametrize(
    ["year", "race_points", "expected"],
    (
        (1978, {i + 1: 1 for i in range(16)}, 14),
        (1979, {i + 1: 1 for i in range(15)}, 15),
        (1980, {i + 1: 1 for i in range(15)}, 15),
        (1985, {i + 1: 1 for i in range(15)}, 15),
    ),
)
def test_races_to_championship_points_constructors(year, race_points, expected):
    assert races_to_championship_points(year, race_points, True) == expected

@pytest.mark.parametrize(
    ["year", "race_points", "is_constructors"],
    (
        (2023, {0: 5}, False),
        (1950, {-5: 1.0}, False),
        (1949, {1: 1}, False),
        (1957, {1: 1}, True),
    ),
)
def test_races_to_championship_points_error(year, race_points, is_constructors):
    with pytest.raises(ValueError):
        races_to_championship_points(year, race_points, is_constructors)

def test_races_to_championship_points_all_years():
    for year in range(1950, 2030):
        assert races_to_championship_points(year, {1: 4, 6: 6}) == 10
    for year in range(1958, 2030):
        assert races_to_championship_points(year, {1: 4, 6: 6}, True) == 10