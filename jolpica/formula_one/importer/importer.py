from __future__ import annotations

import logging
from collections import defaultdict
from typing import Any, ClassVar

from django.db import IntegrityError
from django.db.models import Model

from jolpica.formula_one import models as f1
from jolpica.formula_one.models.mixins import ApiIDMixin
from jolpica.formula_one.standings import update_championship_standings_in_db
from jolpica.formula_one.utils import generate_api_id

from .deserialisers import DeserialisationResult, DeserialiserFactory, ModelImport, ModelLookupCache

logger = logging.getLogger(__name__)


class JSONModelImporter:
    # These object types should be prioritised in the deserialisation process to allow Lookups to be created first
    OBJECT_TYPE_PRIORITY = (
        "Round",
        "Driver",
        "Team",
        "TeamDriver",
        "RoundEntry",
        "SessionEntry",
        "Lap",
        "lap",
        "pit_stop",
    )

    # Models eligible for bulk_create(update_conflicts=True).
    # Maps model class to the DB UniqueConstraint fields that must match the importer's unique_fields.
    BULK_CREATE_UNIQUE_FIELDS: ClassVar[dict[type[Model], tuple[str, ...]]] = {
        f1.RoundEntry: ("round", "team_driver", "car_number"),
        f1.SessionEntry: ("session", "round_entry"),
        f1.Lap: ("session_entry", "number"),
        f1.PitStop: ("session_entry", "number"),
    }

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
    def update_managed_views_and_save_to_db(cls, import_data: list[dict]) -> None:
        # Get list of seasons changed
        season_years = set()
        for data in import_data:
            year = data["foreign_keys"].get("year")
            if year:
                season_years.add(year)

        if season_years:
            update_championship_standings_in_db(season_years)

    @classmethod
    def save_deserialisation_result_to_db(cls, result: DeserialisationResult) -> dict[str, Any]:
        prioritised_items = sorted(result.instances.items(), key=lambda x: cls.get_model_import_priority(x[0]))

        import_stats: dict[str, Any] = {
            "updated_count": 0,
            "created_count": 0,
            "models": defaultdict(lambda: {"updated_count": 0, "created_count": 0, "updated": [], "created": []}),
        }

        for model_import, instances in prioritised_items:
            model_class = model_import.model_class
            model_name = model_class.__name__

            can_bulk = (
                model_class in cls.BULK_CREATE_UNIQUE_FIELDS
                and model_import.unique_fields == cls.BULK_CREATE_UNIQUE_FIELDS[model_class]
            )

            if can_bulk:
                # Separate special-case instances that need individual handling
                regular: list[Model] = []
                special: list[Model] = []
                for ins in instances:
                    if isinstance(ins, f1.Lap) and ins.is_entry_fastest_lap:
                        special.append(ins)
                    elif isinstance(ins, f1.PitStop) and ins.lap:
                        special.append(ins)
                    else:
                        regular.append(ins)

                if regular:
                    cls._bulk_save_instances(model_import, regular, import_stats, model_name)

                for ins in special:
                    cls._save_instance_individually(model_import, ins, import_stats, model_name)
            else:
                for ins in instances:
                    cls._save_instance_individually(model_import, ins, import_stats, model_name)

        import_stats["total_count"] = import_stats["created_count"] + import_stats["updated_count"]

        cls.update_managed_views_and_save_to_db(result.data if isinstance(result.data, list) else [result.data])

        return import_stats

    @classmethod
    def _bulk_save_instances(
        cls,
        model_import: ModelImport,
        instances: list[Model],
        import_stats: dict[str, Any],
        model_name: str,
    ) -> None:
        """Save instances using bulk_create with update_conflicts for efficiency."""
        model_class = model_import.model_class
        unique_fields = model_import.unique_fields

        # Build update_fields excluding unique_fields (can't update conflict target columns)
        unique_field_set = set(unique_fields)
        bulk_update_fields = [f for f in model_import.update_fields if f not in unique_field_set]

        if not bulk_update_fields:
            # No non-unique fields to update; fall back to individual saves
            for ins in instances:
                cls._save_instance_individually(model_import, ins, import_stats, model_name)
            return

        # Pre-generate api_id for instances that need it.
        # bulk_create skips Model.save(), so ApiIDMixin.save() won't auto-generate api_id.
        # Check for falsy (empty string or None) since CharField defaults to ''.
        if issubclass(model_class, ApiIDMixin) and "api_id" not in model_import.update_fields:
            prefix = model_class.get_id_prefix()
            for ins in instances:
                if not ins.api_id:  # type: ignore[attr-defined]
                    ins.api_id = generate_api_id(prefix)  # type: ignore[attr-defined]

        # Re-sync FK _id fields from FK objects (objects may have gotten PKs from earlier saves)
        cls._refresh_fk_ids(instances, model_class)

        # Get ID field names for unique fields (e.g. "session_entry" -> "session_entry_id")
        id_field_names = cls._get_id_field_names(model_class, unique_fields)

        # Query existing records to determine created vs updated (1 query)
        first_id_field = id_field_names[0]
        filter_values = {getattr(ins, first_id_field) for ins in instances}
        existing_keys = set(
            model_class.objects.filter(  # type: ignore[attr-defined]
                **{f"{first_id_field}__in": filter_values}
            ).values_list(*id_field_names)
        )

        # Bulk create/update (1 query)
        try:
            model_class.objects.bulk_create(  # type: ignore[attr-defined]
                instances,
                update_conflicts=True,
                unique_fields=list(unique_fields),
                update_fields=bulk_update_fields,
            )
        except IntegrityError as ex:
            ex.add_note(f"bulk_create failed for {model_name}")
            ex.add_note(f"unique_fields={unique_fields}, update_fields={bulk_update_fields}")
            raise

        # Track import stats using pre-queried existing keys
        for ins in instances:
            key = tuple(getattr(ins, name) for name in id_field_names)
            if key in existing_keys:
                import_stats["updated_count"] += 1
                import_stats["models"][model_name]["updated_count"] += 1
                import_stats["models"][model_name]["updated"].append(ins.pk)
            else:
                import_stats["created_count"] += 1
                import_stats["models"][model_name]["created_count"] += 1
                import_stats["models"][model_name]["created"].append(ins.pk)

    @classmethod
    def _save_instance_individually(
        cls,
        model_import: ModelImport,
        ins: Model,
        import_stats: dict[str, Any],
        model_name: str,
    ) -> None:
        """Save a single instance using update_or_create."""
        unique_fields = {field: getattr(ins, field) for field in model_import.unique_fields}
        if isinstance(ins, f1.Lap) and ins.is_entry_fastest_lap:
            existing_fastest_lap = f1.Lap.objects.filter(
                session_entry=ins.session_entry, is_entry_fastest_lap=True
            ).first()
            if existing_fastest_lap is not None and existing_fastest_lap.number is None:
                # Merge into existing numberless fastest lap (fill in the number)
                unique_fields = {"pk": existing_fastest_lap.pk}
        if isinstance(ins, f1.PitStop) and ins.lap and f1.PitStop.objects.filter(lap=ins.lap).exists():
            unique_fields = {"lap": ins.lap}

        defaults = {field: getattr(ins, field) for field in model_import.update_fields}
        create_defaults = {field: getattr(ins, field) for field in model_import.update_fields}

        if "api_id" not in model_import.update_fields and hasattr(ins, "api_id") and ins.api_id is None:
            if issubclass(model_import.model_class, ApiIDMixin):
                ins.api_id = generate_api_id(model_import.model_class.get_id_prefix())  # type: ignore[union-attr]
                # Newly created objects need to have api_id set
                create_defaults["api_id"] = ins.api_id  # type: ignore[union-attr]

        try:
            updated_ins, is_created = model_import.model_class.objects.update_or_create(  # type: ignore[attr-defined]
                **unique_fields,
                defaults=defaults,
                create_defaults=create_defaults,
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

    @staticmethod
    def _refresh_fk_ids(instances: list[Model], model_class: type[Model]) -> None:
        """Re-sync FK _id fields from FK objects.

        Needed because FK objects may have gotten their PKs set after instance construction
        (e.g., via earlier bulk_create or update_or_create).
        """
        fk_fields = [f for f in model_class._meta.concrete_fields if f.is_relation]
        for ins in instances:
            for field in fk_fields:
                fk_obj = getattr(ins, field.name, None)
                if fk_obj is not None and fk_obj.pk is not None:
                    setattr(ins, field.attname, fk_obj.pk)

    @staticmethod
    def _get_id_field_names(model_class: type[Model], field_names: tuple[str, ...]) -> list[str]:
        """Convert field names to their _id versions for FK fields."""
        result = []
        for name in field_names:
            field = model_class._meta.get_field(name)
            if field.is_relation:
                result.append(f"{name}_id")
            else:
                result.append(name)
        return result
