from django.contrib import admin

from .models import Fact


admin.site.site_header = "Door to Data"
admin.site.register(Fact)