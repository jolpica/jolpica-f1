import pytest
from django.urls import reverse
from pydantic import ValidationError
from rest_framework.test import APIClient

from jolpica.formula_one import models as f1
from jolpica.schemas.f1_api.alpha import DetailResponse, PaginatedResponse, ScheduleSummary


@pytest.fixture
def api_client():
    """Provides an API client for making requests."""
    return APIClient()


@pytest.fixture
def sample_circuit():
    return f1.Circuit.objects.get(reference="monza")


@pytest.fixture
def sample_season_data():
    return f1.Season.objects.get(year=2023)


@pytest.mark.django_db
def test_schedule_list_schema_conformance(api_client, sample_season_data):
    """Verify the schedule list response conforms to PaginatedSeasonScheduleListSchema."""
    url = reverse("schedules-list")
    response = api_client.get(url)

    assert response.status_code == 200
    response_data = response.json()

    try:
        PaginatedResponse[list[ScheduleSummary]].model_validate(response_data)
    except ValidationError as e:
        pytest.fail(f"API list response does not conform to PaginatedSeasonScheduleListSchema:\n{e}")


@pytest.mark.django_db
def test_schedule_detail_schema_conformance(api_client, sample_season_data):
    """Verify the schedule detail response conforms to DetailResponseSchema."""
    year = sample_season_data.year
    url = reverse("schedules-detail", kwargs={"year": year})
    response = api_client.get(url)

    assert response.status_code == 200
    response_data = response.json()

    try:
        DetailResponse.model_validate(response_data)
    except ValidationError as e:
        pytest.fail(f"API detail response does not conform to DetailResponseSchema:\n{e}")


@pytest.mark.django_db
def test_rounds_detail_schema_conformance(api_client, sample_season_data):
    """Verify the rounds detail response conforms to RetrievedRoundDetail."""
    from jolpica.schemas.f1_api.alpha import RetrievedRoundDetail

    round_obj = sample_season_data.rounds.first()
    assert round_obj is not None, "Sample season must have at least one round"

    url = reverse("rounds-detail", kwargs={"api_id": round_obj.api_id})
    response = api_client.get(url)

    assert response.status_code == 200
    response_data = response.json()

    try:
        RetrievedRoundDetail.model_validate(response_data)
    except ValidationError as e:
        pytest.fail(f"API rounds detail response does not conform to RetrievedRoundDetail:\n{e}")
