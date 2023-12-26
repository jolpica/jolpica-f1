from typing import TYPE_CHECKING, ClassVar

from django.db import models

if TYPE_CHECKING:
    from . import Race, RaceEntry, Season


class BaseTeam(models.Model):
    """Underlying Team ignoring rebrands"""

    id = models.BigAutoField(primary_key=True)
    teams: models.QuerySet["Team"]

    name = models.CharField(max_length=255, unique=True, null=True, blank=True)

    def __str__(self) -> str:
        return f"{self.name}"


class Team(models.Model):
    """Information about a Constructor / Team"""

    id = models.BigAutoField(primary_key=True)
    base_team = models.ForeignKey("BaseTeam", on_delete=models.SET_NULL, null=True, blank=True, related_name="teams")
    drivers = models.ManyToManyField("formula_one.Driver", through="formula_one.TeamDriver", related_name="teams")
    races: models.QuerySet["Race"]
    seasons: models.QuerySet["Season"]
    race_entries: models.QuerySet["RaceEntry"]
    team_drivers: models.QuerySet["TeamDriver"]

    reference = models.CharField(max_length=32, unique=True, null=True, blank=True)
    name = models.CharField(max_length=255)
    nationality = models.CharField(max_length=255, null=True, blank=True)
    wikipedia = models.URLField(max_length=255, null=True, blank=True)

    def __str__(self) -> str:
        return f"{self.name}"


class TeamDriverRole(models.IntegerChoices):
    """Role of a driver employed by a team"""

    PERMANENT = 0
    RESERVE = 1
    JUNIOR = 2


class TeamDriver(models.Model):
    """Membership of a Driver to a Team for a given season"""

    id = models.BigAutoField(primary_key=True)
    team = models.ForeignKey("Team", on_delete=models.CASCADE, related_name="team_drivers")
    driver = models.ForeignKey("Driver", on_delete=models.CASCADE, related_name="team_drivers")
    season = models.ForeignKey("Season", on_delete=models.CASCADE, related_name="team_drivers")

    role = models.PositiveSmallIntegerField(choices=TeamDriverRole.choices, null=True, blank=True)

    class Meta:
        constraints: ClassVar = [
            models.UniqueConstraint(fields=["team", "driver", "season"], name="team_driver_unique")
        ]

    def __str__(self) -> str:
        return f"{self.team} {self.driver} {self.season}"
