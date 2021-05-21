from django.conf.urls import url
from django.urls import path

from ajax_select import views

urlpatterns = [
    url(r'^ajax_lookup/(?P<channel>[-\w]+)$',
        views.ajax_lookup,
        name='ajax_lookup'),
]