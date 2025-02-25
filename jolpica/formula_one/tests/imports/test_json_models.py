from datetime import timedelta

import pytest
from pydantic import ValidationError

from jolpica.formula_one.importer.json_models import mutate_timedelta_from_dict


@pytest.mark.parametrize(
    ["input_data", "expected_output"],
    [
        (
            {"_type": "timedelta", "days": 1, "hours": 2, "minutes": 30, "seconds": 45},
            timedelta(days=1, hours=2, minutes=30, seconds=45),
        ),
        (
            {"_type": "timedelta", "milliseconds": 1000},
            timedelta(microseconds=1000000),
        ),
        (
            {"_type": "timedelta", "seconds": 3600},
            timedelta(seconds=3600),
        ),
        (
            timedelta(seconds=3600),
            timedelta(seconds=3600),
        ),
        (
            "invalid",
            "invalid",
        ),
        (
            {"_type": "nottimedelta", "milliseconds": 1000},
            {"_type": "nottimedelta", "milliseconds": 1000},
        ),
    ],
)
def test_mutate_timedelta_from_dict(input_data, expected_output):
    result = mutate_timedelta_from_dict(input_data)
    assert result == expected_output


@pytest.mark.parametrize(
    ["input_data", "expected_error"],
    [
        (
            {"_type": "timedelta", "fentoseconds": 1000},
            "Extra inputs are not permitted",
        ),
    ],
)
def test_mutate_timedelta_from_dict_error(input_data, expected_error):
    with pytest.raises(ValidationError, match=expected_error):
        mutate_timedelta_from_dict(input_data)
