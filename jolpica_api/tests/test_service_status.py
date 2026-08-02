from unittest.mock import patch

import pytest

from jolpica_api import views


def test_database_check_executes_lightweight_query():
    with patch("jolpica_api.views.connection.cursor") as mock_cursor:
        result = views._database_is_available()

    assert result is True
    mock_cursor.return_value.__enter__.return_value.execute.assert_called_once_with("SELECT 1")


def test_database_check_handles_failure():
    with patch(
        "jolpica_api.views.connection.cursor",
        side_effect=Exception("Database unavailable"),
    ):
        result = views._database_is_available()

    assert result is False


def test_cache_check_calls_cache():
    with patch("jolpica_api.views.cache.get") as mock_cache_get:
        result = views._cache_is_available()

    assert result is True
    mock_cache_get.assert_called_once_with("service-status")


def test_cache_check_handles_failure():
    with patch(
        "jolpica_api.views.cache.get",
        side_effect=Exception("Cache unavailable"),
    ):
        result = views._cache_is_available()

    assert result is False


def test_service_status_returns_ok(client):
    with (
        patch("jolpica_api.views._database_is_available", return_value=True),
        patch("jolpica_api.views._cache_is_available", return_value=True),
    ):
        response = client.get("/status/")

    assert response.status_code == 200
    assert response.json() == {"status": "OK"}


@pytest.mark.parametrize(
    ("database_available", "cache_available"),
    [
        (False, True),
        (True, False),
        (False, False),
    ],
)
def test_service_status_returns_degraded(
    client,
    database_available,
    cache_available,
):
    with (
        patch(
            "jolpica_api.views._database_is_available",
            return_value=database_available,
        ),
        patch(
            "jolpica_api.views._cache_is_available",
            return_value=cache_available,
        ),
    ):
        response = client.get("/status/")

    assert response.status_code == 503
    assert response.json() == {"status": "DEGRADED"}
