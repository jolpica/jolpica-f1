from typing import TYPE_CHECKING

from django.db import models

if TYPE_CHECKING:
    from . import Race, TeamDriver


class Season(models.Model):
    """
    Table season {
        id integer [primary key]
        year integer
        wikipedia string
    }
    """

    id = models.BigAutoField(primary_key=True)
    teams = models.ManyToManyField("formula_one.Team", through="formula_one.TeamDriver", related_name="seasons")
    drivers = models.ManyToManyField("formula_one.Driver", through="formula_one.TeamDriver", related_name="seasons")
    races: models.QuerySet["Race"]
    team_drivers: models.QuerySet["TeamDriver"]

    year = models.SmallIntegerField(unique=True)
    wikipedia = models.URLField(max_length=255, null=True, blank=True)

    def __str__(self) -> str:
        return f"{self.year}"
