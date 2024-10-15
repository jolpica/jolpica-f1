import pickle
from datetime import timedelta
from pathlib import Path

import pytest

from jolpica.formula_one import models as f1
from jolpica.formula_one.imports.deserialisers import (
    LapDeserialiser,
    ModelDeserialiser,
    RoundEntryDeserialiser,
    SessionEntryDeserialiser,
    PitStopDeserialiser
)


@pytest.fixture
def entry_list_data():
    return {
        "object_type": "round_entry",
        "foreign_keys": {"year": 2023, "round": 22},
        "objects": [
            {"car_number": 1, "name": "Max Verstappen", "team": "Oracle Red Bull Racing"},
            {"car_number": 11, "name": "Sergio Perez", "team": "Oracle Red Bull Racing"},
            {"car_number": 16, "name": "Charles Leclerc", "team": "Scuderia Ferrari"},
            {"car_number": 55, "name": "Carlos Sainz", "team": "Scuderia Ferrari"},
            {"car_number": 63, "name": "George Russell", "team": "Mercedes-AMG PETRONAS F1 Team"},
            {"car_number": 44, "name": "Lewis Hamilton", "team": "Mercedes-AMG PETRONAS F1 Team"},
            {"car_number": 31, "name": "Esteban Ocon", "team": "BWT Alpine F1 Team"},
            {"car_number": 10, "name": "Pierre Gasly", "team": "BWT Alpine F1 Team"},
            {"car_number": 81, "name": "Oscar Piastri", "team": "McLaren F1 Team"},
            {"car_number": 4, "name": "Lando Norris", "team": "McLaren F1 Team"},
            {"car_number": 77, "name": "Valtteri Bottas", "team": "Alfa Romeo F1 Team Stake"},
            {"car_number": 24, "name": "Zhou Guanyu", "team": "Alfa Romeo F1 Team Stake"},
            {"car_number": 18, "name": "Lance Stroll", "team": "Aston Martin Aramco Cognizant F1 Team"},
            {"car_number": 14, "name": "Fernando Alonso", "team": "Aston Martin Aramco Cognizant F1 Team"},
            {"car_number": 20, "name": "Kevin Magnussen", "team": "MoneyGram Haas F1 Team"},
            {"car_number": 27, "name": "Nico Hulkenberg", "team": "MoneyGram Haas F1 Team"},
            {"car_number": 3, "name": "Daniel Ricciardo", "team": "Scuderia AlphaTauri"},
            {"car_number": 22, "name": "Yuki Tsunoda", "team": "Scuderia AlphaTauri"},
            {"car_number": 23, "name": "Alexander Albon", "team": "Williams Racing"},
            {"car_number": 2, "name": "Logan Sargeant", "team": "Williams Racing"},
            {"car_number": 39, "name": "Robert Shwartzman", "team": "Scuderia Ferrari"},
            {"car_number": 34, "name": "Felipe Drugovich", "team": "Aston Martin Aramco Cognizant F1 Team"},
            {"car_number": 50, "name": "Oliver Bearman", "team": "MoneyGram Haas F1 Team"},
            {"car_number": 61, "name": "Jack Doohan", "team": "BWT Alpine F1 Team"},
            {"car_number": 29, "name": "Patricio O'Ward", "team": "McLaren F1 Team"},
            {"car_number": 42, "name": "Frederik Vesti", "team": "Mercedes-AMG PETRONAS F1 Team"},
            {"car_number": 36, "name": "Jake Dennis", "team": "Oracle Red Bull Racing"},
            {"car_number": 37, "name": "Isack Hadjar", "team": "Oracle Red Bull Racing"},
            {"car_number": 98, "name": "Theo Pourchaire", "team": "Alfa Romeo F1 Team Stake"},
            {"car_number": 45, "name": "Zak O'Sullivan", "team": "Williams Racing"},
        ],
    }


@pytest.mark.django_db
def test_deserialise_round_entries(entry_list_data):
    deserialised = RoundEntryDeserialiser().deserialise(entry_list_data)

    assert len(deserialised.models) + len(deserialised.failed_objects) == len(entry_list_data["objects"])
    assert len(deserialised.models) == 20
    assert len(deserialised.failed_objects) == 10

    new_models = 0
    existing_models = 0
    for model in deserialised.models:
        try:
            f1.RoundEntry.objects.get(round_id=model.round_id, team_driver_id=model.team_driver_id)
        except f1.RoundEntry.DoesNotExist:
            new_models += 1
        else:
            existing_models += 1

    assert new_models == 0
    assert existing_models == len(deserialised.models)


@pytest.mark.parametrize(
    ["year", "round", "object", "error"],
    [
        (2023, 22, {"car_number": 1, "name": "Max Verstappen", "team": "invalid"}, "(unmapped team name)"),
        (2023, 22, {"car_number": 1, "name": "Max Verstappen", "team": "invalid"}, "(team miss)"),
        (2023, 22, {"car_number": 1, "name": "Invalid Driver", "team": "Oracle Red Bull Racing"}, "(driver miss)"),
    ],
)
@pytest.mark.django_db
def test_round_entry_deserialiser_invalid_team(year, round, object, error):
    data = {
        "object_type": "round_entry",
        "foreign_keys": {"year": year, "round": round},
        "objects": [object],
    }
    deserialiser = RoundEntryDeserialiser()
    result = deserialiser.deserialise(data)

    assert len(result.failed_objects) == 1
    assert "TeamDriver not found" in result.failed_objects[0][1]
    assert error in result.failed_objects[0][1]


@pytest.mark.django_db
def test_deserialise_laps():
    with open(Path(__file__).parent.parent / "fixtures/laps.pkl", "rb") as f:
        objects = pickle.load(f)

    laps = ModelDeserialiser().create_from_dicts(objects)

    new_lap_num = 0
    existing_laps = 0
    for lap in laps:
        try:
            f1.Lap.objects.get(session_entry=lap.session_entry, time=lap.time, number=lap.number)
        except f1.Lap.DoesNotExist:
            new_lap_num += 1
        else:
            existing_laps += 1

    num_objects = sum([len(items["objects"]) for items in objects])
    assert num_objects == len(laps)

    assert new_lap_num == 0
    assert existing_laps == len(laps)


@pytest.mark.django_db
def test_deserialise_fastest_laps():
    with open(Path(__file__).parent.parent / "fixtures/fastest_laps.pkl", "rb") as f:
        objects = pickle.load(f)

    # TODO: REMOVE BEFORE MERGE, TEMP DATA FIX
    for item in objects:
        for obj in item["objects"]:
            obj["is_entry_fastest_lap"] = True

    laps = ModelDeserialiser().create_from_dicts(objects)

    new_lap_num = 0
    existing_laps = 0
    for lap in laps:
        try:
            f1.Lap.objects.get(session_entry=lap.session_entry, is_entry_fastest_lap=True)
        except f1.Lap.DoesNotExist:
            new_lap_num += 1
        else:
            existing_laps += 1

    num_objects = sum([len(items["objects"]) for items in objects])
    assert num_objects == len(laps)

    assert new_lap_num == 0
    assert existing_laps == len(laps)


@pytest.fixture
def session_entry_race_data():
    return {
        "object_type": "classification",
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
    deserialised = SessionEntryDeserialiser().deserialise(session_entry_race_data)

    assert len(deserialised.models) + len(deserialised.failed_objects) == len(session_entry_race_data["objects"])
    assert len(deserialised.models) == 1
    assert len(deserialised.failed_objects) == 0

    new_models = 0
    existing_models = 0
    for model in deserialised.models:
        try:
            f1.SessionEntry.objects.get(session_id=model.session_id, round_entry_id=model.round_entry_id)
        except f1.SessionEntry.DoesNotExist:
            new_models += 1
        else:
            existing_models += 1

    assert new_models == 0
    assert existing_models == len(deserialised.models)


@pytest.mark.parametrize(
    ["year", "round", "session", "car_number", "object", "error"],
    [
        (2023, 22, "R", 1, {"invalid_key": "value"}, "Invalid key: invalid_key"),
        (2023, 99, "R", 1, {}, "Session matching query does not exist"),
        (2023, 22, "R", 99, {}, "RoundEntry matching query does not exist"),
    ],
)
@pytest.mark.django_db
def test_session_entry_deserialiser_invalid_data(year, round, session, car_number, object, error):
    data = {
        "object_type": "session_entry",
        "foreign_keys": {"year": year, "round": round, "session": session, "car_number": car_number},
        "objects": [object],
    }
    deserialiser = SessionEntryDeserialiser()
    result = deserialiser.deserialise(data)

    assert len(result.failed_objects) == 1
    assert error in result.failed_objects[0][1]


@pytest.fixture
def lap_data():
    return {
        "object_type": "lap",
        "foreign_keys": {"year": 2023, "round": 18, "session": "R", "car_number": 1},
        "objects": [
            {"number": 1, "position": 1, "time": timedelta(minutes=1, seconds=30), "average_speed": 200.0},
            {"number": 2, "position": 1, "time": timedelta(minutes=1, seconds=29), "average_speed": 201.0},
        ],
    }


@pytest.mark.django_db
def test_deserialise_laps(lap_data):
    deserialised = LapDeserialiser().deserialise(lap_data)

    assert len(deserialised.models) + len(deserialised.failed_objects) == len(lap_data["objects"])
    assert len(deserialised.models) == 2
    assert len(deserialised.failed_objects) == 0

    new_laps = 0
    existing_laps = 0
    for lap in deserialised.models:
        try:
            f1.Lap.objects.get(session_entry_id=lap.session_entry_id, number=lap.number)
        except f1.Lap.DoesNotExist:
            new_laps += 1
        else:
            existing_laps += 1

    assert new_laps == 0
    assert existing_laps == len(deserialised.models)


@pytest.mark.parametrize(
    ["year", "round", "session", "car_number", "object", "error"],
    [
        (2023, 18, "R", 1, {"invalid_key": "value"}, "Invalid key: invalid_key"),
        (
            2023,
            99,
            "R",
            1,
            {},
            "SessionEntry matching query does not exist",
        ),
    ],
)
@pytest.mark.django_db
def test_lap_deserialiser_invalid_data(year, round, session, car_number, object, error):
    data = {
        "object_type": "lap",
        "foreign_keys": {"year": year, "round": round, "session": session, "car_number": car_number},
        "objects": [object],
    }
    deserialiser = LapDeserialiser()
    result = deserialiser.deserialise(data)

    assert len(result.failed_objects) == 1
    assert error in result.failed_objects[0][1]


@pytest.fixture
def pit_stop_data():
    return {
        "object_type": "pit_stop",
        "foreign_keys": {"year": 2023, "round": 18, "session": "R", "car_number": 1},
        "objects": [
            {"number": 1, "duration": timedelta(seconds=25), "local_timestamp": timedelta(minutes=30)},
            {"number": 2, "duration": timedelta(seconds=24), "local_timestamp": timedelta(minutes=60)},
        ],
    }


@pytest.mark.django_db
def test_deserialise_pit_stops(pit_stop_data):
    deserialised = PitStopDeserialiser().deserialise(pit_stop_data)

    assert len(deserialised.models) + len(deserialised.failed_objects) == len(pit_stop_data["objects"])
    assert len(deserialised.models) == 2
    assert len(deserialised.failed_objects) == 0

    new_pit_stops = 0
    existing_pit_stops = 0
    for pit_stop in deserialised.models:
        try:
            f1.PitStop.objects.get(session_entry_id=pit_stop.session_entry_id, number=pit_stop.number)
        except f1.PitStop.DoesNotExist:
            new_pit_stops += 1
        else:
            existing_pit_stops += 1

    assert new_pit_stops == 0
    assert existing_pit_stops == len(deserialised.models)


@pytest.mark.parametrize(
    ["year", "round", "session", "car_number", "object", "error"],
    [
        (2023, 18, "R", 1, {"invalid_key": "value"}, "Invalid key: invalid_key"),
        (2023, 99, "R", 1, {}, "SessionEntry matching query does not exist"),
    ],
)
@pytest.mark.django_db
def test_pit_stop_deserialiser_invalid_data(year, round, session, car_number, object, error):
    data = {
        "object_type": "pit_stop",
        "foreign_keys": {"year": year, "round": round, "session": session, "car_number": car_number},
        "objects": [object],
    }
    deserialiser = PitStopDeserialiser()
    result = deserialiser.deserialise(data)

    assert len(result.failed_objects) == 1
    assert error in result.failed_objects[0][1]
