from django.apps import apps
from django.contrib import admin


class ListAdminMixin:
    def __init__(self, model, admin_site):
        self.list_display = [field.name for field in model._meta.fields]
        if model.__name__ == "Results":
            self.list_filter = [
                "raceId__year__year",
                "raceId__round",
            ]
        super().__init__(model, admin_site)


models = apps.get_app_config("ergast").get_models()
for model in models:
    admin_class = type("AdminClass", (ListAdminMixin, admin.ModelAdmin), {})
    try:
        admin.site.register(model, admin_class)
    except admin.sites.AlreadyRegistered:  # type: ignore
        pass
