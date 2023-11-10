from typing import TYPE_CHECKING, ClassVar

from django.db import models

if TYPE_CHECKING:
    from . import Session, SessionEntry


class Race(models.Model):
    """
    Table race {
        id integer [primary key]
        season_id integer
        circuit_id integer
        round integer
        name varchar
        date date
        wikipedia string
        cancelled bool
    }
    """

    id = models.BigAutoField(primary_key=True)
    season = models.ForeignKey("Season", on_delete=models.CASCADE, related_name="races")
    circuit = models.ForeignKey("Circuit", on_delete=models.CASCADE, related_name="races")
    team_drivers = models.ManyToManyField(
        "formula_one.TeamDriver", through="formula_one.RaceEntry", related_name="races"
    )
    race_entries: models.QuerySet["RaceEntry"]
    sessions: models.QuerySet["Session"]

    round = models.PositiveSmallIntegerField(null=True, blank=True)
    name = models.CharField(max_length=255, null=True, blank=True)
    date = models.DateField(null=True, blank=True)
    race_number = models.PositiveSmallIntegerField(null=True, blank=True)
    wikipedia = models.URLField(null=True, blank=True)
    is_cancelled = models.BooleanField(default=False)

    class Meta:
        constraints: ClassVar = [models.UniqueConstraint(fields=["season", "round"], name="race_unique_season_round")]

    def __str__(self) -> str:
        return f"{self.season.year} {self.name}"


class RaceEntry(models.Model):
    """
    Table race_entry {
        id integer [primary key]
        driver_id integer
        race_id integer
        team_id integer
        Note: 'Driver data per race'
    }
    """

    id = models.BigAutoField(primary_key=True)
    race = models.ForeignKey("Race", on_delete=models.CASCADE, related_name="race_entries")
    team_driver = models.ForeignKey("TeamDriver", on_delete=models.CASCADE, related_name="race_entries")
    sessions: models.QuerySet["Session"]
    session_entries: models.QuerySet["SessionEntry"]

    car_number = models.PositiveSmallIntegerField(null=True, blank=True)

    class Meta:
        constraints: ClassVar = [
            models.UniqueConstraint(fields=["race", "team_driver", "car_number"], name="race_entry_unique")
        ]

    def __str__(self) -> str:
        return f"{self.team_driver} - {self.race}"
