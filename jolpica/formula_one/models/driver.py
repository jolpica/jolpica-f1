from __future__ import annotations

from typing import TYPE_CHECKING

from django.db import models

if TYPE_CHECKING:
    from . import ChampionshipAdjustment, Round, Season, Team, TeamDriver


class Driver(models.Model):
    """Session Participant / Racing Driver Information

    May track reserve drivers with no sessions, or junior drivers only taking part in practice sessions."""

    id = models.BigAutoField(primary_key=True)
    teams: models.QuerySet[Team]
    seasons: models.QuerySet[Season]
    team_drivers: models.QuerySet[TeamDriver]
    championship_adjustments: models.QuerySet[ChampionshipAdjustment]

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
