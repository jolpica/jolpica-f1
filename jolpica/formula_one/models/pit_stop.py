from typing import ClassVar

from django.db import models


class PitStop(models.Model):
    """Pit Stop information for a session"""

    id = models.BigAutoField(primary_key=True)
    session_entry = models.ForeignKey("SessionEntry", on_delete=models.CASCADE, related_name="pit_stops")
    lap = models.OneToOneField(
        "Lap",
        on_delete=models.CASCADE,
        unique=True,
        null=True,
        blank=True,
        related_name="pit_stop",
        limit_choices_to=models.Q(session_entry=models.F("session_entry")),
    )

    number = models.PositiveSmallIntegerField(null=True, blank=True)
    duration = models.DurationField(null=True, blank=True)
    local_timestamp = models.CharField(max_length=16, blank=True, null=True)

    class Meta:
        constraints: ClassVar = [
            models.UniqueConstraint(fields=["session_entry", "number"], name="pit_stop_unique_session_entry_number"),
        ]

    def __str__(self) -> str:
        return f"{self.number} - {self.session_entry}"
