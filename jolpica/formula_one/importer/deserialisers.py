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
    }
    EXCLUDE_FROM_CACHE: ClassVar[tuple] = (f1.Lap, f1.PitStop)

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
        if isinstance(model, f1.RoundEntry):
            if model.car_number is None:
                logger.warning("Not adding RoundEntry to cache as car_number is None")
                return
            cache_key = (foreign_keys.year, foreign_keys.round, model.car_number)  # type: ignore[attr-defined]
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


class BaseDeserializer[R: json_models.F1Object, S: json_models.F1ForeignKeys, T: json_models.F1Import]:
    """Base class for all deserializers."""

    MODEL: ClassVar[type[models.Model]]
    JSON_IMPORT_TYPE: ClassVar[type[json_models.F1Import]]
    UNIQUE_FIELDS: ClassVar[tuple]

    _cache: ModelLookupCache

    def __init__(self, cache: ModelLookupCache | None = None):
        if self.MODEL is None:
            raise NotImplementedError("Subclasses must define MODEL")
        if cache is None:
            cache = ModelLookupCache()
        self._cache = cache

    def _get_common_foreign_keys(self, foreign_keys: S) -> dict[str, int]:
        """Get the foreign keys that are required to get or create the unique model instance.

        :param foreign_keys_dict: Dictionary of identifying values
        :return: Mapping of foreign key primary key fields to their values (e.g. {"round_id": 1})
        """
        raise NotImplementedError("Subclasses must implement this method")

    def create_model_instance(self, foreign_key_fields: dict[str, int], field_values: R) -> models.Model:
        return self.MODEL(**foreign_key_fields, **field_values.model_dump(exclude_unset=True))

    def deserialise(self, data_dict: dict) -> DeserialisationResult:
        try:
            data = self.JSON_IMPORT_TYPE.model_validate(data_dict)
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
        for object in data.objects:
            try:
                model = self.create_model_instance(foreign_key_fields, object)
            except ValueError as ex:
                failed_objects.append((object, str(ex)))
            else:
                self._cache.add_to_cache(model, data.foreign_keys)
                model_instances[
                    ModelImport(
                        self.MODEL,
                        tuple(object.model_fields_set),
                        self.UNIQUE_FIELDS,
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
    UNIQUE_FIELDS = ("round_id", "team_driver_id", "car_number")

    def _get_common_foreign_keys(self, foreign_keys: json_models.RoundEntryForeignKeys) -> dict[str, int]:
        round = self._cache.get_model_instance(
            f1.Round,
            season__year=foreign_keys.year,
            number=foreign_keys.round,
        )
        team_driver = self._cache.get_model_instance(
            f1.TeamDriver,
            season__year=foreign_keys.year,
            driver__reference=foreign_keys.driver_reference,
            team__reference=foreign_keys.team_reference,
        )
        return {
            "round_id": round.id,
            "team_driver_id": team_driver.id,
        }


class SessionEntryDeserialiser(BaseDeserializer):
    MODEL = f1.SessionEntry
    JSON_IMPORT_TYPE = json_models.SessionEntryImport
    UNIQUE_FIELDS = ("session_id", "round_entry_id")

    def _get_common_foreign_keys(self, foreign_keys_dict: json_models.SessionEntryForeignKeys) -> dict[str, int]:
        session = self._cache.get_model_instance(
            f1.Session,
            round__season__year=foreign_keys_dict.year,
            round__number=foreign_keys_dict.round,
            type=foreign_keys_dict.session,
        )
        round_entry = self._cache.get_model_instance(
            f1.RoundEntry,
            round__season__year=foreign_keys_dict.year,
            round__number=foreign_keys_dict.round,
            car_number=foreign_keys_dict.car_number,
        )
        return {
            "session_id": session.id,
            "round_entry_id": round_entry.id,
        }


class LapDeserialiser(BaseDeserializer):
    MODEL: ClassVar[type[models.Model]] = f1.Lap
    JSON_IMPORT_TYPE: ClassVar[type[json_models.F1Import]] = json_models.LapImport
    UNIQUE_FIELDS = ("session_entry_id", "number")

    def _get_common_foreign_keys(self, foreign_keys: json_models.LapForeignKeys) -> dict[str, int]:
        session_entry = self._cache.get_model_instance(
            f1.SessionEntry,
            session__round__season__year=foreign_keys.year,
            session__round__number=foreign_keys.round,
            session__type=foreign_keys.session,
            round_entry__car_number=foreign_keys.car_number,
        )
        return {
            "session_entry_id": session_entry.id,
        }


class PitStopDeserialiser(BaseDeserializer):
    MODEL = f1.PitStop
    JSON_IMPORT_TYPE = json_models.PitStopImport
    UNIQUE_FIELDS = ("session_entry_id", "number")

    def _get_common_foreign_keys(self, foreign_keys: json_models.PitStopForeignKeys) -> dict[str, int]:
        session_entry = self._cache.get_model_instance(
            f1.SessionEntry,
            session__round__season__year=foreign_keys.year,
            session__round__number=foreign_keys.round,
            session__type=foreign_keys.session,
            round_entry__car_number=foreign_keys.car_number,
        )
        lap = f1.Lap.objects.get(session_entry_id=session_entry.id, number=foreign_keys.lap)
        return {
            "session_entry_id": session_entry.id,
            "lap_id": lap.id,
        }


class DeserialiserFactory:
    deserialisers = {
        "SessionEntry": SessionEntryDeserialiser,
        "classification": SessionEntryDeserialiser,
        "session_entry": SessionEntryDeserialiser,
        "RoundEntry": RoundEntryDeserialiser,
        "Lap": LapDeserialiser,
        "lap": LapDeserialiser,
        "PitStop": PitStopDeserialiser,
        "pit_stop": PitStopDeserialiser,
    }

    def get_deserialiser(self, object_type: str) -> BaseDeserializer:
        return self.deserialisers[object_type]()
