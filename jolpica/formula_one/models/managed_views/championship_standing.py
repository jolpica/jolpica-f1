from typing import ClassVar

from django.db import models

from ..point_scheme import ChampionshipAdjustmentType


class DriverChampionship(models.Model):
    id = models.BigAutoField(primary_key=True)

    session_id: int
    session = models.ForeignKey("formula_one.Session", on_delete=models.CASCADE, related_name="driver_championships")
    driver_id: int
    driver = models.ForeignKey("formula_one.Driver", on_delete=models.CASCADE, related_name="driver_championships")
    year = models.SmallIntegerField()
    round_number = models.PositiveSmallIntegerField()
    position = models.SmallIntegerField(null=True)
    points = models.FloatField()
    win_count = models.SmallIntegerField()
    highest_finish = models.SmallIntegerField(null=True)
    finish_string = models.CharField(max_length=255)

    is_eligible = models.BooleanField(default=False)
    adjustment_type = models.PositiveSmallIntegerField(choices=ChampionshipAdjustmentType.choices, default=0)

    season_id: int
    season = models.ForeignKey(
        "formula_one.Season", null=True, blank=True, on_delete=models.SET_NULL, related_name="driver_championships"
    )
    round_id: int
    round = models.ForeignKey(
        "formula_one.Round", null=True, blank=True, on_delete=models.SET_NULL, related_name="driver_championships"
    )

    class Meta:
        constraints: ClassVar = [
            models.UniqueConstraint(fields=["session", "driver"], name="driver_championship_unique_session_driver"),
        ]

    def __str__(self) -> str:
        return f"{self.year}"


class TeamChampionship(models.Model):
    id = models.BigAutoField(primary_key=True)

    session = models.ForeignKey("formula_one.Session", on_delete=models.CASCADE, related_name="team_championships")
    team = models.ForeignKey("formula_one.Team", on_delete=models.CASCADE, related_name="team_championships")
    year = models.SmallIntegerField()
    round_number = models.PositiveSmallIntegerField()
    position = models.SmallIntegerField(null=True)
    points = models.FloatField()
    win_count = models.SmallIntegerField()
    highest_finish = models.SmallIntegerField(null=True)
    finish_string = models.CharField(max_length=255)

    is_eligible = models.BooleanField(default=False)
    adjustment_type = models.PositiveSmallIntegerField(choices=ChampionshipAdjustmentType.choices, default=0)

    season = models.ForeignKey(
        "formula_one.Season", null=True, blank=True, on_delete=models.SET_NULL, related_name="team_championships"
    )
    round = models.ForeignKey(
        "formula_one.Round", null=True, blank=True, on_delete=models.SET_NULL, related_name="team_championships"
    )

    class Meta:
        constraints: ClassVar = [
            models.UniqueConstraint(fields=["session", "team"], name="team_championship_unique_session_team"),
        ]

    def __str__(self) -> str:
        return f"{self.year}"
