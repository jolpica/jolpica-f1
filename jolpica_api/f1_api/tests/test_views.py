from __future__ import annotations

from collections.abc import Callable
from typing import Any

import pytest
from django.urls import reverse
from rest_framework.test import APIClient

from jolpica.formula_one import models as f1


@pytest.mark.django_db
def test_rounds_list_query_optimization(api_client, django_assert_max_num_queries):
    """Verify the rounds list endpoint makes fewer than 10 database queries."""
    url = reverse("rounds-list")

    with django_assert_max_num_queries(10):
        response = api_client.get(url)

    assert response.status_code == 200
    rsp = response.json()
    assert rsp["metadata"]["count"] == f1.Round.objects.count()
    assert 0 < len(rsp["data"]) >= 100


@pytest.mark.django_db
@pytest.mark.parametrize(
    "filter_name,get_params,validate_result",
    [
        (
            "year",
            lambda season: {"year": season.year},
            lambda data, season: all(round_data["season"]["year"] == season.year for round_data in data),
        ),
        (
            "round_number",
            lambda season: {"round_number": season.rounds.first().number}
            if season.rounds.first() and season.rounds.first().number is not None
            else None,
            lambda data, season: all(round_data["number"] == season.rounds.first().number for round_data in data),
        ),
        (
            "is_cancelled_false",
            lambda season: {"is_cancelled": "false"},
            lambda data, season: all(round_data["is_cancelled"] is False for round_data in data),
        ),
        (
            "driver_id",
            lambda season: (
                {"driver_id": entry.team_driver.driver.api_id}
                if (
                    entry := f1.RoundEntry.objects.filter(round__season=season)
                    .select_related("team_driver__driver")
                    .first()
                )
                else None
            ),
            lambda data, season: len(data) > 0,
        ),
        (
            "team_id",
            lambda season: (
                {"team_id": entry.team_driver.team.api_id}
                if (
                    entry := f1.RoundEntry.objects.filter(round__season=season)
                    .select_related("team_driver__team")
                    .first()
                )
                else None
            ),
            lambda data, season: len(data) > 0,
        ),
    ],
    ids=[
        "filter_by_year",
        "filter_by_round_number",
        "filter_by_is_cancelled",
        "filter_by_driver_id",
        "filter_by_team_id",
    ],
)
def test_rounds_filter_valid(
    api_client: APIClient,
    sample_season_data: f1.Season,
    filter_name: str,
    get_params: Callable[[f1.Season], dict[str, Any] | None],
    validate_result: Callable[[list[dict[str, Any]], f1.Season], bool],
):
    """Test filtering rounds with valid parameters."""
    params = get_params(sample_season_data)

    if params is None:
        pytest.skip(f"No data available for testing {filter_name}")

    url = reverse("rounds-list")
    response = api_client.get(url, params)

    assert response.status_code == 200
    response_data = response.json()

    assert validate_result(response_data["data"], sample_season_data)


@pytest.mark.django_db
@pytest.mark.parametrize(
    "params,error_field",
    [
        ({"year": "not_a_number"}, "year"),
        ({"round_number": "-1"}, "round_number"),
        ({"race_number": "-1"}, "race_number"),
    ],
    ids=["invalid_year_type", "negative_round_number", "negative_race_number"],
)
def test_rounds_filter_invalid_input(
    api_client: APIClient,
    params: dict[str, str],
    error_field: str,
):
    """Test that invalid filter parameters return validation errors."""
    url = reverse("rounds-list")
    response = api_client.get(url, params)

    assert response.status_code == 400
    response_data = response.json()
    assert error_field in response_data


@pytest.mark.django_db
def test_rounds_filter_combined(api_client: APIClient, sample_season_data: f1.Season):
    """Test combining multiple filters."""
    url = reverse("rounds-list")
    response = api_client.get(url, {"year": sample_season_data.year, "is_cancelled": "false"})

    assert response.status_code == 200
    response_data = response.json()

    # Verify all returned rounds match both filters
    for round_data in response_data["data"]:
        assert round_data["season"]["year"] == sample_season_data.year
        assert round_data["is_cancelled"] is False
