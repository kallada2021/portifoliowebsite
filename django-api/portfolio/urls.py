from api import views
from django.conf import settings
from django.conf.urls.static import static
from django.contrib import admin
from django.urls import include, path

urlpatterns = [
    # TODO: Change admin URL
    path("admin/", include("admin_honeypot.urls", namespace="admin_honeypot")),
    path("portfolioadmin/", admin.site.urls),
    path("api/", include("api.urls")),
    path("", views.displayFrontend, name="homepage"),
]


if settings.DEBUG:
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
    urlpatterns += static(settings.STATIC_URL, document_root=settings.STATIC_ROOT)
