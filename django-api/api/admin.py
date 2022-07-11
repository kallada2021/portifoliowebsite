from django.contrib import admin
from .models import Contact, Project, Service, Technology


class ContactAdmin(admin.ModelAdmin):
    list_display: tuple = (
        "name",
        "email",
        "created_at",
    )


admin.site.register(Contact, ContactAdmin)
admin.site.register(Service)
admin.site.register(Technology)
admin.site.register(Project)