from __future__ import annotations

from jolpica.formula_one import models as f1

from .base_serializer import BaseAPISerializer


class CircuitSerializer(BaseAPISerializer):
    """
    Serializer for Circuit information.

    Required prefetches: None
    """

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
