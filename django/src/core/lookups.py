# yourapp/lookups.py
from ajax_select import register, LookupChannel
from .models import Tag, Sublocation, Location


@register('sublocation')
class SublocationChannel(LookupChannel):
    model = Sublocation

    def get_query(self, q, request):
        location_id = request.GET.get('relative')
        if not location_id:
        	querySet = self.model.objects.all()       	
        else:
            querySet = self.model.objects.filter(location__id = location_id)
        return querySet.filter(name__icontains=q).order_by('name')[:50]

    def format_item_display(self, item):
        return item.name


@register('location')
class LocationChannel(LookupChannel):
    model = Location

    def get_query(self, q, request):
        return self.model.objects.filter(name__icontains=q).order_by('name')[:50]

    def format_item_display(self, item):
        return item.name


@register('designated_sublocation')
class DesignatedSublocationChannel(LookupChannel):
    model = Sublocation

    def get_query(self, q, request):
        location_id = request.GET.get('relative')
        if not location_id:
        	querySet = self.model.objects.all()       	
        else:
            querySet = self.model.objects.filter(location__id = location_id)
        return querySet.filter(name__icontains=q).order_by('name')[:50]

    def format_item_display(self, item):
        return item.name


@register('designated_location')
class DesignatedLocationChannel(LookupChannel):
    model = Location

    def get_query(self, q, request):
        return self.model.objects.filter(name__icontains=q).order_by('name')[:50]

    def format_item_display(self, item):
        return item.name


#315-370-225