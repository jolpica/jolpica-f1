from __future__ import annotations

import datetime
from datetime import timedelta

from pydantic import BaseModel, ConfigDict, Field, HttpUrl

from .metadata import DetailResponse


class ResultsDriver(BaseModel):
    """
    Driver information in Results context.
    """

    id: str
    url: HttpUrl
    abbreviation: str | None = Field(None, max_length=10)
    forename: str
    surname: str


class ResultsTeam(BaseModel):
    """
    Team information in Results context.
    """

    id: str
    url: HttpUrl
    name: str
    reference: str


class ResultsCircuit(BaseModel):
    """
    Circuit information in Results context.
    """

    id: str
    url: HttpUrl
    name: str
    reference: str
    locality: str | None = None
    country: str | None = None


class ResultsSeason(BaseModel):
    """
    Season information in Results context.
    """

    id: str
    url: HttpUrl
    year: int


class ResultsSession(BaseModel):
    """
    Session information in Results context.
    """

    id: str
    url: HttpUrl
    number: int | None = None
    type: str = Field(..., description="Session type code (e.g., R, Q1, Q2, Q3, QA, QB, QO)")
    type_display: str = Field(..., description="Display name for the session type")
    timestamp: datetime.datetime | None = None


class ResultsRound(BaseModel):
    """
    Round information in Results context.
    """

    id: str
    url: HttpUrl
    number: int | None = None
    name: str | None = None
    season: ResultsSeason


class ResultsQualifyingComponent(BaseModel):
    """
    Qualifying sub-session component information.
    """

    id: str
    url: HttpUrl
    type: str = Field(..., description="Session type code (e.g., Q1, Q2, Q3, QA, QB, QO)")
    type_display: str = Field(..., description="Display name for the session type")
    time: timedelta | None = Field(None, description="Session time in ISO 8601 duration format (e.g., PT1M32.458S)")
    time_display: str | None = Field(None, description="Human-readable session time (e.g., '1:32.458')")


class ResultsSummary(BaseModel):
    """
    Summary information for a race or qualifying result.
    """

    position: int | None = None
    points: float | None = None
    status: str | None = Field(None, description="Result status (e.g., Finished, +1 Lap, Retired)")
    laps: int | None = Field(None, description="Number of laps completed")
    time: timedelta | None = Field(
        None, description="Finishing time in ISO 8601 duration format (e.g., PT1H28M51.910S)"
    )
    time_display: str | None = Field(None, description="Human-readable finishing time (e.g., '1:28:51.910')")
    fastest_lap: timedelta | None = Field(
        None, description="Fastest lap time in ISO 8601 duration format (e.g., PT1M32.458S)"
    )
    fastest_lap_display: str | None = Field(None, description="Human-readable fastest lap time (e.g., '1:32.458')")
    driver: ResultsDriver
    team: ResultsTeam
    components: list[ResultsQualifyingComponent] | None = Field(
        None, description="Qualifying sub-session components (only for qualifying results)"
    )


class ResultsRoundInfo(BaseModel):
    """
    Round information container with circuit and sessions.
    """

    id: str
    url: HttpUrl
    number: int | None = None
    name: str | None = None
    season: ResultsSeason
    circuit: ResultsCircuit
    sessions: list[ResultsSession]


class ResultsData(BaseModel):
    """
    Complete results data structure.
    """

    round: ResultsRoundInfo
    results: list[ResultsSummary]


class ResultsDetail(DetailResponse[ResultsData]):
    """Schema for results detail responses"""

    model_config = ConfigDict(
        extra="forbid",
    )


RetrievedResultsDetail = ResultsDetail


__all__ = [
    "ResultsCircuit",
    "ResultsData",
    "ResultsDetail",
    "ResultsDriver",
    "ResultsQualifyingComponent",
    "ResultsRound",
    "ResultsRoundInfo",
    "ResultsSeason",
    "ResultsSession",
    "ResultsSummary",
    "ResultsTeam",
    "RetrievedResultsDetail",
]
