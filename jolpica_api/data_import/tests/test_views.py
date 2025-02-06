
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
    response = client.post("/data/import/", data={"dry_run": 5, "extra_key": "test"})
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
    response = client.post(
        "/data/import/",
        data={
            "data": [invalid_round_entry_data],
        },
        format="json",
    )
    assert response.status_code == 400

    data = response.json()

    assert data == {"errors": ["DoesNotExist('Round matching query does not exist.')"]}


@pytest.mark.django_db
def test_data_import_deserialise_success(client: APIClient, max_round_entry_data):
    response = client.post("/data/import/", {"data": [max_round_entry_data]}, format="json")
    assert response.status_code == 200

    data = response.json()

    assert data == {"instances": ["<RoundEntry: Red Bull Max Verstappen 2023 - 2023 United States Grand Prix>"]}




@pytest.mark.django_db
def test_data_import_model_is_successfully_created(client: APIClient, max_round_entry_data):
    # Ensure instance does not exist
    instance = f1.RoundEntry.objects.get(
        round__season__year=2023, round__number=18, team_driver__driver__forename__icontains="Max"
    )
    instance.delete()
    with pytest.raises(f1.RoundEntry.DoesNotExist):
        f1.RoundEntry.objects.get(
            round__season__year=2023, round__number=18, team_driver__driver__forename__icontains="Max"
        )

    client.force_authenticate(user=User.objects.get(username="test_user"))
    response = client.post("/data/import/", {"dry_run": False, "data": [max_round_entry_data]}, format="json")
    assert response.status_code == 200

    assert (
        f1.RoundEntry.objects.get(
            round__season__year=2023, round__number=18, team_driver__driver__forename__icontains="Max"
        )
        is not None
    )
