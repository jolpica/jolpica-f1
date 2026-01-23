from __future__ import annotations

from rest_framework import serializers

from jolpica.formula_one import models as f1
from jolpica_schemas.f1_api.alpha.driver import DriverSummary

from .base_serializer import BaseAPISerializer


class DriverSerializer(BaseAPISerializer):
    """
    Serializer for Driver with nested team history.

    Required prefetches:
    - prefetch_related('team_drivers__team', 'team_drivers__season')
    """

    pydantic_schema_class = DriverSummary
    view_name = "drivers-detail"
    given_name = serializers.CharField(read_only=True, source="forename")
    family_name = serializers.CharField(read_only=True, source="surname")
    nationality = serializers.CharField(read_only=True)  # TODO: Generate from country_code

    class Meta:
        model = f1.Driver
