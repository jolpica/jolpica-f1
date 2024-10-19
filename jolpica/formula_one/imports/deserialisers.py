from collections.abc import Sequence
from dataclasses import dataclass
from typing import Literal, TypedDict

from django.core.exceptions import ObjectDoesNotExist
from django.db import models
from django.db.models import Q

from .. import models as f1

"""
convert all snake_case object_type values to CapitalCase (e.g. session_entry -> SessionEntry)
"classification" object type should be "SessionEntry"
"driver" / "RoundEntry" objects should have team_entrant_name / team_constructor_name / driver_name in foreign keys

"""


@dataclass(frozen=True)
class ModelDeserialisationResult:
    model: type[models.Model]
    resolved_foreign_keys: dict[str, int] | None
    models: Sequence[models.Model]
    failed_objects: list[tuple[dict, str]]


class ForeignKeysDict(TypedDict, total=False):
    year: int
    round: int
    session: str
    type: str
    car_number: int


class BaseModelDict(TypedDict):
    object_type: Literal["lap"]
    foreign_keys: ForeignKeysDict
    objects: list[dict]


class ForeignKeyDeserialisationError(Exception):
    pass


class BaseDeserializer:
    """Base class for all deserializers."""

    MODEL: type[models.Model] | None = None
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

    def create_model_instance(self, foreign_keys: dict[str, int], field_values: dict) -> models.Model:
        # TODO: Create sensible field_value validator (e.g. points > 26 likely is an error)
        for key in field_values.keys():
            if key not in self.ALLOWED_FIELD_VALUES:
                raise ValueError(f"Invalid key: {key}")
        return self.MODEL(**foreign_keys, **field_values)

    def deserialise(self, data: BaseModelDict) -> ModelDeserialisationResult:
        try:
            foreign_keys = self.get_common_foreign_keys(data["foreign_keys"])
        except (ObjectDoesNotExist, ForeignKeyDeserialisationError) as ex:
            return ModelDeserialisationResult(self.MODEL, None, [], [(object, str(ex)) for object in data["objects"]])

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
            self.MODEL,
            foreign_keys,
            model_instances,
            failed_objects,
        )


class RoundEntryDeserialiser(BaseDeserializer):
    MODEL = f1.RoundEntry
    ALLOWED_FIELD_VALUES = {"car_number"}

    team_mapping = {  # TODO: Move this mapping to the DB, & add full entrant / constructor name to team models
        "Oracle Red Bull Racing": "Red Bull",
        "Mercedes-AMG PETRONAS F1 Team": "Mercedes",
        "Alfa Romeo F1 Team Stake": "Alfa Romeo",
        "Aston Martin Aramco Cognizant F1 Team": "Aston Martin",
        "BWT Alpine F1 Team": "Alpine F1 Team",
        "McLaren F1 Team": "McLaren",
        "MoneyGram Haas F1 Team": "Haas F1 Team",
        "Scuderia AlphaTauri": "AlphaTauri",
        "Scuderia Ferrari": "Ferrari",
        "Williams Racing": "Williams",
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

    def get_team_driver(self, foreign_keys_dict: dict) -> f1.TeamDriver:
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
        if len(team_drivers) == 0:
            message = f"TeamDriver not found for {foreign_keys_dict["driver_name"]} in {team_name}"
            if foreign_keys_dict["team_name"] not in self.team_mapping:
                message += " (unmapped team name)"
            if not f1.TeamDriver.objects.filter(Q(season__year=foreign_keys_dict["year"]) & driver_query).exists():
                message += " (driver miss)"
            if not f1.TeamDriver.objects.filter(Q(season__year=foreign_keys_dict["year"]) & team_query).exists():
                message += " (team miss)"
            raise ForeignKeyDeserialisationError(message)
        elif len(team_drivers) > 1:
            message = f"Multiple TeamDrivers found for {foreign_keys_dict["driver_name"]} in {team_name}"
            raise ForeignKeyDeserialisationError(message)
        return team_drivers.first()


class ClassificationDeserialiser(BaseDeserializer):
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
            if result.failed_objects:
                result.failed_objects[0] = (object, result.failed_objects[0][1])
            results.append(result)

        return ModelDeserialisationResult(
            self.MODEL,
            None,
            [obj for result in results for obj in result.models],
            [obj for result in results for obj in result.failed_objects],
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
    MODEL = f1.Lap
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


class ModelDeserialiser:
    def get_foreign_keys(self, object_type: Literal["lap"], identifiers: ForeignKeysDict):
        object_key_fields = {
            "lap": ["session_entry_id"],
        }
        foreign_key_fields = {}
        if "session_entry_id" in object_key_fields[object_type]:
            foreign_key_fields["session_entry_id"] = self.get_session_entry_id(identifiers)
        return foreign_key_fields

    def get_session_entry_id(self, identifiers: ForeignKeysDict):
        for key in ["year", "round", "session", "car_number"]:
            if key not in identifiers:
                raise ValueError(f"Missing required key for session_entry: {key}")
        try:
            return f1.SessionEntry.objects.get(
                session__round__season__year=identifiers["year"],
                session__round__number=identifiers["round"],
                session__type=identifiers["session"],
                round_entry__car_number=identifiers["car_number"],
            ).id
        except f1.SessionEntry.DoesNotExist:
            # TODO: Create it
            print(identifiers)
            raise ValueError("SessionEntry not found")

    def create_from_dicts(self, model_dicts: list[BaseModelDict]):
        if not isinstance(model_dicts, list):
            raise TypeError("Expected a list of Dicts")
        models = []
        for obj in model_dicts:
            models.extend(self.create_from_dict(obj))
        return models

    def create_from_dict(self, model_dict: BaseModelDict):
        if model_dict["object_type"] == "fastest_lap":
            model_dict["object_type"] = "lap"
        if model_dict["object_type"] != "lap":
            raise ValueError(f"Unknown object type: {model_dict['object_type']}")
        common_foreign_keys = self.get_foreign_keys(model_dict["object_type"], model_dict["foreign_keys"])
        # TODO: REMOVE WHEN FASTEST_LAP OBJECTS ARE NO LONGER A DICT
        if isinstance(model_dict["objects"], dict):
            model_dict["objects"] = [model_dict["objects"]]

        models = []
        for obj in model_dict["objects"]:
            if "fastest_lap_rank" in obj:
                if f1.SessionEntry.objects.get(pk=common_foreign_keys["session_entry_id"]).fastest_lap_rank != obj.pop(
                    "fastest_lap_rank"
                ):
                    # TODO: return the session entry to be saved / updated
                    raise ValueError("Mismatch in fastest lap rank")
            models.append(self.create(**obj, **common_foreign_keys))
        return models

    def create(self, **kwargs):
        # kwargs["is_entry_fastest_lap"] = kwargs.pop("is_fastest_lap")
        # TODO: REMOVE WHEN FASTEST_LAP OBJECTS HAVE RENAMED lap_number to number
        if "lap_number" in kwargs:
            kwargs["number"] = kwargs.pop("lap_number")
        return f1.Lap(**kwargs)
