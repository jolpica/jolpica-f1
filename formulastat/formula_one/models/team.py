from typing import ClassVar

from django.db import models


class BaseTeam(models.Model):
    """
    Table base_team {
        id integer [primary key]
        first_entry integer
        Note: 'The official Team entry (consistent between rebrands)'
    }
    """

    id = models.BigAutoField(primary_key=True)
    name = models.CharField(max_length=255, unique=True, null=True, blank=True)

    def __str__(self) -> str:
        return f"{self.name}"


class Team(models.Model):
    """
    Table team {
    id integer [primary key]
    reference string
    name string
    nationality string
    wikipedia string
    base_team_id integer
    }
    """

    id = models.BigAutoField(primary_key=True)
    base_team = models.ForeignKey("BaseTeam", on_delete=models.SET_NULL, null=True, blank=True, related_name="teams")
    reference = models.CharField(max_length=32, unique=True, null=True, blank=True)
    name = models.CharField(max_length=255)
    nationality = models.CharField(max_length=255, null=True, blank=True)
    wikipedia = models.URLField(max_length=255, null=True, blank=True)

    def __str__(self) -> str:
        return f"{self.name}"


class TeamDriverRole(models.TextChoices):
    PERMANENT = 1
    RESERVE = 2
    JUNIOR = 3


class TeamDriver(models.Model):
    """
    Table team_driver {
        id integer [primary key]
        team_id integer
        driver_id integer
        season_id integer
        role team_driver_role
    }
    enum team_driver_role {
        permanent
        reserve
        junior // https://f1.fandom.com/wiki/List_of_drivers_who_participated_only_free_practice_during_Grand_Prix_weekend
    }
    """

    id = models.BigAutoField(primary_key=True)
    team = models.ForeignKey("Team", on_delete=models.CASCADE, related_name="team_drivers")
    driver = models.ForeignKey("Driver", on_delete=models.CASCADE, related_name="team_drivers")
    season = models.ForeignKey("Season", on_delete=models.CASCADE, related_name="team_drivers")
    role = models.PositiveSmallIntegerField(choices=TeamDriverRole.choices)

    class Meta:
        constraints: ClassVar = [
            models.UniqueConstraint(fields=["team", "driver", "season"], name="team_driver_unique")
        ]

    def __str__(self) -> str:
        return f"{self.team} {self.driver} {self.season}"
