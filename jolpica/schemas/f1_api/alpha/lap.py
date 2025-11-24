from __future__ import annotations

from datetime import timedelta

from pydantic import BaseModel, ConfigDict, Field, HttpUrl

from .metadata import DetailResponse, PaginatedResponse


class LapSessionEntry(BaseModel):
    """
    Minimal SessionEntry information in Lap context.
    """

    id: str
    url: HttpUrl


class LapPitStop(BaseModel):
    """
    PitStop information in Lap context.
    """

    id: str
    url: str | None = Field(None, description="TODO: URL to pit stop detail endpoint")
    number: int | None = None
    duration: timedelta | None = Field(None, description="Pit stop duration as ISO 8601")
    duration_display: str | None = Field(None, description="Human-readable pit stop duration (e.g., '2.456')")
    duration_milliseconds: int | None = Field(None, description="Pit stop duration in milliseconds")
    local_timestamp: str | None = Field(None, max_length=16, description="Local time of pit stop")


class LapSummary(BaseModel):
    """Summary information for Lap."""

    id: str
    url: HttpUrl
    number: int | None = None
    position: int | None = None
    time: timedelta | None = Field(None, description="Lap time in ISO 8601 duration format (e.g., PT2M49.888S)")
    time_display: str | None = Field(None, description="Human-readable lap time (e.g., '1:32.156')")
    time_milliseconds: int | None = Field(None, description="Lap time in milliseconds")
    average_speed: float | None = None
    is_entry_fastest_lap: bool = False
    session_entry: LapSessionEntry
    pit_stop: LapPitStop | None = None


class PaginatedLapSummary(PaginatedResponse[list[LapSummary]]):
    """Schema for paginated lap list responses"""


LapDetail = LapSummary


class RetrievedLapDetail(DetailResponse[LapDetail]):
    """Schema for lap detail responses"""


class LapQueryParams(BaseModel):
    """Query parameters for filtering laps list"""

    model_config = ConfigDict(extra="forbid")

    year: int | None = Field(None, description="Filter by season year")
    session_id: str | None = Field(None, description="Filter by session API ID")
    session_type: list[str] | None = Field(None, description="Filter by session type codes (e.g., R, Q, FP1)")
    session_entry_id: str | None = Field(None, description="Filter by session entry API ID")
    driver_id: str | None = Field(None, description="Filter by driver API ID")
    team_id: str | None = Field(None, description="Filter by team API ID")
    is_fastest_lap: bool | None = Field(None, description="Filter to show only fastest laps")
    has_pit_stop: bool | None = Field(None, description="Filter laps that have pit stops")
