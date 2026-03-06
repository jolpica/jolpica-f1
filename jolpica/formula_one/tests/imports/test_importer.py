from __future__ import annotations

import json
from datetime import timedelta
from pathlib import Path

import pytest
from django.db import IntegrityError, transaction

from jolpica.formula_one import models as f1
from jolpica.formula_one.importer.deserialisers import DeserialisationResult
from jolpica.formula_one.importer.importer import JSONModelImporter


@pytest.fixture
def importer() -> JSONModelImporter:
    return JSONModelImporter()


@pytest.fixture
def fastest_lap_session_entry() -> f1.SessionEntry:
    """Create FK chain for fastest-lap import tests.

    Uses IDs in the 2126xx range and car_number=88 to avoid collisions with other tests.
    """
    season = f1.Season.objects.create(id=2126, year=2126, championship_system_id=1)
    round_obj = f1.Round.objects.create(id=212601, season=season, number=1, circuit_id=1, name="Test Round")
    session = f1.Session.objects.create(id=2126010, round=round_obj, number=1, type="Q1")
    driver = f1.Driver.objects.create(id=21260, reference="test_driver_fl_merge", forename="Test", surname="Driver")
    team = f1.Team.objects.create(id=21260, reference="test_team_fl_merge", name="Test Team")
    team_driver = f1.TeamDriver.objects.create(
        id=21260, team=team, driver=driver, season=season, api_id="teamdriver_test_fl_merge"
    )
    round_entry = f1.RoundEntry.objects.create(
        id=21260, round=round_obj, team_driver=team_driver, car_number=88, api_id="roundentry_test_fl_merge"
    )
    return f1.SessionEntry.objects.create(
        id=21260, session=session, round_entry=round_entry, api_id="sessionentry_test_fl_merge"
    )


def test_deserialise_all_success(monkeypatch, importer):
    data = [
        {"object_type": "RoundEntry", "data": "round_entry_data"},
        {"object_type": "SessionEntry", "data": "session_entry_data"},
    ]

    def mock_get_deserialiser(object_type):
        class MockDeserialiser:
            def deserialise(self, data):
                return DeserialisationResult(success=True, data=data, instances={object_type: [data]})

        return MockDeserialiser()

    monkeypatch.setattr(importer.factory, "get_deserialiser", mock_get_deserialiser)

    result = importer.deserialise_all(data)

    assert result.success
    assert len(result.instances) == 2
    assert result.errors == []


def test_deserialise_all_with_errors(monkeypatch, importer):
    data = [
        {"object_type": "RoundEntry", "data": "round_entry_data"},
        {"object_type": "InvalidType", "data": "invalid_data"},
    ]

    def mock_get_deserialiser(object_type):
        class MockDeserialiser:
            def deserialise(self, data):
                if object_type == "InvalidType":
                    return DeserialisationResult(success=False, data=data, errors="Invalid object type")
                return DeserialisationResult(success=True, data=data, instances={object_type: [data]})

        return MockDeserialiser()

    monkeypatch.setattr(importer.factory, "get_deserialiser", mock_get_deserialiser)

    result = importer.deserialise_all(data)

    assert not result.success
    assert len(result.instances) == 1
    assert len(result.errors) == 1
    assert result.errors[0]["type"] == "InvalidType"
    assert result.errors[0]["message"] == "Invalid object type"


def test_deserialise_all_with_mixed_success(monkeypatch, importer):
    data = [
        {"object_type": "RoundEntry", "data": "round_entry_data"},
        {"object_type": "InvalidType", "data": "invalid_data"},
        {"object_type": "SessionEntry", "data": "session_entry_data"},
    ]

    def mock_get_deserialiser(object_type):
        class MockDeserialiser:
            def deserialise(self, data):
                if object_type == "InvalidType":
                    return DeserialisationResult(success=False, data=data, errors="Invalid object type")
                return DeserialisationResult(success=True, data=data, instances={object_type: [data]})

        return MockDeserialiser()

    monkeypatch.setattr(importer.factory, "get_deserialiser", mock_get_deserialiser)

    result = importer.deserialise_all(data)

    assert not result.success
    assert len(result.instances) == 2
    assert len(result.errors) == 1
    assert result.errors[0]["index"] == 1
    assert result.errors[0]["type"] == "InvalidType"
    assert result.errors[0]["message"] == "Invalid object type"


def test_deserialise_all_prioritisation(monkeypatch, importer):
    data = [
        {"object_type": "SessionEntry", "data": "session_entry_data"},
        {"object_type": "RoundEntry", "data": "round_entry_data"},
    ]

    deserialisation_order = []

    def mock_get_deserialiser(object_type):
        class MockDeserialiser:
            def deserialise(self, data):
                deserialisation_order.append(object_type)
                return DeserialisationResult(success=True, data=data, instances={object_type: [data]})

        return MockDeserialiser()

    monkeypatch.setattr(importer.factory, "get_deserialiser", mock_get_deserialiser)

    result = importer.deserialise_all(data)

    assert result.success
    assert len(result.instances) == 2
    assert result.errors == []
    assert deserialisation_order == ["RoundEntry", "SessionEntry"]


@pytest.mark.django_db
def test_deserialise_monaco_data(importer: JSONModelImporter):
    with open(Path("jolpica/formula_one/tests/fixtures/2024_08_monaco.json")) as f:
        data = json.load(f)

    result = importer.deserialise_all(data)

    assert result.errors == []
    assert result.success

    for model_import, instances in result.instances.items():
        if model_import.model_class is f1.PitStop:
            for ins in instances:
                assert ins.lap is not None

    assert f1.managed_views.DriverChampionship.objects.filter(year=2024).count() == 0
    assert f1.PitStop.objects.filter(lap__isnull=True).count() == 0
    importer.save_deserialisation_result_to_db(result)
    assert f1.managed_views.DriverChampionship.objects.filter(year=2024).count() > 0
    assert f1.PitStop.objects.filter(lap__isnull=True).count() == 0


@pytest.mark.django_db
def test_import_new_pit_stops(importer: JSONModelImporter):
    season = f1.Season.objects.create(id=1000, year=2125, championship_system_id=1)
    round = f1.Round.objects.create(season=season, id=999999, number=1, circuit_id=1)
    f1.Session.objects.create(id=99999, round=round, number=7, type="R")
    with open(Path("jolpica/formula_one/tests/fixtures/2025_01_pit_stops.json")) as f:
        data = json.load(f)

    result = importer.deserialise_all(data)

    assert result.errors == []
    assert result.success

    for model_import, instances in result.instances.items():
        if model_import.model_class is f1.PitStop:
            for ins in instances:
                assert ins.lap is not None

    results = importer.save_deserialisation_result_to_db(result)
    assert results["models"]["PitStop"]["updated_count"] == 0
    assert results["models"]["PitStop"]["created_count"] == 82
    assert len(set(results["models"]["PitStop"]["created"])) == 82


@pytest.mark.django_db
def test_import_lap_with_number_updates_existing_fastest_lap_without_number(
    importer: JSONModelImporter, fastest_lap_session_entry: f1.SessionEntry
) -> None:
    """Importing a numbered fastest lap merges into an existing numberless fastest lap.

    When a lap exists with number=None and is_entry_fastest_lap=True, and we import
    a lap with number=5 and is_entry_fastest_lap=True for the same session_entry,
    the existing lap should be updated rather than creating a duplicate.
    """
    session_entry = fastest_lap_session_entry
    f1.Lap.objects.create(
        session_entry=session_entry,
        number=None,
        is_entry_fastest_lap=True,
        time=timedelta(seconds=90),
        api_id="lap_fl_case1_existing",
    )

    import_data = [
        {
            "object_type": "Lap",
            "foreign_keys": {"year": 2126, "round": 1, "session": "Q1", "car_number": 88},
            "objects": [
                {
                    "number": 5,
                    "is_entry_fastest_lap": True,
                    "time": {"_type": "timedelta", "milliseconds": 85000},
                }
            ],
        }
    ]

    result = importer.deserialise_all(import_data)
    assert result.success, f"Deserialisation failed: {result.errors}"

    importer.save_deserialisation_result_to_db(result)

    laps = f1.Lap.objects.filter(session_entry=session_entry)
    assert laps.count() == 1, (
        f"Expected 1 lap, got {laps.count()}. Laps: {[(lap.number, lap.is_entry_fastest_lap) for lap in laps]}"
    )
    lap = laps.first()
    assert lap.number == 5
    assert lap.is_entry_fastest_lap is True
    assert lap.time == timedelta(milliseconds=85000)


@pytest.mark.django_db
def test_import_null_fastest_lap_updates_time_of_existing_null_fastest_lap(
    importer: JSONModelImporter, fastest_lap_session_entry: f1.SessionEntry
) -> None:
    """Importing a numberless fastest lap updates an existing numberless fastest lap's time."""
    session_entry = fastest_lap_session_entry
    f1.Lap.objects.create(
        session_entry=session_entry,
        number=None,
        is_entry_fastest_lap=True,
        time=timedelta(seconds=90),
        api_id="lap_fl_case2_existing",
    )

    import_data = [
        {
            "object_type": "Lap",
            "foreign_keys": {"year": 2126, "round": 1, "session": "Q1", "car_number": 88},
            "objects": [
                {
                    "is_entry_fastest_lap": True,
                    "time": {"_type": "timedelta", "milliseconds": 85000},
                }
            ],
        }
    ]

    result = importer.deserialise_all(import_data)
    assert result.success, f"Deserialisation failed: {result.errors}"

    importer.save_deserialisation_result_to_db(result)

    laps = f1.Lap.objects.filter(session_entry=session_entry)
    assert laps.count() == 1, (
        f"Expected 1 lap, got {laps.count()}. Laps: {[(lap.number, lap.is_entry_fastest_lap) for lap in laps]}"
    )
    lap = laps.first()
    assert lap.number is None
    assert lap.is_entry_fastest_lap is True
    assert lap.time == timedelta(milliseconds=85000)


@pytest.mark.django_db
def test_import_different_numbered_fastest_lap_raises_integrity_error(
    importer: JSONModelImporter, fastest_lap_session_entry: f1.SessionEntry
) -> None:
    """Importing a fastest lap fails when a different-numbered fastest already exists.

    The merge logic must not activate when the existing fastest lap already has a number,
    because merging would silently overwrite the existing lap's number.
    """
    session_entry = fastest_lap_session_entry
    f1.Lap.objects.create(
        session_entry=session_entry,
        number=6,
        is_entry_fastest_lap=True,
        time=timedelta(seconds=90),
        api_id="lap_fl_case3_existing",
    )

    import_data = [
        {
            "object_type": "Lap",
            "foreign_keys": {"year": 2126, "round": 1, "session": "Q1", "car_number": 88},
            "objects": [
                {
                    "number": 5,
                    "is_entry_fastest_lap": True,
                    "time": {"_type": "timedelta", "milliseconds": 85000},
                }
            ],
        }
    ]

    result = importer.deserialise_all(import_data)
    assert result.success, f"Deserialisation failed: {result.errors}"

    with pytest.raises(IntegrityError):
        with transaction.atomic():
            importer.save_deserialisation_result_to_db(result)


@pytest.mark.django_db
def test_import_new_fastest_lap_with_old_fastest_cleared_succeeds(
    importer: JSONModelImporter, fastest_lap_session_entry: f1.SessionEntry
) -> None:
    """Importing a new fastest lap succeeds when the same batch also clears the old fastest.

    The regular lap (number=6, not fastest) is bulk-processed first, clearing the fastest flag.
    Then the special lap (number=5, fastest) is individually processed with no conflict.
    """
    session_entry = fastest_lap_session_entry
    f1.Lap.objects.create(
        session_entry=session_entry,
        number=6,
        is_entry_fastest_lap=True,
        time=timedelta(seconds=90),
        api_id="lap_fl_case4_existing",
    )

    import_data = [
        {
            "object_type": "Lap",
            "foreign_keys": {"year": 2126, "round": 1, "session": "Q1", "car_number": 88},
            "objects": [
                {
                    "number": 5,
                    "is_entry_fastest_lap": True,
                    "time": {"_type": "timedelta", "milliseconds": 85000},
                },
                {
                    "number": 6,
                    "is_entry_fastest_lap": False,
                    "time": {"_type": "timedelta", "milliseconds": 90000},
                },
            ],
        }
    ]

    result = importer.deserialise_all(import_data)
    assert result.success, f"Deserialisation failed: {result.errors}"

    importer.save_deserialisation_result_to_db(result)

    laps = f1.Lap.objects.filter(session_entry=session_entry).order_by("number")
    assert laps.count() == 2, (
        f"Expected 2 laps, got {laps.count()}. Laps: {[(lap.number, lap.is_entry_fastest_lap) for lap in laps]}"
    )
    lap_5 = laps.get(number=5)
    lap_6 = laps.get(number=6)

    assert lap_5.is_entry_fastest_lap is True
    assert lap_5.time == timedelta(milliseconds=85000)
    assert lap_6.is_entry_fastest_lap is False
    assert lap_6.time == timedelta(milliseconds=90000)
