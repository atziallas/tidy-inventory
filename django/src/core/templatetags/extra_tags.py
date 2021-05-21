from django import template
from django.templatetags.static import static

from tidy import settings

register = template.Library()

@register.simple_tag
def script(script_name):
    if (settings.DEBUG):
        return f"{settings.WEBPACK_DEV_HOST}{script_name}"
    else:
        return static(script_name)
