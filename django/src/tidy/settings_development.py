import os
import socket

SECRET_KEY = '&-zzue2mtf15_#9e9m*suv$hkzbf$3(_2nxj-kdsc%1j1!-giu'
DEBUG = True
ALLOWED_HOSTS = ['*']

REACT_DEV_HOST = "http://localhost:9101/"

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
