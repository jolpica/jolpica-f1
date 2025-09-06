from __future__ import annotations

from rest_framework.permissions import BasePermission
from rest_framework.request import Request
from rest_framework.views import APIView


class CanUploadDumpsPermission(BasePermission):
    """Permission class for dump upload operations.

    Allows access only to authenticated users with the 'can_upload_dumps'
    permission or superusers. This permission is required for both starting uploads
    and confirming uploads.

    The permission is checked for POST requests on dump-related endpoints.
    """

    def has_permission(self, request: Request, view: APIView) -> bool:
        # Only check permissions for POST requests (our dump operations)
        if request.method == "POST":
            user = request.user
            return user.is_authenticated and (user.has_perm("dumps.can_upload_dumps") or user.is_superuser)

        # Deny all other HTTP methods (GET, PUT, PATCH, DELETE)
        return False
