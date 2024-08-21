from __future__ import annotations

from typing import TYPE_CHECKING, ClassVar

from django.db import models

if TYPE_CHECKING:
    from . import Lap, PitStop
    from .managed_views import DriverChampionship, TeamChampionship


class SessionType(models.TextChoices):
    """The type of session"""

    RACE = "R"
    QUALIFYING_ONE = "Q1"
    QUALIFYING_TWO = "Q2"
    QUALIFYING_THREE = "Q3"
    QUALIFYING_AVG = "QA"
    QUALIFYING_ORDER = "QO"
    QUALIFYING_BEST = "QB"
    PRACTICE_ONE = "FP1"
    PRACTICE_TWO = "FP2"
    PRACTICE_THREE = "FP3"
    PREQUALIFYING = "PQ"
    SPRINT_RACE = "SR"
    SPRINT_QUALIFYING1 = "SQ1"
    SPRINT_QUALIFYING2 = "SQ2"
    SPRINT_QUALIFYING3 = "SQ3"


class Session(models.Model):
    """Information about a scheduled session where cars are on track"""

    id = models.BigAutoField(primary_key=True)
    round = models.ForeignKey("formula_one.Round", on_delete=models.CASCADE, related_name="sessions")
    number = models.PositiveSmallIntegerField(null=True, blank=True)
    point_system = models.ForeignKey("PointSystem", on_delete=models.PROTECT, related_name="sessions")
    round_entries = models.ManyToManyField(
        "formula_one.RoundEntry", through="formula_one.SessionEntry", related_name="sessions"
    )
    session_entries: models.QuerySet[SessionEntry]
    driver_championships: models.QuerySet[DriverChampionship]
    team_championships: models.QuerySet[TeamChampionship]

    type = models.CharField(max_length=3, choices=SessionType.choices)
    date = models.DateField(null=True, blank=True)
    time = models.TimeField(null=True, blank=True)
    scheduled_laps = models.PositiveSmallIntegerField(null=True, blank=True)
    is_cancelled = models.BooleanField(default=False)

    class Meta:
        constraints: ClassVar = [
            models.UniqueConstraint(fields=["round", "number"], name="session_unique_number_round"),
        ]

    def __str__(self) -> str:
        return f"{self.round} - {SessionType(self.type).label}"


class SessionStatus(models.IntegerChoices):
    """Finishing status of an entry for a session"""

    FINISHED = 0, "Finished"
    LAPPED = 1, "Car Finished Lap(s) behind Leader"
    ACCIDENT = 10, "Accident, Collision or Driver Error on Track"
    RETIRED = 11, "Mechanial, Safety or Other Retirement"
    DISQUALIFIED = 20, "Disqualified"
    DID_NOT_START = 30, "Withdrawn or Did Not Start"
    DID_NOT_QUALIFY = 40
    DID_NOT_PREQUALIFY = 41


class SessionEntry(models.Model):
    """All information for a round entry for the session"""

    id = models.BigAutoField(primary_key=True)
    session = models.ForeignKey("Session", on_delete=models.CASCADE, related_name="session_entries")
    round_entry = models.ForeignKey("RoundEntry", on_delete=models.CASCADE, related_name="session_entries")
    laps: models.QuerySet[Lap]
    pit_stops: models.QuerySet[PitStop]
    penalties: models.QuerySet[Penalty]
    served_penalities: models.QuerySet[Penalty]

    position = models.PositiveSmallIntegerField(null=True, blank=True)
    is_classified = models.BooleanField(null=True, blank=True)
    status = models.PositiveSmallIntegerField(choices=SessionStatus.choices, null=True, blank=True)
    detail = models.CharField(max_length=255, null=True, blank=True)
    # Race Specific
    points = models.FloatField(null=True, blank=True)
    is_eligible_for_points = models.BooleanField(default=True)
    grid = models.PositiveSmallIntegerField(null=True, blank=True)
    time = models.DurationField(null=True, blank=True)
    fastest_lap_rank = models.PositiveSmallIntegerField(null=True, blank=True)
    laps_completed = models.PositiveSmallIntegerField(null=True, blank=True)

    class Meta:
        constraints: ClassVar = [
            models.UniqueConstraint(fields=["session", "round_entry"], name="session_entry_unique_session_round_entry"),
        ]

    def __str__(self) -> str:
        return f"{self.session} - {self.round_entry}"


class Penalty(models.Model):
    """Penalty given/served in an entry's session"""

    id = models.BigAutoField(primary_key=True)
    earned = models.ForeignKey(
        "SessionEntry", on_delete=models.SET_NULL, null=True, blank=True, related_name="penalties"
    )
    served = models.ForeignKey(
        "SessionEntry", on_delete=models.SET_NULL, null=True, blank=True, related_name="served_penalties"
    )

    license_points = models.PositiveSmallIntegerField(null=True, blank=True)
    position = models.PositiveSmallIntegerField(null=True, blank=True)
    time = models.DurationField(null=True, blank=True)
    is_time_served_in_pit = models.BooleanField(null=True, blank=True)

    def __str__(self) -> str:
        return f"{self.earned}"
