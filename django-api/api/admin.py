from django.contrib import admin

from .models import Contact, MeetTheTeam, Project, Service, Technology


class ContactAdmin(admin.ModelAdmin):
    list_display: tuple = (
        "name",
        "email",
        "created_at",
    )


class ServiceAdmin(admin.ModelAdmin):
    list_display: tuple = (
        "type",
        "description",
        "image_url",
        "created_at",
    )


class ProjectAdmin(admin.ModelAdmin):
    list_display: tuple = (
        "name",
        "description",
        "image_url",
        "created_at",
    )


admin.site.register(Contact, ContactAdmin)
admin.site.register(Service, ServiceAdmin)
admin.site.register(Technology)
admin.site.register(Project, ProjectAdmin)
admin.site.register(MeetTheTeam)
