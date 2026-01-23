from pydantic import BaseModel, ConfigDict, Field

from .metadata import DetailResponse, PaginatedResponse
from .shared import Circuit


class CircuitSummary(Circuit):
    pass


PaginatedCircuitSummary = PaginatedResponse[list[CircuitSummary]]
RetrievedCircuitDetail = DetailResponse[CircuitSummary]


class CircuitQueryParams(BaseModel):
    """Query parameters for filtering circuits list"""

    model_config = ConfigDict(extra="forbid")

    year: int | None = Field(None, description="Filter by circuits that appeared in a specific season year")
    country_code: str | None = Field(None, max_length=3, description="Filter by ISO 3166-1 alpha-3 country code")
