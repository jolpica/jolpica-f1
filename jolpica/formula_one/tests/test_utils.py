from datetime import timedelta

import pytest

from ..models import ResultsChampionshipScheme, SplitChampionshipScheme
from ..utils import calculate_championship_points, format_timedelta


def year_to_scheme(year: int | str) -> tuple[int, int, int | None]:
    """Return (split scheme, best results, total_rounds) for a given year"""
    match year:
        case 2023:
            return (0, -1, 22)
        case 1991:
            return (0, -1, 99)
        case 1990:
            return (0, 11, 16)
        case 1985:
            return (0, 11, 99)
        case 1980:
            return (3, 5, 14)
        case 1979:
            return (3, 4, 15)
        case 1978:
            return (2, -2, 16)
        case 1977:
            return (2, -2, 17)
        case 1966:
            return (0, 5, 99)
        case 1958:
            return (0, 6, 99)
        case "c1951":
            return (0, 0, 9)
        case "c1950":
            return (0, 0, 99)
    raise NotImplementedError()


@pytest.mark.parametrize(
    ["year", "race_points", "expected"],
    (
        # 1991+ All races are included
        (2023, {}, 0),
        (2023, {5: None}, 0),
        (2023, {1: 25.0, 2: 1, 5: None, 17: 12.5}, 38.5),
        (1991, {22: 0.0}, 0),
        # 1981 - 1990 Best 11 races
        (1990, {1: 1, 2: 5}, 6),
        (1985, {}, 0),
        (1985, {(i + 1): i % 2 + 1 for i in range(20)}, 21),  # 20 alternating scores of 1 and 2
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
        (1978, {1: 1, 2: 1, 3: 1, 6: 5, 7: 1, 8: 1, 11: 5}, 15),
        (1978, {i + 1: 1 for i in range(16)}, 14),
        # 1977 17 rounds
        (1977, {i + 1: 1 for i in range(9)}, 8),
        (1977, {i + 1: 1 for i in range(10)}, 9),
        (1977, {i + 1: 1 for i in range(17)}, 15),
        # 1966 Best 5
        (1966, {1: 0, 2: 3, 3: 9, 4: 9, 5: 9, 6: 9, 7: 0, 8: 0, 9: 6}, 42),
        # 1958 Best 6
        (1958, {1: 4, 3: 2, 5: 7, 7: 7, 9: 7, 10: 6, 11: 6, 6: 9}, 42),
        # Constructor championship before 1958 (not available)
        ("c1951", {i + 1: 1 for i in range(15)}, None),
        ("c1950", {}, None),
    ),
)
def test_calculate_championship_points(year, race_points, expected):
    assert calculate_championship_points(race_points, *year_to_scheme(year)) == expected


@pytest.mark.parametrize(
    ["race_points", "split", "results", "total_rounds"],
    (
        # Invalid round numbers
        ({0: 5}, 0, 5, 9),
        ({-5: 1.0}, 0, 5, 9),
        # no total rounds for split schema
        ({1: 1}, 1, 5, 99),
        # Invalid split type
        ({1: 1}, 99, 5, 99),
        # total rounds less than or equal to 0
        ({1: 1}, 1, 5, 0),
    ),
)
def test_calculate_championship_points_error(race_points, split, results, total_rounds):
    with pytest.raises(ValueError):
        calculate_championship_points(race_points, split, results, total_rounds)


def test_calculate_championship_points_all_variations():
    for split in SplitChampionshipScheme:
        for best_results in ResultsChampionshipScheme:
            for total_rounds in [1, 17]:
                assert calculate_championship_points({1: 4, 9: 6}, split, best_results, total_rounds) in (None, 10, 0)


@pytest.mark.parametrize(
    ["delta", "expected"],
    [
        (timedelta(seconds=100, milliseconds=100), "1:40.100"),
        (timedelta(seconds=59, milliseconds=70), "59.070"),
        (timedelta(seconds=90, milliseconds=0), "1:30.000"),
    ],
)
def test_format_timedelta_expected(delta, expected):
    assert format_timedelta(delta) == expected
