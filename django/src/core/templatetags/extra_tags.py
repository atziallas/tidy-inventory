from django import template
from django.templatetags.static import static

from tidy import settings

register = template.Library()

@register.simple_tag
def static_or_webpack_dev(script_name):
    if (settings.DEBUG):
        return f"{settings.REACT_DEV_HOST}js/{script_name}"
    else:
        return static(f"core/assets/{script_name}")
