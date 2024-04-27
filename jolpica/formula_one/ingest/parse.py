from django.db.models import Q

from ..models import Lap, SessionEntry


class ObjectParser:
    def __init__(self, create_new_base_objects: bool = False, create_new_team_drivers: bool = False) -> None:
        self.create_new_teams = create_new_base_objects
        self.create_new_drivers = create_new_base_objects
        self.create_new_team_drivers = create_new_team_drivers

    def parse_objects(self, objects: dict):
        if objects.get("object_type") == "lap":
            return self.parse_laps(objects)
        else:
            raise NotImplementedError(f"object_type not implemented ({objects.get('object_type')})")

    def parse_laps(self, objects: dict):
        session_entry = self.get_session_entry(**objects.get("foreign_keys", {}))
        return [
            Lap(
                session_entry=session_entry,
                number=obj["number"],
                position=obj["position"],
            )
            for obj in objects.get("objects", [])
        ]

    def get_session_entry(self, **kwargs):
        required_params = ["season_year", "round_number", "type", "team", "driver"]
        for param in required_params:
            if param not in kwargs:
                raise TypeError(f"Missing required param: {param}")

        driver_names = kwargs["driver"].split(" ")
        driver_query = Q(round_entry__team_driver__driver__surname__in=driver_names) | Q(
            round_entry__team_driver__driver__forename__in=driver_names
        )
        return SessionEntry.objects.get(
            driver_query,
            round_entry__round__season__year=kwargs["season_year"],
            round_entry__round__number=kwargs["round_number"],
            session__type=kwargs["type"],
            round_entry__team_driver__team__name__startswith=kwargs["team"],
        )
