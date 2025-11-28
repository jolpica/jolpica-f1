from datetime import timedelta

from pydantic import BaseModel, ConfigDict, Field, HttpUrl

from .metadata import DetailResponse, PaginatedResponse


class SessionEntrySession(BaseModel):
    """
    Session information in SessionEntry context.
    """

    id: str
    url: HttpUrl
    type: str = Field(..., description="Session type code (e.g., R, Q1, FP1)")
    type_display: str = Field(..., description="Display name for the session type")


class SessionEntryRound(BaseModel):
    """
    Round information in SessionEntry context.
    """

    id: str
    url: HttpUrl
    number: int | None = None
    name: str | None = None


class SessionEntryDriver(BaseModel):
    """
    Driver information in SessionEntry context.
    """

    id: str
    url: HttpUrl
    abbreviation: str | None = Field(None, max_length=10)
    forename: str
    surname: str


class SessionEntryTeam(BaseModel):
    """
    Team information in SessionEntry context.
    """

    id: str
    url: HttpUrl
    name: str
    reference: str


class SessionEntrySummary(BaseModel):
    """Summary information for SessionEntry."""

    id: str
    url: HttpUrl
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
    car_number: int | None = Field(None, description="Car number used for this entry")
    session: SessionEntrySession
    round: SessionEntryRound
    driver: SessionEntryDriver
    team: SessionEntryTeam


PaginatedSessionEntrySummary = PaginatedResponse[list[SessionEntrySummary]]
SessionEntryDetail = SessionEntrySummary
RetrievedSessionEntryDetail = DetailResponse[SessionEntryDetail]


class SessionEntryQueryParams(BaseModel):
    """Query parameters for filtering session entries list"""

    model_config = ConfigDict(extra="forbid")

    year: int | None = Field(None, description="Filter by season year")
    session_id: str | None = Field(None, description="Filter by session API ID")
    driver_id: str | None = Field(None, description="Filter by driver API ID")
    team_id: str | None = Field(None, description="Filter by team API ID")
    position: int | None = Field(None, description="Filter by finishing position", ge=1)
    round_id: str | None = Field(None, description="Filter by round API ID")
    session_type: list[str] | None = Field(
        None, description="Filter by session type codes (e.g., R, Q1, FP1). Can specify multiple values."
    )
    has_session_points: bool | None = Field(None, description="Filter for session entries in point scoring sessions")
