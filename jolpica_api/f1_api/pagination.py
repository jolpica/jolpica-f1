from django.utils import timezone
from rest_framework.pagination import PageNumberPagination
from rest_framework.response import Response


class StandardMetadataPagination(PageNumberPagination):
    page_size = 100 # Default page size
    page_size_query_param = None 
    max_page_size = 100 # Maximum limit allowed

    def get_paginated_response(self, data):
        # Metadata specific to paginated list views
        metadata = {
            'timestamp': timezone.now(),
            'count': self.page.paginator.count,
            'page_size': self.get_page_size(self.request),
            'current_page': self.page.number,
            'total_pages': self.page.paginator.num_pages,
            'next_url': self.get_next_link(),
            'previous_url': self.get_previous_link(),
        }
        return Response({
            'metadata': metadata,
            'data': data
        })

    def get_paginated_response_schema(self, schema):
        # Optional: Adjust schema generation for API documentation tools if needed
        return {
            'type': 'object',
            'properties': {
                'metadata': {
                    'type': 'object',
                    'properties': {
                        'timestamp': {'type': 'string', 'format': 'date-time'},
                        'count': {'type': 'integer'},
                        'page_size': {'type': 'integer'},
                        'current_page': {'type': 'integer'},
                        'total_pages': {'type': 'integer'},
                        'next_url': {'type': 'string', 'nullable': True, 'format': 'uri'},
                        'previous_url': {'type': 'string', 'nullable': True, 'format': 'uri'},
                    }
                },
                'data': schema,
            },
        }