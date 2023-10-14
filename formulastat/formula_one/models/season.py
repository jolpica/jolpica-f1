from django.db import models


class Season(models.Model):
    """
    Table season {
        id integer [primary key]
        year integer
        wikipedia string
    }
    """

    id = models.BigAutoField(primary_key=True)
    year = models.SmallIntegerField(unique=True)
    wikipedia = models.URLField(max_length=255, null=True, blank=True)

    def __str__(self) -> str:
        return f"{self.year}"
