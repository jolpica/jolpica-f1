from typing import ClassVar

from django.db import models

from ..utils import generate_api_id


class PitStop(models.Model):
    """Pit Stop information for a session"""

    ID_PREFIX = "pitstop"

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

    api_id = models.CharField(max_length=64, unique=True, null=True, blank=True, db_index=True)
    number = models.PositiveSmallIntegerField(null=True, blank=True)
    duration = models.DurationField(null=True, blank=True)
    local_timestamp = models.CharField(max_length=16, blank=True, null=True)

    class Meta:
        constraints: ClassVar = [
            models.UniqueConstraint(fields=["session_entry", "number"], name="pit_stop_unique_session_entry_number"),
        ]

    def save(self, *args, **kwargs) -> None:
        if not self.api_id:
            self.api_id = generate_api_id(self.ID_PREFIX)
        super().save(*args, **kwargs)

    def __str__(self) -> str:
        return f"{self.number} - {self.session_entry}"
