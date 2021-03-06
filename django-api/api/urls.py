from django.urls import path

from . import views

urlpatterns = [
    path("", views.apiOverview, name="api"),
    path("technologies/", views.technologies, name="technologies"),
    path("technologies/<str:pk>/", views.technologiesDetail, name="technology-details"),
    path("projects/", views.projects, name="projects"),
    path("projects/<str:pk>/", views.projectDetail, name="project-details"),
    path("services/", views.services, name="solutions"),
    path("services/<str:pk>", views.servicesDetail, name="solutions"),
    path("contacts/", views.contact, name="contacts"),
    path("create-contact/", views.createContact, name="create-contact"),
]
