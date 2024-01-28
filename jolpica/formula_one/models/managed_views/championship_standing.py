from typing import ClassVar

from django.db import models

from ..point_scheme import ChampionshipAdjustmentType


class DriverChampionship(models.Model):
    id = models.BigAutoField(primary_key=True)

    session = models.ForeignKey("formula_one.Session", on_delete=models.CASCADE, related_name="driver_standings")
    driver = models.ForeignKey("formula_one.Driver", on_delete=models.CASCADE, related_name="driver_standings")
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
        "formula_one.Season", null=True, blank=True, on_delete=models.SET_NULL, related_name="driver_standings"
    )
    round = models.ForeignKey(
        "formula_one.Round", null=True, blank=True, on_delete=models.SET_NULL, related_name="driver_standings"
    )

    class Meta:
        constraints: ClassVar = [
            models.UniqueConstraint(fields=["session", "driver"], name="driver_standing_unique_session_driver"),
        ]

    def __str__(self) -> str:
        return f"{self.year}"
