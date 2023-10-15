from typing import TYPE_CHECKING, ClassVar

from django.db import models

if TYPE_CHECKING:
    from . import Lap, PitStop


class SessionType(models.TextChoices):
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
    """
    Table session {
        id integer [primary key]
        race_id integer
        date date
        time time
        session_category session_category
        point_system point_system
        laps integer
        Note: 'The sessions of a race e.g. race, quali'
    }
    """

    id = models.BigAutoField(primary_key=True)
    race = models.ForeignKey("Race", on_delete=models.CASCADE, related_name="sessions")
    point_scheme = models.ForeignKey("PointScheme", on_delete=models.PROTECT, related_name="sessions")
    race_entries = models.ManyToManyField("RaceEntry", through="SessionEntry", related_name="sessions")
    session_entries: models.QuerySet["SessionEntry"]

    type = models.CharField(max_length=3, choices=SessionType.choices)
    date = models.DateField(null=True, blank=True)
    time = models.TimeField(null=True, blank=True)
    scheduled_laps = models.PositiveSmallIntegerField(null=True, blank=True)
    is_cancelled = models.BooleanField(default=False)

    def __str__(self) -> str:
        return f"{self.race} - {SessionType(self.type).label}"


class SessionStatus(models.IntegerChoices):
    FINISHED = 0, "Finished"
    LAPPED = 1, "Car Finished Lap(s) behind Leader"
    DISQUALIFIED = 2, "Disqualified"
    ACIDENT = 3, "Acident, Collision or Driver Error on track"
    MECHANICAL = 4, "Mechanical Issue, Retired on track"
    RETIRED = 5, "Car Retired in Pits"
    DID_NOT_QUALIFY = 6


class SessionEntry(models.Model):
    """
    Table driver_session {
        id integer [primary key]
        session_id integer
        race_entry_id integer
        car_number string
        // both
        position integer
        classified bool
        fastest_lap integer
        points decimal
        // race
        grid integer
        time duration
        laps integer
        status integer
        detail string
    }
    enum status {
        Finished
        retired
        disqualified
    }
    """

    id = models.BigAutoField(primary_key=True)
    session = models.ForeignKey("Session", on_delete=models.CASCADE, related_name="session_entries")
    race_entry = models.ForeignKey("RaceEntry", on_delete=models.CASCADE, related_name="session_entries")
    fastest_lap = models.ForeignKey(
        "Lap",
        on_delete=models.SET_NULL,
        null=True,
        blank=True,
        related_name="+",
        limit_choices_to=models.Q(session_entry_id=models.F("pk")),
    )
    laps: models.QuerySet["Lap"]
    pit_stops: models.QuerySet["PitStop"]
    penalties: models.QuerySet["Penalty"]
    served_penalities: models.QuerySet["Penalty"]

    car_number = models.PositiveSmallIntegerField(null=True, blank=True)
    position = models.PositiveSmallIntegerField(null=True, blank=True)
    is_classified = models.BooleanField(null=True, blank=True)
    status = models.PositiveSmallIntegerField(choices=SessionStatus.choices, null=True, blank=True)
    detail = models.CharField(max_length=255, null=True, blank=True)
    # Race Specific
    points = models.FloatField(null=True, blank=True)
    grid = models.PositiveSmallIntegerField(null=True, blank=True)
    time = models.DurationField(null=True, blank=True)
    laps_completed = models.PositiveSmallIntegerField(null=True, blank=True)

    class Meta:
        constraints: ClassVar = [
            models.UniqueConstraint(fields=["session", "race_entry"], name="session_entry_unique_session_race_entry"),
            models.UniqueConstraint(fields=["session", "position"], name="session_entry_unique_session_position"),
        ]

    def __str__(self) -> str:
        return f"{self.session} - {self.race_entry}"


class Penalty(models.Model):
    """
    Table penalty {
        id integer [primary key]
        earned integer
        served integer
        license_points integer
        position integer
        time duration
        time_served_in_pit bool
    }
    """

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
