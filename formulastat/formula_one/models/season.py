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
    teams = models.ManyToManyField("Team", through="TeamDriver", related_name="seasons")
    drivers = models.ManyToManyField("Driver", through="TeamDriver", related_name="seasons")
    races: models.QuerySet["Race"]
    team_drivers: models.QuerySet["TeamDriver"]

    year = models.SmallIntegerField(unique=True)
    wikipedia = models.URLField(max_length=255, null=True, blank=True)

    def __str__(self) -> str:
        return f"{self.year}"
