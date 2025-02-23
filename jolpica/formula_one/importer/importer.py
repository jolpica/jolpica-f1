from collections import defaultdict

from .deserialisers import DeserialisationResult, DeserialiserFactory, ModelLookupCache


class JSONModelImporter:
    # These object types should be prioritised in the deserialisation process to allow Lookups to be created first
    OBJECT_TYPE_PRIORITY = ("RoundEntry", "SessionEntry", "Lap", "lap", "pit_stop")

    def __init__(self):
        self.cache = ModelLookupCache()
        self.factory = DeserialiserFactory(cache=self.cache)

    def deserialise(self, data: dict) -> DeserialisationResult:
        deserialiser = self.factory.get_deserialiser(data["object_type"])
        return deserialiser.deserialise(data)

    def get_object_priority(self, object_dict: dict) -> int:
        object_type = object_dict.get("object_type")

        if object_type in self.OBJECT_TYPE_PRIORITY:
            return self.OBJECT_TYPE_PRIORITY.index(object_type)
        else:
            return len(self.OBJECT_TYPE_PRIORITY)

    def deserialise_all(self, data: list[dict]) -> DeserialisationResult:
        prioritised_data = sorted(enumerate(data), key=lambda x: self.get_object_priority(x[1]))
        indexed_results = [(i, self.deserialise(item)) for i, item in prioritised_data]

        import_instances = defaultdict(list)
        errors = []
        for i, result in indexed_results:
            if not result.success and isinstance(result.data, dict):
                errors.append({"index": i, "type": result.data.get("object_type"), "message": result.errors})

            for model_import, instances in result.instances.items():
                import_instances[model_import].extend(instances)

        return DeserialisationResult(
            success=all(result.success for _, result in indexed_results) and len(indexed_results) > 0,
            data=data,
            instances=import_instances,
            errors=errors,
        )
