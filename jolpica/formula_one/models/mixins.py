from __future__ import annotations

from django.db import models

from ..utils import generate_api_id


class ApiIDMixin(models.Model):
    """Mixin for models that use auto-generated API IDs"""

    ID_PREFIX: str
    api_id: str | None

    class Meta:
        abstract = True

    @classmethod
    def get_id_prefix(cls) -> str:
        """Return the API ID prefix for this model"""
        return cls.ID_PREFIX

    def save(self, *args, **kwargs) -> None:
        if not self.api_id:
            self.api_id = generate_api_id(self.get_id_prefix())
        super().save(*args, **kwargs)
