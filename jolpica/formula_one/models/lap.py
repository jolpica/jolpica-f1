from typing import TYPE_CHECKING, ClassVar

from django.db import models

from ..utils import format_timedelta

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
    is_fastest_lap = models.BooleanField(default=False)

    class Meta:
        constraints: ClassVar = [
            models.UniqueConstraint(fields=["session_entry", "number"], name="lap_unique_session_entry_number"),
            models.UniqueConstraint(
                fields=["session_entry", "is_fastest_lap"],
                condition=models.Q(is_fastest_lap=True),
                name="lap_unique_fastest_lap",
            ),
        ]

    def __str__(self) -> str:
        lap_number_string = f"{self.number} " if self.number else ""
        time_delta_string = format_timedelta(self.time) if self.time else ""
        return f"{self.session_entry.session.type}: {lap_number_string}{time_delta_string}"
