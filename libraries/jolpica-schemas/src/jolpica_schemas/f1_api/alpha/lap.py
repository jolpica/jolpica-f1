from __future__ import annotations

from pydantic import BaseModel, ConfigDict, Field

from .metadata import DetailResponse, PaginatedResponse
from .shared import BasicSessionEntry, Lap, PitStop


class LapSessionEntry(BasicSessionEntry):
    pass


class LapPitStop(PitStop):
    pass


class LapSummary(Lap):
    session_entry: LapSessionEntry
    pit_stop: LapPitStop | None = None


PaginatedLapSummary = PaginatedResponse[list[LapSummary]]
RetrievedLapDetail = DetailResponse[LapSummary]


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
