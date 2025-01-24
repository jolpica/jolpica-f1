from collections.abc import Sequence
from dataclasses import dataclass
from datetime import timedelta
from typing import ClassVar, TypedDict

from django.core.exceptions import ObjectDoesNotExist
from django.db import models
from django.db.models import Q

from .. import models as f1


@dataclass(frozen=True)
class ModelDeserialisationResult:
    model: type[models.Model]
    object_type: str
    foreign_keys: dict
    resolved_foreign_keys: dict[str, int] | None
    models: Sequence[models.Model]

    foreign_key_failure: str | None
    object_failures: list[tuple[dict, str]]

    @property
    def has_failure(self) -> bool:
        return bool(self.foreign_key_failure is not None or len(self.object_failures) > 0)

    @property
    def get_unique_failure_reasons(self) -> list[str]:
        return (
            [self.foreign_key_failure]
            if self.foreign_key_failure is not None
            else [reason for _, reason in self.object_failures]
        )


class ForeignKeysDict(TypedDict, total=False):
    year: int
    round: int
    session: str
    type: str
    car_number: int
    driver_name: str
    team_name: str


class BaseModelDict(TypedDict):
    object_type: str
    foreign_keys: ForeignKeysDict
    objects: list[dict]


class ForeignKeyDeserialisationError(Exception):
    pass


class UnableToParseValueError(Exception):
    pass


class BaseDeserializer:
    """Base class for all deserializers."""

    MODEL: ClassVar[type[models.Model]]
    ALLOWED_FIELD_VALUES: set | None = None

    def __init__(self):
        if self.MODEL is None:
            raise NotImplementedError("Subclasses must define MODEL")
        if self.ALLOWED_FIELD_VALUES is None:
            raise NotImplementedError("Subclasses must define ALLOWED_FIELD_VALUES")

    def get_common_foreign_keys(self, foreign_keys_dict: ForeignKeysDict) -> dict[str, int]:
        """Get the foreign keys that are required to get or create the unique model instance.

        :param foreign_keys_dict: Dictionary of identifying values
        :return: Mapping of foreign key primary key fields to their values (e.g. {"round_id": 1})
        """
        raise NotImplementedError("Subclasses must implement this method")

    def parse_field_values(self, field_values: dict) -> dict:
        """Check if any field values are of a special type, such as timedelta and parse them."""
        for key, value in field_values.items():
            if not isinstance(value, dict) or "_type" not in value.keys():
                continue
            if value["_type"] == "timedelta":
                del value["_type"]
                for val in value.keys():
                    if val not in {"milliseconds", "seconds", "minutes", "hours", "days"}:
                        # Important to prevent arbitary malicious args being input
                        raise UnableToParseValueError(f"{val} is not a valid field for given type")
                field_values[key] = timedelta(**value)
        return field_values

    def create_model_instance(self, foreign_keys: dict[str, int], field_values: dict) -> models.Model:
        # TODO: Create sensible field_value validator (e.g. points > 26 likely is an error)
        self.parse_field_values(field_values)
        for key in field_values.keys():
            if self.ALLOWED_FIELD_VALUES and key not in self.ALLOWED_FIELD_VALUES:
                raise ValueError(f"Invalid key: {key}")
        return self.MODEL(**foreign_keys, **field_values)

    def deserialise(self, data: BaseModelDict) -> ModelDeserialisationResult:
        try:
            foreign_keys = self.get_common_foreign_keys(data["foreign_keys"])
        except (ObjectDoesNotExist, ForeignKeyDeserialisationError, KeyError) as ex:
            return ModelDeserialisationResult(
                model=self.MODEL,
                object_type=data["object_type"],
                foreign_keys=data["foreign_keys"],
                resolved_foreign_keys=None,
                models=[],
                foreign_key_failure=repr(ex),
                object_failures=[],
            )

        failed_objects = []
        model_instances = []
        for object in data["objects"]:
            try:
                model = self.create_model_instance(foreign_keys, object)
            except ValueError as ex:
                failed_objects.append((object, str(ex)))
            else:
                model_instances.append(model)

        return ModelDeserialisationResult(
            model=self.MODEL,
            object_type=data["object_type"],
            foreign_keys=data["foreign_keys"],
            resolved_foreign_keys=foreign_keys,
            models=model_instances,
            foreign_key_failure=None,
            object_failures=failed_objects,
        )


class RoundEntryDeserialiser(BaseDeserializer):
    MODEL = f1.RoundEntry
    ALLOWED_FIELD_VALUES = {"car_number"}

    team_mapping = {  # TODO: Move this mapping to the DB, & add full entrant / constructor name to team models
        "Oracle Red Bull Racing": "Red Bull",
        "Red Bull Racing Honda RBPT": "Red Bull",
        "Mercedes-AMG PETRONAS F1 Team": "Mercedes",
        "Alfa Romeo F1 Team Stake": "Alfa Romeo",
        "Alfa Romeo Ferrari": "Alfa Romeo",
        "Aston Martin Aramco Cognizant F1 Team": "Aston Martin",
        "Aston Martin Aramco Mercedes": "Aston Martin",
        "BWT Alpine F1 Team": "Alpine F1 Team",
        "Alpine Renault": "Alpine F1 Team",
        "McLaren F1 Team": "McLaren",
        "McLaren Mercedes": "McLaren",
        "MoneyGram Haas F1 Team": "Haas F1 Team",
        "Haas Ferrari": "Haas F1 Team",
        "Scuderia AlphaTauri": "AlphaTauri",
        "AlphaTauri Honda RBPT": "AlphaTauri",
        "Scuderia Ferrari": "Ferrari",
        "Williams Racing": "Williams",
        "Williams Mercedes": "Williams",
    }

    def get_common_foreign_keys(self, foreign_keys_dict: ForeignKeysDict) -> dict[str, int]:
        round = f1.Round.objects.get(
            season__year=foreign_keys_dict["year"],
            number=foreign_keys_dict["round"],
        )
        team_driver = self.get_team_driver(foreign_keys_dict)
        return {
            "round_id": round.id,
            "team_driver_id": team_driver.id,
        }

    def get_team_driver(self, foreign_keys_dict: ForeignKeysDict) -> f1.TeamDriver:
        driver_names = foreign_keys_dict["driver_name"].split(" ")
        # Find a driver with matching first & last name, or 1 of the names and the car number.
        driver_query = Q(driver__forename__in=driver_names, driver__surname__in=driver_names) | (
            Q(driver__forename__in=driver_names) | Q(driver__surname__in=driver_names)
        )
        team_name = self.team_mapping.get(foreign_keys_dict["team_name"], foreign_keys_dict["team_name"])
        team_query = Q(team__name=team_name)
        team_drivers = f1.TeamDriver.objects.filter(
            Q(season__year=foreign_keys_dict["year"]) & driver_query & team_query
        )
        if len(team_drivers) > 1:
            message = f"Multiple TeamDrivers found for {foreign_keys_dict["driver_name"]} in {team_name}"
            raise ForeignKeyDeserialisationError(message)

        result = team_drivers.first()
        if result is None:
            message = f"TeamDriver not found for {foreign_keys_dict["driver_name"]} in {team_name}"
            if foreign_keys_dict["team_name"] not in self.team_mapping:
                message += " (unmapped team name)"
            if not f1.TeamDriver.objects.filter(Q(season__year=foreign_keys_dict["year"]) & driver_query).exists():
                message += " (driver miss)"
            if not f1.TeamDriver.objects.filter(Q(season__year=foreign_keys_dict["year"]) & team_query).exists():
                message += " (team miss)"
            raise ForeignKeyDeserialisationError(message)
        return result


class DriverDeserialiser(BaseDeserializer):
    """Special values of `name` and `team` are mapped to the correct TeamDriver object."""

    MODEL = f1.RoundEntry
    ALLOWED_FIELD_VALUES = {"car_number"}

    def deserialise(self, data: BaseModelDict) -> ModelDeserialisationResult:
        results: list[ModelDeserialisationResult] = []
        for object in data["objects"]:
            result = RoundEntryDeserialiser().deserialise(
                {
                    "object_type": "RoundEntry",
                    "foreign_keys": {
                        "year": data["foreign_keys"]["year"],
                        "round": data["foreign_keys"]["round"],
                        "team_name": object["team"],
                        "driver_name": object["name"],
                    },
                    "objects": [{"car_number": object["car_number"]}],
                }
            )
            if result.object_failures:
                result.object_failures[0] = (object, result.object_failures[0][1])
            results.append(result)

        return ModelDeserialisationResult(
            model=self.MODEL,
            object_type=data["object_type"],
            foreign_keys=data["foreign_keys"],
            resolved_foreign_keys=None,
            models=[obj for result in results for obj in result.models],
            foreign_key_failure=None,
            object_failures=[obj for result in results for obj in result.object_failures],
        )


class SessionEntryDeserialiser(BaseDeserializer):
    MODEL = f1.SessionEntry
    ALLOWED_FIELD_VALUES = {
        "position",
        "is_classified",
        "status",
        "detail",
        "points",
        "is_eligible_for_points",
        "grid",
        "time",
        "fastest_lap_rank",
        "laps_completed",
    }

    def get_common_foreign_keys(self, foreign_keys_dict: ForeignKeysDict) -> dict[str, int]:
        session = f1.Session.objects.get(
            round__season__year=foreign_keys_dict["year"],
            round__number=foreign_keys_dict["round"],
            type=foreign_keys_dict["session"],
        )
        round_entry = f1.RoundEntry.objects.get(
            round__season__year=foreign_keys_dict["year"],
            round__number=foreign_keys_dict["round"],
            car_number=foreign_keys_dict["car_number"],
        )
        return {
            "session_id": session.id,
            "round_entry_id": round_entry.id,
        }


class LapDeserialiser(BaseDeserializer):
    MODEL: ClassVar[type[models.Model]] = f1.Lap
    ALLOWED_FIELD_VALUES = {"number", "position", "time", "average_speed", "is_entry_fastest_lap", "is_deleted"}

    def get_common_foreign_keys(self, foreign_keys_dict: ForeignKeysDict) -> dict[str, int]:
        session_entry = f1.SessionEntry.objects.get(
            session__round__season__year=foreign_keys_dict["year"],
            session__round__number=foreign_keys_dict["round"],
            session__type=foreign_keys_dict["session"],
            round_entry__car_number=foreign_keys_dict["car_number"],
        )
        return {
            "session_entry_id": session_entry.id,
        }


class PitStopDeserialiser(LapDeserialiser):
    MODEL = f1.PitStop
    ALLOWED_FIELD_VALUES = {"number", "duration", "local_timestamp"}

    def get_common_foreign_keys(self, foreign_keys_dict):
        resolved_foreign_keys = super().get_common_foreign_keys(foreign_keys_dict)

        resolved_foreign_keys["lap"] = f1.Lap.objects.get(
            session_entry_id=resolved_foreign_keys["session_entry_id"], number=foreign_keys_dict["lap"]
        )
        return resolved_foreign_keys


class DeserialiserFactory:
    deserialisers = {
        "SessionEntry": SessionEntryDeserialiser,
        "classification": SessionEntryDeserialiser,
        "session_entry": SessionEntryDeserialiser,
        "driver": DriverDeserialiser,
        "RoundEntry": RoundEntryDeserialiser,
        "Lap": LapDeserialiser,
        "lap": LapDeserialiser,
        "PitStop": PitStopDeserialiser,
        "pit_stop": PitStopDeserialiser,
    }

    def get_deserialiser(self, object_type: str) -> BaseDeserializer:
        return self.deserialisers[object_type]()
