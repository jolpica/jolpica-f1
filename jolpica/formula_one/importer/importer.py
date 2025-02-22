from collections import defaultdict
from .deserialisers import DeserialisationResult, DeserialiserFactory


class JSONModelImporter:
    def __init__(self):
        self.factory = DeserialiserFactory()

    def deserialise(self, data: dict) -> DeserialisationResult:
        deserialiser = self.factory.get_deserialiser(data["object_type"])
        return deserialiser.deserialise(data)

    def deserialise_all(self, data: list[dict]) -> DeserialisationResult:
        results = [self.deserialise(item) for item in data]

        import_instances = defaultdict(list)
        for result in results:
            for model_import, instances in result.instances.items():
                import_instances[model_import].extend(instances)

        return DeserialisationResult(
            success=all(result.success for result in results),
            data=data,
            instances=import_instances,
            errors=[error for result in results for error in result.errors],
        )
