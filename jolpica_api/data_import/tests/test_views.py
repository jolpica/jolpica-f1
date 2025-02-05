import json
import re
from pathlib import Path

import pytest
from rest_framework.test import APIClient


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
def test_data_import_deserialise_error(client: APIClient):
    response = client.post(
        "/data/import/",
        data={
            "data": [
                {
                    "object_type": "RoundEntry",
                    "foreign_keys": {
                        "year": 1900,
                        "round": 18,
                        "driver_name": "Max Verstappen",
                        "team_name": "Red Bull Racing Honda RBPT",
                    },
                    "objects": [{"car_number": 1}],
                }
            ],
        },
        content_type="application/json",
    )
    assert response.status_code == 400

    data = response.json()

    assert data == { "errors": ["DoesNotExist('Round matching query does not exist.')"] }

@pytest.mark.django_db
def test_data_import_deserialise_success(client: APIClient):
    response = client.post(
        "/data/import/",
        data={
            "data": [
                {
                    "object_type": "RoundEntry",
                    "foreign_keys": {
                        "year": 2023,
                        "round": 18,
                        "driver_name": "Max Verstappen",
                        "team_name": "Red Bull Racing Honda RBPT",
                    },
                    "objects": [{"car_number": 1}],
                }
            ],
        },
        content_type="application/json",
    )
    assert response.status_code == 200

    data = response.json()

    assert data == { "instances": ["<RoundEntry: Red Bull Max Verstappen 2023 - 2023 United States Grand Prix>"] }
