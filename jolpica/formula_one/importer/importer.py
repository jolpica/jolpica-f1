from .deserialisers import DeserialisationResult, DeserialiserFactory


class JSONModelImporter:
    def __init__(self):
        self.factory = DeserialiserFactory()

    def deserialise(self, data: dict) -> DeserialisationResult:
        deserialiser = self.factory.get_deserialiser(data["object_type"])
        return deserialiser.deserialise(data)

    def deserialise_all(self, data: list[dict]) -> list[DeserialisationResult]:
        return [self.deserialise(item) for item in data]
