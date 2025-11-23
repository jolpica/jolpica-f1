from __future__ import annotations

from typing import Any

import pydantic
from django.utils import timezone
from rest_framework import permissions, response, viewsets

from jolpica.schemas.f1_api.alpha.metadata import (
    DetailMetadata,
    DetailResponse,
)

from ..pagination import StandardMetadataPagination
from ..utils import validate_query_params


class BaseFilterableViewSet[T: pydantic.BaseModel](viewsets.ReadOnlyModelViewSet):
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
    query_params_class: type[T]
    response_schema_class: type[pydantic.BaseModel]

    def __init__(self, **kwargs: Any):
        super().__init__(**kwargs)
        if not hasattr(self, "query_params_class"):
            raise NotImplementedError(f"{self.__class__.__name__} must define 'query_params_class' attribute")
        if not hasattr(self, "response_schema_class"):
            raise NotImplementedError(f"{self.__class__.__name__} must define 'response_schema_class' attribute")

    def _get_validated_query_params(self) -> T:
        """Parse and validate query parameters using the query_params_class."""
        return validate_query_params(
            query_params=self.request.query_params,
            model=self.query_params_class,
            pagination_class=self.pagination_class,
        )

    def retrieve(self, request: Any, *args: Any, **kwargs: Any) -> response.Response:
        """
        Override retrieve to return DetailResponse format with metadata.

        Validates serializer data against response_schema_class before returning.
        """
        instance = self.get_object()
        serializer = self.get_serializer(instance)
        data = self.response_schema_class.model_validate(serializer.data)
        metadata = DetailMetadata(timestamp=timezone.now())
        return response.Response(
            DetailResponse(metadata=metadata, data=data).model_dump(mode="json", exclude_none=True)
        )
