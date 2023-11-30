from datetime import timedelta
from typing import Any

from django.db.models import QuerySet
from rest_framework import serializers

from formulastat.formula_one.models import (
    Circuit,
    Driver,
    Race,
    RaceEntry,
    Season,
    SessionEntry,
    SessionType,
    Team,
)
from formulastat.formula_one.models.session import SessionStatus


class ErgastModelSerializer(serializers.ModelSerializer):
    def to_representation(self, instance: Any) -> Any:
        representation = super().to_representation(instance)
        return {key: value for key, value in representation.items() if value is not None}


class SeasonSerializer(ErgastModelSerializer):
    season = serializers.CharField(source="year")
    url = serializers.CharField(source="wikipedia")

    class Meta:
        model = Season
        fields = ["season", "url"]


class CircuitSerializer(ErgastModelSerializer):
    circuitId = serializers.CharField(source="reference")  # noqa: N815
    url = serializers.CharField(source="wikipedia")
    circuitName = serializers.CharField(source="name")  # noqa: N815
    Location = serializers.SerializerMethodField(method_name="get_location")

    def get_location(self, circuit: Circuit) -> dict:
        return {
            "lat": str(circuit.location.y),
            "long": str(circuit.location.x),
            "locality": circuit.locality,
            "country": circuit.country,
        }

    class Meta:
        model = Circuit
        fields = ["circuitId", "url", "circuitName", "Location"]


class RaceSerializer(ErgastModelSerializer):
    season = serializers.CharField()
    round = serializers.CharField()
    url = serializers.CharField(source="wikipedia")
    raceName = serializers.CharField(source="name")  # noqa: N815
    Circuit = CircuitSerializer(source="circuit")
    date = serializers.CharField()
    time = serializers.SerializerMethodField(method_name="get_time")

    def get_time(self, race: Race) -> dict:
        time = race.sessions.get(type=SessionType.RACE).time
        if time:
            return f"{time}Z"
        else:
            return None

    class Meta:
        model = Race
        fields = ["season", "round", "url", "raceName", "Circuit", "date", "time"]


class StatusSerializer(ErgastModelSerializer):
    statusId = serializers.CharField()  # noqa: N815
    status = serializers.CharField(source="detail")
    count = serializers.CharField()

    class Meta:
        model = SessionEntry
        fields = ["statusId", "count", "status"]


class ConstructorSerializer(ErgastModelSerializer):
    constructorId = serializers.CharField(source="reference")  # noqa: N815
    url = serializers.CharField(source="wikipedia")

    class Meta:
        model = Team
        fields = ["constructorId", "url", "name", "nationality"]


class DriverSerializer(ErgastModelSerializer):
    driverId = serializers.CharField(source="reference")  # noqa: N815
    permanentNumber = serializers.CharField(source="permanent_car_number")  # noqa: N815
    code = serializers.CharField(source="abbreviation")
    url = serializers.CharField(source="wikipedia")
    givenName = serializers.CharField(source="forename")  # noqa: N815
    familyName = serializers.CharField(source="surname")  # noqa: N815
    dateOfBirth = serializers.CharField(source="date_of_birth")  # noqa: N815
    nationality = serializers.CharField()

    class Meta:
        model = Driver
        fields = ["driverId", "permanentNumber", "code", "url", "givenName", "familyName", "dateOfBirth", "nationality"]


class ListResultsSerializer(serializers.ListSerializer):
    def to_representation(self, data: QuerySet[SessionEntry]) -> Any:
        is_single = False
        is_qualifying = self.child.results_list_name == "QualifyingResults"
        if isinstance(data, SessionEntry):
            data = SessionEntry.objects.filter(pk=data.pk).select_related("race_entry__race").distinct()
            is_single = True

        race_results = {}
        for session_entry in data:
            race_id = session_entry.race_entry.race_id

            if race_id not in race_results.keys():
                race_results[race_id] = RaceSerializer().to_representation(session_entry.race_entry.race)
                race_results[race_id][self.child.results_list_name] = []

        race_to_winner_time = {}
        winner_times = Race.objects.filter(
            pk__in=race_results.keys(),
            sessions__type=self.child.results_session_type,
            sessions__session_entries__position=1,
        )
        for race_id, time in winner_times.values_list("pk", "sessions__session_entries__time"):
            race_to_winner_time[race_id] = time

        for session_entry in data:
            race_id = session_entry.race_entry.race_id
            result = {
                "number": str(session_entry.race_entry.car_number),
                "position": str(session_entry.position),
                "positionText": str(session_entry.position),
                "points": None,
                "Driver": DriverSerializer().to_representation(session_entry.race_entry.team_driver.driver),
                "Constructor": ConstructorSerializer().to_representation(session_entry.race_entry.team_driver.team),
                "grid": str(session_entry.grid),
                "laps": str(session_entry.laps_completed),
                "status": session_entry.detail,
            }
            if session_entry.points is not None:
                if session_entry.points % 1 == 0:
                    result["points"] = str(int(session_entry.points))
                else:
                    result["points"] = str(session_entry.points)
            else:
                del result["points"]
            if is_qualifying:
                del result["positionText"], result["grid"], result["laps"], result["status"]
            elif not session_entry.is_classified:
                match session_entry.status:
                    case SessionStatus.WITHDREW:
                        result["positionText"] = "W"
                    case SessionStatus.DISQUALIFIED:
                        result["positionText"] = "D"
                    case SessionStatus.WITHDREW:
                        result["positionText"] = "W"
                    case SessionStatus.DID_NOT_QUALIFY | SessionStatus.DID_NOT_PREQUALIFY:
                        result["positionText"] = "F"
                    case _:
                        result["positionText"] = "R"
            if session_entry.time:
                result["Time"] = {
                    "millis": str(int(session_entry.time.total_seconds() * 1000)),
                    "time": self.calculate_finish_display_from_millis(session_entry.time, race_to_winner_time[race_id]),
                }
            if not is_qualifying and session_entry.fastest_lap:
                result["FastestLap"] = {
                    "rank": str(session_entry.fastest_lap_rank),
                    "lap": str(session_entry.fastest_lap.number),
                    "Time": {"time": str(session_entry.fastest_lap.time).lstrip(":0")[:-3]},
                }
                if session_entry.fastest_lap.average_speed:
                    result["FastestLap"]["AverageSpeed"] = {
                        "units": "kph",
                        "speed": str(session_entry.fastest_lap.average_speed).ljust(7, "0"),
                    }
                result["FastestLap"] = {key: value for key, value in result["FastestLap"].items() if value != "None"}

            race_results[race_id][self.child.results_list_name].append(result)

        results = list(race_results.values())
        if is_single:
            return results[0]
        return results

    @staticmethod
    def calculate_finish_display_from_millis(finish_time: timedelta, winner_time: timedelta) -> str:
        if finish_time == winner_time:
            # time = str(finish_time).strip(":0")
            time = str(finish_time)[:-3].lstrip("0:")
        else:
            time_diff = (finish_time - winner_time).total_seconds()
            hours, mins, secs, millis = (
                time_diff // (60 * 60),
                (time_diff % (60 * 60)) // 60,
                time_diff % (60) // 1,
                (time_diff % 1) * 1000 // 1,
            )
            time = ""
            if hours:
                time += f"{int(hours):02}:"
            if mins:
                time += f"{int(mins):02}:"
            time += f"{int(secs):02}.{int(millis):03}"
            if time[0] == "0":
                time = time[1:]
            time = f"+{time}"  # .rstrip("0")

        return time

    class Meta:
        model = SessionEntry


class RaceResultsSerializer(ErgastModelSerializer):
    results_list_name = "Results"
    results_session_type = SessionType.RACE

    class Meta:
        model = SessionEntry
        list_serializer_class = ListResultsSerializer


class SprintResultsSerializer(RaceResultsSerializer):
    results_list_name = "SprintResults"
    results_session_type = SessionType.SPRINT_RACE


class ListQualifyingSerializer(serializers.ListSerializer):
    def to_representation(self, race_entries: QuerySet[RaceEntry]) -> Any:
        is_single = False
        if isinstance(race_entries, RaceEntry):
            race_entries = RaceEntry.objects.filter(pk=race_entries.pk).select_related("race_entry__race").distinct()
            is_single = True
        print(race_entries)
        driver_session_entries: QuerySet[SessionEntry] = SessionEntry.objects.filter(
            race_entry__in=race_entries, session__type__startswith="Q"
        ).order_by("session__date")

        race_results = {}
        race_entry_set = {}
        for race_entry in race_entries:
            race_entry_set[race_entry] = []

            race_results[race_entry.race.pk] = RaceSerializer().to_representation(race_entry.race)
            race_results[race_entry.race.pk][self.child.results_list_name] = []

        for session_entry in driver_session_entries:
            race_entry_set[session_entry.race_entry].append(session_entry)

        for race_entry, driver_session_entries in race_entry_set.items():
            race_id = race_entry.race_id
            result = {
                "number": str(race_entry.car_number),
                "position": str(driver_session_entries[-1].position) if driver_session_entries else None,
                "Driver": DriverSerializer().to_representation(race_entry.team_driver.driver),
                "Constructor": ConstructorSerializer().to_representation(race_entry.team_driver.team),
            }
            for session_entry in driver_session_entries:
                if session_entry.fastest_lap.time:
                    quali_time = str(session_entry.fastest_lap.time).lstrip(":0")[:-3]
                else:
                    quali_time = ""
                if session_entry.session.type in ("Q1", "Q2", "Q3"):
                    result[session_entry.session.type] = quali_time
                else:
                    if not result.get("Q1"):
                        result["Q1"] = quali_time
                    else:
                        result["Q2"] = quali_time

            race_results[race_id][self.child.results_list_name].append(result)

        for race_id, results_dict in race_results.items():
            results = results_dict[self.child.results_list_name]

        results = list(race_results.values())
        if is_single:
            return results[0]
        return results

    class Meta:
        model = RaceEntry


class QualifyingResultsSerializer(ErgastModelSerializer):
    results_list_name = "QualifyingResults"

    class Meta:
        model = RaceEntry
        list_serializer_class = ListQualifyingSerializer
