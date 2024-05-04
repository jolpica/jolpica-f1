import pytest
from rest_framework.test import APIClient

from jolpica.formula_one.models import Circuit, Driver, Round, Season, SessionEntry, SessionType, Team


@pytest.mark.parametrize("use_json", [True, False])
@pytest.mark.parametrize(
    ["endpoint", "model", "table_name", "data_name"],
    [
        ("seasons/", Season, "SeasonTable", "Seasons"),
        ("circuits/", Circuit, "CircuitTable", "Circuits"),
        ("status/", None, "StatusTable", "Status"),
        ("races/", Round, "RaceTable", "Races"),
        ("constructors/", Team, "ConstructorTable", "Constructors"),
        ("drivers/", Driver, "DriverTable", "Drivers"),
    ],
)
@pytest.mark.django_db
def test_metadata(client: APIClient, endpoint: str, model, table_name, data_name, use_json):
    if use_json:
        endpoint.replace("/", ".json")
    response = client.get(f"/ergast/f1/{endpoint}", follow=True)
    assert response.status_code == 200
    data: dict = response.json()
    if model is not None:
        total_rows = model.objects.all().count()
    elif endpoint == "status/":
        total_rows = SessionEntry.objects.filter(session__type=SessionType.RACE).values("detail").distinct().count()
    table: dict = data["MRData"].pop(table_name)

    assert response.json() == {
        "MRData": {
            "xmlns": "",
            "series": "f1",
            "url": f"http://testserver/ergast/f1/{endpoint}",
            "limit": "30",
            "offset": "0",
            "total": f"{total_rows}",
        }
    }
    assert len(table.keys()) == 1
    assert len(table[data_name]) == min(total_rows, 30)
