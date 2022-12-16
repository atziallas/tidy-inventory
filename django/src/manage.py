#!/usr/bin/env python
import os
import sys

from tidy import settings

def initialize_debugger():
    import debugpy
    
    # optionally check to see what env you're running in, you probably only want this for 
    # local development, for example: if os.getenv("MY_ENV") == "dev":

    # RUN_MAIN envvar is set by the reloader to indicate that this is the 
    # actual thread running Django. This code is in the parent process and
    # initializes the debugger
    if not (os.getenv("RUN_MAIN") or os.environ.get('WERKZEUG_RUN_MAIN')):
        #5678 or 9999?
        debugpy.listen(("0.0.0.0", 5678))
        sys.stdout.write("Start the VS Code debugger now, waiting...\n")
        debugpy.wait_for_client()
        sys.stdout.write("Debugger attached, starting server...\n")


if __name__ == "__main__":
    os.environ.setdefault("DJANGO_SETTINGS_MODULE", "tidy.settings")

    # added section
    # from django.conf import settings

    # if settings.DEBUG:
    #     if os.environ.get('RUN_MAIN') or os.environ.get('WERKZEUG_RUN_MAIN'):
    #         import debugpy
    #         debugpy.listen(("0.0.0.0", 5678))
    #         print('Attached!')

    try:
        from django.core.management import execute_from_command_line
    except ImportError as exc:
        raise ImportError(
            "Couldn't import Django. Are you sure it's installed and "
            "available on your PYTHONPATH environment variable? Did you "
            "forget to activate a virtual environment?"
        ) from exc
    # initialize_debugger()
    execute_from_command_line(sys.argv)
