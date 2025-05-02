from django.utils import timezone
from rest_framework.pagination import PageNumberPagination
from rest_framework.response import Response


class StandardMetadataPagination(PageNumberPagination):
    page_size_query_param = None
    page_size = 100
    max_page_size = 100

    def get_paginated_response(self, data):
        # Metadata specific to paginated list views
        metadata = {
            "timestamp": timezone.now(),
            "count": self.page.paginator.count,
            "page_size": self.get_page_size(self.request),
            "current_page": self.page.number,
            "total_pages": self.page.paginator.num_pages,
            "next_url": self.get_next_link(),
            "previous_url": self.get_previous_link(),
        }
        return Response({"metadata": metadata, "data": data})
