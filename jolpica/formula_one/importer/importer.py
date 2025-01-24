from .deserialisers import DeserialiserFactory, ModelDeserialisationResult


class JSONModelImporter:
    def __init__(self):
        self.factory = DeserialiserFactory()

    def deserialise(self, data: dict) -> ModelDeserialisationResult:
        deserialiser = self.factory.get_deserialiser(data["object_type"])
        return deserialiser.deserialise(data)

    def deserialise_all(self, data: list[dict]) -> list[ModelDeserialisationResult]:
        return [self.deserialise(item) for item in data]
