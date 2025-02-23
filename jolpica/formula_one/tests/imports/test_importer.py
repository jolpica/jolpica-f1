import pytest

from jolpica.formula_one.importer.deserialisers import DeserialisationResult
from jolpica.formula_one.importer.importer import JSONModelImporter


@pytest.fixture
def importer():
    return JSONModelImporter()


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
