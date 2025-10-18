import pytest
from django.urls import reverse
from pydantic import ValidationError

from jolpica.schemas.f1_api.alpha import DetailResponse, PaginatedResponse, ScheduleSummary


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


@pytest.mark.django_db
def test_circuits_list_schema_conformance(api_client, sample_season_data):
    """Verify the circuits list response conforms to PaginatedCircuitSummary."""
    from jolpica.schemas.f1_api.alpha import PaginatedCircuitSummary

    url = reverse("circuits-list")
    response = api_client.get(url)

    assert response.status_code == 200
    response_data = response.json()

    try:
        PaginatedCircuitSummary.model_validate(response_data)
    except ValidationError as e:
        pytest.fail(f"API circuits list response does not conform to PaginatedCircuitSummary:\n{e}")


@pytest.mark.django_db
def test_circuits_detail_schema_conformance(api_client, sample_season_data):
    """Verify the circuits detail response conforms to RetrievedCircuitDetail."""
    from jolpica.formula_one import models as f1
    from jolpica.schemas.f1_api.alpha import RetrievedCircuitDetail

    circuit_obj = f1.Circuit.objects.first()
    assert circuit_obj is not None, "Database must have at least one circuit"

    url = reverse("circuits-detail", kwargs={"api_id": circuit_obj.api_id})
    response = api_client.get(url)

    assert response.status_code == 200
    response_data = response.json()

    try:
        RetrievedCircuitDetail.model_validate(response_data)
    except ValidationError as e:
        pytest.fail(f"API circuits detail response does not conform to RetrievedCircuitDetail:\n{e}")


@pytest.mark.django_db
def test_drivers_list_schema_conformance(api_client, sample_season_data):
    """Verify the drivers list response conforms to PaginatedDriverSummary."""
    from jolpica.schemas.f1_api.alpha import PaginatedDriverSummary

    url = reverse("drivers-list")
    response = api_client.get(url)

    assert response.status_code == 200
    response_data = response.json()

    try:
        PaginatedDriverSummary.model_validate(response_data)
    except ValidationError as e:
        pytest.fail(f"API drivers list response does not conform to PaginatedDriverSummary:\n{e}")


@pytest.mark.django_db
def test_drivers_detail_schema_conformance(api_client, sample_season_data):
    """Verify the drivers detail response conforms to RetrievedDriverDetail."""
    from jolpica.formula_one import models as f1
    from jolpica.schemas.f1_api.alpha import RetrievedDriverDetail

    driver_obj = f1.Driver.objects.first()
    assert driver_obj is not None, "Database must have at least one driver"

    url = reverse("drivers-detail", kwargs={"api_id": driver_obj.api_id})
    response = api_client.get(url)

    assert response.status_code == 200
    response_data = response.json()

    try:
        RetrievedDriverDetail.model_validate(response_data)
    except ValidationError as e:
        pytest.fail(f"API drivers detail response does not conform to RetrievedDriverDetail:\n{e}")
