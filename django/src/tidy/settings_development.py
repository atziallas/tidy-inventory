import os
import socket

SECRET_KEY = '&-zzue2mtf15_#9e9m*suv$hkzbf$3(_2nxj-kdsc%1j1!-giu'
DEBUG = True
ALLOWED_HOSTS = ['*']
# INTERNAL_IPS = [os.environ.get('HOST_IP')]
# INTERNAL_IPS = [socket.gethostbyname('host.docker.internal'), '127.0.0.1']

WEBPACK_DEV_HOST = "http://localhost:9101"

DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.postgresql',
        'NAME': 'tidy',
        'USER': 'tidy',
        'PASSWORD': 'tidypass',
        'HOST': os.environ.get('DB_HOST'),
        'PORT': '5432'
    }
}
