import json
from pathlib import Path

import pytest
from formulastat.formula_one.models import Circuit, Season
from rest_framework.test import APIClient


@pytest.mark.parametrize(
    ["endpoint", "endpoint_fixture"],
    list((path.name.replace("@", "/"), path) for path in Path("tests/fixtures/ergast_responses").glob("**/*.json")),
)
@pytest.mark.django_db
def test_viewsets(client: APIClient, endpoint_fixture: Path, endpoint):
    # endpoint = endpoint_fixture.name.replace("@", "/")
    with open(endpoint_fixture, mode="rb") as f:
        expected = json.load(f)

    # We intentially do not match the xmlns or url
    expected["MRData"]["xmlns"] = ""
    expected["MRData"]["url"] = expected["MRData"]["url"].replace(
        "http://ergast.com/api/f1/",
        "http://testserver/ergast/",
    )

    response = client.get(f"/ergast/{endpoint}")
    assert response.status_code == 200
    assert response.json() == expected
