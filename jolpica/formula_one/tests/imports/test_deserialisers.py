import pickle
from pathlib import Path

import pytest
from unittest.mock import patch
from jolpica.formula_one import models as f1
from jolpica.formula_one.imports.deserialisers import (
    ModelDeserialiser,
    RoundEntryDeserialiser,
    ModelDeserialisationResult,
)


@pytest.fixture
def entry_list_data():
    return {
        "object_type": "driver",
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
        "object_type": "driver",
        "foreign_keys": {"year": year, "round": round},
        "objects": [object],
    }
    deserialiser = RoundEntryDeserialiser()
    result = deserialiser.deserialise(data)

    assert len(result.failed_objects) == 1
    assert "TeamDriver not found" in result.failed_objects[0][1]
    assert error in result.failed_objects[0][1]
