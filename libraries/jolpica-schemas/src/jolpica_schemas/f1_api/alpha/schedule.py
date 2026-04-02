import datetime

from pydantic import BaseModel, Field, HttpUrl

from .metadata import DetailResponse
from .shared import BasicRound, Circuit, Season


class ScheduleCircuit(Circuit):
    reference: str | None = None


class ScheduleSession(BaseModel):
    type: str = Field(..., description="Session type code (e.g., R, Q1, FP1)")
    type_display: str = Field(..., description="Display name for the session type")
    timestamp: datetime.datetime | None = None
    timezone: str | None = None
    missing_time_data: bool | None = Field(None, description="Does the timestamp field only have date information")
    local_timestamp: datetime.datetime | None = None
    results_url: HttpUrl | None = None


class ScheduleRound(BasicRound):
    circuit: ScheduleCircuit
    date: datetime.date | None = None
    sessions: list[ScheduleSession]


class ScheduleRoundInfoDetail(BaseModel):
    number: int
    index: int


class ScheduleRoundsInfo(BaseModel):
    next: ScheduleRoundInfoDetail | None = None
    previous: ScheduleRoundInfoDetail | None = None


class ScheduleSummary(Season):
    pass


class ScheduleDetail(Season):
    rounds_info: ScheduleRoundsInfo | None = None
    rounds: list[ScheduleRound]


class RetrievedScheduleDetail(DetailResponse[ScheduleDetail]):
    """Schema for season schedule detail responses"""
