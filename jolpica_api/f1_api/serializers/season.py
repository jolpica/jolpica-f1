from __future__ import annotations

from jolpica.formula_one import models as f1
from jolpica_schemas.f1_api.alpha.season import SeasonSummary

from .base_serializer import BaseAPISerializer


class SeasonSerializer(BaseAPISerializer):
    """
    Serializer for Circuit information.

    Required prefetches: None
    """

    pydantic_schema_class = SeasonSummary
    view_name = "seasons-detail"

    class Meta:
        model = f1.Season
