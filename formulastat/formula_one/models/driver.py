from typing import TYPE_CHECKING
from django.db import models

if TYPE_CHECKING:
    from . import Team, Race, Season, TeamDriver, RaceEntry

class Driver(models.Model):
    """
    Table driver {
        id integer [primary key]
        reference string [unique]
        forename string
        surname string
        abbreviation string
        nationality string
        permanent_car_number integer
        date_of_birth date
        wikipedia string
    }
    """

    id = models.BigAutoField(primary_key=True)
    teams: models.QuerySet["Team"] 
    races: models.QuerySet["Race"]
    seasons: models.QuerySet["Season"]
    race_entries: models.QuerySet["RaceEntry"]
    team_drivers: models.QuerySet["TeamDriver"]

    reference = models.CharField(max_length=32, unique=True, null=True, blank=True)
    forename = models.CharField(max_length=255)
    surname = models.CharField(max_length=255)
    abbreviation = models.CharField(max_length=10, null=True, blank=True)
    nationality = models.CharField(max_length=255, null=True, blank=True)
    permanent_car_number = models.PositiveSmallIntegerField(null=True, blank=True)
    date_of_birth = models.DateField(null=True, blank=True)
    wikipedia = models.URLField(max_length=255, null=True, blank=True)

    def __str__(self) -> str:
        return f"{self.forename} {self.surname}"
