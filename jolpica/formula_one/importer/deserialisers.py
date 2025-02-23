from collections import defaultdict
from dataclasses import dataclass, field
from typing import ClassVar

from django.core.exceptions import ObjectDoesNotExist
from django.db import models
from django.db.models import Q
from pydantic import ValidationError

from .. import models as f1
from . import json_models


@dataclass(frozen=True)
class ModelImport:
    model_class: type[models.Model]
    update_fields: tuple
    unique_fields: tuple


@dataclass(frozen=True)
class DeserialisationResult:
    success: bool
    data: dict

    # Success
    instances: dict[ModelImport, list[models.Model]] = field(default_factory=dict)

    # Failure
    errors: list = field(default_factory=list)

    def __post_init__(self):
        if self.success and not self.instances:
            raise ValueError("Instances must be provided if success is True")
        elif not self.success and not self.errors:
            raise ValueError("Error message must be provided if success is False")



class BaseDeserializer[R: json_models.F1Object, S: json_models.F1ForeignKeys, T: json_models.F1Import]:
    """Base class for all deserializers."""

    MODEL: ClassVar[type[models.Model]]
    JSON_IMPORT_TYPE: ClassVar[type[json_models.F1Import]]
    UNIQUE_FIELDS: tuple

    def __init__(self):
        if self.MODEL is None:
            raise NotImplementedError("Subclasses must define MODEL")

    def _get_common_foreign_keys(self, foreign_keys: S) -> dict[str, int]:
        """Get the foreign keys that are required to get or create the unique model instance.

        :param foreign_keys_dict: Dictionary of identifying values
        :return: Mapping of foreign key primary key fields to their values (e.g. {"round_id": 1})
        """
        raise NotImplementedError("Subclasses must implement this method")

    def create_model_instance(self, foreign_keys: dict[str, int], field_values: R) -> models.Model:
        return self.MODEL(**foreign_keys, **field_values.model_dump(exclude_unset=True))

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
                model_instances[
                    ModelImport(
                        self.MODEL,
                        tuple(object.model_fields_set),
                        self.UNIQUE_FIELDS,
                    )
                ].append(model)
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
        round = f1.Round.objects.get(
            season__year=foreign_keys.year,
            number=foreign_keys.round,
        )
        team_driver = f1.TeamDriver.objects.get(
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
        session = f1.Session.objects.get(
            round__season__year=foreign_keys_dict.year,
            round__number=foreign_keys_dict.round,
            type=foreign_keys_dict.session,
        )
        round_entry = f1.RoundEntry.objects.get(
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
        session_entry = f1.SessionEntry.objects.get(
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
        session_entry = f1.SessionEntry.objects.get(
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
