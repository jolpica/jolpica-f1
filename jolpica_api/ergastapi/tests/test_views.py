import json
from pathlib import Path

import pytest
from rest_framework.test import APIClient


@pytest.mark.parametrize(
    ["endpoint", "path"],
    list(
        (
            path.name.replace("@", "/").replace("^", "?"),
            path,
        )
        for path in Path("tests/fixtures/ergast_responses").glob("**/*.json*")
    ),
)
@pytest.mark.django_db
def test_viewsets(client: APIClient, endpoint, path: Path, django_assert_max_num_queries):
    # endpoint = endpoint_fixture.name.replace("@", "/")
    with open(path, mode="rb") as f:
        expected = json.load(f)

    # We intentially do not match the xmlns or url
    expected["MRData"]["xmlns"] = ""
    expected["MRData"]["url"] = expected["MRData"]["url"].replace(
        "http://ergast.com/api/f1/",
        "http://testserver/ergast/f1/",
    )

    with django_assert_max_num_queries(10):
        response = client.get(f"/ergast/f1/{endpoint}")
    assert response.status_code == 200

    result = response.json()

    # Special case for results data, allow text time to be off by 1 millisecond
    # This is because in ergast the millis time and text based time is inconsistent
    if (
        "results.json" in endpoint
        or "results/2.json" in endpoint
        or "results/15.json" in endpoint
        or "sprint.json" in endpoint
        or "sprint/1.json" in endpoint
        or "sprint/17.json" in endpoint
    ):
        if "sprint" in endpoint:
            result_prefix = "Sprint"
        else:
            result_prefix = ""
        for i, race_data in enumerate(result["MRData"]["RaceTable"]["Races"]):
            for j, result_data in enumerate(race_data[f"{result_prefix}Results"]):
                expected_data = expected["MRData"]["RaceTable"]["Races"][i][f"{result_prefix}Results"][j]
                if expected_data.get("positionText") in ("N", "W") and expected_data.get("status") != "Withdrew":
                    expected_data["positionText"] = "R"
                if result_data.get("Time"):
                    expected_data["Time"]["time"] = expected_data["Time"]["time"].rstrip("0")
                    result_data["Time"]["time"] = result_data["Time"]["time"].rstrip("0")
    if "laps.json" in endpoint or "laps/1.json" in endpoint:
        for i, race_data in enumerate(result["MRData"]["RaceTable"]["Races"]):
            for j, laps_data in enumerate(race_data["Laps"]):
                for k, timing_data in enumerate(laps_data["Timings"]):
                    expected_data = expected["MRData"]["RaceTable"]["Races"][i]["Laps"][j]["Timings"][k]
                    if timing_data.get("time"):
                        expected_data["time"] = expected_data["time"].rstrip("0")
                        timing_data["time"] = timing_data["time"].rstrip("0")

    if "driverstandings.json" in endpoint or "constructorstandings.json" in endpoint:
        if "driverstandings.json" in endpoint:
            list_name = "DriverStandings"

            def key(d):
                return d["Driver"]["driverId"]
        else:
            list_name = "ConstructorStandings"

            def key(d):
                return d["Constructor"]["constructorId"]

        result["MRData"]["StandingsTable"]["StandingsLists"][0][list_name] = sorted(
            result["MRData"]["StandingsTable"]["StandingsLists"][0][list_name],
            key=key,
        )
        expected["MRData"]["StandingsTable"]["StandingsLists"][0][list_name] = sorted(
            expected["MRData"]["StandingsTable"]["StandingsLists"][0][list_name],
            key=key,
        )

    assert result == expected


@pytest.mark.parametrize(
    "endpoint",
    [
        "laps.json",
        "2023/laps.json",
        "pitstops.json",
        "2023/pitstops.json",
    ],
)
@pytest.mark.django_db
def test_missing_required_parameters(client: APIClient, endpoint):
    response = client.get(f"/ergast/f1/{endpoint}")
    assert response.status_code == 400
    assert response.json()["detail"].startswith("Bad Request: Missing one of the required parameters")


@pytest.mark.parametrize(
    "endpoint",
    [
        "2023/races/1.json",
        "seasons/2010.json",
    ],
)
@pytest.mark.django_db
def test_endpoint_does_not_support_final_filter(client: APIClient, endpoint):
    response = client.get(f"/ergast/f1/{endpoint}")
    assert response.status_code == 400
    assert response.json()["detail"].startswith("Bad Request: Endpoint does not support final filter")


@pytest.mark.parametrize(
    "endpoint",
    [
        "2023/11/laps/1/races.json",
        "2023/11/laps/1/drivers.json",
    ],
)
@pytest.mark.django_db
def test_unsupported_filter_for_endpoint(client: APIClient, endpoint):
    response = client.get(f"/ergast/f1/{endpoint}")
    assert response.status_code == 400
    assert response.json()["detail"].startswith("Bad Request: Unsupported filter for endpoint")
