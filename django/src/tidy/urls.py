"""tidy URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/2.0/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.conf.urls import url, include
from django.conf.urls.static import static
from django.contrib import admin
from django.conf import settings
from ajax_select import urls as ajax_select_urls
from django.urls import path

# admin.autodiscover()


urlpatterns = [
                  path('', include('core.urls')),
                  path('admin/', admin.site.urls),
                  path('^chaining/', include('smart_selects.urls')),
                  path(r'^ajax_select/', include(ajax_select_urls))
              ] + static(settings.STATIC_URL, document_root=settings.STATIC_ROOT)
