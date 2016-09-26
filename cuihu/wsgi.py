# -*- coding: utf-8 -*-
"""
WSGI config for cuihu project.

It exposes the WSGI callable as a module-level variable named ``application``.

For more information on this file, see
https://docs.djangoproject.com/en/1.8/howto/deployment/wsgi/
"""

import os
import sys

from os.path import  dirname, abspath
from django.core.wsgi import get_wsgi_application

#同一台服务上部署多个django程序，需要指定settings文件
PROJECT_DIR = dirname(dirname(abspath(__file__)))
sys.path.insert(0, PROJECT_DIR)
#os.environ.setdefault("DJANGO_SETTINGS_MODULE", "cuihu.settings")
os.environ["DJANGO_SETTINGS_MODULE"] = "cuihu.settings"

application = get_wsgi_application()
