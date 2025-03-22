import logging
from collections import defaultdict
from dataclasses import dataclass, field
from typing import ClassVar

from django.core.exceptions import ObjectDoesNotExist
from django.db import models
from pydantic import ValidationError

from jolpica.schemas import data_import as json_models

from .. import models as f1

logger = logging.getLogger(__name__)

type ForeignKeyDict = dict[str, int | models.Model]


@dataclass(frozen=True)
class ModelImport:
    model_class: type[models.Model]
    update_fields: tuple[str, ...]
    unique_fields: tuple[str, ...]


@dataclass(frozen=True)
class DeserialisationResult:
    success: bool
    data: dict | list[dict]

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
    cached_model_fields: dict[type[models.Model], tuple[str, ...]] = field(default_factory=dict)

    MODEL_CACHE_FIELD_MAP: ClassVar[dict[type[models.Model], dict[str, str]]] = {
        f1.Team: {"reference": "team_reference"},
        f1.Driver: {"reference": "driver_reference"},
        f1.TeamDriver: {
            "season__year": "year",
            "driver__reference": "driver_reference",
            "team__reference": "team_reference",
        },
        f1.Round: {"season__year": "year", "number": "round"},
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
        f1.Lap: {
            "session_entry__session__round__season__year": "year",
            "session_entry__session__round__number": "round",
            "session_entry__session__type": "session",
            "session_entry__round_entry__car_number": "car_number",
            "number": "lap",
        },
    }
    EXCLUDE_FROM_CACHE: ClassVar[tuple[type[models.Model], ...]] = (f1.PitStop, f1.Circuit)

    def add_to_cache(self, model: M, foreign_keys: json_models.F1ForeignKeysSchema) -> None:
        model_class = type(model)
        if model_class in self.EXCLUDE_FROM_CACHE:
            return

        if model_class not in self.MODEL_CACHE_FIELD_MAP:
            raise ValueError(f"Cache fields not defined for {model_class}")

        expected_fields = tuple(self.MODEL_CACHE_FIELD_MAP[model_class].keys())
        if model_class in self.cached_model_fields and self.cached_model_fields[model_class] != expected_fields:
            raise ValueError(
                f"Unique fields for {model_class.__name__} have changed since last lookup."
                f" Expected: {expected_fields}, Got: {self.cached_model_fields[model_class]}"
            )

        self.cached_model_fields[model_class] = expected_fields

        if model_class not in self._model_cache:
            self._model_cache[model_class] = {}
        cache = self._model_cache[model_class]

        cache_key: tuple
        if isinstance(model, f1.RoundEntry):
            if model.car_number is None:
                logger.warning("Not adding RoundEntry to cache as car_number is None")
                return
            cache_key = (foreign_keys.year, foreign_keys.round, model.car_number)  # type: ignore[attr-defined]
        elif isinstance(model, f1.Driver | f1.Team):
            if model.reference is None:
                logger.warning(f"Not adding {type(model).__name__} to cache as reference is None")
                return
            cache_key = (model.reference,)  # type: ignore[attr-defined]
        elif isinstance(model, f1.Lap):
            cache_key = (
                foreign_keys.year,  # type: ignore[attr-defined]
                foreign_keys.round,  # type: ignore[attr-defined]
                foreign_keys.session,  # type: ignore[attr-defined]
                foreign_keys.car_number,  # type: ignore[attr-defined]
                model.number,
            )
        elif isinstance(model, f1.Round) and isinstance(foreign_keys, json_models.HasSeasonForeignKey):
            cache_key = (foreign_keys.year, model.number)
        else:
            cache_key = tuple(getattr(foreign_keys, val) for val in self.MODEL_CACHE_FIELD_MAP[model_class].values())
        cache[cache_key] = model

    def get_model_instance(self, model_class: type[M], **unique_fields) -> M:
        if model_class in self.EXCLUDE_FROM_CACHE:
            return model_class.objects.get(**unique_fields)  # type: ignore[attr-defined]

        expected_fields = tuple(unique_fields.keys())
        if model_class in self.cached_model_fields and self.cached_model_fields[model_class] != expected_fields:
            raise ValueError(
                f"Unique fields for {model_class.__name__} have changed since last lookup. "
                f"Expected: {self.cached_model_fields[model_class]}, Got: {expected_fields}"
            )

        if model_class not in self._model_cache:
            self._model_cache[model_class] = {}

        cache = self._model_cache[model_class]
        cache_key = tuple(unique_fields.values())

        if cache_key not in cache:
            model_instance = model_class.objects.get(**unique_fields)  # type: ignore[attr-defined]
            cache[cache_key] = model_instance
        return cache[cache_key]


class Deserialiser:
    """Base class for all deserializers."""

    _cache: ModelLookupCache
    legacy_import: bool

    def __init__(
        self,
        model: type[models.Model],
        json_import_type: type[json_models.F1Import],
        unique_fields: tuple[str, ...],
        cache: ModelLookupCache | None = None,
        legacy_import: bool = False,
    ):
        self.model = model
        self.json_import_type = json_import_type
        self.unique_fields = unique_fields
        self._cache = cache if cache is not None else ModelLookupCache()
        self.legacy_import = legacy_import

    def _get_common_foreign_keys(self, foreign_keys: json_models.F1ForeignKeys) -> ForeignKeyDict:
        """Get the foreign keys that are required to get or create the unique model instance."""
        values = {}
        if isinstance(foreign_keys, json_models.HasSeasonForeignKey):
            values["season"] = self._cache.get_model_instance(f1.Season, year=foreign_keys.year)
        if isinstance(foreign_keys, json_models.HasTeamForeignKey):
            values["team"] = self._cache.get_model_instance(f1.Team, reference=foreign_keys.team_reference)
        if isinstance(foreign_keys, json_models.HasTeamForeignKey):
            values["team"] = self._cache.get_model_instance(f1.Team, reference=foreign_keys.team_reference)
        if isinstance(foreign_keys, json_models.HasDriverForeignKey):
            values["driver"] = self._cache.get_model_instance(f1.Driver, reference=foreign_keys.driver_reference)
        if isinstance(foreign_keys, json_models.HasRoundForeignKey):
            values["round"] = self._cache.get_model_instance(
                f1.Round, season__year=foreign_keys.year, number=foreign_keys.round
            )
        if isinstance(foreign_keys, json_models.HasTeamDriverForeignKey):
            values["team_driver"] = self._cache.get_model_instance(
                f1.TeamDriver,
                season__year=foreign_keys.year,
                driver__reference=foreign_keys.driver_reference,
                team__reference=foreign_keys.team_reference,
            )
        if isinstance(foreign_keys, json_models.HasSessionForeignKey):
            values["session"] = self._cache.get_model_instance(
                f1.Session,
                round__season__year=foreign_keys.year,
                round__number=foreign_keys.round,
                type=foreign_keys.session,
            )
        if isinstance(foreign_keys, json_models.HasRoundEntryForeignKey):
            values["round_entry"] = self._cache.get_model_instance(
                f1.RoundEntry,
                round__season__year=foreign_keys.year,
                round__number=foreign_keys.round,
                car_number=foreign_keys.car_number,
            )
        if isinstance(foreign_keys, json_models.HasSessionEntryForeignKey):
            values["session_entry"] = self._cache.get_model_instance(
                f1.SessionEntry,
                session__round__season__year=foreign_keys.year,
                session__round__number=foreign_keys.round,
                session__type=foreign_keys.session,
                round_entry__car_number=foreign_keys.car_number,
            )
        if isinstance(foreign_keys, json_models.HasLapForeignKey):
            values["lap"] = self._cache.get_model_instance(
                f1.Lap,
                session_entry__session__round__season__year=foreign_keys.year,
                session_entry__session__round__number=foreign_keys.round,
                session_entry__session__type=foreign_keys.session,
                session_entry__round_entry__car_number=foreign_keys.car_number,
                number=foreign_keys.lap,
            )
        return values

    def create_model_instance(
        self, foreign_key_fields: ForeignKeyDict, field_values: json_models.F1ObjectSchema
    ) -> models.Model:
        value_map = field_values.model_dump(exclude_unset=True)
        # Set detail field as stop gap to support legacy ergast status
        if self.model == f1.SessionEntry and "status" in value_map and "detail" not in value_map:
            value_map["detail"] = f1.SessionStatus(value_map["status"]).name.replace("_", " ").capitalize()

        return self.model(**foreign_key_fields, **value_map)

    def get_unique_fields(
        self, foreign_keys: json_models.F1ForeignKeysSchema, object_data: json_models.F1Object
    ) -> tuple[str, ...]:
        if (
            isinstance(foreign_keys, json_models.LapForeignKeys)
            and isinstance(object_data, json_models.LapObject)
            and self.legacy_import
            and foreign_keys.session != "R"
            and object_data.is_entry_fastest_lap
        ):
            return ("session_entry", "is_entry_fastest_lap")
        return self.unique_fields

    def deserialise(self, data_dict: dict) -> DeserialisationResult:
        try:
            data = self.json_import_type.model_validate(data_dict)
        except ValidationError as ex:
            return DeserialisationResult(
                success=False, data=data_dict, errors=ex.errors(include_url=False, include_input=False)
            )

        try:
            foreign_key_fields = self._get_common_foreign_keys(data.foreign_keys)
        except ObjectDoesNotExist as ex:
            return DeserialisationResult(
                success=False, data=data_dict, errors=[{"error": repr(ex), "input": data.foreign_keys.model_dump()}]
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
                unique_fields = self.get_unique_fields(data.foreign_keys, obj_data)
                update_fields = [
                    *obj_data.model_fields_set,
                    *[fk for fk in foreign_key_fields.keys() if fk not in unique_fields],
                ]
                if isinstance(model, f1.SessionEntry) and model.detail:
                    update_fields.append("detail")

                model_instances[
                    ModelImport(
                        self.model,
                        tuple(update_fields),
                        unique_fields,
                    )
                ].append(model)

        if failed_objects:
            return DeserialisationResult(success=False, data=data_dict, errors=failed_objects)

        return DeserialisationResult(success=True, data=data_dict, instances=model_instances)


class DeserialiserFactory:
    deserialisers: ClassVar[dict[str, tuple[type[models.Model], type[json_models.F1Import], tuple[str, ...]]]] = {
        "Team": (f1.Team, json_models.TeamImport, ("reference",)),
        "Driver": (f1.Driver, json_models.DriverImport, ("reference",)),
        "Circuit": (f1.Circuit, json_models.CircuitImport, ("reference",)),
        "TeamDriver": (f1.TeamDriver, json_models.TeamDriverImport, ("season", "team", "driver")),
        "Round": (f1.Round, json_models.RoundImport, ("season", "number")),
        "SessionEntry": (f1.SessionEntry, json_models.SessionEntryImport, ("session", "round_entry")),
        "classification": (f1.SessionEntry, json_models.SessionEntryImport, ("session", "round_entry")),
        "session_entry": (f1.SessionEntry, json_models.SessionEntryImport, ("session", "round_entry")),
        "RoundEntry": (f1.RoundEntry, json_models.RoundEntryImport, ("round", "team_driver", "car_number")),
        "Lap": (f1.Lap, json_models.LapImport, ("session_entry", "number")),
        "lap": (f1.Lap, json_models.LapImport, ("session_entry", "number")),
        "PitStop": (f1.PitStop, json_models.PitStopImport, ("session_entry", "number")),
        "pit_stop": (f1.PitStop, json_models.PitStopImport, ("session_entry", "number")),
    }

    def __init__(self, cache: ModelLookupCache[models.Model] | None = None, legacy_import: bool = False):
        self.cache = cache if cache is not None else ModelLookupCache()
        self.legacy_import = legacy_import

    def get_deserialiser(self, object_type: str) -> Deserialiser:
        args = self.deserialisers.get(object_type, None)
        if not args:
            raise ValueError(f"Deserializer not found for object type: {object_type}")
        model, json_import_type, unique_fields = args

        return Deserialiser(model, json_import_type, unique_fields, cache=self.cache, legacy_import=self.legacy_import)
