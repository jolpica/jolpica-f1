import json
from pathlib import Path

import pytest

from jolpica.formula_one.importer.deserialisers import (
    DeserialiserFactory,
    ModelLookupCache,
)


# Successful Deserialisation
@pytest.mark.parametrize(
    ["entry_data"],
    [
        pytest.param(
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
            id="create round entry with car number",
        ),
        pytest.param(
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
            id="Can make round entry with no car number",
        ),
        pytest.param(
            {
                "object_type": "SessionEntry",
                "foreign_keys": {"year": 2023, "round": 18, "session": "R", "car_number": 1},
                "objects": [
                    {
                        "position": 1,
                        "is_classified": True,
                        "status": 0,
                        "points": 25.0,
                        "time": {"_type": "timedelta", "seconds": 5721, "milliseconds": 362},
                        "laps_completed": 56,
                    }
                ],
            },
            id="Session Entry",
        ),
        pytest.param(
            {
                "object_type": "Lap",
                "foreign_keys": {"year": 2023, "round": 18, "session": "R", "car_number": 1},
                "objects": [
                    {
                        "number": 1,
                        "position": 1,
                        "time": {"_type": "timedelta", "minutes": 1, "seconds": 30},
                        "average_speed": 200.0,
                    },
                    {
                        "number": 2,
                        "position": 1,
                        "time": {"_type": "timedelta", "minutes": 1, "seconds": 29},
                        "average_speed": 201.0,
                    },
                ],
            },
            id="Lap",
        ),
        pytest.param(
            {
                "object_type": "PitStop",
                "foreign_keys": {"year": 2023, "round": 18, "session": "R", "car_number": 1, "lap": 1},
                "objects": [
                    {
                        "number": 1,
                        "duration": {"_type": "timedelta", "seconds": 25},
                        "local_timestamp": "23:45:32",
                    },
                    {
                        "number": 2,
                        "duration": {"_type": "timedelta", "seconds": 24},
                        "local_timestamp": "12:34:56",
                    },
                ],
            },
            id="Pit Stop",
        ),
        pytest.param(
            {
                "object_type": "Driver",
                "foreign_keys": {},
                "objects": [
                    {
                        "reference": "max_verstappen",
                        "forename": "Max",
                        "surname": "Verstappen",
                        "date_of_birth": "2025-05-05",
                    },
                ],
            },
            id="Driver (with reference)",
        ),
        pytest.param(
            {
                "object_type": "Driver",
                "foreign_keys": {},
                "objects": [
                    {"forename": "Max", "surname": "Verstappen", "date_of_birth": "2025-05-05"},
                ],
            },
            id="Driver (no reference)",
        ),
        pytest.param(
            {
                "object_type": "Team",
                "foreign_keys": {},
                "objects": [
                    {"reference": "red_bull", "name": "Red Bull"},
                ],
            },
            id="Team",
        ),
        pytest.param(
            {
                "object_type": "TeamDriver",
                "foreign_keys": {"year": 2023, "team_reference": "red_bull", "driver_reference": "max_verstappen"},
                "objects": [
                    {"role": 0},
                ],
            },
            id="Team",
        ),
    ],
)
@pytest.mark.django_db
def test_deserialise_object_success(entry_data):
    factory = DeserialiserFactory()
    deserialiser = factory.get_deserialiser(entry_data["object_type"])
    result = deserialiser.deserialise(entry_data)

    assert result.success
    assert len(result.instances) == 1, "Only 1 type of model import should be used"

    for model_import in result.instances.values():
        assert len(model_import) == len(entry_data["objects"]), "Same number of models as objects should be created"


# Invalid deserialisation
@pytest.mark.parametrize(
    ["object_type", "foreign_keys", "object", "error"],
    [
        (
            "TeamDriver",
            {"year": 2023, "team_reference": "red_bull", "driver_reference": "max_verstappen"},
            {"role": 123},
            ("type", "enum"),
        ),
        (
            "RoundEntry",
            {"year": 2023, "round": 22, "driver_reference": "hamilton", "team_reference": "mercedes"},
            {"extra_key": "1"},
            ("type", "extra_forbidden"),
        ),
        (
            "RoundEntry",
            {"year": 2023, "round": 22, "driver_reference": "None", "team_reference": "mercedes"},
            {},
            "TeamDriver",
        ),
        (
            "SessionEntry",
            {"year": 2023, "round": 22, "session": "R", "car_number": 1},
            {"invalid_key": "value"},
            ("type", "extra_forbidden"),
        ),
        ("SessionEntry", {"year": 2023, "round": 99, "session": "R", "car_number": 1}, {}, "Session"),
        ("SessionEntry", {"year": 2023, "round": 22, "session": "R", "car_number": 99}, {}, "RoundEntry"),
        ("Lap", {"year": 2023, "round": 99, "session": "R", "car_number": 1}, {}, "SessionEntry"),
        (
            "PitStop",
            {"year": 2023, "round": 99, "session": "R", "car_number": 1, "lap": 1},
            {},
            "SessionEntry",
        ),
        (
            "RoundEntry",
            {"year": 2023, "round": 22, "team_reference": "haas", "driver_reference": "bearman"},
            {"car_number": 50},
            "TeamDriver",
        ),
        (
            "RoundEntry",
            {
                "year": 2023,
                "round": 22,
                "team_reference": "alpine",
                "driver_reference": "doohan",
            },
            {"car_number": 61},
            "TeamDriver",
        ),
        (
            "RoundEntry",
            {
                "year": 2023,
                "round": 22,
                "team_reference": "williams",
                "driver_reference": "osullivan",
            },
            {"car_number": 45},
            "TeamDriver",
        ),
    ],
)
@pytest.mark.django_db
def test_deserialiser_invalid_data(object_type, foreign_keys, object, error):
    factory = DeserialiserFactory()
    deserialiser = factory.get_deserialiser(object_type)
    data = {
        "object_type": object_type,
        "foreign_keys": foreign_keys,
        "objects": [object],
    }
    result = deserialiser.deserialise(data)

    assert not result.success

    assert len(result.errors) == 1
    if isinstance(error, tuple):
        assert result.errors[0][error[0]] == error[1]
    else:
        assert error in result.errors[0]


def test_factory_deserialisers_require_at_least_one_object():
    factory = DeserialiserFactory()
    for object_type in DeserialiserFactory.deserialisers.keys():
        deserialiser = factory.get_deserialiser(object_type)
        data = {"object_type": object_type, "foreign_keys": {}, "objects": []}
        result = deserialiser.deserialise(data)

        assert "too_short" in [
            error["type"] for error in result.errors if "objects" in error["loc"]
        ], "Not all deserialisers requite at least 1 object"


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
            DeserialiserFactory().get_deserialiser(entry["object_type"]).deserialise(entry)

    cached_factory = DeserialiserFactory()
    with django_assert_max_num_queries(999) as cached_queries:
        for entry in quali_session_entries_2023_18[10:20]:
            cached_factory.get_deserialiser(entry["object_type"]).deserialise(entry)

    assert len(baseline_queries.captured_queries) > len(cached_queries.captured_queries)
    assert len(cached_queries.captured_queries) < len(baseline_queries.captured_queries)


@pytest.mark.django_db
def test_deserialiser_cache_across_deserialisers(
    django_assert_max_num_queries, quali_session_entries_2023_18, quali_laps_2023_18
):
    cache = ModelLookupCache()
    factory = DeserialiserFactory(cache=cache)
    for entry in quali_session_entries_2023_18:
        assert factory.get_deserialiser(entry["object_type"]).deserialise(entry).success

    with django_assert_max_num_queries(999) as cached_queries:
        for entry in quali_laps_2023_18:
            assert factory.get_deserialiser(entry["object_type"]).deserialise(entry).success

    assert len(cached_queries.captured_queries) < len(quali_laps_2023_18)
