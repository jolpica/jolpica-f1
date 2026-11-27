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
    driver = f1.Driver.objects.get(reference="max_verstappen")

    response = api_client.get(reverse("core-drivers-stats", kwargs={"api_id": driver.api_id}))

    assert response.status_code == 200
    RetrievedDriverStats.model_validate(response.json())


@pytest.mark.django_db
def test_driver_stats_unknown_driver_returns_404(api_client: APIClient):
    response = api_client.get(reverse("core-drivers-stats", kwargs={"api_id": "driver_unknown"}))

    assert response.status_code == 404


@pytest.mark.django_db
@pytest.mark.parametrize("driver_reference", ["alonso", "max_verstappen", "senna"])
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
def test_driver_stats_ignores_early_qualifying_positions(api_client: APIClient):
    early_entries = (
        f1.SessionEntry.objects.filter(session__type__in=[f1.SessionType.QUALIFYING_ONE, f1.SessionType.QUALIFYING_TWO])
        .filter(position=1)
        .exclude(session__round__sessions__type="QA")
        .exclude(session__round__sessions__type="QB")
        .select_related("round_entry__team_driver__driver", "session__round")
    )
    early_entry = None
    final_session = None
    for candidate in early_entries:
        candidate_final_session = (
            f1.Session.objects.filter(round=candidate.session.round, type__startswith="Q")
            .exclude(type__in=["QA", "QB"])
            .order_by("-number")
            .first()
        )
        if (
            candidate_final_session
            and not f1.SessionEntry.objects.filter(
                session=candidate_final_session,
                round_entry__team_driver__driver=candidate.round_entry.team_driver.driver,
                position=1,
            ).exists()
        ):
            early_entry = candidate
            final_session = candidate_final_session
            break

    assert early_entry is not None, "Database must have an early qualifying winner"
    assert final_session is not None, "Fixture round must have a final knockout qualifying session"

    response = api_client.get(
        reverse(
            "core-drivers-stats",
            kwargs={"api_id": early_entry.round_entry.team_driver.driver.api_id},
        )
    )

    assert response.status_code == 200
    qualifying_entries = (
        f1.SessionEntry.objects.filter(
            round_entry__team_driver__driver=early_entry.round_entry.team_driver.driver,
            session__type__startswith="Q",
        )
        .select_related("session")
        .order_by("session__round_id", "session__number")
    )
    qualifying_by_round: dict[int, list[f1.SessionEntry]] = {}
    for entry in qualifying_entries:
        qualifying_by_round.setdefault(entry.session.round_id, []).append(entry)

    expected_poles = 0
    for round_entries in qualifying_by_round.values():
        session_types = {entry.session.type for entry in round_entries}
        if "QA" in session_types:
            final_entries = [entry for entry in round_entries if entry.session.type == "QA"]
        elif "QB" in session_types:
            final_entries = [entry for entry in round_entries if entry.session.type == "QB"]
        else:
            final_number = max(entry.session.number for entry in round_entries if entry.session.number is not None)
            final_entries = [entry for entry in round_entries if entry.session.number == final_number]
        expected_poles += any(entry.position == 1 for entry in final_entries)

    assert response.json()["data"]["pole_positions"] == expected_poles


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
