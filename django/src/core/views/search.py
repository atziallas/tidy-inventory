import json

from django.conf import settings
from django.contrib.auth.decorators import login_required
from django.contrib import messages
from django.contrib.admin import AdminSite, ModelAdmin
from django.contrib.messages import get_messages
from django.db.models import When, Value, Case, FloatField, OuterRef, Subquery
from django.db.models.functions import Cast
from django.http import FileResponse, HttpResponse
from django.template import loader

from core.models import Thing, Location, Sublocation
from lib.barcode_admin_actions import (
    ACTION_FAIL,
    print_barcode,
    generate_barcode,
    unlabel,
)
from lib.converters import create_entities_json, filter_and_convert
from lib.custom import MultipleRelatedOnlyFieldListFilter, DependantMultipleListFilter


class SublocationFilter(DependantMultipleListFilter):
    title = "sublocation"
    parameter_name = "sublocation"
    relevant_field_name = "location"


class ThingAdmin(ModelAdmin):
    list_filter = (
        "type__plane",
        ("type", MultipleRelatedOnlyFieldListFilter),
        ("subType", MultipleRelatedOnlyFieldListFilter),
        "tags",
        "location",
        ("sublocation", SublocationFilter),
    )
    list_display = (
        "name",
        "barcode",
        "type",
        "subType",
        "fetched_length",
        "placed",
        "designated",
        "labeled",
    )
    search_fields = ("name", "id")

    def get_queryset(self, request):
        things_with_length = (
            Thing.objects.annotate(
                length=Case(
                    When(
                        tags__tagType__name__exact="Length",
                        then=Cast("tags__value", output_field=FloatField()),
                    ),
                    default=Value(0.0),
                )
            )
            .filter(pk=OuterRef("pk"))
            .distinct("id")
        )
        return Thing.objects.annotate(
            length=Subquery(
                things_with_length.values("length"), output_field=FloatField()
            )
        )

    def fetched_length(self, obj):
        return obj.length

    fetched_length.admin_order_field = "length"
    fetched_length.short_description = "Length"

    generate_barcode = generate_barcode
    print_barcode = print_barcode
    unlabel = unlabel

    def test(modeladmin, request, queryset):
        modeladmin.message_user(request, "Sample response!", messages.SUCCESS)

    actions = [test, generate_barcode, print_barcode, unlabel]

    def get_actions(self, request):
        actions = super().get_actions(request)
        if settings.DEMO_MODE:
            del actions["delete_selected"]
            del actions["generate_barcode"]
            del actions["unlabel"]
        return actions

    print_barcode.short_description = "Print Barcode"
    generate_barcode.short_description = "Generate Barcode"
    unlabel.short_description = "Unlabel"
    test.short_description = "Test Async Action"


def health(request):
    return HttpResponse("OK", status=200)


@login_required
def index(request):
    admin = ThingAdmin(Thing, AdminSite())
    state = create_entities_json(admin, request)
    template = loader.get_template("core/search.html")
    return HttpResponse(template.render({"initialState": json.dumps(state)}, request))


@login_required
def filter(request):
    admin = ThingAdmin(Thing, AdminSite())
    response_dict = filter_and_convert(admin, request)
    return HttpResponse(json.dumps(response_dict), content_type="application/json")


@login_required
def action(request):
    parsed_request = json.loads(request.body)
    request_action = parsed_request["selectedAction"]
    admin = ThingAdmin(Thing, AdminSite())

    if settings.DEMO_MODE:
        if request_action != "test" and request_action != "print_barcode":
            response_dict = {
                **filter_and_convert(ThingAdmin(Thing, AdminSite()), request),
                "messages": [{"message": "Illegal Action! This is demo mode.", "tags": ["error"], "show": True}],
            }
            return HttpResponse(json.dumps(response_dict), content_type="application/json")

    action = admin.get_action(request_action)
    qs = admin.model.objects.filter(pk__in=parsed_request["selections"])
    result = action[0](admin, request, qs)
    transformed_messages = []
    admin_messages = get_messages(request)

    for message in admin_messages:
        transformed_messages.append(
            {"message": message.message, "tags": [message.tags], "show": False}
        )

    if request_action == "print_barcode" and result != ACTION_FAIL:
        result.seek(0)
        response = HttpResponse(
            result.read(),
            content_type="application/vnd.openxmlformats-officedocument.wordprocessingml.document",
        )
        response["Content-Disposition"] = "attachment; filename=stickers_template.docx"
        return response
    else:
        response_dict = {
            **filter_and_convert(ThingAdmin(Thing, AdminSite()), request),
            "messages": transformed_messages,
        }
        return HttpResponse(json.dumps(response_dict), content_type="application/json")


@login_required
def transfer(request):
    parsed_request = json.loads(request.body)
    for thing_id in parsed_request["selections"]:
        thing = Thing.objects.get(pk=thing_id)
        thing.location = Location.objects.get(pk=parsed_request["location"]["id"])
        if "id" in parsed_request["sublocation"]:
            thing.sublocation = Sublocation.objects.get(
                pk=parsed_request["sublocation"]["id"]
            )
        else:
            thing.sublocation = None
        thing.save()

    response_dict = filter_and_convert(ThingAdmin(Thing, AdminSite()), request)
    return HttpResponse(json.dumps(response_dict), content_type="application/json")


@login_required
def designate(request):
    parsed_request = json.loads(request.body)
    for thing_id in parsed_request["selections"]:
        thing = Thing.objects.get(pk=thing_id)
        thing.designated_location = Location.objects.get(
            pk=parsed_request["designatedLocation"]["id"]
        )
        if "id" in parsed_request["designatedSublocation"]:
            thing.designated_sublocation = Sublocation.objects.get(
                pk=parsed_request["designatedSublocation"]["id"]
            )
        else:
            thing.designated_sublocation = None
        thing.save()

    response_dict = filter_and_convert(ThingAdmin(Thing, AdminSite()), request)
    return HttpResponse(json.dumps(response_dict), content_type="application/json")
