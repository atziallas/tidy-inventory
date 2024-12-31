from django.urls import path

from core.views import search,transit,dashboard
from django.contrib.auth.views import LogoutView, LoginView

urlpatterns = [
    path('', dashboard.index, name='browse'),
    path('up', search.health, name='health'),
    path('browse', search.index, name='browse'),
    # path('location', views.locations, name='locations'),
    path('filter', search.filter, name='filter'),
    path('transfer', search.transfer, name='transfer'),
    path('action', search.action, name='action'),
    # path('sublocation', views.sublocations, name='sublocations'),
    path('transit', transit.transit_index, name='transit'),
    path('barcodeChanged', transit.search_barcode, name='barcodeChanged'),
    path('removeBarcode', transit.removeBarcode, name='removeBarcode'),
    path('designate', search.designate, name='designate'),
    path('transfer', search.transfer, name='transfer'),
    path('transit/designate', transit.designate, name='designate'),
    path('transit/transfer', transit.transfer, name='transfer'),
    path("logout/", LogoutView.as_view(), name="logout"),
    path("login/", LoginView.as_view(), name="login"),
]
