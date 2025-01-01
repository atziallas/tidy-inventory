timeout = 160
workers = 2

max_requests = 750
max_requests_jitter = 40

# Load app pre-fork to save memory and worker startup time
preload_app = True

worker_class = 'uvicorn.workers.UvicornWorker'

bind = '0.0.0.0:80'
