
from ajax_select.fields import AutoCompleteSelectField
from django import forms
from django.contrib import admin
from django.contrib import messages
from django.db.models import Case, When, Value, FloatField
from django.db.models.functions import Cast
from django_admin_multiple_choice_list_filter.list_filters import MultipleChoiceListFilter

from lib.barcode_admin_actions import generate_barcode, print_barcode, unlabel
from lib.custom import MultipleRelatedOnlyFieldListFilter

from .models import Type, SubType, Thing, Tag, TagType, Location, Sublocation, House, Owner, Plane


class TypeAdmin(admin.ModelAdmin):
    search_fields = ('id', 'name')


class SubTypeAdmin(admin.ModelAdmin):
    search_fields = ('id', 'name')


class LocationAdmin(admin.ModelAdmin):
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
                self.message_user(request, "Cannot delete default location Outside", messages.ERROR)

    delete.short_description = "Delete selected locations"

    actions = [delete]

class TypeListFilter(MultipleChoiceListFilter):
    title = 'type'
    parameter_name = 'type__in'

    def lookups(self, request, model_admin):
        return [(obj.id, obj) for obj in Type.objects.all()]


class SubTypeListFilter(MultipleChoiceListFilter):
    title = 'subType'
    parameter_name = 'subType__in'

    def lookups(self, request, model_admin):
        return [(obj.id, obj) for obj in SubType.objects.all()]


# class MultipleListFilter(RelatedOnlyFieldListFilter):



class ThingAdmin(admin.ModelAdmin):
    list_filter = (('type__plane',MultipleRelatedOnlyFieldListFilter), TypeListFilter, SubTypeListFilter, ('location',admin.RelatedOnlyFieldListFilter), 'tags')
    list_display = ('name', 'barcode', 'type', 'subType', 'fetched_length', 'labeled')
    search_fields = ('name', 'id')
    autocomplete_fields = ('type', 'subType',)


    def fetched_length(self, obj):
        return obj.length

    fetched_length.admin_order_field = 'length'
    fetched_length.short_description = 'Length'

    def get_queryset(self, request):
        return Thing.objects.annotate(length=Case(
            When(tags__tagType__name__exact='Length', then=Cast('tags__value', FloatField())),
            default=Value(0)
        ))


    actions = [generate_barcode, print_barcode, unlabel]

    def get_form(self, request, obj=None, **kwargs):
        form = super().get_form(request, obj, **kwargs)
        form.base_fields['location'] = AutoCompleteSelectField('location', required=False)
        form.base_fields['sublocation'] = AutoCompleteSelectField('sublocation', required=False)
        form.base_fields['designated_location'] = AutoCompleteSelectField('designated_location', required=False)
        form.base_fields['designated_sublocation'] = AutoCompleteSelectField('designated_sublocation', required=False)
        return form

    print_barcode.short_description = 'Print Barcode'
    generate_barcode.short_description = 'Generate Barcode'
    unlabel.short_description = 'Unlabel'


class ThingForm(forms.ModelForm):
    class Meta:
        model = Thing()
        fields = []


admin.site.register(Type, TypeAdmin)
admin.site.register(SubType, SubTypeAdmin)
admin.site.register(Thing, ThingAdmin)
admin.site.register(Tag)
admin.site.register(TagType)
admin.site.register(Location, LocationAdmin)
admin.site.register(Sublocation)
admin.site.register(House)
admin.site.register(Owner)
admin.site.register(Plane)
