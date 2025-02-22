import pytest
from django.contrib.auth.models import User
from rest_framework.test import APIClient

import jolpica.formula_one.models as f1


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
            "driver_name": "Max Verstappen",
            "team_name": "Red Bull Racing Honda RBPT",
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
            {"loc": ["dry_run"], "msg": "Input should be a valid boolean", "type": "bool_type"},
            {"loc": ["data"], "msg": "Field required", "type": "missing"},
        ],
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
    assert "DoesNotExist('Round matching query does not exist.')" in data["errors"][0]


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
