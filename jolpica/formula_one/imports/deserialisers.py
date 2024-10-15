from collections.abc import Sequence
from dataclasses import dataclass
from typing import Literal, TypedDict

from django.db import models
from django.db.models import Q

from .. import models as f1


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
        raise NotImplementedError("Subclasses must implement this method")

    def create_model_instance(self, foreign_keys: dict[str, int], field_values: dict) -> models.Model:
        # TODO: Create sensible field_value validator (e.g. points > 26 likely is an error)
        for key in field_values.keys():
            if key not in self.ALLOWED_FIELD_VALUES:
                raise ValueError(f"Invalid key: {key}")
        return self.MODEL(**foreign_keys, **field_values)

    def deserialise(self, data: BaseModelDict) -> ModelDeserialisationResult:
        raise NotImplementedError("Subclasses must implement this method")


class RoundEntryDeserialiser(BaseDeserializer):
    """Special values of `name` and `team` are mapped to the correct TeamDriver object."""

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
        season = f1.Season.objects.get(year=foreign_keys_dict["year"])
        round_ = f1.Round.objects.get(season=season, number=foreign_keys_dict["round"])
        return {
            "season_id": season.id,
            "round_id": round_.id,
        }

    def get_team_driver(
        self, season_id: int, driver_full_name: str, team_full_name: str, car_number: int
    ) -> tuple[f1.TeamDriver | None, str]:
        driver_names = driver_full_name.split(" ")
        # Find a driver with matching first & last name, or 1 of the names and the car number.
        driver_query = Q(driver__forename__in=driver_names, driver__surname__in=driver_names) | (
            (Q(driver__forename__in=driver_names) | Q(driver__surname__in=driver_names))
            & Q(driver__permanent_car_number=car_number)
        )
        team_name = self.team_mapping.get(team_full_name, team_full_name)
        team_query = Q(team__name=team_name)
        team_drivers = f1.TeamDriver.objects.filter(Q(season_id=season_id) & driver_query & team_query)
        if len(team_drivers) == 0:
            message = f"TeamDriver not found for {driver_full_name} in {team_name}"
            if team_full_name not in self.team_mapping:
                message += " (unmapped team name)"
            if not f1.TeamDriver.objects.filter(Q(season_id=season_id) & driver_query).exists():
                message += " (driver miss)"
            if not f1.TeamDriver.objects.filter(Q(season_id=season_id) & team_query).exists():
                message += " (team miss)"
            return None, message
        elif len(team_drivers) > 1:
            return None, f"Multiple TeamDrivers found for {driver_full_name} in {team_name}"
        return team_drivers.first(), ""

    def deserialise(self, data: BaseModelDict) -> ModelDeserialisationResult:
        foreign_keys = self.get_common_foreign_keys(data["foreign_keys"])

        failed_objects = []
        round_entries = []
        for object in data["objects"]:
            team_driver, error = self.get_team_driver(
                foreign_keys["season_id"],
                object["name"],
                object["team"],
                object["car_number"],
            )
            if team_driver is None:
                failed_objects.append((object, error))
                continue
            values_dict = {k: v for k, v in object.items() if k not in ["name", "team"]}
            model_foreign_keys = {  # drop season_id, add team_driver_id
                "round_id": foreign_keys["round_id"],
                "team_driver_id": team_driver.id,
            }
            round_entry = self.create_model_instance(model_foreign_keys, values_dict)
            round_entries.append(round_entry)

        return ModelDeserialisationResult(
            self.MODEL,
            foreign_keys,
            round_entries,
            failed_objects,
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
    ALLOWED_FIELD_VALUES = { "number", "duration", "local_timestamp" }


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
