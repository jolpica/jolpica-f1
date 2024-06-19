import json
import re
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
def test_viewsets(client: APIClient, endpoint: str, path: Path, django_assert_max_num_queries):
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

    if re.search(r"(?i)(?:results|sprint)(?:/[0-9]+)?.json", endpoint):
        if "sprint" in endpoint:
            result_prefix = "Sprint"
        else:
            result_prefix = ""
        for race_data, exp_race_data in zip(
            result["MRData"]["RaceTable"]["Races"], expected["MRData"]["RaceTable"]["Races"]
        ):
            for result_data, expected_data in zip(
                race_data[f"{result_prefix}Results"], exp_race_data[f"{result_prefix}Results"]
            ):
                if expected_data.get("positionText") in ("N", "W") and expected_data.get("status") != "Withdrew":
                    # Ergast is inconsistent with positionText vs status
                    expected_data["positionText"] = "R"
                if result_data.get("Time"):
                    # Ergast is inconsistent with trailing 0s
                    expected_data["Time"]["time"] = expected_data["Time"]["time"].rstrip("0")
                    result_data["Time"]["time"] = result_data["Time"]["time"].rstrip("0")
    if re.search(r"(?i)laps(?:/[0-9]+)?.json", endpoint):
        for i, race_data in enumerate(result["MRData"]["RaceTable"]["Races"]):
            for j, laps_data in enumerate(race_data["Laps"]):
                for k, timing_data in enumerate(laps_data["Timings"]):
                    expected_data = expected["MRData"]["RaceTable"]["Races"][i]["Laps"][j]["Timings"][k]
                    if timing_data.get("time"):
                        # Ergast is inconsistent with trailing 0s
                        expected_data["time"] = expected_data["time"].rstrip("0")
                        timing_data["time"] = timing_data["time"].rstrip("0")

    if re.search(r"(?i)(?:driverstandings|constructorstandings)(?:/[0-9]+)?.json", endpoint):
        # We add round to standings tables while ergast doesn't. remove for comparison
        if re.search(r"^[0-9]{4}/(?![0-9]{1,2}/)", endpoint):
            result["MRData"]["StandingsTable"].pop("round", "")

    if re.match(r"2023(/(next|last))?(/races)?\.json$", endpoint):
        # Ergast doesn't properly support sprint shootout
        for race_data in result["MRData"]["RaceTable"]["Races"]:
            if "Sprint" in race_data:
                assert "SprintShootout" in race_data
                race_data["SecondPractice"] = race_data["SprintShootout"]
                race_data.pop("SprintShootout")

    if re.match(r"2024(/(next|last))?(/races)?\.json$", endpoint):
        # Ergast doesn't properly support sprint qualifying
        for race_data in result["MRData"]["RaceTable"]["Races"]:
            if "Sprint" in race_data:
                assert "SprintQualifying" in race_data
                race_data["SecondPractice"] = race_data["SprintQualifying"]
                race_data.pop("SprintQualifying")

    assert result == expected


@pytest.mark.parametrize(
    ["endpoint1", "endpoint2"],
    [
        # Check json & non-json formats return same data
        ("circuits/monza", "circuits/monza.json"),
        ("drivers/alonso/status/1", "drivers/alonso/status/1.json"),
        ("2017/results/2?limit=2", "2017/results/2.json?limit=2"),
    ],
)
@pytest.mark.django_db
def test_equivalent_urls(client: APIClient, endpoint1, endpoint2):
    response1 = client.get(f"/ergast/f1/{endpoint1}", follow=True)
    response2 = client.get(f"/ergast/f1/{endpoint2}", follow=True)
    assert response1.status_code == response2.status_code

    result1 = response1.json()
    result2 = response2.json()

    if "MRData" in result1:
        result1["MRData"]["url"] = result2["MRData"]["url"]

    assert result1 == result2


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
        "2023/11/drivers/1/constructorstandings.json",
        "2023/11/constructors/1/driverstandings.json",
    ],
)
@pytest.mark.django_db
def test_unsupported_filter_for_endpoint(client: APIClient, endpoint):
    response = client.get(f"/ergast/f1/{endpoint}")
    assert response.status_code == 400
    assert response.json()["detail"].startswith("Bad Request: Unsupported filter for endpoint")
