import logging
from collections import defaultdict

from django.db import IntegrityError

from jolpica.formula_one import models as f1

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

    @classmethod
    def get_object_priority(cls, object_dict: dict) -> int:
        object_type = object_dict.get("object_type")

        if object_type in cls.OBJECT_TYPE_PRIORITY:
            return cls.OBJECT_TYPE_PRIORITY.index(object_type)
        else:
            return len(cls.OBJECT_TYPE_PRIORITY)

    @classmethod
    def get_model_import_priority(cls, import_key: ModelImport) -> int:
        object_type = import_key.model_class.__name__
        return cls.get_object_priority({"object_type": object_type})

    @classmethod
    def save_deserialisation_result_to_db(cls, result: DeserialisationResult) -> dict:
        prioritised_items = sorted(result.instances.items(), key=lambda x: cls.get_model_import_priority(x[0]))

        import_stats: dict = {
            "updated_count": 0,
            "created_count": 0,
            "models": defaultdict(lambda: {"updated_count": 0, "created_count": 0, "updated": [], "created": []}),
        }

        for model_import, instances in prioritised_items:
            model_name = model_import.model_class.__name__

            for ins in instances:
                if isinstance(ins, f1.Lap) and ins.is_entry_fastest_lap:
                    f1.Lap.objects.filter(session_entry=ins.session_entry, is_entry_fastest_lap=True).update(
                        is_entry_fastest_lap=False
                    )
                try:
                    updated_ins, is_created = model_import.model_class.objects.update_or_create(  # type: ignore[attr-defined]
                        **{field: getattr(ins, field) for field in model_import.unique_fields},
                        defaults={field: getattr(ins, field) for field in model_import.update_fields},
                    )
                except IntegrityError as ex:
                    values = {key: val for key, val in vars(ins).items() if not key.startswith("_")}
                    ex.add_note(str(model_import))
                    ex.add_note(f"Failed to update {values}")
                    raise
                ins.pk = updated_ins.pk

                if is_created:
                    import_stats["created_count"] += 1
                    import_stats["models"][model_name]["created_count"] += 1
                    import_stats["models"][model_name]["created"].append(updated_ins.pk)
                else:
                    import_stats["updated_count"] += 1
                    import_stats["models"][model_name]["updated_count"] += 1
                    import_stats["models"][model_name]["updated"].append(updated_ins.pk)

        import_stats["total_count"] = import_stats["created_count"] + import_stats["updated_count"]

        return import_stats
