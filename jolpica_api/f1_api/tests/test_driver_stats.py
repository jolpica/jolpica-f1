from __future__ import annotations

import pytest
from django.core.cache import cache
from django.urls import reverse
from rest_framework.test import APIClient

from jolpica.formula_one import models as f1
from jolpica_schemas.f1_api.alpha.core.driver import RetrievedDriverStats


def ergast_total(client: APIClient, path: str) -> int:
    cache.clear()
    response = client.get(path)
    assert response.status_code == 200
    return int(response.json()["MRData"]["total"])


@pytest.mark.django_db
def test_driver_stats_schema_conformance(api_client: APIClient):
    driver = f1.Driver.objects.get(reference="verstappen")

    response = api_client.get(reverse("core-drivers-stats", kwargs={"api_id": driver.api_id}))

    assert response.status_code == 200
    RetrievedDriverStats.model_validate(response.json())


@pytest.mark.django_db
def test_driver_stats_unknown_driver_returns_404(api_client: APIClient):
    response = api_client.get(reverse("core-drivers-stats", kwargs={"api_id": "driver_unknown"}))

    assert response.status_code == 404


@pytest.mark.django_db
@pytest.mark.parametrize("driver_reference", ["alonso", "verstappen", "senna"])
def test_driver_stats_race_wins_and_podiums_match_ergast(
    api_client: APIClient, client: APIClient, driver_reference: str
):
    driver = f1.Driver.objects.get(reference=driver_reference)
    stats_response = api_client.get(reverse("core-drivers-stats", kwargs={"api_id": driver.api_id}))

    assert stats_response.status_code == 200
    stats = stats_response.json()["data"]

    race_wins = ergast_total(client, f"/ergast/f1/drivers/{driver_reference}/results/1.json")
    podiums = sum(
        ergast_total(client, f"/ergast/f1/drivers/{driver_reference}/results/{position}.json") for position in (1, 2, 3)
    )

    assert stats["race_wins"] == race_wins
    assert stats["podiums"] == podiums


@pytest.mark.django_db
@pytest.mark.parametrize("driver_reference", ["alonso", "verstappen", "senna"])
def test_driver_stats_pole_positions_match_ergast(api_client: APIClient, client: APIClient, driver_reference: str):
    driver = f1.Driver.objects.get(reference=driver_reference)
    stats_response = api_client.get(reverse("core-drivers-stats", kwargs={"api_id": driver.api_id}))
    pole_positions = ergast_total(client, f"/ergast/f1/drivers/{driver_reference}/qualifying/1.json")

    assert stats_response.status_code == 200
    assert stats_response.json()["data"]["pole_positions"] == pole_positions


@pytest.mark.django_db
def test_driver_stats_without_race_entries_returns_zeroes(api_client: APIClient):
    driver = (
        f1.Driver.objects.exclude(team_drivers__round_entries__session_entries__session__type=f1.SessionType.RACE)
        .filter(team_drivers__round_entries__session_entries__isnull=True)
        .first()
    )
    assert driver is not None, "Database must have a driver without race entries"

    response = api_client.get(reverse("core-drivers-stats", kwargs={"api_id": driver.api_id}))

    assert response.status_code == 200
    stats = response.json()["data"]
    assert {key: stats[key] for key in stats if key != "driver"} == {
        "race_starts": 0,
        "race_wins": 0,
        "podiums": 0,
        "pole_positions": 0,
        "total_points": 0.0,
        "championships": 0,
    }
