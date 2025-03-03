import json
from pathlib import Path

import pytest
from django.contrib.auth.models import User
from rest_framework import status
from rest_framework.test import APIClient

import jolpica.formula_one.models as f1
from jolpica_api.data_import.models import DataImportLog


@pytest.fixture(scope="function")
def client() -> APIClient:
    client = APIClient()
    client.force_authenticate(user=User.objects.get(username="test_user"))
    return client


@pytest.fixture
def max_round_entry_data():
    return {
        "object_type": "RoundEntry",
        "foreign_keys": {
            "year": 2023,
            "round": 18,
            "driver_reference": "max_verstappen",
            "team_reference": "red_bull",
        },
        "objects": [{"car_number": 1}],
    }


@pytest.mark.django_db
def test_data_import_validation_error(client: APIClient):
    response = client.put("/data/import/", data={"dry_run": 5, "extra_key": "test"})
    assert response.status_code == 400

    data = response.json()

    assert data == {
        "errors": [
            {
                "input": ["5"],
                "loc": ["dry_run"],
                "msg": "Input should be a valid boolean",
                "type": "bool_type",
            },
            {
                "input": {"dry_run": "5", "extra_key": "test"},
                "loc": ["data"],
                "msg": "Field required",
                "type": "missing",
            },
        ]
    }


@pytest.mark.django_db
def test_data_import_deserialise_error(client: APIClient, max_round_entry_data):
    invalid_round_entry_data = max_round_entry_data.copy()
    invalid_round_entry_data["foreign_keys"]["year"] = 1900
    response = client.put(
        "/data/import/",
        data={
            "data": [invalid_round_entry_data],
        },
        format="json",
    )
    assert response.status_code == 400

    data = response.json()

    assert "errors" in data
    assert "DoesNotExist('Round matching query does not exist.')" in data["errors"][0]["message"]


@pytest.mark.django_db
def test_data_import_deserialise_success(client: APIClient, max_round_entry_data):
    response = client.put("/data/import/", {"data": [max_round_entry_data]}, format="json")
    assert response.status_code == 200


@pytest.mark.parametrize(["already_exists"], [(True,), (False,)])
@pytest.mark.django_db
def test_data_import_model_is_successfully_created(client: APIClient, max_round_entry_data, already_exists):
    existing_instance = f1.RoundEntry.objects.get(
        round__season__year=2023, round__number=18, team_driver__driver__forename__icontains="Max"
    )
    if not already_exists:
        # Ensure instance does not exist
        existing_instance.delete()
        with pytest.raises(f1.RoundEntry.DoesNotExist):
            f1.RoundEntry.objects.get(
                round__season__year=2023, round__number=18, team_driver__driver__forename__icontains="Max"
            )

    client.force_authenticate(user=User.objects.get(username="test_user"))
    response = client.put("/data/import/", {"dry_run": False, "data": [max_round_entry_data]}, format="json")
    assert response.status_code == 200

    assert (
        f1.RoundEntry.objects.get(
            round__season__year=2023, round__number=18, team_driver__driver__forename__icontains="Max"
        )
        is not None
    )


@pytest.mark.django_db
def test_data_import_model_is_successfully_updated(client: APIClient):
    input = {
        "object_type": "Lap",
        "foreign_keys": {"year": 2023, "round": 18, "session": "R", "car_number": 1},
        "objects": [
            {
                "number": 40,
                "position": 1,
                "time": {"_type": "timedelta", "milliseconds": 100000},
            },
        ],
    }
    get_query = {
        "session_entry__round_entry__round__season__year": 2023,
        "session_entry__session__round__number": 18,
        "session_entry__round_entry__car_number": 1,
        "number": 40,
    }
    existing_instance = f1.Lap.objects.get(**get_query)
    assert existing_instance.position == 1
    assert existing_instance.average_speed == 198.412
    assert existing_instance.time.total_seconds() == 100.028

    client.force_authenticate(user=User.objects.get(username="test_user"))

    # Dry Run
    response = client.put("/data/import/", {"dry_run": True, "data": [input]}, format="json")
    assert response.status_code == 200
    updated_instance = f1.Lap.objects.get(**get_query)
    assert updated_instance.position == 1, "dry_run should not cause updates"
    assert updated_instance.average_speed == 198.412, "dry_run should not cause updates"
    assert updated_instance.time.total_seconds() == 100.028, "dry_run should not cause updates"

    # Production Run
    response = client.put("/data/import/", {"dry_run": False, "data": [input]}, format="json")
    assert response.status_code == 200

    updated_instance = f1.Lap.objects.get(**get_query)
    assert updated_instance.position == 1, "Position should stay the same"
    assert updated_instance.average_speed == 198.412, "Average speed should not be updated"
    assert updated_instance.time.total_seconds() == 100, "Time should be updated"


@pytest.mark.django_db
def test_data_import_2023_18_models_are_imported(client: APIClient):
    input_data = []
    for path in Path("jolpica/formula_one/tests/fixtures").glob("2023_18_*.json"):
        with open(path) as f:
            input_data.extend(json.load(f))

    client.force_authenticate(user=User.objects.get(username="test_user"))

    assert (
        f1.Lap.objects.filter(
            session_entry__round_entry__round__season__year=2023,
            session_entry__round_entry__round__number=18,
            session_entry__session__type__contains="Q",
        ).count()
        == 45
    )

    # Dry Run
    response = client.put("/data/import/", {"dry_run": True, "legacy_import": True, "data": input_data}, format="json")
    assert response.status_code == 200

    assert (
        f1.Lap.objects.filter(
            session_entry__round_entry__round__season__year=2023,
            session_entry__round_entry__round__number=18,
            session_entry__session__type__contains="Q",
        ).count()
        == 45
    )

    # Import Data
    response = client.put("/data/import/", {"dry_run": False, "legacy_import": True, "data": input_data}, format="json")
    assert response.status_code == 200

    assert (
        f1.Lap.objects.filter(
            session_entry__round_entry__round__season__year=2023,
            session_entry__round_entry__round__number=18,
            session_entry__session__type__contains="Q",
        ).count()
        > 45
    )


@pytest.mark.django_db
def test_successful_import(client):
    """Test successful data import."""
    data = {
        "dry_run": False,
        "description": "Test import",
        "data": [
            {
                "object_type": "Driver",
                "foreign_keys": {},
                "objects": [{"reference": "max_verstappen", "forename": "Max"}],
            }
        ],
    }
    response = client.put("/data/import/", data, format="json")

    assert response.status_code == status.HTTP_200_OK
    assert DataImportLog.objects.count() == 1
    log = DataImportLog.objects.first()
    assert log.completed_at is not None
    assert not log.dry_run
    assert log.error_type is None
    assert log.import_result["created_count"] == 0
    assert log.import_result["updated_count"] == 1
    assert list(log.import_result["models"].keys()) == ["Driver"]
    assert log.import_result["models"]["Driver"]["updated"] == [831]
    assert log.is_success
    assert log.error_type is None
    assert log.errors is None
    assert log.description == "Test import"


@pytest.mark.django_db
def test_validation_error_has_logs(client):
    """Test import with deserialization errors."""
    data = {
        "dry_run": False,
        "data": [
            {
                "object_type": "Driver",
                "objects": [{"reference": "max_verstappen", "forename": "Max"}],
            }
        ],
    }
    response = client.put("/data/import/", data, format="json")

    assert response.status_code == status.HTTP_400_BAD_REQUEST
    assert DataImportLog.objects.count() == 1
    log = DataImportLog.objects.first()
    assert not log.is_success
    assert not log.dry_run
    assert log.error_type == "VALIDATION"
    assert log.errors[0]["type"] == "missing"


@pytest.mark.django_db
def test_deserialisation_error_has_log(client):
    """Test validation error during request data validation."""
    data = {
        "dry_run": False,
        "data": [
            {
                "object_type": "Round",
                "foreign_keys": {"year": 9999},
                "objects": [{"number": 5}],
            }
        ],
    }
    response = client.put("/data/import/", data, format="json")

    assert response.status_code == status.HTTP_400_BAD_REQUEST
    assert DataImportLog.objects.count() == 1
    log = DataImportLog.objects.first()
    assert not log.is_success
    assert not log.dry_run
    assert log.error_type == "DESERIALISATION"
    assert response.json()["errors"][0] == {
        "index": 0,
        "message": ["DoesNotExist('Season matching query does not exist.')"],
        "type": "Round",
    }


@pytest.mark.django_db
def test_dry_run(client):
    """Test dry run."""
    assert f1.Driver.objects.get(reference="max_verstappen").forename == "Max"
    data = {
        "dry_run": True,
        "data": [
            {
                "object_type": "Driver",
                "foreign_keys": {},
                "objects": [{"reference": "max_verstappen", "forename": "Maxxx"}],
            }
        ],
    }
    response = client.put("/data/import/", data, format="json")

    assert response.status_code == status.HTTP_200_OK
    assert f1.Driver.objects.get(reference="max_verstappen").forename == "Max"
    assert DataImportLog.objects.count() == 1
    assert DataImportLog.objects.first().dry_run


@pytest.mark.parametrize(["dry_run"], [(True,), (False,)])
@pytest.mark.django_db
def test_db_error(client, dry_run):
    """Test database error during import."""
    data = {
        "dry_run": dry_run,
        "legacy_import": False,
        "data": [
            {
                "object_type": "Lap",
                "foreign_keys": {"year": 2023, "round": 18, "session": "R", "car_number": 1},
                "objects": [
                    {"number": 1, "position": 1, "average_speed": 200.0, "is_entry_fastest_lap": True},
                    {
                        "number": 2,
                        "position": 1,
                        "average_speed": 201.0,
                    },
                ],
            },
        ],
    }
    response = client.put("/data/import/", data, format="json")
    assert response.status_code == status.HTTP_400_BAD_REQUEST
    assert DataImportLog.objects.count() == 1
    log = DataImportLog.objects.first()
    assert log.dry_run == dry_run
    assert not log.is_success
    assert log.error_type == "IMPORT"
