import datetime

from pydantic import BaseModel, HttpUrl

from .metadata import DetailResponse
from .shared import Circuit, FullSession, Round, Season


class ScheduleFullSession(FullSession):
    results_url: HttpUrl | None = None


class ScheduleEntry(BaseModel):
    round: Round
    circuit: Circuit
    date: datetime.date | None = None
    schedule: list[ScheduleFullSession]


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
    events: list[ScheduleEntry]


class RetrievedScheduleDetail(DetailResponse[ScheduleDetail]):
    """Schema for season schedule detail responses"""
