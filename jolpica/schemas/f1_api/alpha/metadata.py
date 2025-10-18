"""
Pydantic schemas for the F1 Alpha API.

Generic Response Types:
- DetailResponse[T]: Wraps detail endpoint responses with metadata
- PaginatedResponse[T]: Wraps paginated list responses with pagination metadata
"""

import datetime

from pydantic import BaseModel, HttpUrl


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
