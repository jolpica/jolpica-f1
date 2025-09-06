from __future__ import annotations

from django.apps import AppConfig


class DumpsConfig(AppConfig):
    """Django app configuration for the dumps API layer."""

    default_auto_field = "django.db.models.BigAutoField"
    name = "jolpica_api.dumps"
    verbose_name = "Data Dumps"
