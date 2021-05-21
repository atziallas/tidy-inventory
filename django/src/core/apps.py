from django.apps import AppConfig
from django.core.exceptions import ObjectDoesNotExist


class CoreConfig(AppConfig):
    name = 'core'

    def ready(self):
        try:
            print("-----=============== Initializing Outside Location ===============-----")
            from .models import Location  # or...
            # MyModel = self.get_model('MyModel')
            Location.objects.get(name='Outside')
        except ObjectDoesNotExist:
            thing = Location(name='Outside')
            thing.hard_save()
            print("-----=============== Outside Location Created ===============-----")

