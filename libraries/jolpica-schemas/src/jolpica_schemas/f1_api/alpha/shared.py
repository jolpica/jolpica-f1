import datetime
from datetime import timedelta

from pydantic import BaseModel, Field, HttpUrl


class BasicCircuit(BaseModel):
    id: str
    url: HttpUrl
    name: str
    locality: str | None = None
    country_code: str | None = Field(None, max_length=3)


class Circuit(BasicCircuit):
    country: str | None = None
    latitude: float | None = None
    longitude: float | None = None
    altitude: float | None = None
    wikipedia: HttpUrl | None = None


class BasicSeason(BaseModel):
    id: str
    url: HttpUrl
    year: int


class Season(BasicSeason):
    wikipedia: HttpUrl | None = None


class BasicSession(BaseModel):
    id: str
    url: HttpUrl
    number: int | None = None
    type: str = Field(..., description="Session type code (e.g., R, Q1, FP1)")
    type_display: str = Field(..., description="Display name for the session type")


class Session(BasicSession):
    timestamp: datetime.datetime | None = None
    has_time_data: bool = False
    local_timestamp: str | None = None
    timezone: str | None = None
    scheduled_laps: int | None = None
    is_cancelled: bool = False


class BasicSessionEntry(BaseModel):
    id: str
    url: HttpUrl


class SessionEntry(BasicSessionEntry):
    position: int | None = None
    is_classified: bool | None = None
    status: int | None = Field(None, description="Session status code")
    status_display: str | None = Field(None, description="Display name for the session status")
    points: float | None = None
    grid: int | None = Field(None, description="Grid position at session start")
    time: timedelta | None = Field(
        None, description="Finishing time in ISO 8601 duration format (e.g., PT1H32M15.123S)"
    )
    time_display: str | None = Field(None, description="Human-readable finishing time (e.g., 1:32:15.123)")
    fastest_lap_rank: int | None = Field(None, description="Fastest lap ranking in session")
    laps_completed: int | None = Field(None, description="Number of laps completed")


class PitStop(BaseModel):
    id: str
    url: HttpUrl
    number: int | None = None
    duration: timedelta | None = Field(None, description="Pit stop duration as ISO 8601")
    duration_display: str | None = Field(None, description="Human-readable pit stop duration (e.g., '2.456')")
    duration_milliseconds: int | None = Field(None, description="Pit stop duration in milliseconds")
    local_timestamp: str | None = Field(None, max_length=16, description="Local time of pit stop")


class BasicLap(BaseModel):
    id: str
    url: HttpUrl
    number: int | None = None
    position: int | None = None
    time: timedelta | None = Field(None, description="Lap time in ISO 8601 duration format (e.g., PT2M49.888S)")


class Lap(BasicLap):
    time_display: str | None = Field(None, description="Human-readable lap time (e.g., '1:32.156')")
    time_milliseconds: int | None = Field(None, description="Lap time in milliseconds")
    average_speed: float | None = None
    is_entry_fastest_lap: bool = False


class BasicRound(BaseModel):
    id: str
    url: HttpUrl
    number: int | None = None
    name: str | None = None


class Round(BasicRound):
    race_number: int | None = None
    wikipedia: HttpUrl | None = None
    is_cancelled: bool = False


class BasicDriver(BaseModel):
    id: str
    url: HttpUrl
    abbreviation: str | None = Field(None, max_length=10)
    given_name: str
    family_name: str


class Driver(BasicDriver):
    nationality: str | None = None
    country_code: str | None = Field(None, max_length=3)
    permanent_car_number: int | None = None
    date_of_birth: datetime.date | None = None
    wikipedia: HttpUrl | None = None


class BasicTeam(BaseModel):
    id: str
    url: HttpUrl
    name: str
    primary_color: str | None = None


class Team(BasicTeam):
    nationality: str | None = None
    country_code: str | None = Field(None, max_length=3)
    wikipedia: HttpUrl | None = None
