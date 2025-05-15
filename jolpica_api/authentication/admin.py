from django import forms
from django.contrib import admin, messages
from django.contrib.auth import get_user_model
from django.shortcuts import redirect, render
from django.urls import path
from django.utils import timezone
from knox.models import AuthToken


class GenerateTokenForm(forms.Form):
    user: forms.ModelChoiceField = forms.ModelChoiceField(queryset=None)
    expiry: forms.DateTimeField = forms.DateTimeField(
        required=False,
        help_text="Leave blank for no expiry",
        widget=forms.DateTimeInput(attrs={"type": "datetime-local"}),
    )

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        user_model = get_user_model()
        self.fields["user"].queryset = user_model.objects.all()


class AuthTokenAdmin(admin.ModelAdmin):
    list_display = ("digest", "user", "created", "expiry")
    list_filter = ("user",)
    search_fields = ("digest", "user__username")
    raw_id_fields = ("user",)

    def get_urls(self):
        urls = super().get_urls()
        custom_urls = [
            path(
                "generate-token/", self.admin_site.admin_view(self.generate_token_view), name="auth_authtoken_generate"
            ),
        ]
        return custom_urls + urls

    def generate_token_view(self, request):
        if request.method == "POST":
            form = GenerateTokenForm(request.POST)
            if form.is_valid():
                user = form.cleaned_data["user"]
                expiry = form.cleaned_data["expiry"]
                token_ttl = None
                if expiry:
                    token_ttl = expiry - timezone.now()
                    if token_ttl.total_seconds() <= 0:
                        messages.error(request, "Expiry date must be in the future")
                        return redirect(".")

                # Generate the token
                _, token = AuthToken.objects.create(user=user, expiry=token_ttl)

                # Show the token to the admin
                context = {
                    "token": token,
                    "user": user,
                    "expiry": expiry,
                    "title": "Token Generated",
                    "opts": self.model._meta,
                }
                return render(request, "admin/auth/token_generated.html", context)
        else:
            form = GenerateTokenForm()

        context = {
            "form": form,
            "title": "Generate Auth Token",
            "opts": self.model._meta,
        }
        return render(request, "admin/auth/generate_token.html", context)

    def changelist_view(self, request, extra_context=None):
        extra_context = extra_context or {}
        extra_context["show_generate_button"] = True
        return super().changelist_view(request, extra_context)


admin.site.unregister(AuthToken)
admin.site.register(AuthToken, AuthTokenAdmin)
