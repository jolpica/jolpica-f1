import logging
from collections import defaultdict

from .deserialisers import DeserialisationResult, DeserialiserFactory, ModelImport, ModelLookupCache

logger = logging.getLogger(__name__)


class JSONModelImporter:
    # These object types should be prioritised in the deserialisation process to allow Lookups to be created first
    OBJECT_TYPE_PRIORITY = ("RoundEntry", "SessionEntry", "Lap", "lap", "pit_stop")

    def __init__(self, legacy_import: bool = False):
        self.legacy_import = legacy_import
        self.cache: ModelLookupCache = ModelLookupCache()
        self.factory = DeserialiserFactory(cache=self.cache, legacy_import=legacy_import)

    def deserialise(self, data: dict) -> DeserialisationResult:
        deserialiser = self.factory.get_deserialiser(data["object_type"])
        return deserialiser.deserialise(data)

    def get_object_priority(self, object_dict: dict) -> int:
        object_type = object_dict.get("object_type")

        if object_type in self.OBJECT_TYPE_PRIORITY:
            return self.OBJECT_TYPE_PRIORITY.index(object_type)
        else:
            return len(self.OBJECT_TYPE_PRIORITY)

    def get_model_import_priority(self, import_key: ModelImport) -> int:
        object_type = import_key.model_class.__name__
        return self.get_object_priority({"object_type": object_type})

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

    def save_deserialisation_result_to_db(self, result: DeserialisationResult):
        prioritised_items = sorted(result.instances.items(), key=lambda x: self.get_model_import_priority(x[0]))
        for model_import, instances in prioritised_items:
            for ins in instances:
                ins.id = model_import.model_class.objects.update_or_create(  # type: ignore[attr-defined]
                    **{field: getattr(ins, field) for field in model_import.unique_fields},
                    defaults={field: getattr(ins, field) for field in model_import.update_fields},
                )[0].id
