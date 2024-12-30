import json
import traceback

from django.core.exceptions import ObjectDoesNotExist
from django.contrib.auth.decorators import login_required
from django.http import HttpResponse
from django.template import loader

from core.models import Thing, Sublocation, Location
from lib.converters import entity_objects_as_redux_object
from lib.utils import list_contains, get_or_init


@login_required
def transit_index(request):
    locations = entity_objects_as_redux_object(Location, 'locationsByid', 'locationsAllIds')
    all_sublocations = Sublocation.objects.all()
    sublocations = {
        'byId': {
            sublocation.id: {
                'name': sublocation.name,
                'location': sublocation.location.id
            } for sublocation in Sublocation.objects.all()
        },
        'allIds': [
            sublocation.id for sublocation in all_sublocations
        ]

    }
    lookups = {"location": locations, "sublocation": sublocations}

    entities = get_or_init(request.session, 'entities', [])

    outside = Location.objects.get(name='Outside')

    state = {
        "lookups": lookups,
        "entities": entities,
        "outside": outside.id
    }

    template = loader.get_template('core/transit.html')
    return HttpResponse(template.render({'initialState': json.dumps(state)}, request))


@login_required
def search_barcode(request):
    parsed_request = json.loads(request.body)
    entities_all_ids = get_or_init(request.session, 'entities', [])

    if (list_contains(entities_all_ids, lambda item: item['barcode'] == parsed_request['barcode'])):
        response_dict = {
            'result': 'exists',
            'messages': [{'message': 'Item already added', 'tags': ['error'], 'show': False}]
        }
    else:
        try:
            thing = Thing.objects.get(barcode=parsed_request['barcode'])
            entity = to_redux_transit_entity(thing)
            entities_all_ids.append(entity)
            request.session['entities'] = entities_all_ids

            response_dict = {
                'result': 'found',
                'state': {
                    'entities': entities_all_ids,
                }
            }
        except ObjectDoesNotExist:
            response_dict = {
                'result': 'invalid',
                'messages': [{'message': 'Barcode %s not found' % parsed_request['barcode'], 'tags': ['error'], 'show': False}]
            }
        except Exception as e:
            print(e)
            traceback.print_exc()
            response_dict = {
                'result': 'invalid',
                'messages': [{'message': 'Invalid Request', 'tags': ['error'], 'show': False}]
            }
    return HttpResponse(json.dumps(response_dict), content_type='application/json')


@login_required
def transfer(request):
    parsed_request = json.loads(request.body)
    entities = get_or_init(request.session, 'entities', [])
    for thing_id in parsed_request["selections"]:
        thing = Thing.objects.get(pk=thing_id)
        thing.location = Location.objects.get(pk=parsed_request['location']['id'])
        if ('id' in parsed_request['sublocation']):
            thing.sublocation = Sublocation.objects.get(pk=parsed_request['sublocation']['id'])
        else:
            thing.sublocation = None
        thing.save()
        entities = [to_redux_transit_entity(thing) if e['id'] == thing_id else e for e in entities]
    request.session['entities'] = entities
    response_dict = {
        'state': {
            'entities': entities
        }
    }
    return HttpResponse(json.dumps(response_dict), content_type='application/json')


@login_required
def designate(request):
    parsed_request = json.loads(request.body)
    entities = get_or_init(request.session, 'entities', [])
    for thing_id in parsed_request["selections"]:
        thing = Thing.objects.get(pk=thing_id)
        thing.designated_location = Location.objects.get(pk=parsed_request['designatedLocation']['id'])
        if ('id' in parsed_request['designatedSublocation']):
            thing.designated_sublocation = Sublocation.objects.get(pk=parsed_request['designatedSublocation']['id'])
        else:
            thing.designated_sublocation = None
        thing.save()
        entities = [to_redux_transit_entity(thing) if e['id'] == thing_id else e for e in entities]
    request.session['entities'] = entities
    response_dict = {
        'state': {
            'entities': entities
        }
    }
    return HttpResponse(json.dumps(response_dict), content_type='application/json')

@login_required
def removeBarcode(request):
    entityId = json.loads(request.body)['entityId']
    if 'entities' not in request.session:
        entities = []
    else:
        entities = request.session['entities']

    filtered_entities = [e for e in entities if e['id'] != entityId]
    request.session['entities'] = filtered_entities

    response = {
        'state': {
            'entities': filtered_entities
        }
    }
    return HttpResponse(json.dumps(response), content_type='application/json')


def to_redux_transit_entity(thing):
    entity = {
        'id': str(thing.id),
        'name': thing.name,
        'barcode': thing.barcode,
        'type': thing.type.name if thing.type else None,
        'location': thing.location.id if thing.location else None,
        'sublocation': thing.sublocation.id if thing.sublocation else None,
        'designatedLocation': thing.designated_location.id if thing.designated_location else None,
        'designatedSublocation': thing.designated_sublocation.id if thing.designated_sublocation else None
    }
    return entity
