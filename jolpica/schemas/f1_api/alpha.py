"""
Pydantic schemas for the F1 Alpha API.

Generic Response Types:
- DetailResponse[T]: Wraps detail endpoint responses with metadata
- PaginatedResponse[T]: Wraps paginated list responses with pagination metadata
"""

import datetime

from pydantic import BaseModel, ConfigDict, Field, HttpUrl


class DetailMetadata(BaseModel):
    timestamp: datetime.datetime


class DetailResponse[T](BaseModel):
    metadata: DetailMetadata
    data: T


class PaginationMetadata(DetailMetadata):
    count: int
    page_size: int
    current_page: int
    total_pages: int
    next_url: HttpUrl | None = None
    previous_url: HttpUrl | None = None


class PaginatedResponse[T](BaseModel):
    metadata: PaginationMetadata
    data: T


class ScheduleCircuit(BaseModel):
    name: str
    reference: str | None = None
    wikipedia: HttpUrl | None = None
    latitude: float | None = None
    longitude: float | None = None
    altitude: float | None = None
    locality: str | None = None
    country_code: str | None = Field(None, max_length=3)


class ScheduleSession(BaseModel):
    type: str = Field(..., description="Session type code (e.g., R, Q1, FP1)")
    type_display: str = Field(..., description="Display name for the session type")
    timestamp: datetime.datetime | None = None
    timezone: str | None = None
    has_time_data: bool = False
    local_timestamp: datetime.datetime | None = None


class ScheduleRound(BaseModel):
    number: int
    name: str | None = None
    circuit: ScheduleCircuit
    date: datetime.date | None = None
    sessions: list[ScheduleSession]


class ScheduleRoundInfoDetail(BaseModel):
    number: int
    index: int


class ScheduleRoundsInfo(BaseModel):
    next: ScheduleRoundInfoDetail | None = None
    previous: ScheduleRoundInfoDetail | None = None


class ScheduleSummary(BaseModel):
    url: HttpUrl
    year: int
    wikipedia: HttpUrl | None = None


class ScheduleDetail(BaseModel):
    url: HttpUrl
    year: int
    wikipedia: HttpUrl | None = None
    rounds_info: ScheduleRoundsInfo | None = None
    rounds: list[ScheduleRound]


class RetrievedScheduleDetail(DetailResponse[ScheduleDetail]):
    """Schema for season schedule detail responses"""


class RoundCircuit(BaseModel):
    id: str
    url: HttpUrl
    name: str
    locality: str | None = None
    country_code: str | None = Field(None, max_length=3)


class RoundSeason(BaseModel):
    id: str
    url: HttpUrl
    year: int


class RoundSession(BaseModel):
    id: str
    url: str | None = Field(None, description="TODO: URL to session detail endpoint")
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


class CircuitSummary(BaseModel):
    """Summary information for Circuit"""

    id: str
    url: HttpUrl
    name: str
    reference: str | None = None
    locality: str | None = None
    country: str | None = None
    country_code: str | None = Field(None, max_length=3)
    latitude: float | None = None
    longitude: float | None = None
    altitude: float | None = None
    wikipedia: HttpUrl | None = None


PaginatedCircuitSummary = PaginatedResponse[list[CircuitSummary]]
RetrievedCircuitDetail = DetailResponse[CircuitSummary]


class CircuitQueryParams(BaseModel):
    """Query parameters for filtering circuits list"""

    model_config = ConfigDict(extra="forbid")

    year: int | None = Field(None, description="Filter by circuits that appeared in a specific season year")
    country_code: str | None = Field(None, max_length=3, description="Filter by ISO 3166-1 alpha-3 country code")


class DriverTeam(BaseModel):
    """
    Team information in driver's team history context.
    """

    id: str
    name: str
    country_code: str | None = Field(None, max_length=3)


class DriverSeason(BaseModel):
    """
    Season information in driver's team history context.
    """

    id: str
    year: int


class DriverTeamHistory(BaseModel):
    """
    Driver's stint with a team in a specific season.
    """

    id: str
    team: DriverTeam
    season: DriverSeason
    role: int | None = None
    role_display: str | None = None


class DriverSummary(BaseModel):
    """Summary information for Driver."""

    id: str
    url: HttpUrl
    first_name: str
    last_name: str
    abbreviation: str | None = None
    nationality: str | None = None
    country_code: str | None = Field(None, max_length=3)
    permanent_car_number: int | None = None
    date_of_birth: datetime.date | None = None
    wikipedia: HttpUrl | None = None
    teams: list[DriverTeamHistory]


PaginatedDriverSummary = PaginatedResponse[list[DriverSummary]]
RetrievedDriverDetail = DetailResponse[DriverSummary]


class DriverQueryParams(BaseModel):
    """Query parameters for filtering drivers list"""

    model_config = ConfigDict(extra="forbid")

    year: int | None = Field(None, description="Filter drivers who competed in a specific season year")
    team_id: str | None = Field(None, description="Filter drivers who drove for a specific team (by team API ID)")
    country_code: str | None = Field(None, max_length=3, description="Filter by ISO 3166-1 alpha-3 country code")
    role: int | None = Field(None, description="Filter by driver role (0=Permanent, 1=Reserve, 2=Junior)")


class TeamSeason(BaseModel):
    """
    Season information in team context.
    """

    id: str
    year: int


class TeamSummary(BaseModel):
    """Summary information for Team."""

    id: str
    url: HttpUrl
    name: str
    reference: str | None = None
    nationality: str | None = None
    country_code: str | None = Field(None, max_length=3)
    wikipedia: HttpUrl | None = None
    seasons: list[TeamSeason]


PaginatedTeamSummary = PaginatedResponse[list[TeamSummary]]
RetrievedTeamDetail = DetailResponse[TeamSummary]


class TeamQueryParams(BaseModel):
    """Query parameters for filtering teams list"""

    model_config = ConfigDict(extra="forbid")

    year: int | None = Field(None, description="Filter teams that competed in a specific season year")
    country_code: str | None = Field(None, max_length=3, description="Filter by ISO 3166-1 alpha-3 country code")
