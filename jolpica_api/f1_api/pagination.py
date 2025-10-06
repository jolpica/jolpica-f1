from django.utils import timezone
from rest_framework.pagination import PageNumberPagination
from rest_framework.response import Response

from jolpica.schemas.f1_api.alpha import PaginatedResponse, PaginationMetadata


class StandardMetadataPagination(PageNumberPagination):
    page_size_query_param = None
    page_size = 100
    max_page_size = 100

    def get_paginated_response(self, data):
        metadata = PaginationMetadata(
            timestamp=timezone.now(),
            count=self.page.paginator.count,
            page_size=self.get_page_size(self.request),
            current_page=self.page.number,
            total_pages=self.page.paginator.num_pages,
            next_url=self.get_next_link(),
            previous_url=self.get_previous_link(),
        )
        return Response(PaginatedResponse(metadata=metadata, data=data).model_dump(mode="json", exclude_none=True))

    def get_paginated_response_schema(self, schema):
        return {
            "type": "object",
            "properties": {
                "metadata": PaginationMetadata.model_json_schema(),
                "data": schema,
            },
            "required": ["metadata", "data"],
        }
