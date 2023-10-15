from django.apps import apps
from django.contrib import admin
from django.contrib.gis import admin as geo_admin


class ListAdminMixin:
    def __init__(self, model, admin_site):
        self.list_display = [field.name for field in model._meta.fields]
        super().__init__(model, admin_site)


class FormulaOneModelAdmin(ListAdminMixin, geo_admin.GISModelAdmin):
    gis_widget_kwargs = {"attrs": {"default_lon": 10, "default_lat": 55, "default_zoom": 3.75}}  # noqa: RUF012


models = apps.get_app_config("formula_one").get_models()
for model in models:
    admin_class = type("AdminClass", (FormulaOneModelAdmin,), {})
    try:
        admin.site.register(model, admin_class)
    except admin.sites.AlreadyRegistered:
        pass
