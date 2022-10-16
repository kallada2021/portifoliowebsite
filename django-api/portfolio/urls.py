from api import views
from django.conf import settings
from django.conf.urls.static import static
from django.contrib import admin
from django.urls import include, path

urlpatterns = [
    path("portfolioadmin/", admin.site.urls),
    path("api/", include("api.urls")),
    path("", lambda r: views.displayFrontend(r, "index.html")),
    path("<path:resource>", views.displayFrontend),
]


if settings.DEBUG:
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
    urlpatterns += static(settings.STATIC_URL, document_root=settings.STATIC_ROOT)
