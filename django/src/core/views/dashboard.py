from django.http import HttpResponse
from django.contrib.auth.decorators import login_required
from django.template import loader


@login_required
def index(request):
    template = loader.get_template('core/index.html')
    return HttpResponse(template.render())
