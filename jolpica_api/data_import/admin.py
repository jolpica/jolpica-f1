from django.contrib import admin

from .models import DataImportLog


class DataImportLogAdmin(admin.ModelAdmin):
    def __init__(self, model, admin_site):
        self.list_display = [field.name for field in model._meta.fields if field.name != "updated_records"]
        super().__init__(model, admin_site)


admin.site.register(DataImportLog, DataImportLogAdmin)
