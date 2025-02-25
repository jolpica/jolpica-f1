import json
from datetime import timedelta
from pathlib import Path

import pytest

from jolpica.formula_one import models as f1
from jolpica.formula_one.importer.deserialisers import (
    LapDeserialiser,
    ModelLookupCache,
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
                    "team_reference": "haas",
                    "driver_reference": "bearman",
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
                    "team_reference": "alpine",
                    "driver_reference": "doohan",
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
                    "team_reference": "williams",
                    "driver_reference": "osullivan",
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
    assert "TeamDriver" in result.errors[0]


@pytest.mark.parametrize(
    ["entry_data"],
    [
        (
            {
                "object_type": "RoundEntry",
                "foreign_keys": {
                    "year": 2023,
                    "round": 22,
                    "team_reference": "red_bull",
                    "driver_reference": "max_verstappen",
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
                    "team_reference": "red_bull",
                    "driver_reference": "perez",
                },
                "objects": [{"car_number": 11}],
            },
        ),
        (  # Can make round entry with no car number
            {
                "object_type": "RoundEntry",
                "foreign_keys": {
                    "year": 2023,
                    "round": 22,
                    "team_reference": "mercedes",
                    "driver_reference": "hamilton",
                },
                "objects": [{}],
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
            RoundEntryDeserialiser,
            {"year": 2023, "round": 22, "driver_reference": "hamilton", "team_reference": "mercedes"},
            {"extra_key": "1"},
            ("type", "extra_forbidden"),
        ),
        (
            RoundEntryDeserialiser,
            {"year": 2023, "round": 22, "driver_reference": "None", "team_reference": "mercedes"},
            {},
            "TeamDriver",
        ),
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


@pytest.fixture
def quali_session_entries_2023_18():
    with open(Path(__file__).parent.parent / "fixtures/2023_18_quali_classification.json") as f:
        return json.load(f)


@pytest.fixture
def quali_laps_2023_18():
    with open(Path(__file__).parent.parent / "fixtures/2023_18_quali_lap_times.json") as f:
        return json.load(f)


@pytest.mark.django_db
def test_deserialiser_uses_cache(django_assert_max_num_queries, quali_session_entries_2023_18):
    with django_assert_max_num_queries(999) as baseline_queries:
        for entry in quali_session_entries_2023_18[:10]:
            SessionEntryDeserialiser().deserialise(entry)

    cached_deserialiser = SessionEntryDeserialiser()
    with django_assert_max_num_queries(999) as cached_queries:
        for entry in quali_session_entries_2023_18[10:20]:
            cached_deserialiser.deserialise(entry)

    assert len(baseline_queries.captured_queries) > len(cached_queries.captured_queries)
    assert len(cached_queries.captured_queries) == 11


@pytest.mark.django_db
def test_deserialiser_cache_across_deserialisers(
    django_assert_max_num_queries, quali_session_entries_2023_18, quali_laps_2023_18
):
    cache = ModelLookupCache()
    cached_se_deserialiser = SessionEntryDeserialiser(cache=cache)
    for entry in quali_session_entries_2023_18:
        assert cached_se_deserialiser.deserialise(entry).success

    cached_l_deserialiser = LapDeserialiser(cache=cache)
    with django_assert_max_num_queries(999) as cached_queries:
        for entry in quali_laps_2023_18:
            assert cached_l_deserialiser.deserialise(entry).success

    assert len(cached_queries.captured_queries) == 0
