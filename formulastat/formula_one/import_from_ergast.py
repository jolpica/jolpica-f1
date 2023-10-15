# type: ignore
from datetime import timedelta

import requests
from django.contrib.gis.geos import Point
from tqdm import tqdm

from formulastat.ergast.models import Circuits, Constructors, Drivers, Races, Results, Seasons, Races
from formulastat.formula_one.models import Circuit, Driver, PointScheme, Season, Team, Race, Session, SessionType


def follow_wiki_redirects(url: str) -> str:
    """Get URL that wikipedia will redirect to"""
    title = url.lstrip("http://")
    title = title.lstrip("https://")
    title = title.lstrip("en.wikipedia.org/wiki/")
    if "#" in title:
        title, end = title.rsplit("#")
        end = "#" + end
    else:
        end = ""
    query = requests.get(
        r"https://en.wikipedia.org/w/api.php"
        + r"?action=query"
        + r"&redirects&format=json"
        + r"&titles={}".format(title)
    )
    data = query.json()

    if data.get("query", {}).get("redirects"):
        title = data["query"]["redirects"][-1]["to"]
    new_url = f"https://en.wikipedia.org/wiki/{title}{end}"
    return new_url


def get_point_scheme(year: int, ref: str) -> PointScheme:
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
    elif year <= 2023:
        return 22
    raise NotImplementedError()


# Circuits
circuit_map = {}
completed = set()
count = 1
for circ in tqdm(Circuits.objects.all().order_by("races").distinct()):
    if circ.pk in completed:
        continue
    circuit_map[circ.pk] = count
    new_circit = Circuit(
        pk=count,
        reference=circ.circuitRef,
        name=circ.name,
        city=circ.location,
        country=circ.country,
        location=Point(circ.lng, circ.lat, srid=4326),
        altitude=circ.alt,
        wikipedia=follow_wiki_redirects(circ.url),
    )
    new_circit.save()
    count = count + 1
    completed.add(circ.pk)

# Seasons
season_map = {}
completed = set()
count = 1
for item in tqdm(Seasons.objects.all().order_by("year")):
    if item.pk in completed:
        continue
    season_map[item.pk] = count
    new_item = Season(
        pk=count,
        year=item.year,
        wikipedia=follow_wiki_redirects(item.url),
    )
    new_item.save()
    count = count + 1
    completed.add(item.pk)

# Teams
team_map = {}
completed = set()
count = 1
item_ids = {}
for id in Results.objects.all().order_by("raceId", "-position").values_list("constructorId", flat=True):
    item_ids[id] = None

for item_id in tqdm(item_ids.keys()):
    if item_id in completed:
        continue
    item = Constructors.objects.get(pk=item_id)
    team_map[item.pk] = count
    new_item = Team(
        pk=count,
        base_team=None,
        reference=item.constructorRef,
        name=item.name,
        nationality=item.nationality,
        wikipedia=item.url,
    )
    new_item.save()
    count = count + 1
    completed.add(item.pk)


# Drivers
driver_map = {}
completed = set()
count = 1
item_ids = {}
for id in Results.objects.all().order_by("raceId", "-position").values_list("driverId", flat=True):
    item_ids[id] = None

for item_id in tqdm(item_ids.keys()):
    if item_id in completed:
        continue
    item = Drivers.objects.get(pk=item_id)
    driver_map[item.pk] = count
    new_item = Driver(
        pk=count,
        reference=item.driverRef,
        forename=item.forename,
        surname=item.surname,
        abbreviation=item.code,
        nationality=item.nationality,
        permanent_car_number=item.number,
        date_of_birth=item.dob,
        wikipedia=item.url,
    )
    new_item.save()
    count = count + 1
    completed.add(item.pk)

# Races and Sessions
race_map = {}
completed = set()
count = 1
session_count = 1
for item in tqdm(Races.objects.all()):
    if item.pk in completed:
        continue
    race_map[item.pk] = count
    new_item = Race(
        pk=count,
        season_id=season_map[item.year_id],
        circuit_id=circuit_map[item.circuitId_id],
        round=item.round,
        name=item.name,
        date=item.date,
        race_number=count,
        wikipedia=follow_wiki_redirects(item.url),
        is_cancelled=False,
    )
    new_item.save()
    race = Session(
        pk=session_count,
        race=new_item,
        point_scheme_id=get_point_scheme(item.year_id, item.circuitId.circuitRef),
        type=SessionType.RACE,
        date=item.date,
        time=item.time,
        scheduled_laps=None,
    )
    race.save()
    session_count += 1
    if (item.year_id >= 1950 and item.year_id <= 1995) or item.year_id == 2003:
        if item.year_id == 2003:
            quali_types = SessionType.QUALIFYING_ORDER, SessionType.QUALIFYING_BEST
        else:
            quali_types = SessionType.QUALIFYING_BEST, SessionType.QUALIFYING_BEST
        first_quali = 3 if new_item.circuit.reference == "monaco" else 2
        Session(
            pk=session_count,
            race=new_item,
            point_scheme_id=1,
            type=quali_types[0],
            date=new_item.date - timedelta(first_quali),
        ).save()
        session_count += 1
        Session(
            pk=session_count,
            race=new_item,
            point_scheme_id=1,
            type=quali_types[1],
            date=new_item.date - timedelta(1),
        ).save()
        session_count += 1
    elif item.year_id >= 1996 and item.year_id <= 2002:
        Session(
            pk=session_count,
            race=new_item,
            point_scheme_id=1,
            type=SessionType.QUALIFYING_BEST,
            date=new_item.date - timedelta(1),
        ).save()
        session_count += 1
    elif item.year_id == 2004:
        Session(
            pk=session_count,
            race=new_item,
            point_scheme_id=1,
            type=SessionType.QUALIFYING_ORDER,
            date=new_item.date - timedelta(1),
        ).save()
        session_count += 1
        Session(
            pk=session_count,
            race=new_item,
            point_scheme_id=1,
            type=SessionType.QUALIFYING_BEST,
            date=new_item.date - timedelta(1),
        ).save()
        session_count += 1
    elif item.year_id == 2005:
        if item.round <= 6:
            Session(
                pk=session_count,
                race=new_item,
                point_scheme_id=1,
                type=SessionType.QUALIFYING_AVG,
                date=new_item.date - timedelta(1),
            ).save()
            session_count += 1
            Session(
                pk=session_count,
                race=new_item,
                point_scheme_id=1,
                type=SessionType.QUALIFYING_AVG,
                date=new_item.date - timedelta(0),
            ).save()
            session_count += 1
        else:
            Session(
                pk=session_count,
                race=new_item,
                point_scheme_id=1,
                type=SessionType.QUALIFYING_BEST,
                date=new_item.date - timedelta(1),
            ).save()
            session_count += 1
    elif item.year_id >= 2006:
        date = item.quali_date if item.quali_date else new_item.date - timedelta(1)
        Session(
            pk=session_count,
            race=new_item,
            point_scheme_id=1,
            type=SessionType.QUALIFYING_ONE,
            date=date,
            time=item.quali_time,
        ).save()
        session_count += 1
        Session(
            pk=session_count,
            race=new_item,
            point_scheme_id=1,
            type=SessionType.QUALIFYING_TWO,
            date=date,
            time=item.quali_time,
        ).save()
        session_count += 1
        Session(
            pk=session_count,
            race=new_item,
            point_scheme_id=1,
            type=SessionType.QUALIFYING_THREE,
            date=date,
            time=item.quali_time,
        ).save()
        session_count += 1
    # free practice
    if item.year_id >= 2006 and item.year_id < 2021:
        days_before = 3 if new_item.circuit.reference == "monaco" else 2
        fp1_date = item.fp1_date if item.fp1_date else item.date - timedelta(days_before)
        fp2_date = item.fp2_date if item.fp2_date else item.date - timedelta(days_before)
        fp3_date = item.fp3_date if item.fp3_date else item.date - timedelta(1)
        Session(
            pk=session_count,
            race=new_item,
            point_scheme_id=1,
            type=SessionType.PRACTICE_ONE,
            date=fp1_date,
            time=item.fp1_time,
        ).save()
        session_count += 1
        Session(
            pk=session_count,
            race=new_item,
            point_scheme_id=1,
            type=SessionType.PRACTICE_TWO,
            date=fp2_date,
            time=item.fp2_time,
        ).save()
        session_count += 1
        Session(
            pk=session_count,
            race=new_item,
            point_scheme_id=1,
            type=SessionType.PRACTICE_THREE,
            date=fp3_date,
            time=item.fp3_time,
        ).save()
        session_count += 1

    if item.fp1_date:
        Session(
            pk=session_count,
            race=new_item,
            point_scheme_id=1,
            type=SessionType.PRACTICE_ONE,
            date=item.fp1_date,
            time=item.fp1_time,
        ).save()
        session_count += 1
    if item.fp2_date and item.year_id < 2023:
        Session(
            pk=session_count,
            race=new_item,
            point_scheme_id=1,
            type=SessionType.PRACTICE_TWO,
            date=item.fp2_date,
            time=item.fp2_time,
        ).save()
        session_count += 1
    if item.fp3_date:
        Session(
            pk=session_count,
            race=new_item,
            point_scheme_id=1,
            type=SessionType.PRACTICE_THREE,
            date=item.fp3_date,
            time=item.fp3_time,
        ).save()
        session_count += 1
    # sprints
    if item.year_id <= 2022 and item.sprint_date:
        point_id = 19 if item.year_id == 2021 else 21
        Session(
            pk=session_count,
            race=new_item,
            point_scheme_id=point_id,
            type=SessionType.SPRINT_RACE,
            date=item.sprint_date,
            time=item.sprint_time,
        ).save()
        session_count += 1
    elif item.sprint_date:
        for ty in [SessionType.SPRINT_QUALIFYING1, SessionType.SPRINT_QUALIFYING2, SessionType.SPRINT_QUALIFYING3]:
            Session(
                pk=session_count,
                race=new_item,
                point_scheme_id=1,
                type=ty,
                date=item.fp2_date,
                time=item.fp2_time,
            ).save()
            session_count += 1
        Session(
            pk=session_count,
            race=new_item,
            point_scheme_id=23,
            type=SessionType.SPRINT_RACE,
            date=item.sprint_date,
            time=item.sprint_time,
        ).save()
        session_count += 1
    count = count + 1
    completed.add(item.pk)