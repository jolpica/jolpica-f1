from typing import TYPE_CHECKING, ClassVar

from django.db import models

if TYPE_CHECKING:
    from . import PitStop


class Lap(models.Model):
    """Information on a driven Lap of Race, Qualifying, or any other session for a driver"""

    id = models.BigAutoField(primary_key=True)
    session_entry = models.ForeignKey("SessionEntry", on_delete=models.CASCADE, related_name="laps")
    pit_stop: "PitStop | None"

    number = models.PositiveSmallIntegerField(null=True, blank=True)
    position = models.PositiveSmallIntegerField(null=True, blank=True)
    time = models.DurationField(null=True, blank=True)
    average_speed = models.FloatField(null=True, blank=True)

    class Meta:
        constraints: ClassVar = [
            models.UniqueConstraint(fields=["session_entry", "number"], name="lap_unique_session_entry_number")
        ]

    def __str__(self) -> str:
        return f"{self.session_entry.session.type}: {self.number}"
