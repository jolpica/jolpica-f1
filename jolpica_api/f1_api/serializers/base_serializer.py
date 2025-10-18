from __future__ import annotations

from rest_framework import serializers


class OmitNullMixin:
    """Mixin to omit null/None values from serializer output."""

    def to_representation(self, instance):
        representation = super().to_representation(instance)
        return {key: value for key, value in representation.items() if value is not None}


class BaseAPISerializer(OmitNullMixin, serializers.ModelSerializer):
    """
    Base serializer for F1 API endpoints.

    Provides common fields:
    - id: Maps model's api_id to id for API response
    - url: Self-referencing hyperlinked field (auto-generated if view_name is set)

    Subclasses must define:
    - view_name: The DRF view name for the url field (e.g., 'rounds-detail')
    - Meta.model: The Django model
    - Meta.fields: List of fields to include (must include 'id' and 'url')

    Usage:
        class MySerializer(BaseAPISerializer):
            view_name = "myresources-detail"

            class Meta:
                model = MyModel
                fields = ["id", "url", "field1", "field2"]
    """

    id = serializers.CharField(read_only=True, source="api_id")

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        # Dynamically add url field with correct view_name if not explicitly declared
        # Check both the declared fields (from class definition) and instance fields
        if hasattr(self.__class__, "view_name") and "url" not in self._declared_fields:
            self.fields["url"] = serializers.HyperlinkedIdentityField(
                view_name=self.__class__.view_name, lookup_field="api_id", read_only=True
            )
