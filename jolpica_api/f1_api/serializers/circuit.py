from __future__ import annotations

from jolpica.formula_one import models as f1
from jolpica.schemas.f1_api.alpha.circuit import CircuitSummary

from .base_serializer import PydanticValidatedSerializer


class CircuitSerializer(PydanticValidatedSerializer):
    """
    Serializer for Circuit information.

    Required prefetches: None
    """

    pydantic_schema_class = CircuitSummary
    view_name = "circuits-detail"

    class Meta:
        model = f1.Circuit
        fields = [
            "id",
            "url",
            "name",
            "locality",
            "country",
            "country_code",
            "latitude",
            "longitude",
            "altitude",
            "wikipedia",
        ]
