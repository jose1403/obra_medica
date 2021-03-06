"""
Django settings for naturista project.

Generated by 'django-admin startproject' using Django 1.8.5.

For more information on this file, see
https://docs.djangoproject.com/en/1.8/topics/settings/

For the full list of settings and their values, see
https://docs.djangoproject.com/en/1.8/ref/settings/
"""
# -*- encoding: utf-8 -*-
# Build paths inside the project like this: os.path.join(BASE_DIR, ...)
import os

BASE_DIR = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))


# Quick-start development settings - unsuitable for production
# See https://docs.djangoproject.com/en/1.8/howto/deployment/checklist/

# SECURITY WARNING: keep the secret key used in production secret!
SECRET_KEY = '@um9m%u%p@-)n4f(c=exa^sgmqow-l3anj4j=+0x16b!f#ruh1'

# SECURITY WARNING: don't run with debug turned on in production!
import socket 
 
if socket.gethostname() == 'pandora': 
   DEBUG = TEMPLATE_DEBUG = True 
   DEBUG = True
else: 
    DEBUG = TEMPLATE_DEBUG = False 
    DEBUG = False


#TEMPLATE_DEBUG = False
ADMINS = ( 
('Jose Suarez', 'josegregorio1403@gmail.com'),  
) 
ALLOWED_HOSTS = ['159.203.139.111']


# Application definition

INSTALLED_APPS = (

    #'django_admin_bootstrapped',
    'django.contrib.admin',
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',
    'utilidades',
    'ckeditor',
    'ckeditor_uploader',
    'principal',
    #'tinymce',
    'usuario',
    'feeds',
    #'south'
)

MIDDLEWARE_CLASSES = (
    'django.contrib.sessions.middleware.SessionMiddleware',
    #'django.middleware.cache.UpdateCacheMiddleware', 
    'django.middleware.common.CommonMiddleware',
    #'django.middleware.cache.FetchFromCacheMiddleware', 
    'django.middleware.csrf.CsrfViewMiddleware',
    'django.contrib.auth.middleware.AuthenticationMiddleware',
    'django.contrib.auth.middleware.SessionAuthenticationMiddleware',
    'django.contrib.messages.middleware.MessageMiddleware',
    'django.middleware.clickjacking.XFrameOptionsMiddleware',
    'django.middleware.security.SecurityMiddleware',

)

ROOT_URLCONF = 'naturista.urls'

TEMPLATES = [
    {
        'BACKEND': 'django.template.backends.django.DjangoTemplates',
        'DIRS': [os.path.normpath(os.path.join(os.path.dirname(__file__),'../template'))],
        'APP_DIRS': True,
        'OPTIONS': {
            'context_processors': [
                'django.template.context_processors.debug',
                'django.template.context_processors.request',
                'django.contrib.auth.context_processors.auth',
                'django.contrib.messages.context_processors.messages',
                #'usuario.context_processors.my_processor',
                'principal.context_ProductosNuevos.my_processor',
                #'principal.context_ProductosNuevos.my_recientes',

            ],
        },
    },
]

WSGI_APPLICATION = 'naturista.wsgi.application'


# Database
# https://docs.djangoproject.com/en/1.8/ref/settings/#databases

DATABASES = { 
        'default': { 
       'ENGINE': 'django.db.backends.postgresql_psycopg2', 
       'NAME': 'naturistas', 
       'USER': 'asael', 
        'PASSWORD': '1573837', 
        'HOST': 'localhost', 
        'PORT': '5432', 
   
    } 
}
"""
DATABASES = {
    'default': {

        'ENGINE': 'django.db.backends.mysql',
        'NAME':'avanzada',
        'USER': 'root',
        'PASSWORD':'root', 
        'HOST': '', 
        'PORT': '',
      } 
}"""

"""DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.sqlite3',
        'NAME': os.path.join(BASE_DIR, 'db.sqlite3'),
    }
}"""
"""
CACHES = { 
    'default': { 
        'BACKEND': 'django.core.cache.backends.db.DatabaseCache', 
        'LOCATION': 'crecer_cache', 
    } 
} """

#CACHE_MIDDLEWARE_ALIAS= 'crecer'
#CACHE_MIDDLEWARE_SECONDS= 5000

# Internationalization
# https://docs.djangoproject.com/en/1.8/topics/i18n/

LANGUAGE_CODE = 'es-es'

TIME_ZONE = 'UTC'

USE_I18N = True

USE_L10N = True

USE_TZ = True

#AUTH_USER_MODEL= 'users.User'
EMAIL_BACKEND = 'django.core.mail.backends.smtp.EmailBackend' 
#EMAIL_BACKEND = 'django.core.mail.backends.dummy.EmailBackend' 

EMAIL_HOST = "smtp.gmail.com"#"localhost" #
EMAIL_PORT = 587#1025 #
EMAIL_HOST_USER = 'obramedicanatural@gmail.com'
EMAIL_SUBJECT_PREFIX= 'Naturista'
SEND_BROKEN_LINK_EMAILS = True
MANAGERS = ( 
    ('Jose Suarez', 'josegregorio1403@gmail.com'),
    ('admin web', 'obramedicanatural@gmail.com')
) 
EMAIL_HOST_PASSWORD = 'obramedica3-03'
EMAIL_USE_TLS = True

#perfil de usuario

#AUTH_USER_MODEL ='usuario.User'

# Static files (CSS, JavaScript, Images)
# https://docs.djangoproject.com/en/1.8/howto/static-files/
#DAB_FIELD_RENDERER = 'django_admin_bootstrapped.renderers.BootstrapFieldRenderer'
STATIC_URL = '/static/'
MEDIA_ROOT=os.path.normpath(os.path.join(os.path.dirname(__file__),'../principal/static/media/'))
MEDIA_URL = '/media/'
STATIC_URL = '/static/'
STATIC_ROOT = os.path.join(BASE_DIR, 'public', 'static')#os.path.normpath(os.path.join(os.path.dirname(__file__),'../principal/static/media/'))
CKEDITOR_MEDIA_PREFIX = "/static/media/ckeditor" #copiar ``media/ckeditor``
CKEDITOR_UPLOAD_PATH = "upload/"# Subir archivos
CKEDITOR_BROWSE_SHOW_DIRS= True
CKEDITOR_IMAGE_BACKEND = "pillow"
CKEDITOR_JQUERY_URL = '//ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js'




CKEDITOR_CONFIGS = {
    'default': {
        'toolbar': 'full',
        'height': 1000,
        'width': 1000,
    },
}

#Configuraciones para el editor
"""
CKEDITOR_CONFIGS = {
    'awesome_ckeditor': {
        'toolbar': 'Basic',
    },
}
CKEDITOR_CONFIGS = {
    'default': {
        'toolbar': 'Custom',
        'toolbar_Custom': [
            ['Bold', 'Italic', 'Underline'],
            ['NumberedList', 'BulletedList', '-', 'Outdent', 'Indent', '-', 'JustifyLeft', 'JustifyCenter', 'JustifyRight', 'JustifyBlock'],
            ['Link', 'Unlink'],
            ['RemoveFormat', 'Source']
        ]
    }
}
"""
