import os

SECRET_KEY = os.environ['SECRET_KEY']
DEBUG = False
ALLOWED_HOSTS = [os.environ['ALLOWED_HOST']]
SECURE_SSL_REDIRECT = True
SECURE_REDIRECT_EXEMPT = [r'^up/$']

DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.postgresql',
        'NAME': 'tidy',
        'USER': os.environ['POSTGRES_USER'],
        'PASSWORD': os.environ['POSTGRES_PASSWORD'],
        'HOST': os.environ.get('DB_HOST'),
        'PORT': '5432'
    }
}
