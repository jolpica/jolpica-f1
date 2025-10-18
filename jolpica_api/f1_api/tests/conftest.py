from __future__ import annotations

import datetime
import zoneinfo
from unittest.mock import MagicMock

import pytest
from rest_framework.test import APIClient

from jolpica.formula_one import models as f1


@pytest.fixture
def api_client():
    """Provides an API client for making requests."""
    return APIClient()


@pytest.fixture
def sample_season_data():
    """Provides a sample season for testing."""
    return f1.Season.objects.get(year=2023)


# In-memory fixtures for schema field completeness testing


@pytest.fixture
def fully_populated_circuit():
    """Provides a Circuit instance with all fields populated."""
    circuit = f1.Circuit(
        id=1,
        api_id="circuit_monaco",
        reference="monaco",
        name="Circuit de Monaco",
        locality="Monte Carlo",
        country="Monaco",
        country_code="MCO",
        latitude=43.7347,
        longitude=7.4206,
        altitude=7.0,
        wikipedia="http://en.wikipedia.org/wiki/Circuit_de_Monaco",
    )
    circuit.pk = 1
    return circuit


@pytest.fixture
def fully_populated_season():
    """Provides a Season instance with all fields populated."""
    season = f1.Season(
        id=1,
        api_id="season_2023",
        year=2023,
        wikipedia="http://en.wikipedia.org/wiki/2023_Formula_One_World_Championship",
    )
    season.pk = 1
    return season


@pytest.fixture
def fully_populated_team():
    """Provides a Team instance with all fields populated including seasons."""
    team = f1.Team(
        id=1,
        api_id="team_redbull",
        reference="red_bull",
        name="Red Bull Racing",
        nationality="Austrian",
        country_code="AUT",
        wikipedia="http://en.wikipedia.org/wiki/Red_Bull_Racing",
    )

    # Create season instances for the team
    season_2023 = f1.Season(
        id=1,
        api_id="season_2023",
        year=2023,
    )

    season_2022 = f1.Season(
        id=2,
        api_id="season_2022",
        year=2022,
    )

    # Mock the seasons manager
    mock_seasons_manager = MagicMock()
    mock_seasons_manager.all.return_value = [season_2023, season_2022]
    type(team).seasons = property(lambda self: mock_seasons_manager)

    return team


@pytest.fixture
def fully_populated_team_driver(fully_populated_team, fully_populated_season):
    """Provides a TeamDriver instance linking driver to team."""
    driver = f1.Driver(
        id=1,
        api_id="driver_verstappen",
        forename="Max",
        surname="Verstappen",
    )

    team_driver = f1.TeamDriver(
        id=1,
        api_id="teamdriver_verstappen_redbull_2023",
        team=fully_populated_team,
        driver=driver,
        season=fully_populated_season,
        role=f1.TeamDriverRole.PERMANENT,
    )

    return team_driver


@pytest.fixture
def fully_populated_driver():
    """Provides a Driver instance with all fields populated including team history."""
    driver = f1.Driver(
        id=1,
        api_id="driver_hamilton",
        reference="hamilton",
        forename="Lewis",
        surname="Hamilton",
        abbreviation="HAM",
        nationality="British",
        country_code="GBR",
        permanent_car_number=44,
        date_of_birth=datetime.date(1985, 1, 7),
        wikipedia="http://en.wikipedia.org/wiki/Lewis_Hamilton",
    )

    team = f1.Team(
        id=1,
        api_id="team_mercedes",
        name="Mercedes",
        country_code="GER",
    )

    season = f1.Season(
        id=1,
        api_id="season_2023",
        year=2023,
    )

    # Create team driver instance
    team_driver = f1.TeamDriver(
        id=1,
        api_id="teamdriver_hamilton_mercedes_2023",
        team=team,
        driver=driver,
        season=season,
        role=f1.TeamDriverRole.PERMANENT,
    )

    mock_team_drivers_manager = MagicMock()
    mock_team_drivers_manager.all.return_value = [team_driver]
    type(driver).team_drivers = property(lambda self: mock_team_drivers_manager)

    return driver


@pytest.fixture
def fully_populated_session():
    """Provides a Session instance with all fields populated."""
    session = f1.Session(
        id=1,
        api_id="session_monaco_2023_race",
        type=f1.SessionType.RACE,
        number=1,
        timestamp=datetime.datetime(2023, 5, 28, 13, 0, 0, tzinfo=datetime.UTC),
        has_time_data=True,
        timezone=zoneinfo.ZoneInfo("Europe/Monaco"),
        scheduled_laps=78,
        is_cancelled=False,
    )

    return session


@pytest.fixture
def fully_populated_round(fully_populated_circuit, fully_populated_season, fully_populated_session):
    """Provides a Round instance with all fields populated including related objects."""
    round_obj = f1.Round(
        id=1,
        api_id="round_monaco_2023",
        season=fully_populated_season,
        circuit=fully_populated_circuit,
        number=6,
        name="Monaco Grand Prix",
        race_number=6,
        wikipedia="http://en.wikipedia.org/wiki/2023_Monaco_Grand_Prix",
        is_cancelled=False,
    )
    mock_sessions_manager = MagicMock()
    mock_sessions_manager.all.return_value = [fully_populated_session]
    type(round_obj).sessions = property(lambda self: mock_sessions_manager)

    return round_obj
