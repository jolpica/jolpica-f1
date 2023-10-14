from django.contrib.gis import admin

from .models import Circuit

# Register your models here.
admin.site.register(Circuit, admin.GISModelAdmin)
