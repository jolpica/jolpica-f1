from __future__ import annotations

from typing import Any

import pydantic
from rest_framework import serializers


class OmitNullMixin:
    """Mixin to omit null/None values from serializer output."""

    def to_representation(self, instance):
        representation = getattr(super(), "to_representation", lambda x: {})(instance)
        return {key: value for key, value in representation.items() if value is not None}


class BaseAPISerializer(OmitNullMixin, serializers.ModelSerializer):
    """
    Base serializer that validates output through a Pydantic schema.

    Makes Pydantic the source of truth for API response types by validating
    DRF serializer output before returning to the client.

    Subclasses must define:
    - pydantic_schema_class: The Pydantic schema to validate against
    - view_name: The DRF view name for URL field generation
    - Meta.model: The Django model
    - Meta.fields: List of fields to include (optional, auto-populated from pydantic_schema_class if not set)
    """

    pydantic_schema_class: type[pydantic.BaseModel]

    def __init_subclass__(cls, **kwargs):
        super().__init_subclass__(**kwargs)
        if hasattr(cls, "pydantic_schema_class") and cls.pydantic_schema_class:
            # Only set fields if not already explicitly defined in Meta
            if hasattr(cls, "Meta") and (not hasattr(cls.Meta, "fields") or cls.Meta.fields == "__all__"):
                cls.Meta.fields = list(cls.pydantic_schema_class.model_fields.keys())

    id = serializers.CharField(read_only=True, source="api_id")

    def __init__(self, *args: Any, **kwargs: Any) -> None:
        super().__init__(*args, **kwargs)
        # Dynamically add url field with correct view_name
        if "url" not in self._declared_fields:
            if view_name := getattr(self.__class__, "view_name", None):
                self.fields["url"] = serializers.HyperlinkedIdentityField(
                    view_name=view_name,
                    lookup_field="api_id",
                    read_only=True,
                )
            else:
                # If no view_name is set, url should always be null
                self.fields["url"] = serializers.SerializerMethodField()

    def get_url(self, instance: Any) -> None:
        """Return None for url when view_name is not set."""
        return None

    def to_representation(self, instance: Any) -> dict[str, Any]:
        """
        Convert instance to representation and validate through Pydantic schema.

        This ensures:
        - All fields match Pydantic schema types
        - No extra fields not in schema (equivalent to extra="forbid")
        - Consistent serialization (dates, URLs, enums, etc.)
        - Null values are omitted (exclude_none=True)
        - List and retrieve endpoints produce identical output

        Raises:
            ValidationError: If serializer output doesn't conform to Pydantic schema
                            or contains extra fields not in schema
        """
        # Get DRF representation
        representation = super().to_representation(instance)

        # Check for extra fields not in schema (equivalent to extra="forbid")
        schema_fields = set(self.pydantic_schema_class.model_fields.keys())
        repr_fields = set(representation.keys())
        extra_fields = repr_fields - schema_fields

        if extra_fields:
            raise serializers.ValidationError(
                f"Serializer output contains extra fields not in schema "
                f"{self.pydantic_schema_class.__name__}: {sorted(extra_fields)}"
            )

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
