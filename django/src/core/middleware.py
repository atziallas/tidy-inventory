import json
import os
from django.http import HttpResponse
import logging
from django.conf import settings

requestLogger = logging.getLogger('errors')
requestLogger.setLevel(logging.INFO)
os.makedirs(os.path.dirname(settings.LOG_DIR), exist_ok=True)

requestHandler = logging.handlers.RotatingFileHandler(settings.LOG_DIR+'headers.log', maxBytes=500000, backupCount=2)
requestHandler.setFormatter(logging.Formatter("\n%(asctime)s - %(levelname)s - %(message)s"))
requestHandler.setLevel(logging.INFO)

requestLogger.addHandler(requestHandler)

class HealthCheckMiddleware:
    def __init__(self, get_response):
        self.get_response = get_response

    def __call__(self, request):
        if request.path == '/health' or request.path == '/up':
            return HttpResponse('ok')
        return self.get_response(request)


class LogRequestHeadersMiddleware:
    def __init__(self, get_response):
        self.get_response = get_response

    def __call__(self, request):
        pretty_headers = json.dumps(dict(request.headers), sort_keys=True, indent=4)
        requestLogger.info(pretty_headers)
        return self.get_response(request)