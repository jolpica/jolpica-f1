import pickle

import pytest

from ..ingest.parse import ObjectParser
from ..models import Lap, Season, SessionEntry, TeamDriver


@pytest.mark.django_db
def test_get_session_entry_exists():
    parser = ObjectParser()
    session_entry = parser.get_session_entry(
        season_year=2023,
        round_number=1,
        type="R",
        team_name="Red Bull",
        driver_name="Max Verstappen",
    )
    assert session_entry == SessionEntry.objects.get(
        session__round__season__year=2023,
        session__round__number=1,
        session__type="R",
        round_entry__team_driver__team__name="Red Bull",
        round_entry__team_driver__driver__forename="Max",
    )


@pytest.mark.django_db
def test_get_session_entry_reverse_name_exists():
    parser = ObjectParser()
    session_entry = parser.get_session_entry(
        season_year=2023,
        round_number=1,
        type="R",
        team_name="Alfa Romeo",
        driver_name="Zhou Guanyu",
    )
    assert session_entry == SessionEntry.objects.get(
        session__round__season__year=2023,
        session__round__number=1,
        session__type="R",
        round_entry__team_driver__team__name="Alfa Romeo",
        round_entry__team_driver__driver__forename="Guanyu",
    )


@pytest.mark.django_db
def test_parse_objects():
    parser = ObjectParser()

    with open("laps.pkl", "rb") as f:
        laps = pickle.load(f)

    lap_objs = []
    for lap in laps:
        lap_objs.extend(parser.parse_objects(lap))

    for lap in lap_objs:
        expected_lap = Lap.objects.get(session_entry=lap.session_entry, number=lap.number)
        assert lap.position == expected_lap.position


@pytest.mark.django_db
def test_get_teams_all_exist():
    parser = ObjectParser(create_new_base_objects=False)
    team_names = ["Red Bull", "Williams"]
    season = Season.objects.get(year=2023)

    teams = parser.get_teams(season, team_names)
    assert len(teams) == len(team_names)
    assert set(teams.keys()) == set(team_names)
    assert teams["Red Bull"].nationality == "Austrian"


@pytest.mark.django_db
def test_get_teams_new_team_no_create():
    ingestor = ObjectParser(create_new_base_objects=False)
    team_names = ["Red Bull", "Williams", "BrandNewTeam F1"]
    season = Season.objects.get(year=2023)

    with pytest.raises(ValueError, match="Teams not present"):
        ingestor.get_teams(season, team_names)


@pytest.mark.django_db
def test_get_teams_existing_team_not_in_season_no_create():
    ingestor = ObjectParser(create_new_base_objects=False, create_new_team_drivers=False)
    team_names = ["Red Bull", "Williams", "Brawn"]
    season = Season.objects.get(year=2023)

    with pytest.raises(ValueError, match="Teams not present"):
        ingestor.get_teams(season, team_names)


@pytest.mark.django_db
def test_get_teams_existing_team_not_in_season_create_in_season():
    ingestor = ObjectParser(create_new_base_objects=False, create_new_team_drivers=True)
    team_names = ["Red Bull", "Williams", "Brawn"]
    season = Season.objects.get(year=2023)

    teams = ingestor.get_teams(season, team_names)
    assert len(teams) == len(team_names)
    assert set(teams.keys()) == set(team_names)
    assert teams["Brawn"].nationality == "British"
    assert TeamDriver.objects.filter(season=season, team__name="Brawn").exists()
