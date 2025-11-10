import datetime

from pydantic import BaseModel, ConfigDict, Field, HttpUrl

from .metadata import DetailResponse, PaginatedResponse


class SessionRound(BaseModel):
    """
    Round information in Session context.
    """

    id: str
    url: HttpUrl
    number: int | None = None
    name: str | None = None


class SessionSummary(BaseModel):
    """Summary information for Session."""

    id: str
    url: HttpUrl
    number: int | None = None
    type: str = Field(..., description="Session type code (e.g., R, Q1, FP1)")
    type_display: str = Field(..., description="Display name for the session type")
    timestamp: datetime.datetime | None = None
    has_time_data: bool = False
    local_timestamp: str | None = None
    timezone: str | None = None
    scheduled_laps: int | None = None
    is_cancelled: bool = False
    round: SessionRound


PaginatedSessionSummary = PaginatedResponse[list[SessionSummary]]
SessionDetail = SessionSummary
RetrievedSessionDetail = DetailResponse[SessionSummary]


class SessionQueryParams(BaseModel):
    """Query parameters for filtering sessions list"""

    model_config = ConfigDict(extra="forbid")

    year: int | None = Field(None, description="Filter by season year")
    session_type: str | None = Field(None, max_length=3, description="Filter by session type code (e.g., R, Q1, FP1)")
    round_id: str | None = Field(None, description="Filter by round API ID")
