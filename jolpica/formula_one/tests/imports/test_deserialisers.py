from datetime import timedelta

import pytest

from jolpica.formula_one import models as f1
from jolpica.formula_one.importer.deserialisers import (
    LapDeserialiser,
    PitStopDeserialiser,
    RoundEntryDeserialiser,
    SessionEntryDeserialiser,
)


@pytest.mark.parametrize(
    ["input_data"],
    [
        (
            {
                "object_type": "RoundEntry",
                "foreign_keys": {
                    "year": 2023,
                    "round": 22,
                    "team_name": "MoneyGram Haas F1 Team",
                    "driver_name": "Oliver Bearman",
                },
                "objects": [{"car_number": 50}],
            },
        ),
        (
            {
                "object_type": "RoundEntry",
                "foreign_keys": {
                    "year": 2023,
                    "round": 22,
                    "team_name": "BWT Alpine F1 Team",
                    "driver_name": "Jack Doohan",
                },
                "objects": [{"car_number": 61}],
            },
        ),
        (
            {
                "object_type": "RoundEntry",
                "foreign_keys": {
                    "year": 2023,
                    "round": 22,
                    "team_name": "Williams Racing",
                    "driver_name": "Zak O'Sullivan",
                },
                "objects": [{"car_number": 45}],
            },
        ),
    ],
)
@pytest.mark.django_db
def test_round_entry_deserialiser_error(input_data):
    result = RoundEntryDeserialiser().deserialise(input_data)

    assert not result.success
    assert "ForeignKeyDeserialisationError" in result.errors[0]


@pytest.mark.parametrize(
    ["entry_data"],
    [
        (
            {
                "object_type": "RoundEntry",
                "foreign_keys": {
                    "year": 2023,
                    "round": 22,
                    "team_name": "Oracle Red Bull Racing",
                    "driver_name": "Max Verstappen",
                },
                "objects": [{"car_number": 1}],
            },
        ),
        (
            {
                "object_type": "RoundEntry",
                "foreign_keys": {
                    "year": 2023,
                    "round": 22,
                    "team_name": "Oracle Red Bull Racing",
                    "driver_name": "Sergio Perez",
                },
                "objects": [{"car_number": 11}],
            },
        ),
        (
            {
                "object_type": "RoundEntry",
                "foreign_keys": {
                    "year": 2023,
                    "round": 22,
                    "team_name": "Mercedes-AMG PETRONAS F1 Team",
                    "driver_name": "Lewis Hamilton",
                },
                "objects": [{"car_number": 44}],
            },
        ),
    ],
)
@pytest.mark.django_db
def test_round_entry_deserialiser_success(entry_data):
    result = RoundEntryDeserialiser().deserialise(entry_data)

    assert result.success
    assert len(result.instances) == 1

    for model_import in result.instances.values():
        assert len(model_import) == 1, "Exactly one model should be created"
        for model in model_import:
            assert f1.RoundEntry.objects.get(round_id=model.round_id, team_driver_id=model.team_driver_id)


@pytest.fixture
def session_entry_race_data():
    return {
        "object_type": "SessionEntry",
        "foreign_keys": {"year": 2023, "round": 18, "session": "R", "car_number": 1},
        "objects": [
            {
                "position": 1,
                "is_classified": True,
                "status": 0,
                "points": 25.0,
                "time": timedelta(seconds=5721, microseconds=362000),
                "laps_completed": 56,
            }
        ],
    }


@pytest.mark.django_db
def test_deserialise_session_entries(session_entry_race_data):
    result = SessionEntryDeserialiser().deserialise(session_entry_race_data)

    assert result.success
    assert len(result.instances) == 1

    for model_import in result.instances.values():
        assert len(model_import) == 1, "Exactly one model should be created"
        for model in model_import:
            assert f1.SessionEntry.objects.get(session_id=model.session_id, round_entry_id=model.round_entry_id)


@pytest.fixture
def lap_data():
    return {
        "object_type": "Lap",
        "foreign_keys": {"year": 2023, "round": 18, "session": "R", "car_number": 1},
        "objects": [
            {"number": 1, "position": 1, "time": timedelta(minutes=1, seconds=30), "average_speed": 200.0},
            {"number": 2, "position": 1, "time": timedelta(minutes=1, seconds=29), "average_speed": 201.0},
        ],
    }


@pytest.mark.django_db
def test_deserialise_laps(lap_data):
    result = LapDeserialiser().deserialise(lap_data)

    assert result.success
    assert len(result.instances) == 1

    for laps in result.instances.values():
        assert len(laps) == 2, "Exactly two laps should be created"
        for lap in laps:
            f1.Lap.objects.get(session_entry_id=lap.session_entry_id, number=lap.number)


@pytest.fixture
def pit_stop_data():
    return {
        "object_type": "pit_stop",
        "foreign_keys": {"year": 2023, "round": 18, "session": "R", "car_number": 1, "lap": 1},
        "objects": [
            {"number": 1, "duration": timedelta(seconds=25), "local_timestamp": "23:45:32"},
            {"number": 2, "duration": timedelta(seconds=24), "local_timestamp": "12:34:56"},
        ],
    }


@pytest.mark.django_db
def test_deserialise_pit_stops(pit_stop_data):
    result = PitStopDeserialiser().deserialise(pit_stop_data)

    assert result.success
    assert len(result.instances) == 1

    for laps in result.instances.values():
        assert len(laps) == 2, "Exactly two pit stops should be created"
        for lap in laps:
            f1.PitStop.objects.get(session_entry_id=lap.session_entry_id, number=lap.number)


@pytest.mark.parametrize(
    ["deserialiser", "foreign_keys", "object", "error"],
    [
        (
            SessionEntryDeserialiser,
            {"year": 2023, "round": 22, "session": "R", "car_number": 1},
            {"invalid_key": "value"},
            ("type", "extra_forbidden"),
        ),
        (SessionEntryDeserialiser, {"year": 2023, "round": 99, "session": "R", "car_number": 1}, {}, "Session"),
        (SessionEntryDeserialiser, {"year": 2023, "round": 22, "session": "R", "car_number": 99}, {}, "RoundEntry"),
        (LapDeserialiser, {"year": 2023, "round": 99, "session": "R", "car_number": 1}, {}, "SessionEntry"),
        (
            PitStopDeserialiser,
            {"year": 2023, "round": 99, "session": "R", "car_number": 1, "lap": 1},
            {},
            "SessionEntry",
        ),
    ],
)
@pytest.mark.django_db
def test_deserialiser_invalid_data(deserialiser, foreign_keys, object, error):
    data = {
        "object_type": deserialiser.MODEL.__name__,
        "foreign_keys": foreign_keys,
        "objects": [object],
    }
    deserialiser = deserialiser()
    result = deserialiser.deserialise(data)

    assert not result.success

    assert len(result.errors) == 1
    if isinstance(error, tuple):
        assert result.errors[0][error[0]] == error[1]
    else:
        assert error in result.errors[0]


@pytest.mark.parametrize(
    ["year", "round", "driver", "team", "object", "error"],
    [
        (2023, 22, "Max Verstappen", "invalid", {"car_number": 1}, "(unmapped team name)"),
        (2023, 22, "Max Verstappen", "invalid", {"car_number": 1}, "(team miss)"),
        (2023, 22, "Invalid Driver", "Oracle Red Bull Racing", {"car_number": 1}, "(driver miss)"),
        (2009, 1, "Sébastien AMBIGUOUS", "Toro Rosso", {}, "Multiple TeamDrivers found"),
    ],
)
@pytest.mark.django_db
def test_round_entry_deserialiser_get_team_driver_error(year, round, driver, team, object, error):
    data = {
        "object_type": "RoundEntry",
        "foreign_keys": {
            "year": year,
            "round": round,
            "driver_name": driver,
            "team_name": team,
        },
        "objects": [object],
    }
    deserialiser = RoundEntryDeserialiser()
    result = deserialiser.deserialise(data)

    assert not result.success
    assert "TeamDriver not found" in result.errors[0] or "Multiple TeamDrivers found" in result.errors[0]
    assert error in result.errors[0]
