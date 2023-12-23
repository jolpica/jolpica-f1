from collections import defaultdict
from datetime import timedelta
from typing import Any

from django.db.models import QuerySet
from rest_framework import serializers

from formulastat.formula_one.models import (
    Circuit,
    Driver,
    Lap,
    PitStop,
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


class BaseRaceSerializer(ErgastModelSerializer):
    season = serializers.CharField()
    round = serializers.CharField()
    url = serializers.CharField(source="wikipedia")
    raceName = serializers.CharField(source="name")  # noqa: N815
    Circuit = CircuitSerializer(source="circuit")
    date = serializers.CharField()
    time = serializers.SerializerMethodField(method_name="get_time")

    def get_time(self, race: Race) -> dict:
        time = None
        for session in race.sessions.all():
            if session.type == SessionType.RACE:
                time = session.time
        if time:
            return f"{time}Z"
        else:
            return None

    class Meta:
        model = Race
        fields = ["season", "round", "url", "raceName", "Circuit", "date", "time"]


class RaceSerializer(BaseRaceSerializer):
    FirstPractice = serializers.SerializerMethodField(method_name="get_first_practice")
    SecondPractice = serializers.SerializerMethodField(method_name="get_second_practice")
    ThirdPractice = serializers.SerializerMethodField(method_name="get_third_practice")
    Qualifying = serializers.SerializerMethodField(method_name="get_qualifying")
    Sprint = serializers.SerializerMethodField(method_name="get_sprint")

    def get_session_date_time(self, race: Race, session_type: SessionType) -> dict:
        session = None
        for sess in race.sessions.all():
            if sess.type == session_type:
                session = sess
                break
        if session is None or (session.time is None and session.date is None):
            return None
        time = {}
        if session.date:
            time["date"] = session.date
        if session.time:
            time["time"] = f"{session.time}Z"

        return time

    def get_first_practice(self, race: Race):
        return self.get_session_date_time(race, SessionType.PRACTICE_ONE)

    def get_second_practice(self, race: Race):
        return self.get_session_date_time(race, SessionType.PRACTICE_TWO)

    def get_third_practice(self, race: Race):
        return self.get_session_date_time(race, SessionType.PRACTICE_THREE)

    def get_qualifying(self, race: Race):
        return self.get_session_date_time(race, SessionType.QUALIFYING_ONE)

    def get_sprint(self, race: Race):
        return self.get_session_date_time(race, SessionType.SPRINT_RACE)

    class Meta:
        model = Race
        fields = [
            *BaseRaceSerializer.Meta.fields,
            "FirstPractice",
            "SecondPractice",
            "ThirdPractice",
            "Qualifying",
            "Sprint",
        ]


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


def format_timedelta(time: timedelta) -> str:
    total_seconds = time.total_seconds()
    hours, mins, secs, millis = (
        total_seconds // (60 * 60),
        (total_seconds % (60 * 60)) // 60,
        total_seconds % (60) // 1,
        (total_seconds % 1) * 1000 // 1,
    )
    display_time = ""
    if hours:
        display_time += f"{int(hours):02}:"
    if mins:
        display_time += f"{int(mins):02}:"
    display_time += f"{int(secs):02}.{int(millis):03}"
    if display_time[0] == "0":
        display_time = display_time[1:]
    return display_time


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
                race_results[race_id] = BaseRaceSerializer().to_representation(session_entry.race_entry.race)
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
                    case SessionStatus.DID_NOT_START:
                        result["positionText"] = "W"
                    case SessionStatus.DISQUALIFIED:
                        result["positionText"] = "D"
                    case SessionStatus.DID_NOT_START:
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
            time_diff = finish_time - winner_time
            time = f"+{format_timedelta(time_diff)}"

        return time

    class Meta:
        model = SessionEntry


class RaceResultsSerializer(ErgastModelSerializer):
    results_list_name = "Results"
    results_session_type = SessionType.RACE

    class Meta:
        model = SessionEntry
        fields = []
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
        driver_session_entries: QuerySet[SessionEntry] = (
            SessionEntry.objects.filter(race_entry__in=race_entries, session__type__startswith="Q")
            .order_by("session__date")
            .select_related("session", "fastest_lap")
        )

        race_results = {}
        race_entry_set = {}
        for race_entry in race_entries:
            race_entry_set[race_entry.pk] = (race_entry, [])

            race_results[race_entry.race.pk] = BaseRaceSerializer().to_representation(race_entry.race)
            race_results[race_entry.race.pk][self.child.results_list_name] = []

        for session_entry in driver_session_entries:
            race_entry_set[session_entry.race_entry_id][1].append(session_entry)

        for race_entry, driver_session_entries in race_entry_set.values():
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
        fields = []
        list_serializer_class = ListQualifyingSerializer


class ListPitStopSerializer(serializers.ListSerializer):
    def to_representation(self, pit_stops: QuerySet[PitStop]) -> Any:
        is_single = False
        if isinstance(pit_stops, PitStop):
            pit_stops = (
                PitStop.objects.filter(pk=pit_stops.pk).select_related("session_entry__race_entry__race").distinct()
            )
            is_single = True

        race_results = {}
        pit_stop_set = {}
        for pit_stop in pit_stops:
            pit_stop_set[pit_stop] = []

            race_results[pit_stop.session_entry.race_entry.race.pk] = BaseRaceSerializer().to_representation(
                pit_stop.session_entry.race_entry.race
            )
            race_results[pit_stop.session_entry.race_entry.race.pk][self.child.results_list_name] = []

        for pit_stop in pit_stops:
            race_id = pit_stop.session_entry.race_entry.race_id
            result = {
                "driverId": pit_stop.session_entry.race_entry.team_driver.driver.reference,
                "lap": str(pit_stop.lap.number),
                "stop": str(pit_stop.number),
                "time": pit_stop.local_timestamp,
                "duration": str(pit_stop.duration).lstrip("0:")[:-3],
            }

            race_results[race_id][self.child.results_list_name].append(result)

        results = list(race_results.values())
        if is_single:
            return results[0]
        return results

    class Meta:
        model = PitStop


class PitStopSerializer(ErgastModelSerializer):
    results_list_name = "PitStops"

    class Meta:
        model = PitStop
        fields = []
        list_serializer_class = ListPitStopSerializer


class ListLapSerializer(serializers.ListSerializer):
    def to_representation(self, laps: QuerySet[Lap]) -> Any:
        is_single = False
        if isinstance(laps, Lap):
            laps = Lap.objects.filter(pk=laps.pk).select_related("session_entry__race_entry__race").distinct()
            is_single = True

        race_results = {}
        lap_set = {}
        for lap in laps:
            lap_set[lap] = []

            race_results[lap.session_entry.race_entry.race.pk] = BaseRaceSerializer().to_representation(
                lap.session_entry.race_entry.race
            )
            race_results[lap.session_entry.race_entry.race.pk][self.child.results_list_name] = []

        lap_groupings = {}
        last_lap_number = -1
        for lap in laps:
            race_id = lap.session_entry.race_entry.race_id

            if lap.number not in lap_groupings.keys():
                lap_groupings[lap.number] = {
                    "number": str(lap.number),
                    "Timings": [],
                }

            if last_lap_number != lap.number:
                last_lap_number = lap.number
                race_results[race_id][self.child.results_list_name].append(lap_groupings[lap.number])

            lap_groupings[lap.number]["Timings"].append(
                {
                    "driverId": lap.session_entry.race_entry.team_driver.driver.reference,
                    "position": str(lap.position),
                    "time": format_timedelta(lap.time),
                }
            )

        results = list(race_results.values())
        if is_single:
            return results[0]
        return results

    class Meta:
        model = Lap


class LapSerializer(ErgastModelSerializer):
    results_list_name = "Laps"

    class Meta:
        model = Lap
        fields = []
        list_serializer_class = ListLapSerializer


def race_points_to_championship_points(year: int, round_points: dict[int, float]) -> float:
    """Calculate championship points from using eligible race points for a given year

    Args:
        year: The year of the eligible results ruleset to be applied
        round_points: Dictionary of round number to points scored

    Returns:
        Overall Championship Points for given race results
    """
    debug = sum(round_points.values()) > 30
    if debug:
        print(round_points)
    if year >= 1991:  # Sum all points
        return sum(round_points.values())
    elif year >= 1981:  # Best 11 points
        return sum(
            sorted(
                round_points.values(),
                reverse=True,
            )[:11]
        )

    # Seasons with 2 groups of eligible races
    if year == 1980:
        rounds_in_first_split = 7
        best_n_races_in_split = (5, 5)
    else:
        return -1

    split_round_points = ([], [])
    for key, points in round_points.items():
        if key <= rounds_in_first_split:
            split_round_points[0].append(points)
        else:
            split_round_points[1].append(points)
    points_splits = (
        (sorted(split_round_points[0], reverse=True)[: best_n_races_in_split[0]]),
        (sorted(split_round_points[1], reverse=True)[: best_n_races_in_split[1]]),
    )
    if debug:
        print(points_splits)
    return sum(points_splits[0]) + sum(points_splits[1])


class DriverStandingSerializer(ErgastModelSerializer):
    def to_representation(self, instance: Driver) -> Any:
        season_year = instance.season_year

        round_points = defaultdict(float)
        for team_driver in instance.team_drivers.all():
            for race_entry in team_driver.race_entries.all():
                if race_entry.race_points:
                    round_points[race_entry.race_round] += race_entry.race_points

        points = race_points_to_championship_points(season_year, round_points)

        if points % 1 == 0:
            points = int(points)

        # Temporary fix for 2023 tie, will be fixed with generated table views
        override_position_text = None
        if season_year == 2023:
            if instance.reference == "leclerc":
                instance.position = 5
            elif instance.reference == "alonso":
                instance.position = 4
        elif season_year == 1997:
            if instance.position == 2:
                instance.position = 26
                override_position_text = "D"
            elif instance.position > 2:
                instance.position = instance.position - 1
        return {
            "position": f"{instance.position}",
            "positionText": f"{instance.position}" if override_position_text is None else override_position_text,
            "points": f"{points}",
            "wins": f"{instance.wins}",
            "Driver": DriverSerializer().to_representation(instance),
            "Constructors": ConstructorSerializer(many=True).to_representation(instance.season_teams),
        }

    class Meta:
        model = Driver
        fields = "__all__"
