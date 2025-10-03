from __future__ import annotations

from typing import TYPE_CHECKING, ClassVar

from django.db import models

from ..utils import generate_api_id

if TYPE_CHECKING:
    from . import Session, SessionEntry
    from .managed_views import DriverChampionship, TeamChampionship


class Round(models.Model):
    """Race event information relevent to all sessions"""

    ID_PREFIX = "round"

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

    api_id = models.CharField(max_length=64, unique=True, null=True, blank=True, db_index=True)
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

    def save(self, *args, **kwargs) -> None:
        if not self.api_id:
            self.api_id = generate_api_id(self.ID_PREFIX)
        super().save(*args, **kwargs)

    def __str__(self) -> str:
        return f"{self.season.year} {self.name}"


class RoundEntry(models.Model):
    """All data relating to a driver racing for a specific team for a race"""

    ID_PREFIX = "roundentry"

    id = models.BigAutoField(primary_key=True)
    round = models.ForeignKey("Round", on_delete=models.CASCADE, related_name="round_entries")
    team_driver = models.ForeignKey("TeamDriver", on_delete=models.CASCADE, related_name="round_entries")
    sessions: models.QuerySet[Session]
    session_entries: models.QuerySet[SessionEntry]

    api_id = models.CharField(max_length=64, unique=True, null=True, blank=True, db_index=True)
    car_number = models.PositiveSmallIntegerField(null=True, blank=True)

    class Meta:
        constraints: ClassVar = [
            models.UniqueConstraint(fields=["round", "team_driver", "car_number"], name="round_entry_unique")
        ]

    def save(self, *args, **kwargs) -> None:
        if not self.api_id:
            self.api_id = generate_api_id(self.ID_PREFIX)
        super().save(*args, **kwargs)

    def __str__(self) -> str:
        return f"{self.team_driver} - {self.round}"
