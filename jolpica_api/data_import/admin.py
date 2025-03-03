from django.contrib import admin

from .models import DataImportLog


class DataImportLogAdmin(admin.ModelAdmin):
    def __init__(self, model, admin_site):
        self.list_display = [
            field.name for field in model._meta.fields if field.name not in {"import_result", "errors"}
        ]
        self.list_filter = ["dry_run", "error_type", "is_success"]
        super().__init__(model, admin_site)


admin.site.register(DataImportLog, DataImportLogAdmin)
