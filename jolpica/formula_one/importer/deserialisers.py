import logging
from collections import defaultdict
from dataclasses import dataclass, field
from typing import ClassVar

from django.core.exceptions import ObjectDoesNotExist
from django.db import models
from pydantic import ValidationError

from .. import models as f1
from . import json_models

logger = logging.getLogger(__name__)

type ForeignKeyDict = dict[str, int | models.Model]


@dataclass(frozen=True)
class ModelImport:
    model_class: type[models.Model]
    update_fields: tuple
    unique_fields: tuple


@dataclass(frozen=True)
class DeserialisationResult:
    success: bool
    data: list[dict] | dict

    # Success
    instances: dict[ModelImport, list[models.Model]] = field(default_factory=dict)

    # Failure
    errors: list = field(default_factory=list)

    def __post_init__(self):
        if self.success and not self.instances:
            raise ValueError("Instances must be provided if success is True")
        elif not self.success and not self.errors:
            raise ValueError("Error message must be provided if success is False")


@dataclass
class ModelLookupCache[M: models.Model]:
    _model_cache: dict[type[M], dict[tuple, M]] = field(default_factory=dict)

    cached_model_fields: dict[type[models.Model], tuple] = field(default_factory=dict)

    MODEL_CACHE_FIELD_MAP: ClassVar[dict[type[models.Model], dict[str, str]]] = {
        f1.RoundEntry: {
            "round__season__year": "year",
            "round__number": "round",
            "car_number": "car_number",
        },
        f1.SessionEntry: {
            "session__round__season__year": "year",
            "session__round__number": "round",
            "session__type": "session",
            "round_entry__car_number": "car_number",
        },
        f1.Lap: {"session_entry_id": "session_entry_id", "number": "lap"},
    }
    EXCLUDE_FROM_CACHE: ClassVar[tuple] = (f1.PitStop,)

    def add_to_cache(self, model: M, foreign_keys: json_models.F1ForeignKeys) -> None:
        model_class = type(model)
        if model_class in self.EXCLUDE_FROM_CACHE:
            return
        if model_class not in self.MODEL_CACHE_FIELD_MAP:
            raise ValueError(f"Cache fields not defined for {model_class}")
        if (model_class in self.cached_model_fields) and (
            self.cached_model_fields[model_class] != tuple(self.MODEL_CACHE_FIELD_MAP[model_class].keys())
        ):
            raise ValueError("Unique fields have changed since last lookup")

        if model_class not in self._model_cache:
            self._model_cache[model_class] = {}
        cache = self._model_cache[model_class]
        cache_key: tuple
        if isinstance(model, f1.RoundEntry):
            if model.car_number is None:
                logger.warning("Not adding RoundEntry to cache as car_number is None")
                return
            cache_key = (foreign_keys.year, foreign_keys.round, model.car_number)  # type: ignore[attr-defined]
        elif isinstance(model, f1.Lap):
            cache_key = (model.session_entry_id, model.number)  # type: ignore[attr-defined]
        else:
            cache_key = tuple(getattr(foreign_keys, val) for val in self.MODEL_CACHE_FIELD_MAP[model_class].values())
        cache[cache_key] = model

    def get_model_instance(self, model_class: type[M], **unique_fields) -> M:
        if model_class in self.EXCLUDE_FROM_CACHE:
            model_class.objects.get(**unique_fields)  # type: ignore[attr-defined]

        if (model_class in self.cached_model_fields) and (
            self.cached_model_fields[model_class] != tuple(unique_fields.keys())
        ):
            raise ValueError("Unique fields have changed since last lookup")

        if model_class not in self._model_cache:
            self._model_cache[model_class] = {}

        cache = self._model_cache[model_class]

        cache_key = tuple(unique_fields.values())
        if cache_key not in cache:
            model_instance = model_class.objects.get(**unique_fields)  # type: ignore[attr-defined]
            cache[cache_key] = model_instance
        return cache[cache_key]


class BaseDeserializer[O: json_models.F1Object]:
    """Base class for all deserializers."""

    MODEL: ClassVar[type[models.Model]]
    JSON_IMPORT_TYPE: ClassVar[type[json_models.F1Import]]
    UNIQUE_FIELDS: ClassVar[tuple]

    _cache: ModelLookupCache

    def __init__(self, cache: ModelLookupCache | None = None, legacy_import: bool = False):
        if self.MODEL is None:
            raise NotImplementedError("Subclasses must define MODEL")
        if cache is None:
            cache = ModelLookupCache()
        self._cache = cache
        self.legacy_import = legacy_import

    def _get_common_foreign_keys(self, foreign_keys: json_models.F1ForeignKeys) -> ForeignKeyDict:
        """Get the foreign keys that are required to get or create the unique model instance.

        :param foreign_keys_dict: Dictionary of identifying values
        :return: Mapping of foreign key primary key fields to their values (e.g. {"round_id": 1})
        """
        values = {}
        if self.MODEL in {f1.RoundEntry}:
            values["round"] = self._cache.get_model_instance(
                f1.Round,
                season__year=foreign_keys.year,
                number=foreign_keys.round,
            )
            values["team_driver"] = self._cache.get_model_instance(
                f1.TeamDriver,
                season__year=foreign_keys.year,
                driver__reference=foreign_keys.driver_reference,
                team__reference=foreign_keys.team_reference,
            )
        if self.MODEL in {f1.SessionEntry}:
            values["session"] = self._cache.get_model_instance(
                f1.Session,
                round__season__year=foreign_keys.year,
                round__number=foreign_keys.round,
                type=foreign_keys.session,
            )
            values["round_entry"] = self._cache.get_model_instance(
                f1.RoundEntry,
                round__season__year=foreign_keys.year,
                round__number=foreign_keys.round,
                car_number=foreign_keys.car_number,
            )
        if self.MODEL in {f1.Lap, f1.PitStop}:
            values["session_entry"] = self._cache.get_model_instance(
                f1.SessionEntry,
                session__round__season__year=foreign_keys.year,
                session__round__number=foreign_keys.round,
                session__type=foreign_keys.session,
                round_entry__car_number=foreign_keys.car_number,
            )
            if self.MODEL in {f1.PitStop}:
                values["lap"] = self._cache.get_model_instance(
                    f1.Lap, session_entry_id=values["session_entry"].id, number=foreign_keys.lap
                )

        return values

    def create_model_instance(self, foreign_key_fields: ForeignKeyDict, field_values: O) -> models.Model:
        return self.MODEL(**foreign_key_fields, **field_values.model_dump(exclude_unset=True))

    def get_unique_fields(self, data: json_models.F1Import[O], object_data: O) -> tuple:
        if (
            self.MODEL is f1.Lap
            and isinstance(object_data, json_models.LapObject)
            and self.legacy_import
            and data.foreign_keys.session != "R"
            and object_data.is_entry_fastest_lap
        ):
            # Update existing session data that does not provide lap numbers
            # Previously only race fastest laps had lap numbers
            logger.warning(f"Legacy import for {data.object_type} overriding unique fields")
            return ("session_entry", "is_entry_fastest_lap")
        return self.UNIQUE_FIELDS

    def deserialise(self, data_dict: dict) -> DeserialisationResult:
        try:
            data: json_models.F1Import[O] = self.JSON_IMPORT_TYPE.model_validate(data_dict)  # type: ignore
        except ValidationError as ex:
            return DeserialisationResult(
                success=False,
                data=data_dict,
                errors=ex.errors(include_url=False, include_input=False),
            )
        try:
            foreign_key_fields = self._get_common_foreign_keys(data.foreign_keys)
        except ObjectDoesNotExist as ex:
            return DeserialisationResult(
                success=False,
                data=data_dict,
                errors=[repr(ex)],
            )

        failed_objects = []
        model_instances = defaultdict(list)
        for obj_data in data.objects:
            try:
                model = self.create_model_instance(foreign_key_fields, obj_data)
            except ValueError as ex:
                failed_objects.append((obj_data, str(ex)))
            else:
                self._cache.add_to_cache(model, data.foreign_keys)
                model_instances[
                    ModelImport(
                        self.MODEL,
                        tuple(obj_data.model_fields_set),
                        self.get_unique_fields(data, obj_data),
                    )
                ].append(model)
        if failed_objects:
            return DeserialisationResult(
                success=False,
                data=data_dict,
                errors=failed_objects,
            )
        return DeserialisationResult(
            success=True,
            data=data_dict,
            instances=model_instances,
        )


class RoundEntryDeserialiser(BaseDeserializer):
    MODEL = f1.RoundEntry
    JSON_IMPORT_TYPE = json_models.RoundEntryImport
    UNIQUE_FIELDS = ("round", "team_driver", "car_number")


class SessionEntryDeserialiser(BaseDeserializer):
    MODEL = f1.SessionEntry
    JSON_IMPORT_TYPE = json_models.SessionEntryImport
    UNIQUE_FIELDS = ("session", "round_entry")


class LapDeserialiser(BaseDeserializer):
    MODEL = f1.Lap
    JSON_IMPORT_TYPE = json_models.LapImport
    UNIQUE_FIELDS = ("session_entry", "number")


class PitStopDeserialiser(BaseDeserializer):
    MODEL = f1.PitStop
    JSON_IMPORT_TYPE = json_models.PitStopImport
    UNIQUE_FIELDS = ("session_entry", "number")


class DeserialiserFactory:
    deserialisers: ClassVar[dict[str, type[BaseDeserializer]]] = {
        "SessionEntry": SessionEntryDeserialiser,
        "classification": SessionEntryDeserialiser,
        "session_entry": SessionEntryDeserialiser,
        "RoundEntry": RoundEntryDeserialiser,
        "Lap": LapDeserialiser,
        "lap": LapDeserialiser,
        "PitStop": PitStopDeserialiser,
        "pit_stop": PitStopDeserialiser,
    }

    def __init__(self, cache: ModelLookupCache | None = None, legacy_import: bool = False):
        if cache is None:
            cache = ModelLookupCache()
        self.cache = cache
        self.legecy_import = legacy_import

    def get_deserialiser(self, object_type: str) -> BaseDeserializer:
        return self.deserialisers[object_type](cache=self.cache, legacy_import=self.legecy_import)
