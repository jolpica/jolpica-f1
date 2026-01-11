import datetime

from pydantic import BaseModel, ConfigDict, Field, HttpUrl

from .metadata import DetailResponse, PaginatedResponse


class DriverTeam(BaseModel):
    """
    Team information in driver's team history context.
    """

    id: str
    url: HttpUrl
    name: str
    country_code: str | None = Field(None, max_length=3)


class DriverSeason(BaseModel):
    """
    Season information in driver's team history context.
    """

    id: str
    url: HttpUrl
    year: int


class DriverTeamDriver(BaseModel):
    """
    Driver's stint with a team in a specific season.
    """

    id: str
    url: None = Field(None, description="TODO: URL to team driver detail endpoint")
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
    teams: list[DriverTeamDriver]


PaginatedDriverSummary = PaginatedResponse[list[DriverSummary]]
RetrievedDriverDetail = DetailResponse[DriverSummary]


class DriverQueryParams(BaseModel):
    """Query parameters for filtering drivers list"""

    model_config = ConfigDict(extra="forbid")

    year: int | None = Field(None, description="Filter drivers who competed in a specific season year")
    team_id: str | None = Field(None, description="Filter drivers who drove for a specific team (by team API ID)")
    country_code: str | None = Field(None, max_length=3, description="Filter by ISO 3166-1 alpha-3 country code")
    role: int | None = Field(None, description="Filter by driver role (0=Permanent, 1=Reserve, 2=Junior)")
