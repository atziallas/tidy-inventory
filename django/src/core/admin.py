
# from ajax_select.fields import AutoCompleteSelectField
from django import forms
from django.contrib import admin
from django.contrib import messages
from django.contrib.admin.widgets import AutocompleteSelect
from django.db.models import Case, When, Value, FloatField
from django.db.models.functions import Cast
from django.templatetags.static import static

from lib.barcode_admin_actions import generate_barcode, print_barcode, unlabel
from lib.custom import MultipleRelatedOnlyFieldListFilter

from .models import Type, SubType, Thing, Tag, TagType, Location, Sublocation, House, Owner, Plane


class TypeAdmin(admin.ModelAdmin):
    search_fields = ['name']

class SublocationAdmin(admin.ModelAdmin):
    search_fields = ['name']

    def get_search_results(self, request, queryset, search_term):
        location_id = request.GET.get('dependant_value')
        if not location_id:
            querySet = Sublocation.objects.all()
        else:
            querySet = Sublocation.objects.filter(location__id=location_id)
        if search_term != '':
            querySet = querySet.filter(name__icontains=search_term), False
        return querySet, False

class SubTypeAdmin(admin.ModelAdmin):
    search_fields = ['name']

    def get_search_results(self, request, queryset, search_term):
        type_id = request.GET.get('dependant_value')
        if not type_id:
            querySet = SubType.objects.all()
        else:
            querySet = SubType.objects.filter(type__id=type_id)
        if search_term != '':
            querySet = querySet.filter(name__icontains=search_term), False
        return querySet, False


class LocationAdmin(admin.ModelAdmin):
    search_fields = ['name']

    def delete_model(modeladmin, request, queryset):
        if (queryset.name != "Outside"):
            queryset.delete()
        else:
            messages.set_level(request, messages.ERROR)
            messages.error(request, 'Cannot delete default location Outside')

    def get_actions(self, request):
        actions = super().get_actions(request)
        if 'delete_selected' in actions:
            del actions['delete_selected']
        return actions

    def delete(self, request, queryset):
        for obj in queryset:
            if (obj.name != "Outside"):
                obj.delete()
            else:
                self.message_user(
                    request, "Cannot delete default location Outside", messages.ERROR)

    delete.short_description = "Delete selected locations"

    actions = [delete]


class TypeListFilter(admin.SimpleListFilter):
    pass
    title = 'type'
    parameter_name = 'type__in'

    def lookups(self, request, model_admin):
        return [(obj.id, obj) for obj in Type.objects.all()]

    def queryset(self, request, queryset):
        return queryset


class SubTypeListFilter(admin.SimpleListFilter):
    pass
    title = 'subType'
    parameter_name = 'subType__in'

    def lookups(self, request, model_admin):
        # return SubType.objects.all()
        return [(obj.id, obj) for obj in SubType.objects.all()]

    def queryset(self, request, queryset):
        return queryset


class ThingDependantAutocomplete(AutocompleteSelect):

    #override autocomplete.js
    @property
    def media(self):
        parent_media = super().media
        tuple_as_list = list(parent_media._js_lists[0])
        tuple_as_list[4] = static("/core/js/thing_autocompletes.js")
        parent_media._js_lists = [tuple(tuple_as_list)]
        return parent_media


class ThingForm(forms.ModelForm):
    class Meta:
        model = Thing()
        widgets = {
            'subType': ThingDependantAutocomplete(Thing.subType.field, admin.site),
            'sublocation': ThingDependantAutocomplete(Thing.sublocation.field, admin.site),
        }
        fields = '__all__'


class ThingAdmin(admin.ModelAdmin):
    form = ThingForm
    list_filter = (('type__plane', MultipleRelatedOnlyFieldListFilter), TypeListFilter,
                   SubTypeListFilter, ('location', admin.RelatedOnlyFieldListFilter), 'tags')
    list_display = ('name', 'barcode', 'type', 'subType',
                    'fetched_length', 'labeled')
    autocomplete_fields = ['type', 'subType', 'location',
                           'sublocation', 'designated_location', 'designated_sublocation']

    def fetched_length(self, obj):
        return obj.length

    fetched_length.admin_order_field = 'length'
    fetched_length.short_description = 'Length'

    def get_queryset(self, request):
        return Thing.objects.annotate(length=Case(When(tags__tagType__name__exact='Length', then=Cast('tags__value', output_field=FloatField())), default=Value(0.0)))

    actions = [generate_barcode, print_barcode, unlabel]
    print_barcode.short_description = 'Print Barcode'
    generate_barcode.short_description = 'Generate Barcode'
    unlabel.short_description = 'Unlabel'


admin.site.register(Type, TypeAdmin)
admin.site.register(SubType, SubTypeAdmin)
admin.site.register(Thing, ThingAdmin)
admin.site.register(Tag)
admin.site.register(TagType)
admin.site.register(Location, LocationAdmin)
admin.site.register(Sublocation, SublocationAdmin)
admin.site.register(House)
admin.site.register(Owner)
admin.site.register(Plane)
