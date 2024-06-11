from __future__ import annotations

from typing import TYPE_CHECKING, ClassVar

from django.db import models

from jolpica.formula_one.models.session import SessionType

if TYPE_CHECKING:
    from . import Session, SessionEntry
    from .managed_views import DriverChampionship, TeamChampionship


class RoundType(models.TextChoices):
    """The type of round"""

    CONVENTIONAL = "C"
    SPRINT_V1 = "S1"
    SPRINT_V2 = "S2"
    SPRINT_V3 = "S3"


class Round(models.Model):
    """Race event information relevent to all sessions"""

    id = models.BigAutoField(primary_key=True)
    season = models.ForeignKey("Season", on_delete=models.CASCADE, related_name="rounds")
    circuit = models.ForeignKey("Circuit", on_delete=models.CASCADE, related_name="rounds")
    team_drivers = models.ManyToManyField(
        "formula_one.TeamDriver", through="formula_one.RoundEntry", related_name="rounds"
    )
    round_entries: models.QuerySet[RoundEntry]
    sessions: models.QuerySet[Session]
    driver_championships: models.QuerySet[DriverChampionship]
    team_championships: models.QuerySet[TeamChampionship]

    number = models.PositiveSmallIntegerField(null=True, blank=True)
    name = models.CharField(max_length=255, null=True, blank=True)
    date = models.DateField(null=True, blank=True)
    race_number = models.PositiveSmallIntegerField(null=True, blank=True)
    wikipedia = models.URLField(null=True, blank=True)
    is_cancelled = models.BooleanField(default=False)

    class Meta:
        constraints: ClassVar = [
            models.UniqueConstraint(fields=["season", "number"], name="round_unique_season_number")
        ]

    def __str__(self) -> str:
        return f"{self.season.year} {self.name}"

    @property
    def is_sprint_format(self) -> bool:
        return self.sessions.filter(type__in=[SessionType.SPRINT_RACE, SessionType.SPRINT_QUALIFYING1]).exists()

class RoundEntry(models.Model):
    """All data relating to a driver racing for a specific team for a race"""

    id = models.BigAutoField(primary_key=True)
    round = models.ForeignKey("Round", on_delete=models.CASCADE, related_name="round_entries")
    team_driver = models.ForeignKey("TeamDriver", on_delete=models.CASCADE, related_name="round_entries")
    sessions: models.QuerySet[Session]
    session_entries: models.QuerySet[SessionEntry]

    car_number = models.PositiveSmallIntegerField(null=True, blank=True)

    class Meta:
        constraints: ClassVar = [
            models.UniqueConstraint(fields=["round", "team_driver", "car_number"], name="round_entry_unique")
        ]

    def __str__(self) -> str:
        return f"{self.team_driver} - {self.round}"
