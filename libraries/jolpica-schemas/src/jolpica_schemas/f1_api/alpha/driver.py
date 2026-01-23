from pydantic import BaseModel, ConfigDict, Field

from .metadata import DetailResponse, PaginatedResponse
from .shared import Driver


class DriverSummary(Driver):
    pass


PaginatedDriverSummary = PaginatedResponse[list[DriverSummary]]
RetrievedDriverDetail = DetailResponse[DriverSummary]


class DriverQueryParams(BaseModel):
    """Query parameters for filtering drivers list"""

    model_config = ConfigDict(extra="forbid")

    year: int | None = Field(None, description="Filter drivers who competed in a specific season year")
    team_id: str | None = Field(None, description="Filter drivers who drove for a specific team (by team API ID)")
    country_code: str | None = Field(None, max_length=3, description="Filter by ISO 3166-1 alpha-3 country code")
    role: int | None = Field(None, description="Filter by driver role (0=Permanent, 1=Reserve, 2=Junior)")
