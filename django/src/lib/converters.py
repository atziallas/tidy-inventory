import json

from django.contrib.admin.utils import display_for_field, lookup_field, label_for_field

from lib.custom import MultipleRelatedOnlyFieldListFilter, DependantMultipleListFilter


def create_entities_json(admin, request):
    changelist = admin.get_changelist_instance(request)
    filters = changelist.get_filters(request)[0]
    state = {
        **results_to_redux(request, changelist),
        **filters_to_redux(filters),
        "fields": [{"id": field, "label":
            label_for_field(field, changelist.model, model_admin=changelist.model_admin, return_attr=True)[0]}
                   for field in admin.list_display],
        "actions": [{"key": choice[0], "name": choice[1]} for choice in admin.get_action_choices(request)],
        "lookups": lookups(filters)
    }
    return state


def entity_objects_as_list(entity):
    entries_list = entity.objects.all()
    return [{'id': entry.id, 'name': entry.name} for entry in entries_list]


def entity_objects_as_redux_object(entity, by_id_key, all_ids_key):
    entries_list = entity.objects.all()
    return {
        'byId': {entry.id: {'name': entry.name} for entry in entries_list},
        'allIds': [entry.id for entry in entries_list]
    }


def field_to_json(entity, field):
    field = getattr(entity, field)
    if (field is not None):
        return {
            'id': field.id,
            'name': field.name
        }
    else:
        return {}


def filter_and_convert(admin, request):
    convert_request_for_admin(request, admin)
    updated_changelist = admin.get_changelist_instance(request)
    response_dict = results_to_redux(request, updated_changelist)
    return response_dict


def lookups(filters):
    lookups_dict = {}
    for filter in filters:
        print(type(filter))
        if (isinstance(filter, DependantMultipleListFilter)):
            lookups_dict[filter.field_path] = json_choices(filter, json_dependant_choice_creator)
        else:
            lookups_dict[filter.field_path] = json_choices(filter, json_choice_creator)
    return lookups_dict


def json_choices(filter, json_choice_creator):
    choices_all_ids = []
    choices_by_id = {}

    for choice in filter.lookup_choices:
        choices_all_ids.append(choice[0])
        choices_by_id[choice[0]] = json_choice_creator(choice, filter)
    return {
        'byId': choices_by_id,
        'allIds': choices_all_ids
    }


# def json_choices(filter, json_choice):
#     choices = []
#     for choice in filter.lookup_choices:
#         choices.append(json_choice(choice, filter))
#     return choices


def json_dependant_choice_creator(choice, filter):
    return {
        # 'id': str(choice[0]),
        'name': choice[1],
        filter.relevant_field_name: choice[2]
    }


def json_choice_creator(choice, filter):
    return {
        'id': str(choice[0]),
        'name': choice[1]
    }


def filters_to_redux(filters):
    filtersById = {}
    filtersAllIds = []
    for filter in filters:
        filtersById[filter.field_path] = {
            'values': [],
            'title': filter.title,
            'type': 'multi' if isinstance(filter, MultipleRelatedOnlyFieldListFilter) else 'single'}
        filtersAllIds.append(filter.field_path)
    return {
        "filters": {
            "filtersById": filtersById,
            "filtersAllIds": filtersAllIds
        }
    }


def results_to_redux(request, changelist):
    entities_dict = {}
    entities_array = []
    for entity in changelist.get_queryset(request):
        entities_dict[str(entity.id)] = create_redux_object(changelist, entity)
        entities_array.append(str(entity.id))
    return {
        "entities": {
            'byId': entities_dict,
            'allIds': entities_array
        }
    }


def create_redux_object(changelist, entity):
    entry = {}
    for field_index, field_name in enumerate(changelist.list_display):
        if (field_name != 'action_checkbox'):
            f, attr, value = lookup_field(field_name, entity, changelist.model_admin)
            if (callable(value)):
                entry[field_name] = value()
            else:
                entry[field_name] = display_for_field(value, f, changelist.model_admin.get_empty_value_display())
    return entry


def convert_request_for_admin(request, admin):
    request.GET = request.GET.copy()
    changelist = admin.get_changelist_instance(request)
    parsed_body = json.loads(request.body)
    for request_filter in parsed_body['filters']:
        filter = next(
            filter for filter in changelist.get_filters(request)[0] if filter.field_path == request_filter['id'])
        if (request_filter['values']):
            request.GET[filter.lookup_kwarg] = ','.join(request_filter['values'])

    order_param = '.'.join(str(item) for item in parsed_body['sorting'])
    request.GET['o'] = order_param
