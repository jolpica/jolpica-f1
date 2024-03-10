from __future__ import annotations

from typing import TYPE_CHECKING

from django.db import models

if TYPE_CHECKING:
    from . import ChampionshipAdjustment, Round, TeamDriver
    from .managed_views import DriverChampionship, TeamChampionship


class Season(models.Model):
    """Formula 1 Championship season"""

    id = models.BigAutoField(primary_key=True)
    teams = models.ManyToManyField("formula_one.Team", through="formula_one.TeamDriver", related_name="seasons")
    drivers = models.ManyToManyField("formula_one.Driver", through="formula_one.TeamDriver", related_name="seasons")
    championship_system = models.ForeignKey(
        "formula_one.ChampionshipSystem", on_delete=models.SET_NULL, related_name="seasons", null=True, blank=True
    )
    rounds: models.QuerySet[Round]
    team_drivers: models.QuerySet[TeamDriver]
    championship_adjustments: models.QuerySet[ChampionshipAdjustment]
    driver_championships: models.QuerySet[DriverChampionship]
    team_championships: models.QuerySet[TeamChampionship]

    year = models.SmallIntegerField(unique=True)
    wikipedia = models.URLField(max_length=255, null=True, blank=True)

    def __str__(self) -> str:
        return f"{self.year}"
