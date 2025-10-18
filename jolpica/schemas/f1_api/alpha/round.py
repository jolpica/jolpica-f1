import datetime

from pydantic import BaseModel, ConfigDict, Field, HttpUrl

from .metadata import DetailResponse


class RoundCircuit(BaseModel):
    id: str
    url: HttpUrl | None = Field(None, description="TODO: URL to circuit detail endpoint")
    name: str
    locality: str | None = None
    country_code: str | None = Field(None, max_length=3)


class RoundSeason(BaseModel):
    id: str
    url: HttpUrl | None = Field(None, description="TODO: URL to season detail endpoint")
    year: int


class RoundSession(BaseModel):
    id: str
    url: HttpUrl | None = Field(None, description="TODO: URL to session detail endpoint")
    number: int | None = None
    type: str = Field(..., description="Session type code (e.g., R, Q1, FP1)")
    type_display: str = Field(..., description="Display name for the session type")
    timestamp: datetime.datetime | None = None
    has_time_data: bool = False
    local_timestamp: str | None = None
    timezone: str | None = None


class RoundSummary(BaseModel):
    id: str
    url: HttpUrl
    number: int | None = None
    name: str | None = None
    race_number: int | None = None
    wikipedia: HttpUrl | None = None
    is_cancelled: bool = False
    circuit: RoundCircuit
    season: RoundSeason
    sessions: list[RoundSession]


RetrievedRoundDetail = DetailResponse[RoundSummary]


class RoundQueryParams(BaseModel):
    """Query parameters for filtering rounds list"""

    model_config = ConfigDict(extra="forbid")

    year: int | None = Field(None, description="Filter by season year")
    round_number: int | None = Field(None, description="Filter by round number within season", ge=1)
    race_number: int | None = Field(None, description="Filter by overall race number", ge=1)
    is_cancelled: bool | None = Field(None, description="Filter by cancellation status")
    driver_id: str | None = Field(None, description="Filter by driver API ID")
    team_id: str | None = Field(None, description="Filter by team API ID")
