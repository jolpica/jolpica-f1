from django.apps import apps
from django.contrib import admin
from django.db import transaction
from django.urls import resolve

from jolpica.formula_one import models as f1
from jolpica.formula_one.standings import update_championship_standings_in_db
from jolpica.formula_one.utils import generate_api_id


class ListAdminMixin:
    def __init__(self, model, admin_site):
        self.list_display = [field.name for field in model._meta.fields]
        self.search_fields = self._get_search_fields(model)
        if model.__name__ not in {"PointScheme"}:
            self.autocomplete_fields = [
                field.name
                for field in model._meta.fields
                if field.name
                in {
                    "round",
                    "session_entry",
                    "round_entry",
                    "team_driver",
                    "driver",
                    "team",
                    "lap",
                    "session",
                    "fastest_lap",
                    "season",
                    "circuit",
                }
            ]
        if model.__name__ == "Lap":
            self.list_filter = [
                "is_entry_fastest_lap",
                "session_entry__session__type",
                "session_entry__session__round__number",
                "session_entry__session__round__season__year",
                "session_entry__round_entry__team_driver__driver",
            ]
        elif model.__name__ == "PitStop":
            self.list_select_related = [
                "session_entry",
                "lap__session_entry__session__round__season",
                "lap__session_entry__round_entry__team_driver__driver",
                "lap__session_entry__round_entry__team_driver__team",
                "session_entry__session__round__season",
                "session_entry__round_entry__round__season",
                "session_entry__round_entry__team_driver__driver",
                "session_entry__round_entry__team_driver__team",
                "session_entry__round_entry__team_driver__season",
            ]
            self.list_filter = [
                "session_entry__session__round__season__year",
                "session_entry__session__round__number",
                "session_entry__session__type",
                "lap__number",
            ]
        elif model.__name__ == "SessionEntry":
            self.list_display = [*self.list_display, "round_entry__car_number"]
            self.list_filter = ["session__type", "session__round__number", "session__round__season"]
        elif model.__name__ == "Session":
            self.list_filter = ["type", "round__season", "round__number"]
        elif model.__name__ == "Round":
            self.list_filter = ["is_cancelled", "number", "season"]
        elif model.__name__ == "Season":
            self.list_select_related = ["championship_system"]
        elif model.__name__ == "TeamDriver":
            self.list_filter = ["season"]
        elif model.__name__ == "DriverChampionship" or model.__name__ == "TeamChampionship":
            self.list_select_related = [
                "session__round__season",
                "season",
                "round__season",
            ]
            if model.__name__ == "TeamChampionship":
                self.list_select_related.append("team")
            else:
                self.list_select_related.append("driver")
            self.list_filter = [
                ("season", admin.EmptyFieldListFilter),
                ("round", admin.EmptyFieldListFilter),
                "round_number",
                "year",
            ]
        super().__init__(model, admin_site)

    def _get_search_fields(self, model) -> list[str]:
        search_fields = []
        model_name = model.__name__
        match model_name:
            case "Circuit":
                search_fields = ["name", "reference", "country", "locality"]
            case "Season":
                search_fields = ["year"]
            case "Round":
                search_fields = ["number", "season__year", "name", "circuit__country"]
            case "TeamDriver":
                search_fields = [
                    "season__year",
                    "team__reference",
                    "team__name",
                    "driver__reference",
                    "driver__forename",
                    "driver__surname",
                ]
            case "Driver":
                search_fields = ["forename", "surname", "abbreviation"]
            case "Team":
                search_fields = ["name", "reference"]
            case "Lap":
                search_fields = [
                    "session_entry__session__type",
                    "number",
                    "session_entry__round_entry__round__name",
                    "session_entry__round_entry__team_driver__driver__forename",
                    "session_entry__round_entry__team_driver__driver__surname",
                ]
            case "Session":
                search_fields = ["number", "round__season__year", "round__name", "type"]
            case "RoundEntry":
                search_fields = [
                    "round__season__year",
                    "round__name",
                    "car_number",
                    "team_driver__driver__forename",
                    "team_driver__driver__surname",
                ]
            case "SessionEntry":
                search_fields = [
                    "session__round__season__year",
                    "session__round__name",
                    "round_entry__team_driver__driver__forename",
                    "round_entry__team_driver__driver__surname",
                    "round_entry__team_driver__team__name",
                ]
        if hasattr(model, "api_id"):
            search_fields.append("api_id")
        return search_fields


class InlineAutoFillApiIdMixin(admin.TabularInline):
    extra = 0

    def get_formset(self, request, obj=None, **kwargs):
        formset = super().get_formset(request, obj, **kwargs)
        model = self.model
        extra = self.get_extra(request, obj, **kwargs)
        original_init = formset.__init__

        def new_init(fs, *args, **kw):
            kw.setdefault("initial", [{"api_id": generate_api_id(model.ID_PREFIX)} for _ in range(extra)])
            original_init(fs, *args, **kw)

        formset.__init__ = new_init
        return formset

    def formfield_for_dbfield(self, db_field, request, **kwargs):
        field = super().formfield_for_dbfield(db_field, request, **kwargs)
        if db_field.name == "api_id" and field is not None:
            field.widget.attrs["data-api-prefix"] = self.model.ID_PREFIX
        return field


class SessionInline(InlineAutoFillApiIdMixin, admin.TabularInline):
    model = f1.Session


class RoundEntryInline(InlineAutoFillApiIdMixin, admin.TabularInline):
    model = f1.RoundEntry

    def get_parent_id_from_request(self, request):
        resolved = resolve(request.path_info)
        if resolved.kwargs:
            return resolved.kwargs["object_id"]
        return None

    def formfield_for_foreignkey(self, db_field, request, **kwargs):
        if db_field.name == "team_driver":
            parent_id = self.get_parent_id_from_request(request)
            if parent_id:
                kwargs["queryset"] = f1.TeamDriver.objects.filter(season__rounds__id=parent_id).prefetch_related(
                    "team", "driver", "season"
                )
            else:
                kwargs["queryset"] = f1.TeamDriver.objects.prefetch_related("team", "driver", "season")
        return super().formfield_for_foreignkey(db_field, request, **kwargs)


class FormulaOneModelAdmin(ListAdminMixin, admin.ModelAdmin):
    class Media:
        js = ("formula_one/admin/autofill_api_id.js",)

    def __init__(self, model, admin_site):
        super().__init__(model, admin_site)
        if model.__name__ == "Round":
            self.inlines = [SessionInline, RoundEntryInline]

    def get_changeform_initial_data(self, request):
        initial = super().get_changeform_initial_data(request)
        if hasattr(self.model, "ID_PREFIX"):
            initial.setdefault("api_id", generate_api_id(self.model.ID_PREFIX))
        return initial


class CancelAndResequenceAdmin(FormulaOneModelAdmin):
    actions = ["mark_as_cancelled"]
    scope_id_field = ""
    select_related_field = ""
    item_label_plural = "items"

    def get_selected_items(self, queryset):
        ordered_queryset = queryset.filter(is_cancelled=False)
        if self.select_related_field:
            ordered_queryset = ordered_queryset.select_related(self.select_related_field)
        return list(ordered_queryset.order_by(self.scope_id_field, "number", "id"))

    def get_scope_id(self, obj):
        return getattr(obj, self.scope_id_field)

    def get_locked_items_by_id(self, scope_ids):
        return {
            item.id: item
            for item in self.model.objects.select_for_update()
            .filter(**{f"{self.scope_id_field}__in": scope_ids})
            .order_by(self.scope_id_field, "number", "id")
        }

    def get_items_to_resequence(self, scope_id):
        return list(
            self.model.objects.select_for_update()
            .filter(**{self.scope_id_field: scope_id, "is_cancelled": False, "number__isnull": False})
            .order_by("number", "id")
        )

    def create_scope_context(self):
        return {}

    def capture_cancellation_context(self, obj, scope_context):
        return

    def resequence_update_fields(self):
        return ["number"]

    def cancellation_update_fields(self):
        return ["is_cancelled", "number"]

    def apply_cancellation(self, obj):
        obj.is_cancelled = True
        obj.number = None

    def is_resequence_required(self, obj, new_number, scope_context):
        return obj.number != new_number

    def apply_resequence(self, obj, new_number, scope_context):
        obj.number = new_number

    @admin.action(description="Mark selected records as cancelled")
    def mark_as_cancelled(self, request, queryset):
        selected_items = self.get_selected_items(queryset)

        if not selected_items:
            if request is not None:
                self.message_user(request, f"No eligible {self.item_label_plural} were selected.")
            return

        scope_ids = {self.get_scope_id(item) for item in selected_items}
        with transaction.atomic():
            scope_contexts = {scope_id: self.create_scope_context() for scope_id in scope_ids}
            locked_items = self.get_locked_items_by_id(scope_ids)

            cancelled_count = 0
            for selected_item in selected_items:
                item = locked_items.get(selected_item.id)
                if item is None or item.is_cancelled:
                    continue

                scope_id = self.get_scope_id(item)
                scope_context = scope_contexts[scope_id]
                self.capture_cancellation_context(item, scope_context)
                self.apply_cancellation(item)
                item.save(update_fields=self.cancellation_update_fields())
                cancelled_count += 1

            for scope_id in scope_ids:
                scope_context = scope_contexts[scope_id]
                items_to_resequence = self.get_items_to_resequence(scope_id)

                for new_number, item in enumerate(items_to_resequence, start=1):
                    if not self.is_resequence_required(item, new_number, scope_context):
                        continue
                    self.apply_resequence(item, new_number, scope_context)
                    item.save(update_fields=self.resequence_update_fields())

        if request is not None:
            self.message_user(request, f"Marked {cancelled_count} {self.item_label_plural} as cancelled.")


class RoundAdmin(CancelAndResequenceAdmin):
    actions = ["mark_as_cancelled"]
    scope_id_field = "season_id"
    select_related_field = "season"
    item_label_plural = "round(s)"

    def create_scope_context(self):
        return {"cancelled_race_numbers": []}

    def capture_cancellation_context(self, obj, scope_context):
        if obj.race_number is not None:
            scope_context["cancelled_race_numbers"].append(obj.race_number)

    def cancellation_update_fields(self):
        return ["is_cancelled", "number", "race_number"]

    def apply_cancellation(self, obj):
        obj._cancelled_original_race_number = obj.race_number
        obj.is_cancelled = True
        obj.number = None
        obj.race_number = None
        f1.Session.objects.filter(round_id=obj.id, is_cancelled=False).update(is_cancelled=True, number=None)

    def resequence_update_fields(self):
        return ["number", "race_number"]

    def _new_race_number(self, obj, scope_context):
        if obj.race_number is None:
            return None
        cancelled_race_numbers = scope_context["cancelled_race_numbers"]
        decrements = sum(
            1 for cancelled_race_number in cancelled_race_numbers if cancelled_race_number < obj.race_number
        )
        return obj.race_number - decrements

    def is_resequence_required(self, obj, new_number, scope_context):
        return not (obj.number == new_number and obj.race_number == self._new_race_number(obj, scope_context))

    def apply_resequence(self, obj, new_number, scope_context):
        obj.number = new_number
        obj.race_number = self._new_race_number(obj, scope_context)


class SessionAdmin(CancelAndResequenceAdmin):
    actions = ["mark_as_cancelled"]
    scope_id_field = "round_id"
    select_related_field = "round"
    item_label_plural = "session(s)"


class SeasonAdmin(FormulaOneModelAdmin):
    actions = ["regenerate_standings"]

    @admin.action(description="Regenerate Standings")
    def regenerate_standings(self, request, queryset):
        years = set(queryset.values_list("year", flat=True))
        with transaction.atomic():
            f1.managed_views.DriverChampionship.objects.filter(year__in=years).delete()
            f1.managed_views.TeamChampionship.objects.filter(year__in=years).delete()
            update_championship_standings_in_db(years)
        self.message_user(request, f"Successfully regenerated standings for seasons: {sorted(years)}")


models = apps.get_app_config("formula_one").get_models()
for model in models:
    admin_class: type[admin.ModelAdmin]
    if model is f1.Round:
        admin_class = RoundAdmin
    elif model is f1.Session:
        admin_class = SessionAdmin
    elif model is f1.Season:
        admin_class = SeasonAdmin
    else:
        admin_class = type("AdminClass", (FormulaOneModelAdmin,), {})
    try:
        admin.site.register(model, admin_class)
    except admin.sites.AlreadyRegistered:  # type: ignore
        pass
