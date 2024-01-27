from __future__ import annotations

from django.db import models


class Circuits(models.Model):
    circuitId = models.AutoField("Primary Key", primary_key=True, db_column="circuitId")
    circuitRef = models.CharField("Unique circuit identifier", max_length=255, unique=True, db_column="circuitRef")
    name = models.CharField("Circuit name", max_length=255)
    location = models.CharField("Location name", max_length=255, blank=True)
    country = models.CharField("Country", max_length=255, blank=True)
    lat = models.FloatField("Latitude", blank=True, null=True)
    lng = models.FloatField("Longitude", blank=True, null=True)
    alt = models.FloatField("Altitude (metres)", blank=True, null=True)
    url = models.CharField("Circuit Wikipedia page", max_length=255, unique=True, blank=True, null=True)

    class Meta:
        db_table = "ergast_circuits"
        ordering = ["circuitRef"]

    def __str__(self):
        return f"{self.name}"


class Seasons(models.Model):
    year = models.IntegerField("Primary key e.g. 1950", primary_key=True)
    url = models.CharField("Season Wikipedia page", max_length=255, unique=True, blank=True, null=True)

    class Meta:
        db_table = "ergast_seasons"

    def __str__(self):
        return f"{self.year} Season"


class Races(models.Model):
    raceId = models.AutoField("Primary Key", primary_key=True, db_column="raceId")
    year = models.ForeignKey(
        Seasons,
        verbose_name="Foreign key link to seasons table",
        db_column="year",
        on_delete=models.CASCADE,
    )
    round = models.IntegerField("Round number")
    circuitId = models.ForeignKey(
        Circuits,
        verbose_name="Foreign key link to circuits table",
        db_column="circuitId",
        on_delete=models.CASCADE,
    )
    name = models.CharField("Race name", max_length=255)
    date = models.DateField('Race date e.g. "1950-05-13"')
    time = models.TimeField('Race start time e.g."13:00:00"', blank=True, null=True)
    url = models.CharField("Race Wikipedia page", max_length=255, unique=True, blank=True, null=True)
    fp1_date = models.DateField("FP1 date", blank=True, null=True)
    fp1_time = models.TimeField("FP1 start time", blank=True, null=True)
    fp2_date = models.DateField("FP2 date", blank=True, null=True)
    fp2_time = models.TimeField("FP2 start time", blank=True, null=True)
    fp3_date = models.DateField("FP3 date", blank=True, null=True)
    fp3_time = models.TimeField("FP3 start time", blank=True, null=True)
    quali_date = models.DateField("Qualifying date", blank=True, null=True)
    quali_time = models.TimeField("Qualifying start time", blank=True, null=True)
    sprint_date = models.DateField("Sprint date", blank=True, null=True)
    sprint_time = models.TimeField("Sprint start time", blank=True, null=True)
    laptimes_set: models.QuerySet[LapTimes]
    pitstops_set: models.QuerySet[PitStops]
    lap_times = models.ManyToManyField("Drivers", through="LapTimes", related_name="lap_times")  # type: ignore
    pit_stops = models.ManyToManyField("Drivers", through="PitStops", related_name="pit_stops")  # type: ignore

    class Meta:
        db_table = "ergast_races"
        ordering = ["year", "round"]

    def __str__(self):
        return f"{self.year.year} {self.name}"


class LapTimes(models.Model):
    id = models.CharField("Unique id '<raceId>|<driverId>|<lap>'", primary_key=True, max_length=255)
    raceId = models.ForeignKey(
        Races,
        verbose_name="Foreign key link to races table",
        db_column="raceId",
        on_delete=models.CASCADE,
    )
    driverId = models.ForeignKey(
        "Drivers",
        verbose_name="Foreign key link to drivers table",
        db_column="driverId",
        on_delete=models.CASCADE,
    )
    lap = models.IntegerField("Lap number")
    position = models.IntegerField("Driver race position", blank=True, null=True)
    time = models.CharField('Lap time e.g. "1:43.762"', max_length=255, blank=True, null=True)
    milliseconds = models.IntegerField("Lap time in milliseconds", blank=True, null=True)

    class Meta:
        db_table = "ergast_lap_times"
        constraints = [models.UniqueConstraint(fields=["raceId", "driverId", "lap"], name="unique_lap_time")]

    def __str__(self):
        return f"{self.raceId} - {self.driverId} lap {self.lap}"


class PitStops(models.Model):
    id = models.CharField("Unique id '<raceId>|<driverId>|<stop>'", primary_key=True, max_length=255)
    raceId = models.ForeignKey(
        Races,
        verbose_name="Foreign key link to races table",
        db_column="raceId",
        on_delete=models.CASCADE,
    )
    driverId = models.ForeignKey(
        "Drivers",
        verbose_name="Foreign key link to drivers table",
        db_column="driverId",
        on_delete=models.CASCADE,
    )
    stop = models.IntegerField("Stop number")
    lap = models.IntegerField("Lap number")
    time = models.CharField('Time of stop e.g. "13:52:25"', max_length=255, blank=True, null=True)
    duration = models.CharField('Duration of stop e.g. "21.783"', max_length=255, blank=True, null=True)
    milliseconds = models.IntegerField("Duration of stop in milliseconds", blank=True, null=True)

    class Meta:
        db_table = "ergast_pit_stops"
        constraints = [models.UniqueConstraint(fields=["raceId", "driverId", "stop"], name="unique_pit_stop")]

    def __str__(self):
        return f"{self.raceId} - {self.driverId} pit stop {self.stop}"


class Constructors(models.Model):
    constructorId = models.AutoField("Primary Key", primary_key=True, db_column="constructorId")
    constructorRef = models.CharField(
        "Unique constructor identifier",
        db_column="constructorRef",
        unique=True,
        max_length=255,
    )
    name = models.CharField("Constructor name", max_length=255)
    nationality = models.CharField("Constructor nationality", max_length=255, blank=True, null=True)
    url = models.CharField("Constructor Wikipedia page", max_length=255, blank=True, null=True)

    class Meta:
        db_table = "ergast_constructors"

    def __str__(self):
        return f"{self.name}"


class Drivers(models.Model):
    driverId = models.AutoField("Primary Key", primary_key=True, db_column="driverId")
    driverRef = models.CharField("Unique driver identifier", max_length=255, db_column="driverRef")
    number = models.IntegerField("Permanent driver number", blank=True, null=True)
    code = models.CharField('Driver code e.g. "ALO"', max_length=3, blank=True, null=True)
    forename = models.CharField("Driver forename", max_length=255, blank=True)
    surname = models.CharField("Driver surname", max_length=255, blank=True)
    dob = models.DateField("Driver date of birth", blank=True, null=True)
    nationality = models.CharField("Driver nationality", max_length=255, blank=True)
    url = models.CharField("Constructor Wikipedia page", max_length=255, unique=True, blank=True, null=True)

    class Meta:
        db_table = "ergast_drivers"

    def __str__(self):
        return f"{self.forename} {self.surname}"


class ConstructorResults(models.Model):
    constructorResultsId = models.AutoField("Primary Key", primary_key=True, db_column="constructorResultsId")
    raceId = models.ForeignKey(
        Races,
        verbose_name="Foreign key link to races table",
        db_column="raceId",
        on_delete=models.CASCADE,
    )
    constructorId = models.ForeignKey(
        Constructors,
        verbose_name="Foreign key link to constructors table",
        db_column="constructorId",
        on_delete=models.CASCADE,
    )
    points = models.FloatField("Constructor points for season", blank=True, null=True)
    status = models.CharField('"D" for disqualified (or null)', max_length=255, blank=True, null=True)

    class Meta:
        db_table = "ergast_constructor_results"

    def __str__(self):
        return f"{self.raceId} - {self.constructorId} results"


class ConstructorStandings(models.Model):
    constructorStandingsId = models.AutoField("Primary Key", primary_key=True, db_column="constructorStandingsId")
    raceId = models.ForeignKey(
        Races,
        verbose_name="Foreign key link to races table",
        db_column="raceId",
        on_delete=models.CASCADE,
    )
    constructorId = models.ForeignKey(
        Constructors,
        verbose_name="Foreign key link to constructors table",
        db_column="constructorId",
        on_delete=models.CASCADE,
    )
    points = models.FloatField("Constructor points for season", blank=True, null=True)
    position = models.IntegerField("Constructor standings position (integer)", blank=True, null=True)
    positionText = models.CharField(
        "Constructor standings position (string)",
        max_length=255,
        blank=True,
        null=True,
        db_column="positionText",
    )
    wins = models.IntegerField("Season win count")

    class Meta:
        db_table = "ergast_constructor_standings"

    def __str__(self):
        return f"{self.raceId} - {self.constructorId} standings"


class DriverStandings(models.Model):
    driverStandingsId = models.AutoField("Primary Key", primary_key=True, db_column="driverStandingsId")
    raceId = models.ForeignKey(
        Races,
        verbose_name="Foreign key link to races table",
        db_column="raceId",
        on_delete=models.CASCADE,
    )
    driverId = models.ForeignKey(
        Drivers,
        verbose_name="Foreign key link to drivers table",
        db_column="driverId",
        on_delete=models.CASCADE,
    )
    points = models.FloatField("Driver points for season")
    position = models.IntegerField("Driver standings position (integer)", blank=True, null=True)
    positionText = models.CharField(
        "Driver standings position (string)",
        max_length=255,
        blank=True,
        null=True,
        db_column="positionText",
    )
    wins = models.IntegerField("Season win count")

    class Meta:
        db_table = "ergast_driver_standings"

    def __str__(self):
        return f"{self.raceId} - {self.driverId} championship standings"


class Qualifying(models.Model):
    qualifyId = models.AutoField("Primary key", primary_key=True, db_column="qualifyId")
    raceId = models.ForeignKey(
        Races,
        verbose_name="Foreign key link to races table",
        db_column="raceId",
        on_delete=models.CASCADE,
    )
    driverId = models.ForeignKey(
        Drivers,
        verbose_name="Foreign key link to drivers table",
        db_column="driverId",
        on_delete=models.CASCADE,
    )
    constructorId = models.ForeignKey(
        Constructors,
        verbose_name="Foreign key link to constructors table",
        db_column="constructorId",
        on_delete=models.CASCADE,
    )
    number = models.IntegerField("Driver number")
    position = models.IntegerField("Qualifying position", blank=True, null=True)
    q1 = models.CharField('Q1 lap time e.g. "1:21.374"', max_length=255, blank=True, null=True)
    q2 = models.CharField("Q2 lap time", max_length=255, blank=True, null=True)
    q3 = models.CharField("Q3 lap time", max_length=255, blank=True, null=True)

    class Meta:
        db_table = "ergast_qualifying"

    def __str__(self):
        return f"{self.raceId} - {self.driverId} Qualifying"


class Results(models.Model):
    resultId = models.AutoField("Primary key", primary_key=True, db_column="resultId")
    raceId = models.ForeignKey(
        Races,
        verbose_name="Foreign key link to races table",
        db_column="raceId",
        on_delete=models.CASCADE,
    )
    driverId = models.ForeignKey(
        Drivers,
        verbose_name="Foreign key link to drivers table",
        db_column="driverId",
        on_delete=models.CASCADE,
    )
    constructorId = models.ForeignKey(
        Constructors,
        verbose_name="Foreign key link to constructors table",
        db_column="constructorId",
        on_delete=models.CASCADE,
    )
    number = models.IntegerField("Driver number", blank=True, null=True)
    grid = models.IntegerField("Starting grid position")
    position = models.IntegerField("Official classification, if applicable", blank=True, null=True)
    positionText = models.CharField(
        'Driver position string e.g. "1" or "R"',
        max_length=255,
        db_column="positionText",
        blank=True,
    )
    positionOrder = models.IntegerField("Driver position for ordering purposes", db_column="positionOrder")
    points = models.FloatField("Driver points for race")
    laps = models.IntegerField("Number of completed laps")
    time = models.CharField("Finishing time or gap", max_length=255, blank=True, null=True)
    milliseconds = models.IntegerField("Finishing time in milliseconds", blank=True, null=True)
    fastestLap = models.IntegerField("Lap number of fastest lap", db_column="fastestLap", blank=True, null=True)
    rank = models.IntegerField("Fastest lap rank, compared to other drivers", blank=True, null=True)
    fastestLapTime = models.CharField(
        'Fastest lap time e.g. "1:27.453"',
        max_length=255,
        db_column="fastestLapTime",
        blank=True,
        null=True,
    )
    fastestLapSpeed = models.CharField(
        'Fastest lap speed (km/h) e.g. "213.874"',
        max_length=255,
        db_column="fastestLapSpeed",
        blank=True,
        null=True,
    )
    statusId = models.ForeignKey(
        "Status",
        verbose_name="Foreign key link to status table",
        db_column="statusId",
        on_delete=models.CASCADE,
    )

    class Meta:
        db_table = "ergast_results"

    def __str__(self):
        return f"{self.raceId} {self.driverId}"


class Status(models.Model):
    statusId = models.AutoField("Primary key", primary_key=True, db_column="statusId")
    status = models.CharField('Finishing status e.g. "Retired"', max_length=255)

    class Meta:
        db_table = "ergast_status"

    def __str__(self):
        return f"{self.status}"


class SprintResults(models.Model):
    resultId = models.AutoField("Primary key", primary_key=True, db_column="resultId")
    raceId = models.ForeignKey(
        Races,
        verbose_name="Foreign key link to races table",
        db_column="raceId",
        on_delete=models.CASCADE,
    )
    driverId = models.ForeignKey(
        Drivers,
        verbose_name="Foreign key link to drivers table",
        db_column="driverId",
        on_delete=models.CASCADE,
    )
    constructorId = models.ForeignKey(
        Constructors,
        verbose_name="Foreign key link to constructors table",
        db_column="constructorId",
        on_delete=models.CASCADE,
    )
    number = models.IntegerField("Driver number", blank=True, null=True)
    grid = models.IntegerField("Starting grid position")
    position = models.IntegerField("Official classification, if applicable", blank=True, null=True)
    positionText = models.CharField(
        'Driver position string e.g. "1" or "R"',
        max_length=255,
        db_column="positionText",
        blank=True,
    )
    positionOrder = models.IntegerField("Driver position for ordering purposes", db_column="positionOrder")
    points = models.FloatField("Driver points for race")
    laps = models.IntegerField("Number of completed laps")
    time = models.CharField("Finishing time or gap", max_length=255, blank=True, null=True)
    milliseconds = models.IntegerField("Finishing time in milliseconds", blank=True, null=True)
    fastestLap = models.IntegerField("Lap number of fastest lap", db_column="fastestLap", blank=True, null=True)
    fastestLapTime = models.CharField(
        'Fastest lap time e.g. "1:27.453"',
        max_length=255,
        db_column="fastestLapTime",
        blank=True,
        null=True,
    )
    statusId = models.ForeignKey(
        "Status",
        verbose_name="Foreign key link to status table",
        db_column="statusId",
        on_delete=models.CASCADE,
    )

    class Meta:
        db_table = "ergast_sprint_results"

    def __str__(self):
        return f"{self.raceId} {self.driverId}"
