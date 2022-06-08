import os
from .settings_common import *
if os.environ.get('DJANGO_CONFIGURATION') == 'dev':
    from .settings_development import *
else:
    from .settings_production import *