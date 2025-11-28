from __future__ import annotations

from datetime import timedelta

from pydantic import BaseModel, ConfigDict, Field, HttpUrl

from .metadata import DetailResponse, PaginatedResponse


class PitStopDriver(BaseModel):
    """
    Driver information in PitStop context.
    """

    id: str
    url: HttpUrl
    abbreviation: str | None = Field(None, max_length=10)
    forename: str
    surname: str


class PitStopTeam(BaseModel):
    """
    Team information in PitStop context.
    """

    id: str
    url: HttpUrl
    name: str
    reference: str


class PitStopSession(BaseModel):
    """
    Session information in PitStop context.
    """

    id: str
    url: HttpUrl
    number: int | None = None
    type: str = Field(..., description="Session type code (e.g., R, Q, FP1)")
    type_display: str = Field(..., description="Display name for the session type")


class PitStopSeason(BaseModel):
    """
    Season information in PitStop context.
    """

    id: str
    url: str | None = Field(None, description="TODO: URL to season detail endpoint")
    year: int


class PitStopRound(BaseModel):
    """
    Round information in PitStop context.
    """

    id: str
    url: HttpUrl
    number: int | None = None
    name: str | None = None
    season: PitStopSeason


class PitStopLap(BaseModel):
    """
    Lap information in PitStop context.
    """

    id: str
    url: HttpUrl
    number: int | None = None
    position: int | None = None
    time: str | None = Field(None, description="Lap time in ISO 8601 duration format (e.g., PT2M49.888S)")


class PitStopSummary(BaseModel):
    """Summary information for PitStop."""

    id: str
    url: HttpUrl
    number: int | None = Field(None, description="Pit stop number for this driver in the session")
    duration: timedelta | None = Field(None, description="Pit stop duration in ISO 8601 format (e.g., PT13.341S)")
    duration_display: str | None = Field(None, description="Human-readable pit stop duration (e.g., '2.347s')")
    duration_milliseconds: int | None = Field(None, description="Pit stop duration in milliseconds")
    local_timestamp: str | None = Field(None, max_length=16, description="Local time of pit stop")
    driver: PitStopDriver
    team: PitStopTeam
    session: PitStopSession
    round: PitStopRound
    lap: PitStopLap | None = None


class PaginatedPitStopSummary(PaginatedResponse[list[PitStopSummary]]):
    """Schema for paginated pit stop list responses"""


PitStopDetail = PitStopSummary


class RetrievedPitStopDetail(DetailResponse[PitStopDetail]):
    """Schema for pit stop detail responses"""


class PitStopQueryParams(BaseModel):
    """Query parameters for filtering pit stops list"""

    model_config = ConfigDict(extra="forbid")

    year: int | None = Field(None, description="Filter by season year")
    session_id: str | None = Field(None, description="Filter by session API ID")
    driver_id: str | None = Field(None, description="Filter by driver API ID")
    team_id: str | None = Field(None, description="Filter by team API ID")
    round_id: str | None = Field(None, description="Filter by round API ID")
    lap_number: int | None = Field(None, description="Filter by lap number", ge=1)
    stop_number: int | None = Field(None, description="Filter by pit stop number", ge=1)
