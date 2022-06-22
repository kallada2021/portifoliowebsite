from django.urls import path
from . import views

urlpatterns = [
    path("", views.apiOverview, name="api"),
    path("contact/", views.contact, name="contact"),
    path("technologies/", views.technologies, name="technologies"),
]
