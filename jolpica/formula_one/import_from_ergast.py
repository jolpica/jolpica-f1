# type: ignore
from collections import defaultdict
from datetime import datetime, time, timedelta
from time import perf_counter

import requests
from django.contrib.gis.geos import Point
from django.core.management import call_command
from django.db.models import F, Prefetch, Q
from tqdm import tqdm

from jolpica.ergast.models import (
    Circuits,
    Constructors,
    Drivers,
    PitStops,
    Qualifying,
    Races,
    Results,
    Seasons,
    SprintResults,
    Status,
)
from jolpica.formula_one.data_correction import run_data_correction
from jolpica.formula_one.models import (
    ChampionshipSystem,
    Circuit,
    Driver,
    Lap,
    PitStop,
    PointSystem,
    Round,
    RoundEntry,
    Season,
    Session,
    SessionEntry,
    SessionStatus,
    SessionType,
    Team,
    TeamDriver,
)
from jolpica.formula_one.models.managed_views import DriverChampionship, TeamChampionship
from jolpica.formula_one.standings import Group, SeasonData


def str_to_delta(timestamp: str | None) -> timedelta | None:
    if timestamp is None or timestamp == "nan":
        return None
    t = datetime.strptime(timestamp, "%M:%S.%f")
    return timedelta(minutes=t.minute, seconds=t.second, microseconds=t.microsecond)


def follow_wiki_redirects(url: str) -> str:
    """Get URL that wikipedia will redirect to"""
    return url
    title = url.lstrip("http://")
    title = title.lstrip("https://")
    title = title.lstrip("en.wikipedia.org/wiki/")
    if "#" in title:
        title, end = title.rsplit("#")
        end = "#" + end
    else:
        end = ""
    query = requests.get(
        r"https://en.wikipedia.org/w/api.php" + r"?action=query" + r"&redirects&format=json" + rf"&titles={title}",
        timeout=10,
    )
    data = query.json()

    if data.get("query", {}).get("redirects"):
        title = data["query"]["redirects"][-1]["to"]
    new_url = f"https://en.wikipedia.org/wiki/{title}{end}"
    return new_url


def get_point_system(year: int, ref: str) -> PointSystem:
    if year <= 1953:
        return 2
    elif year <= 1954:
        return 3
    elif year <= 1955:
        return 4
    elif year <= 1957:
        return 5
    elif year <= 1959 and ref == "indianapolis":
        return 7
    elif year <= 1959:
        return 6
    elif year <= 1960 and ref == "indianapolis":
        return 9
    elif year <= 1960:
        return 8
    elif year <= 1961:
        return 10
    elif year <= 1974:
        return 11
    elif year <= 1979:
        return 12
    elif year <= 1990:
        return 13
    elif year <= 2002:
        return 14
    elif year <= 2009:
        return 15
    elif year == 14 and ref == "yas_marina":
        return 17
    elif year <= 2018:
        return 16
    elif year <= 2021:
        return 18
    elif year <= 2022:
        return 20
    elif year <= 2024:
        return 22
    raise NotImplementedError(f"{year} point system not implemented")


def year_to_championship_system(year: int) -> ChampionshipSystem:
    if year >= 1950 and year <= 1953:
        ref = "s1950"
    elif year >= 1954 and year <= 1957:
        ref = "s1954"
    elif year in (1958, 1960, 1963, 1964, 1965):
        ref = "s1958"
    elif year in (1959, 1961, 1962, 1966):
        ref = "s1959"
    elif year >= 1967 and year <= 1978:
        ref = "s1967"
    elif year == 1979:
        ref = "s1979"
    elif year == 1980:
        ref = "s1980"
    elif year >= 1981 and year <= 1990:
        ref = "s1981"
    elif year >= 1991 and year <= 2001:
        ref = "s1991"
    elif year >= 2002:
        ref = "s2002"
    else:
        raise ValueError(f"Invalid year: {year}")
    return ChampionshipSystem.objects.get(reference=ref)


# fmt: off
status_mapping = {
    "FINISHED": (Status.objects.filter(status__in=["Finished"]).values_list("pk", flat=True)),
    "LAPPED": (Status.objects.filter(
        Q(status__in=["Not classified"]) | Q(status__contains="Lap")
        ).values_list( "pk", flat=True)
    ),
    "ACCIDENT": (Status.objects.filter(
        status__in=["Accident", "Collision", "Spun off", "Collision damage"],
        ).values_list( "pk", flat=True)
    ),
    "RETIRED": (Status.objects.filter(
        status__in=[
            "Damage", "Retired", "Debris", "Driver unwell", "Fatal accident",
            "Eye injury", "Illness", "Out of fuel", "Puncture", "Tyre puncture",
            "Injury", "Safety concerns", "Safety", "Injured", "Engine",
            "Gearbox", "Transmission", "Clutch", "Hydraulics", "Electrical",
            "Radiator", "Suspension", "Brakes", "Differential", "Overheating",
            "Mechanical", "Tyre", "Driver Seat", "Driveshaft", "Fuel pressure",
            "Front wing", "Water pressure", "Refuelling", "Wheel", "Throttle",
            "Steering", "Technical", "Electronics", "Broken wing", "Exhaust",
            "Heat shield fire", "Oil leak", "Wheel rim", "Water leak", "Fuel pump",
            "Track rod", "Oil pressure", "Engine fire", "Engine misfire", "Wheel nut",
            "Pneumatics", "Handling", "Handling", "Rear wing", "Fire",
            "Wheel bearing", "Physical", "Fuel system", "Oil line", "Fuel rig",
            "Launch control", "Fuel", "Power loss", "Vibrations", "Ignition",
            "Drivetrain", "Chassis", "Battery", "Stalled", "Halfshaft",
            "Crankshaft", "Alternator", "Oil pump", "Fuel leak", "Injection",
            "Distributor", "Turbo", "CV joint", "Water pump", "Spark plugs",
            "Fuel pipe", "Oil pipe", "Axle", "Water pipe", "Magneto",
            "Supercharger", "Power Unit", "ERS", "Brake duct", "Seat",
            "Undertray", "Cooling system", "Safety belt",
        ]
    ).values_list("pk", flat=True)),
    "DISQUALIFIED": (Status.objects.filter(status__in=["Disqualified", "Underweight", "Excluded"]).values_list(
        "pk", flat=True
    )),
    "DID_NOT_START": (Status.objects.filter(status__in=["Withdrew", "Not restarted"]).values_list("pk", flat=True)),
    "DID_NOT_QUALIFY": (
        Status.objects.filter(status__in=["107% Rule", "Did not qualify"]).values_list("pk", flat=True)
    ),
    "DID_NOT_PREQUALIFY": (Status.objects.filter(status__in=["Did not prequalify"]).values_list("pk", flat=True)),
}
# fmt: on


def map_status(status_id, qualifying=False, pos_text: str = "") -> None | SessionStatus:
    chosen_key = None
    if pos_text == "W":
        return SessionStatus.DID_NOT_START
    for key, status_ids in status_mapping.items():
        if status_id in status_ids:
            chosen_key = key
            break
    if chosen_key is None:
        raise NotImplementedError()

    if qualifying is False or (chosen_key in ["DID_NOT_QUALIFY", "DID_NOT_PREQUALIFY"]):
        return SessionStatus[chosen_key]
    else:
        return None


def import_circuits() -> dict:
    """Import data from Ergast Circuits to Jolpica Circuit

    Returns:
        Mapping of Ergast Circuit PK to Jolpica Circuit PK
    """
    new_circuits = []
    circuit_map = {}
    completed = set()
    count = 1
    for circ in tqdm(Circuits.objects.all().order_by("races").distinct(), desc="Circuits"):
        if circ.pk in completed:
            continue
        circuit_map[circ.pk] = count
        new_circuits.append(
            Circuit(
                pk=count,
                reference=circ.circuitRef,
                name=circ.name,
                locality=circ.location,
                country=circ.country,
                location=Point(circ.lng, circ.lat, srid=4326),
                altitude=circ.alt,
                wikipedia=follow_wiki_redirects(circ.url),
            )
        )
        count = count + 1
        completed.add(circ.pk)
    Circuit.objects.bulk_create(
        new_circuits,
        batch_size=1000,
        update_conflicts=True,
        unique_fields=["reference"],
        update_fields=["name", "locality", "country", "location", "altitude", "wikipedia"],
    )
    return circuit_map


def import_seasons() -> dict:
    new_seasons = []
    season_map = {}
    completed = set()
    count = 1
    for er_season in tqdm(Seasons.objects.all().order_by("year"), desc="Seasons"):
        if er_season.pk in completed:
            continue
        season_map[er_season.pk] = count
        new_seasons.append(
            Season(
                pk=count,
                year=er_season.year,
                wikipedia=follow_wiki_redirects(er_season.url),
                championship_system=year_to_championship_system(er_season.year),
            )
        )
        count = count + 1
        completed.add(er_season.pk)
    Season.objects.bulk_create(
        new_seasons,
        batch_size=1000,
        update_conflicts=True,
        unique_fields=["year"],
        update_fields=["wikipedia", "championship_system"],
    )
    return season_map


def import_teams():
    new_teams = []
    team_map = {}
    completed = set()
    count = 1

    constructors = Constructors.objects.order_by("results__raceId", "-results__position").distinct()
    for item in tqdm(constructors, desc="Teams"):
        if item.pk in completed:
            continue
        team_map[item.pk] = count
        new_teams.append(
            Team(
                pk=count,
                base_team=None,
                reference=item.constructorRef,
                name=item.name,
                nationality=item.nationality,
                wikipedia=item.url,
            )
        )
        count = count + 1
        completed.add(item.pk)
    Team.objects.bulk_create(
        new_teams,
        batch_size=1000,
        update_conflicts=True,
        unique_fields=["reference"],
        update_fields=["base_team", "name", "nationality", "wikipedia"],
    )
    return team_map


def import_drivers():
    drivers_to_add = []
    driver_map = {}
    completed = set()
    count = 1

    drivers = Drivers.objects.order_by("results__raceId", "results__positionOrder").distinct()
    for er_driver in tqdm(drivers, desc="Drivers"):
        if er_driver.pk in completed:
            continue
        driver_map[er_driver.pk] = count
        new_item = Driver(
            pk=count,
            reference=er_driver.driverRef,
            forename=er_driver.forename,
            surname=er_driver.surname,
            abbreviation=er_driver.code,
            nationality=er_driver.nationality,
            permanent_car_number=er_driver.number,
            date_of_birth=er_driver.dob,
            wikipedia=er_driver.url,
        )
        drivers_to_add.append(new_item)
        count = count + 1
        completed.add(er_driver.pk)
    Driver.objects.bulk_create(
        drivers_to_add,
        batch_size=1000,
        update_conflicts=True,
        unique_fields=["reference"],
        update_fields=[
            "forename",
            "surname",
            "abbreviation",
            "nationality",
            "permanent_car_number",
            "date_of_birth",
            "wikipedia",
        ],
    )
    return driver_map


def import_rounds_and_sessions(season_map: dict, circuit_map: dict) -> dict:
    round_map = {}
    round_to_race_session_map = {}
    completed = set()
    count = 1
    session_count = 1
    round_to_add = []
    sessions_to_add = []
    second_session_bests_to_add = []
    for er_race in tqdm(
        Races.objects.all().annotate(ann_circuit_ref=F("circuitId__circuitRef")), desc="Race & Sessions"
    ):
        sessions_in_round: list[Session] = []
        if er_race.pk in completed:
            continue
        round_map[er_race.pk] = count
        new_item = Round(
            pk=count,
            season_id=season_map[er_race.year_id],
            circuit_id=circuit_map[er_race.circuitId_id],
            number=er_race.round,
            name=er_race.name,
            date=er_race.date,
            race_number=count,
            wikipedia=follow_wiki_redirects(er_race.url),
            is_cancelled=False,
        )
        round_to_add.append(new_item)
        race_session = Session(
            pk=session_count,
            round=new_item,
            point_system_id=get_point_system(er_race.year_id, er_race.ann_circuit_ref),
            type=SessionType.RACE,
            date=er_race.date,
            time=er_race.time,
            scheduled_laps=None,
        )
        round_to_race_session_map[new_item.pk] = race_session.pk
        sessions_in_round.append(race_session)
        session_count += 1
        if (er_race.year_id >= 1950 and er_race.year_id <= 1995) or er_race.year_id == 2003:
            if er_race.year_id == 2003:
                double_bests = False
                quali_types = SessionType.QUALIFYING_ORDER, SessionType.QUALIFYING_BEST
            else:
                double_bests = True
                quali_types = SessionType.QUALIFYING_BEST, SessionType.QUALIFYING_BEST
            first_quali = 3 if new_item.circuit.reference == "monaco" else 2
            sessions_in_round.append(
                Session(
                    pk=session_count,
                    round=new_item,
                    point_system_id=1,
                    type=quali_types[0],
                    date=new_item.date - timedelta(first_quali),
                )
            )
            session_count += 1
            second_q_sess = Session(
                pk=session_count,
                round=new_item,
                point_system_id=1,
                type=quali_types[1],
                date=new_item.date - timedelta(1),
            )
            if double_bests:
                second_session_bests_to_add.append(second_q_sess)
            else:
                sessions_in_round.append(second_q_sess)
            session_count += 1
        elif er_race.year_id >= 1996 and er_race.year_id <= 2002:
            sessions_in_round.append(
                Session(
                    pk=session_count,
                    round=new_item,
                    point_system_id=1,
                    type=SessionType.QUALIFYING_BEST,
                    date=new_item.date - timedelta(1),
                )
            )
            session_count += 1
        elif er_race.year_id == 2004:
            sessions_in_round.append(
                Session(
                    pk=session_count,
                    round=new_item,
                    point_system_id=1,
                    type=SessionType.QUALIFYING_ORDER,
                    date=new_item.date - timedelta(1),
                )
            )
            session_count += 1
            sessions_in_round.append(
                Session(
                    pk=session_count,
                    round=new_item,
                    point_system_id=1,
                    type=SessionType.QUALIFYING_BEST,
                    date=new_item.date - timedelta(1),
                )
            )
            session_count += 1
        elif er_race.year_id == 2005:
            if er_race.round <= 6:
                sessions_in_round.append(
                    Session(
                        pk=session_count,
                        round=new_item,
                        point_system_id=1,
                        type=SessionType.QUALIFYING_AVG,
                        date=new_item.date - timedelta(1),
                    )
                )
                session_count += 1
                sessions_in_round.append(
                    Session(
                        pk=session_count,
                        round=new_item,
                        point_system_id=1,
                        type=SessionType.QUALIFYING_AVG,
                        date=new_item.date - timedelta(0),
                    )
                )
                session_count += 1
            else:
                sessions_in_round.append(
                    Session(
                        pk=session_count,
                        round=new_item,
                        point_system_id=1,
                        type=SessionType.QUALIFYING_BEST,
                        date=new_item.date - timedelta(1),
                    )
                )
                session_count += 1
        elif er_race.year_id >= 2006:
            date = er_race.quali_date if er_race.quali_date else new_item.date - timedelta(1)
            sessions_in_round.append(
                Session(
                    pk=session_count,
                    round=new_item,
                    point_system_id=1,
                    type=SessionType.QUALIFYING_ONE,
                    date=date,
                    time=er_race.quali_time,
                )
            )
            session_count += 1
            sessions_in_round.append(
                Session(
                    pk=session_count,
                    round=new_item,
                    point_system_id=1,
                    type=SessionType.QUALIFYING_TWO,
                    date=date,
                    time=er_race.quali_time,
                )
            )
            session_count += 1
            sessions_in_round.append(
                Session(
                    pk=session_count,
                    round=new_item,
                    point_system_id=1,
                    type=SessionType.QUALIFYING_THREE,
                    date=date,
                    time=er_race.quali_time,
                )
            )
            session_count += 1
        # free practice
        if er_race.year_id >= 2006 and er_race.year_id < 2021:
            days_before = 3 if new_item.circuit.reference == "monaco" else 2
            fp1_date = er_race.fp1_date if er_race.fp1_date else er_race.date - timedelta(days_before)
            fp2_date = er_race.fp2_date if er_race.fp2_date else er_race.date - timedelta(days_before)
            fp3_date = er_race.fp3_date if er_race.fp3_date else er_race.date - timedelta(1)
            sessions_in_round.append(
                Session(
                    pk=session_count,
                    round=new_item,
                    point_system_id=1,
                    type=SessionType.PRACTICE_ONE,
                    date=fp1_date,
                    time=er_race.fp1_time,
                )
            )
            session_count += 1
            sessions_in_round.append(
                Session(
                    pk=session_count,
                    round=new_item,
                    point_system_id=1,
                    type=SessionType.PRACTICE_TWO,
                    date=fp2_date,
                    time=er_race.fp2_time,
                )
            )
            session_count += 1
            sessions_in_round.append(
                Session(
                    pk=session_count,
                    round=new_item,
                    point_system_id=1,
                    type=SessionType.PRACTICE_THREE,
                    date=fp3_date,
                    time=er_race.fp3_time,
                )
            )
            session_count += 1

        if er_race.fp1_date:
            sessions_in_round.append(
                Session(
                    pk=session_count,
                    round=new_item,
                    point_system_id=1,
                    type=SessionType.PRACTICE_ONE,
                    date=er_race.fp1_date,
                    time=er_race.fp1_time,
                )
            )
            session_count += 1
        # If fp2 date make fp2 session, unless year is >= 2023, then a sprint quali should be created
        if er_race.fp2_date and not (er_race.year_id >= 2023 and er_race.sprint_date):
            sessions_in_round.append(
                Session(
                    pk=session_count,
                    round=new_item,
                    point_system_id=1,
                    type=SessionType.PRACTICE_TWO,
                    date=er_race.fp2_date,
                    time=er_race.fp2_time,
                )
            )
            session_count += 1
        if er_race.fp3_date:
            sessions_in_round.append(
                Session(
                    pk=session_count,
                    round=new_item,
                    point_system_id=1,
                    type=SessionType.PRACTICE_THREE,
                    date=er_race.fp3_date,
                    time=er_race.fp3_time,
                )
            )
            session_count += 1
        # sprints
        if er_race.year_id <= 2022 and er_race.sprint_date:
            point_id = 19 if er_race.year_id == 2021 else 21
            sessions_in_round.append(
                Session(
                    pk=session_count,
                    round=new_item,
                    point_system_id=point_id,
                    type=SessionType.SPRINT_RACE,
                    date=er_race.sprint_date,
                    time=er_race.sprint_time,
                )
            )
            session_count += 1
        elif er_race.sprint_date:
            for ty in [SessionType.SPRINT_QUALIFYING1, SessionType.SPRINT_QUALIFYING2, SessionType.SPRINT_QUALIFYING3]:
                sessions_in_round.append(
                    Session(
                        pk=session_count,
                        round=new_item,
                        point_system_id=1,
                        type=ty,
                        date=er_race.fp2_date,
                        time=er_race.fp2_time,
                    )
                )
                session_count += 1
            sessions_in_round.append(
                Session(
                    pk=session_count,
                    round=new_item,
                    point_system_id=23,
                    type=SessionType.SPRINT_RACE,
                    date=er_race.sprint_date,
                    time=er_race.sprint_time,
                )
            )
            session_count += 1
        # Add session numbers by date
        sessions_in_round = sorted(sessions_in_round, key=lambda x: (x.date, x.time if x.time else time(23, 59)))
        for i, session in enumerate(sessions_in_round):
            session.number = i + 1
        count = count + 1
        sessions_to_add.extend(sessions_in_round)
        completed.add(er_race.pk)
    Round.objects.bulk_create(
        round_to_add,
        batch_size=1000,
        update_conflicts=True,
        unique_fields=["season_id", "number"],
        update_fields=["circuit_id", "name", "date", "race_number", "wikipedia", "is_cancelled"],
    )
    Session.objects.bulk_create(
        sessions_to_add,
        batch_size=1000,
        update_conflicts=True,
        unique_fields=["pk"],
        update_fields=["round", "type", "point_system_id", "date", "time"],
    )
    Session.objects.bulk_create(
        second_session_bests_to_add,
        batch_size=1000,
        update_conflicts=True,
        unique_fields=["pk"],
        update_fields=["round", "type", "point_system_id", "date", "time"],
    )
    return round_map, round_to_race_session_map


def import_teamdrivers_and_raceentries(
    season_map, driver_map, team_map, round_map, round_to_race_session_map
) -> tuple[dict, dict]:
    completed = set()
    count = 1
    team_driver_count = 1

    team_driver_map = {}
    round_entry_map = {}
    round_entry_to_race_session_map = {}
    results_list = (
        Results.objects.all()
        .order_by("raceId", "positionOrder")
        .annotate(ann_year=F("raceId__year_id"), ann_status_detail=F("statusId__status"))
    )

    team_drivers_to_add = []
    round_entries_to_add = []
    for item in tqdm(results_list, desc="round Entries"):
        season_id = season_map[item.ann_year]
        driver_id = driver_map[item.driverId_id]
        team_id = team_map[item.constructorId_id]
        if item.pk in completed:
            continue
        completed.add(item.pk)
        team_driver = team_driver_map.get((season_id, team_id, driver_id))
        if team_driver is None:
            team_driver = TeamDriver(
                pk=team_driver_count,
                season_id=season_id,
                team_id=team_id,
                driver_id=driver_id,
            )
            team_driver_count += 1
            team_driver_map[(season_id, team_id, driver_id)] = team_driver
            team_drivers_to_add.append(team_driver)
        round_entry = RoundEntry(
            pk=count,
            round_id=round_map[item.raceId_id],
            team_driver=team_driver,
            car_number=item.number,
        )
        round_entry_map[item.pk] = round_entry.pk
        round_entry_to_race_session_map[round_entry.pk] = round_to_race_session_map[round_entry.round_id]
        round_entries_to_add.append(round_entry)
        count = count + 1
    TeamDriver.objects.bulk_create(
        team_drivers_to_add,
        batch_size=1000,
        update_conflicts=True,
        unique_fields=["id"],
        update_fields=["season_id", "team_id", "driver_id"],
    )
    RoundEntry.objects.bulk_create(round_entries_to_add, batch_size=1000, ignore_conflicts=True)
    return round_entry_map, round_entry_to_race_session_map


def run_import():
    if PitStops.objects.filter(lap__isnull=True).count() != 0:
        raise ValueError("pitstop without a lap")
    # point system fixtures
    call_command("loaddata", "jolpica/formula_one/fixtures/point_systems.json")
    call_command("loaddata", "jolpica/formula_one/fixtures/championship_systems.json")
    ChampionshipSystem.objects.get(reference="s2002")

    # Data Fixes
    # wrong constructor in quali
    old_results = set(Results.objects.all().values_list("raceId_id", "driverId_id", "constructorId_id").distinct())
    old_qresults = set(Qualifying.objects.all().values_list("raceId_id", "driverId_id", "constructorId_id").distinct())
    for r in old_qresults:
        if r not in old_results:
            q = Qualifying.objects.get(raceId_id=r[0], driverId_id=r[1], constructorId_id=206)
            q.constructorId_id = 209
            q.save()
    # wrong car number in quali
    old_results = set(
        Results.objects.all().values_list("raceId_id", "driverId_id", "constructorId_id", "number").distinct()
    )
    old_qresults = set(
        Qualifying.objects.all().values_list("raceId_id", "driverId_id", "constructorId_id", "number").distinct()
    )
    for r in old_qresults.difference(old_results):
        res = Results.objects.get(raceId_id=r[0], driverId_id=r[1], constructorId_id=r[2])
        sprint = Qualifying.objects.get(raceId_id=r[0], driverId_id=r[1], constructorId_id=r[2], number=r[3])
        sprint.number = res.number
        sprint.save()

    # Circuits
    circuit_map = import_circuits()

    # Seasons
    season_map = import_seasons()

    # Teams
    team_map = import_teams()

    # Drivers
    driver_map = import_drivers()

    # Championship Adjustments
    call_command("loaddata", "jolpica/formula_one/fixtures/championship_adjustments.json")

    # Races and Sessions
    round_map, round_to_race_session_map = import_rounds_and_sessions(season_map, circuit_map)

    # Race Entries

    round_entry_map, round_entry_to_race_session_map = import_teamdrivers_and_raceentries(
        season_map, driver_map, team_map, round_map, round_to_race_session_map
    )

    laps_to_add = []
    pitstops_to_add = []
    new_session_entries = []
    # Prepare the DB queries into maps so only a single db call is needed
    quali_filtered = defaultdict(lambda: None)
    for quali in tqdm(Qualifying.objects.all(), desc="Filtering quali"):
        quali_filtered[(quali.raceId_id, quali.driverId_id, quali.constructorId_id)] = quali
    sprint_filtered = defaultdict(lambda: None)

    for sprint in tqdm(
        SprintResults.objects.all().annotate(ann_status_detail=F("statusId__status")), desc="Filtering sprints"
    ):
        sprint_filtered[(sprint.raceId_id, sprint.driverId_id, sprint.constructorId_id)] = sprint

    results_list = (
        Results.objects.all()
        .order_by("raceId", "positionOrder")
        .annotate(ann_year=F("raceId__year_id"), ann_status_detail=F("statusId__status"))
        .prefetch_related(
            Prefetch(
                "raceId",
                Races.objects.all().prefetch_related("laptimes_set", "pitstops_set"),
                to_attr="fetched_race",
            ),
        )
    )
    lap_count = 1
    entry_count = 1
    fastest_laps = []
    for result in tqdm(results_list, desc="Session Entries"):
        round_entry_id = round_entry_map[result.pk]
        sess_entry = SessionEntry(
            pk=entry_count,
            session_id=round_entry_to_race_session_map[round_entry_id],
            round_entry_id=round_entry_id,
            position=result.positionOrder,
            is_classified=result.position is not None,
            status=map_status(result.statusId_id, pos_text=result.positionText),
            detail=result.ann_status_detail,
            points=result.points,
            grid=result.grid,
            time=timedelta(milliseconds=result.milliseconds) if result.milliseconds else None,
            laps_completed=result.laps,
            fastest_lap_rank=result.rank,
        )
        laps = result.fetched_race.laptimes_set.all()
        pitstops = result.fetched_race.pitstops_set.all()
        pit_dict = {}
        for pit in pitstops:
            if pit.driverId != result.driverId:
                continue
            pit_dict[pit.lap] = {"stop": pit.stop, "time": pit.time, "milliseconds": pit.milliseconds}
        fastest_lap_obj = None
        for lap in laps:
            if lap.driverId != result.driverId:
                continue
            new_lap = Lap(
                id=lap_count,
                session_entry=sess_entry,
                number=lap.lap,
                position=lap.position,
                time=timedelta(milliseconds=lap.milliseconds),
            )
            laps_to_add.append(new_lap)
            lap_count += 1
            if lap.lap == result.fastestLap:
                new_lap.is_entry_fastest_lap = True
                fastest_lap_obj = new_lap
            if lap.lap in pit_dict:
                pitstops_to_add.append(
                    PitStop(
                        session_entry_id=sess_entry.pk,
                        lap=new_lap,
                        number=pit_dict[lap.lap]["stop"],
                        duration=timedelta(milliseconds=pit_dict[lap.lap]["milliseconds"])
                        if pit_dict[lap.lap]["milliseconds"]
                        else None,
                        local_timestamp=pit_dict[lap.lap]["time"],
                    )
                )
        new_session_entries.append(sess_entry)

        if result.fastestLap:
            if fastest_lap_obj:
                lap = fastest_lap_obj
            else:
                lap = Lap(
                    id=lap_count,
                    session_entry=sess_entry,
                    number=result.fastestLap,
                    is_entry_fastest_lap=True,
                )
                lap_count += 1
                laps_to_add.append(lap)
            fastest_laps.append(lap)
            if lap_time := str_to_delta(result.fastestLapTime):
                lap.time = lap_time
            lap.average_speed = result.fastestLapSpeed
        entry_count += 1

        quali = quali_filtered[(result.raceId_id, result.driverId_id, result.constructorId_id)]
        if quali:
            quali_sessions = (
                Session.objects.filter(round__round_entries=round_entry_id, type__startswith="Q")
                .exclude(type="QO")
                .order_by("pk")
            ).distinct("pk")
            for i, session in enumerate(quali_sessions):
                time = quali.q1 if i == 0 else (quali.q2 if i == 1 else quali.q3)
                time = str_to_delta(time)
                if time is None and (i != 0 or quali.position is None):
                    continue
                quali_entry = SessionEntry(
                    pk=entry_count,
                    session=session,
                    round_entry_id=round_entry_id,
                    position=quali.position,
                    status=map_status(result.statusId_id, qualifying=True),
                )
                if quali_entry.status:
                    quali_entry.detail = result.ann_status_detail
                new_session_entries.append(quali_entry)
                entry_count += 1
                # Skip adding a lap if someone didn't set a time, but competed in the session
                if time is not None:
                    lap = Lap(
                        id=lap_count,
                        session_entry=quali_entry,
                        number=None,
                        time=time,
                        average_speed=None,
                        is_entry_fastest_lap=True,
                    )
                    laps_to_add.append(lap)
                    fastest_laps.append(lap)
                    lap_count += 1
        sprint = sprint_filtered[(result.raceId_id, result.driverId_id, result.constructorId_id)]
        if sprint:
            sprint_entry = SessionEntry(
                pk=entry_count,
                session=Session.objects.get(round__round_entries=round_entry_id, type=SessionType.SPRINT_RACE),
                round_entry_id=round_entry_id,
                position=sprint.positionOrder,
                is_classified=sprint.position is not None,
                status=map_status(sprint.statusId_id),
                detail=sprint.ann_status_detail,
                points=sprint.points,
                grid=sprint.grid,
                time=timedelta(milliseconds=sprint.milliseconds) if sprint.milliseconds else None,
                laps_completed=sprint.laps,
            )
            new_session_entries.append(sprint_entry)
            entry_count += 1
            lap = Lap(
                id=lap_count,
                session_entry=sprint_entry,
                number=sprint.fastestLap,
                time=str_to_delta(sprint.fastestLapTime),
            )
            if lap.number or lap.time:
                lap_count += 1
                laps_to_add.append(lap)
                lap.is_entry_fastest_lap = True
                fastest_laps.append(lap)
        if len(new_session_entries) > 5000 or len(pitstops_to_add) > 5000:
            start = perf_counter()
            print("Creating objects...", end="\t")
            SessionEntry.objects.bulk_create(new_session_entries, batch_size=5000)
            print("SessionEntries created.", end="\t")
            Lap.objects.bulk_create(laps_to_add, batch_size=20000)
            print("Laps Created.", end="\t")
            PitStop.objects.bulk_create(pitstops_to_add, batch_size=10000)
            print("PitStops created.", end="\t")
            laps_to_add = []
            pitstops_to_add = []
            new_session_entries = []
            fastest_laps = []

    start = perf_counter()
    print("Creating objects...", end="\t")
    SessionEntry.objects.bulk_create(new_session_entries, batch_size=5000)
    print("SessionEntries created.", end="\t")
    Lap.objects.bulk_create(laps_to_add, batch_size=20000)
    print("Laps Created.", end="\t")
    PitStop.objects.bulk_create(pitstops_to_add, batch_size=10000)
    print("PitStops created.", end="\t")

    run_data_correction()

    print("Generating Team & Driver Standings...")
    start = perf_counter()
    team_standings = []
    driver_standings = []
    for season in Season.objects.all().select_related("championship_system"):
        season_data = SeasonData.from_season(season)
        driver_standings.extend(season_data.generate_standings(Group.DRIVER))
        team_standings.extend(season_data.generate_standings(Group.TEAM))
    DriverChampionship.objects.bulk_create(
        driver_standings,
        update_conflicts=True,
        unique_fields=["session_id", "driver_id"],
        update_fields=["season", "round"],
    )
    TeamChampionship.objects.bulk_create(team_standings)
    print(f"Team & Driver Standings created.\tTook {perf_counter() - start}")
