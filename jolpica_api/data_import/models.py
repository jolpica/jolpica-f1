from __future__ import annotations

from django.contrib.auth.models import User
from django.db import models


class DataImportLog(models.Model):
    id = models.BigAutoField(primary_key=True)
    description = models.CharField(max_length=255)
    user = models.ForeignKey(User, on_delete=models.SET_NULL, null=True)
    dry_run = models.BooleanField(default=True)
    is_success = models.BooleanField(default=False)
    completed_at = models.DateTimeField(auto_now_add=True)
    total_records = models.PositiveIntegerField(null=True)
    import_result = models.JSONField(null=True)
    error_type = models.CharField(max_length=255, null=True)
    errors = models.JSONField(null=True)
