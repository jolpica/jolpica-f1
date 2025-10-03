from __future__ import annotations

from typing import TYPE_CHECKING, ClassVar

from django.db import models

from ..utils import generate_api_id

if TYPE_CHECKING:
    from . import ChampionshipAdjustment, Round, RoundEntry, Season
    from .managed_views import DriverChampionship, TeamChampionship


class BaseTeam(models.Model):
    """Underlying Team ignoring rebrands"""

    ID_PREFIX = "baseteam"

    id = models.BigAutoField(primary_key=True)
    teams: models.QuerySet[Team]

    api_id = models.CharField(max_length=64, unique=True, null=True, blank=True, db_index=True)
    name = models.CharField(max_length=255, unique=True, null=True, blank=True)

    def save(self, *args, **kwargs) -> None:
        if not self.api_id:
            self.api_id = generate_api_id(self.ID_PREFIX)
        super().save(*args, **kwargs)

    def __str__(self) -> str:
        return f"{self.name}"


class Team(models.Model):
    """Information about a Constructor / Team"""

    ID_PREFIX = "team"

    id = models.BigAutoField(primary_key=True)
    base_team = models.ForeignKey("BaseTeam", on_delete=models.SET_NULL, null=True, blank=True, related_name="teams")
    drivers = models.ManyToManyField("formula_one.Driver", through="formula_one.TeamDriver", related_name="teams")
    seasons: models.QuerySet[Season]
    round_entries: models.QuerySet[RoundEntry]
    team_drivers: models.QuerySet[TeamDriver]
    championship_adjustments: models.QuerySet[ChampionshipAdjustment]
    driver_championships: models.QuerySet[DriverChampionship]
    team_championships: models.QuerySet[TeamChampionship]

    api_id = models.CharField(max_length=64, unique=True, null=True, blank=True, db_index=True)
    reference = models.CharField(max_length=32, unique=True, null=True, blank=True)
    name = models.CharField(max_length=255)
    nationality = models.CharField(max_length=255, null=True, blank=True)
    country_code = models.CharField("3 Letter country code (ISO 3166-1 alpha-3)", max_length=3, null=True, blank=True)
    wikipedia = models.URLField(max_length=255, null=True, blank=True)

    def save(self, *args, **kwargs) -> None:
        if not self.api_id:
            self.api_id = generate_api_id(self.ID_PREFIX)
        super().save(*args, **kwargs)

    def __str__(self) -> str:
        return f"{self.name}"


class TeamDriverRole(models.IntegerChoices):
    """Role of a driver employed by a team"""

    PERMANENT = 0
    RESERVE = 1
    JUNIOR = 2


class TeamDriver(models.Model):
    """Membership of a Driver to a Team for a given season"""

    ID_PREFIX = "teamdriver"

    id = models.BigAutoField(primary_key=True)
    team = models.ForeignKey("Team", on_delete=models.CASCADE, related_name="team_drivers")
    driver = models.ForeignKey("Driver", on_delete=models.CASCADE, related_name="team_drivers")
    season = models.ForeignKey("Season", on_delete=models.CASCADE, related_name="team_drivers")
    rounds: models.QuerySet[Round]

    api_id = models.CharField(max_length=64, unique=True, null=True, blank=True, db_index=True)
    role = models.PositiveSmallIntegerField(choices=TeamDriverRole.choices, null=True, blank=True)

    class Meta:
        constraints: ClassVar = [
            models.UniqueConstraint(fields=["team", "driver", "season"], name="team_driver_unique")
        ]

    def save(self, *args, **kwargs) -> None:
        if not self.api_id:
            self.api_id = generate_api_id(self.ID_PREFIX)
        super().save(*args, **kwargs)

    def __str__(self) -> str:
        return f"{self.team} {self.driver} {self.season}"
