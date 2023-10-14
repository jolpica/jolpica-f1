from typing import ClassVar

from django.db import models


class Lap(models.Model):
    """
    Table lap {
      id integer [primary key]
      driver_session_id integer
      time duration
      average_speed decimal
    }
    """

    id = models.BigAutoField(primary_key=True)
    session_entry = models.ForeignKey("SessionEntry", on_delete=models.CASCADE, related_name="laps")
    number = models.PositiveSmallIntegerField(unique=True, null=True, blank=True)
    time = models.DurationField(null=True, blank=True)
    average_speed = models.FloatField(null=True, blank=True)

    class Meta:
        constraints: ClassVar = [
            models.UniqueConstraint(fields=["session_entry", "number"], name="lap_unique_session_entry_number")
        ]

    def __str__(self) -> str:
        return f"{self.number} - {self.session_entry}"
