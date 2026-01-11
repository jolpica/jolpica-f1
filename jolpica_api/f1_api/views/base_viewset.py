from __future__ import annotations

from typing import Any, ClassVar

import pydantic
from django.utils import timezone
from rest_framework import permissions, response, viewsets

from jolpica_schemas.f1_api.alpha.metadata import (
    DetailMetadata,
    DetailResponse,
)

from ..pagination import StandardMetadataPagination
from ..utils import validate_query_params


class BaseFilterableViewSet(viewsets.ReadOnlyModelViewSet):
    """
    Base ViewSet for filterable F1 API endpoints.

    Provides common functionality for endpoints with query parameter filtering
    and standardized DetailResponse wrapping.

    Subclasses must define (following DRF naming conventions):
    - query_params_class: Pydantic model class for query parameter validation
    - response_schema_class: Pydantic schema class for response data validation
    - serializer_class: DRF serializer class (inherited from ReadOnlyModelViewSet)

    Raises:
        NotImplementedError: At instantiation if required attributes are not defined
    """

    permission_classes = [permissions.AllowAny]
    pagination_class = StandardMetadataPagination
    lookup_field = "api_id"

    # Subclasses must override these
    response_schema_class: ClassVar[type[pydantic.BaseModel]]

    def __init__(self, **kwargs: Any):
        super().__init__(**kwargs)
        if not hasattr(self, "query_params_class"):
            raise NotImplementedError(f"{self.__class__.__name__} must define 'query_params_class' attribute")
        if not hasattr(self, "response_schema_class"):
            raise NotImplementedError(f"{self.__class__.__name__} must define 'response_schema_class' attribute")

        # Validate serializer uses PydanticValidatedSerializer
        if hasattr(self, "serializer_class") and self.serializer_class is not None:
            from ..serializers.base_serializer import BaseAPISerializer

            if not issubclass(self.serializer_class, BaseAPISerializer):
                raise NotImplementedError(
                    f"{self.__class__.__name__}.serializer_class must inherit from PydanticValidatedSerializer"
                )

    def _get_validated_query_params[T: pydantic.BaseModel](self, query_params_class: type[T]) -> T:
        """Parse and validate query parameters using the query_params_class."""
        return validate_query_params(
            query_params=self.request.query_params,
            model=query_params_class,
            pagination_class=self.pagination_class,
        )

    def retrieve(self, request: Any, *args: Any, **kwargs: Any) -> response.Response:
        """
        Override retrieve to return DetailResponse format with metadata.

        Serializer automatically validates via PydanticValidatedSerializer.to_representation().
        """
        instance = self.get_object()
        serializer = self.get_serializer(instance)
        # serializer.data is already Pydantic-validated!
        metadata = DetailMetadata(timestamp=timezone.now())
        return response.Response(
            DetailResponse(metadata=metadata, data=serializer.data).model_dump(mode="json", exclude_none=True)
        )
