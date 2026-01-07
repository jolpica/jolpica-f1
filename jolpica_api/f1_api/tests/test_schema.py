from __future__ import annotations

from typing import get_args, get_origin

import pytest
from django.urls import reverse
from pydantic import BaseModel, ValidationError
from rest_framework.request import Request
from rest_framework.test import APIRequestFactory

from jolpica.formula_one import models as f1
from jolpica_api.f1_api.serializers import CircuitSerializer, DriverSerializer, RoundSerializer, TeamSerializer
from jolpica_schemas.f1_api.alpha.circuit import CircuitSummary, PaginatedCircuitSummary, RetrievedCircuitDetail
from jolpica_schemas.f1_api.alpha.driver import DriverSummary, PaginatedDriverSummary, RetrievedDriverDetail
from jolpica_schemas.f1_api.alpha.lap import PaginatedLapSummary, RetrievedLapDetail
from jolpica_schemas.f1_api.alpha.metadata import DetailResponse, PaginatedResponse
from jolpica_schemas.f1_api.alpha.pit_stop import PaginatedPitStopSummary, RetrievedPitStopDetail
from jolpica_schemas.f1_api.alpha.round import RetrievedRoundDetail, RoundSummary
from jolpica_schemas.f1_api.alpha.schedule import ScheduleSummary
from jolpica_schemas.f1_api.alpha.session import PaginatedSessionSummary, RetrievedSessionDetail
from jolpica_schemas.f1_api.alpha.session_entry import (
    PaginatedSessionEntrySummary,
    RetrievedSessionEntryDetail,
)
from jolpica_schemas.f1_api.alpha.team import PaginatedTeamSummary, RetrievedTeamDetail, TeamSummary


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


@pytest.mark.django_db
def test_teams_list_schema_conformance(api_client, sample_season_data):
    """Verify the teams list response conforms to PaginatedTeamSummary."""

    url = reverse("teams-list")
    response = api_client.get(url)

    assert response.status_code == 200
    response_data = response.json()

    try:
        PaginatedTeamSummary.model_validate(response_data)
    except ValidationError as e:
        pytest.fail(f"API teams list response does not conform to PaginatedTeamSummary:\n{e}")


@pytest.mark.django_db
def test_teams_detail_schema_conformance(api_client, sample_season_data):
    """Verify the teams detail response conforms to RetrievedTeamDetail."""

    team_obj = f1.Team.objects.first()
    assert team_obj is not None, "Database must have at least one team"

    url = reverse("teams-detail", kwargs={"api_id": team_obj.api_id})
    response = api_client.get(url)

    assert response.status_code == 200
    response_data = response.json()

    try:
        RetrievedTeamDetail.model_validate(response_data)
    except ValidationError as e:
        pytest.fail(f"API teams detail response does not conform to RetrievedTeamDetail:\n{e}")


@pytest.mark.django_db
def test_sessions_list_schema_conformance(api_client, sample_season_data):
    """Verify the sessions list response conforms to PaginatedSessionSummary."""

    url = reverse("sessions-list")
    response = api_client.get(url)

    assert response.status_code == 200
    response_data = response.json()

    try:
        PaginatedSessionSummary.model_validate(response_data)
    except ValidationError as e:
        pytest.fail(f"API sessions list response does not conform to PaginatedSessionSummary:\n{e}")


@pytest.mark.django_db
def test_sessions_detail_schema_conformance(api_client, sample_season_data):
    """Verify the sessions detail response conforms to RetrievedSessionDetail."""

    session_obj = sample_season_data.rounds.first().sessions.first()
    assert session_obj is not None, "Sample season must have at least one session"

    url = reverse("sessions-detail", kwargs={"api_id": session_obj.api_id})
    response = api_client.get(url)

    assert response.status_code == 200
    response_data = response.json()

    try:
        RetrievedSessionDetail.model_validate(response_data)
    except ValidationError as e:
        pytest.fail(f"API sessions detail response does not conform to RetrievedSessionDetail:\n{e}")


@pytest.mark.django_db
def test_session_entries_list_schema_conformance(api_client, sample_season_data):
    """Verify the session entries list response conforms to PaginatedSessionEntrySummary."""

    url = reverse("session-entries-list")
    response = api_client.get(url)

    assert response.status_code == 200
    response_data = response.json()

    try:
        PaginatedSessionEntrySummary.model_validate(response_data)
    except ValidationError as e:
        pytest.fail(f"API session entries list response does not conform to PaginatedSessionEntrySummary:\n{e}")


@pytest.mark.django_db
def test_session_entries_detail_schema_conformance(api_client, sample_season_data):
    """Verify the session entries detail response conforms to RetrievedSessionEntryDetail."""

    session_entry_obj = f1.SessionEntry.objects.first()
    assert session_entry_obj is not None, "Database must have at least one session entry"

    url = reverse("session-entries-detail", kwargs={"api_id": session_entry_obj.api_id})
    response = api_client.get(url)

    assert response.status_code == 200
    response_data = response.json()

    try:
        RetrievedSessionEntryDetail.model_validate(response_data)
    except ValidationError as e:
        pytest.fail(f"API session entries detail response does not conform to RetrievedSessionEntryDetail:\n{e}")


@pytest.mark.django_db
def test_laps_list_schema_conformance(api_client, sample_season_data):
    """Verify the laps list response conforms to PaginatedLapSummary."""

    url = reverse("laps-list")
    response = api_client.get(url)

    assert response.status_code == 200
    response_data = response.json()

    try:
        PaginatedLapSummary.model_validate(response_data)
    except ValidationError as e:
        pytest.fail(f"API laps list response does not conform to PaginatedLapSummary:\n{e}")


@pytest.mark.django_db
def test_laps_detail_schema_conformance(api_client, sample_season_data):
    """Verify the laps detail response conforms to RetrievedLapDetail."""

    lap_obj = f1.Lap.objects.first()
    assert lap_obj is not None, "Database must have at least one lap"

    url = reverse("laps-detail", kwargs={"api_id": lap_obj.api_id})
    response = api_client.get(url)

    assert response.status_code == 200
    response_data = response.json()

    try:
        RetrievedLapDetail.model_validate(response_data)
    except ValidationError as e:
        pytest.fail(f"API laps detail response does not conform to RetrievedLapDetail:\n{e}")


@pytest.mark.django_db
def test_pit_stops_list_schema_conformance(api_client, sample_season_data):
    """Verify the pit stops list response conforms to PaginatedPitStopSummary."""

    url = reverse("pit-stops-list")
    response = api_client.get(url)

    assert response.status_code == 200
    response_data = response.json()

    try:
        PaginatedPitStopSummary.model_validate(response_data)
    except ValidationError as e:
        pytest.fail(f"API pit stops list response does not conform to PaginatedPitStopSummary:\n{e}")


@pytest.mark.django_db
def test_pit_stops_detail_schema_conformance(api_client, sample_season_data):
    """Verify the pit stops detail response conforms to RetrievedPitStopDetail."""

    pit_stop_obj = f1.PitStop.objects.first()
    assert pit_stop_obj is not None, "Database must have at least one pit stop"

    url = reverse("pit-stops-detail", kwargs={"api_id": pit_stop_obj.api_id})
    response = api_client.get(url)

    assert response.status_code == 200
    response_data = response.json()

    try:
        RetrievedPitStopDetail.model_validate(response_data)
    except ValidationError as e:
        pytest.fail(f"API pit stops detail response does not conform to RetrievedPitStopDetail:\n{e}")


# Field completeness tests


def validate_field_completeness(data: dict | list, schema_class: type, path: str = "") -> list[str]:
    """Recursively validate that all schema fields are present in serialized data.

    Args:
        data: The serialized data to validate
        schema_class: The Pydantic schema class to validate against
        path: Current path in the data structure (for error reporting)

    Returns:
        List of missing field paths
    """
    from pydantic_core import PydanticUndefined

    missing_fields = []

    # Handle BaseModel schemas
    if isinstance(schema_class, type) and issubclass(schema_class, BaseModel):
        if not isinstance(data, dict):
            missing_fields.append(f"{path} (expected dict, got {type(data).__name__})")
            return missing_fields

        # Get schema fields
        for field_name, field_info in schema_class.model_fields.items():
            field_path = f"{path}.{field_name}" if path else field_name

            # Check if field is missing from data
            if field_name not in data:
                # Check if field is optional (has None in union or has default)
                field_type = field_info.annotation
                origin = get_origin(field_type)

                # Check if annotation is literally NoneType (TODO fields like url: None = Field(None, ...))
                is_none_only = field_type is type(None)

                # If it's a Union type (e.g., str | None), check if None is in the union
                is_optional = False
                if origin is type(None) or (hasattr(origin, "__name__") and origin.__name__ == "UnionType"):
                    args = get_args(field_type)
                    is_optional = type(None) in args

                # Check if field has a default value
                has_default = field_info.default is not PydanticUndefined or field_info.default_factory is not None

                # Report missing field based on type and defaults
                if is_none_only:
                    # Field type is literally None (TODO fields) - omission is acceptable
                    pass
                elif not is_optional and not has_default:
                    # Required field with no default
                    missing_fields.append(f"{field_path} (missing from data)")
                elif is_optional and not has_default:
                    # Optional field (type | None) without default - should be present when data exists
                    missing_fields.append(f"{field_path} (optional field omitted from data)")
                elif is_optional and has_default:
                    # Optional field with default - should still be present when data exists
                    missing_fields.append(f"{field_path} (optional field with default omitted from data)")
                # else: field has non-optional default, omission is acceptable
                continue

            # Recursively validate nested structures
            field_value = data[field_name]
            field_type = field_info.annotation
            origin = get_origin(field_type)

            # Handle list types
            if origin is list:
                args = get_args(field_type)
                if args and isinstance(field_value, list):
                    for i, item in enumerate(field_value):
                        item_path = f"{field_path}[{i}]"
                        missing_fields.extend(validate_field_completeness(item, args[0], item_path))
            # Handle nested BaseModel
            elif isinstance(field_type, type) and issubclass(field_type, BaseModel):
                if field_value is not None:
                    missing_fields.extend(validate_field_completeness(field_value, field_type, field_path))
            # Handle Union types that might contain BaseModel
            elif origin is type(None) or (hasattr(origin, "__name__") and origin.__name__ == "UnionType"):
                args = get_args(field_type)
                for arg in args:
                    if arg is not type(None) and isinstance(arg, type) and issubclass(arg, BaseModel):
                        if field_value is not None:
                            missing_fields.extend(validate_field_completeness(field_value, arg, field_path))
                        break

    return missing_fields


@pytest.mark.parametrize(
    ["serializer_class", "schema_class", "fixture_name"],
    [
        (CircuitSerializer, CircuitSummary, "fully_populated_circuit"),
        (DriverSerializer, DriverSummary, "fully_populated_driver"),
        (RoundSerializer, RoundSummary, "fully_populated_round"),
        (TeamSerializer, TeamSummary, "fully_populated_team"),
    ],
)
def test_serializer_field_completeness(request, serializer_class, schema_class, fixture_name):
    """Verify that serializers include all schema fields when data is available.

    This test ensures that:
    1. All required schema fields are present in serialized data
    2. Optional fields are included when the model has data for them
    3. Nested schemas are also fully populated
    """
    # Get the fully populated model instance from the fixture
    instance = request.getfixturevalue(fixture_name)

    # Create a mock request for URL generation in serializers
    factory = APIRequestFactory()
    mock_request = factory.get("/")
    mock_request = Request(mock_request)

    # Serialize the instance
    serializer = serializer_class(instance, context={"request": mock_request})
    serialized_data = serializer.data

    # Validate field completeness
    missing_fields = validate_field_completeness(serialized_data, schema_class)

    # Assert no fields are missing
    if missing_fields:
        error_msg = f"{serializer_class.__name__} is missing fields when data is available:\n" + "\n".join(
            f"  - {field}" for field in missing_fields
        )
        pytest.fail(error_msg)

    # Validate that the data conforms to the schema
    try:
        schema_class.model_validate(serialized_data)
    except ValidationError as e:
        pytest.fail(f"{serializer_class.__name__} output does not conform to {schema_class.__name__}:\n{e}")


@pytest.mark.parametrize(
    ["serializer_class", "schema_class"],
    [
        (CircuitSerializer, CircuitSummary),
        (DriverSerializer, DriverSummary),
        (RoundSerializer, RoundSummary),
        (TeamSerializer, TeamSummary),
    ],
)
def test_serializer_schema_field_parity(serializer_class, schema_class):
    """Verify that serializer Meta.fields exactly match pydantic schema model_fields.

    This static comparison catches mismatches between serializer and schema fields
    without requiring any dummy data or fixtures. It ensures that:
    1. All serializer fields exist in the schema (no extra fields in serializer)
    2. All schema fields exist in the serializer (no missing fields in serializer)
    """
    serializer_fields = set(serializer_class.Meta.fields)
    schema_fields = set(schema_class.model_fields.keys())

    # Fields in serializer but not in schema
    extra_in_serializer = serializer_fields - schema_fields
    # Fields in schema but not in serializer
    missing_from_serializer = schema_fields - serializer_fields

    error_messages = []
    if extra_in_serializer:
        error_messages.append(
            f"Fields in {serializer_class.__name__}.Meta.fields but not in {schema_class.__name__}: "
            f"{sorted(extra_in_serializer)}"
        )
    if missing_from_serializer:
        error_messages.append(
            f"Fields in {schema_class.__name__} but not in {serializer_class.__name__}.Meta.fields: "
            f"{sorted(missing_from_serializer)}"
        )

    if error_messages:
        pytest.fail("\n".join(error_messages))
