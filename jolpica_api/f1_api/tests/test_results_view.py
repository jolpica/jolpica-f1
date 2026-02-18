from __future__ import annotations

import json
from collections.abc import Callable
from pathlib import Path
from typing import Any

import pytest
from django.urls import reverse
from rest_framework.test import APIClient


@pytest.mark.django_db
@pytest.mark.parametrize("session_code", ["R", "Q"])
def test_results_view(
    api_client: APIClient, django_assert_max_num_queries: Callable[[int], Any], session_code: str
) -> None:
    """Test filtering rounds with valid parameters."""

    url = reverse("results-results", args=["round_0hYZFLEe", session_code])
    with django_assert_max_num_queries(10):
        response = api_client.get(url)

    assert response.status_code == 200
    response_data = response.json()

    expected_path = Path(__file__).parent / "fixtures" / "results" / f"results-round_0hYZFLEe-{session_code}.json"
    if expected_path.exists():
        expected_data = json.loads(expected_path.read_text())
    else:
        expected_path.parent.mkdir(parents=True, exist_ok=True)
        expected_path.write_text(json.dumps(response_data, indent=2))
        expected_data = response_data
        pytest.fail(f"No fixture found, created new fixture at {expected_path}")
    assert response_data["data"] == expected_data["data"]
