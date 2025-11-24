from __future__ import annotations

from typing import Any

import pydantic
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


class PydanticValidatedSerializer(serializers.ModelSerializer):
    """
    Base serializer that validates output through a Pydantic schema.

    Makes Pydantic the source of truth for API response types by validating
    DRF serializer output before returning to the client.

    Subclasses must define:
    - pydantic_schema_class: The Pydantic schema to validate against
    - view_name: The DRF view name for URL field generation
    - Meta.model: The Django model
    - Meta.fields: List of fields to include
    """

    pydantic_schema_class: type[pydantic.BaseModel]

    id = serializers.CharField(read_only=True, source="api_id")

    def __init__(self, *args: Any, **kwargs: Any) -> None:
        super().__init__(*args, **kwargs)
        # Dynamically add url field with correct view_name
        if hasattr(self.__class__, "view_name") and "url" not in self._declared_fields:
            self.fields["url"] = serializers.HyperlinkedIdentityField(
                view_name=self.__class__.view_name,
                lookup_field="api_id",
                read_only=True,
            )

    def to_representation(self, instance: Any) -> dict[str, Any]:
        """
        Convert instance to representation and validate through Pydantic schema.

        This ensures:
        - All fields match Pydantic schema types
        - Consistent serialization (dates, URLs, enums, etc.)
        - Null values are omitted (exclude_none=True)
        - List and retrieve endpoints produce identical output

        Raises:
            ValidationError: If serializer output doesn't conform to Pydantic schema
        """
        # Get DRF representation
        representation = super().to_representation(instance)

        # Validate through Pydantic
        try:
            validated_data = self.pydantic_schema_class.model_validate(representation)
        except pydantic.ValidationError as ex:
            # Format validation errors for debugging
            errors = {
                ".".join(str(loc) for loc in error["loc"]): error["msg"] for error in ex.errors(include_url=False)
            }
            raise serializers.ValidationError(
                f"Serializer output does not conform to {self.pydantic_schema_class.__name__}: {errors}"
            )

        # Convert back with Pydantic's serialization (source of truth)
        return validated_data.model_dump(mode="json", exclude_none=True)
