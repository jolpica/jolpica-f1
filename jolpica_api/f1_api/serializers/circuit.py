from __future__ import annotations

from rest_framework import serializers

from jolpica.formula_one import models as f1
from jolpica_api.f1_api.utils import safe_get_country_flag
from jolpica_schemas.f1_api.alpha.core.circuit import CircuitSummary

from .base_serializer import BaseAPISerializer


class CircuitSerializer(BaseAPISerializer):
    """
    Serializer for Circuit information.

    Required prefetches: None
    """

    pydantic_schema_class = CircuitSummary
    view_name = "core-circuits-detail"

    country_flag = serializers.SerializerMethodField()

    class Meta:
        model = f1.Circuit

    def get_country_flag(self, obj: f1.Circuit) -> str | None:
        """Get the country flag for the circuit's country code."""
        return safe_get_country_flag(obj.country_code)
