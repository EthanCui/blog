"""cuihu URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/1.8/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  url(r'^$', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  url(r'^$', Home.as_view(), name='home')
Including another URLconf
    1. Add an import:  from blog import urls as blog_urls
    2. Add a URL to urlpatterns:  url(r'^blog/', include(blog_urls))
"""
from django.conf import settings
from django.conf.urls import include, url
from django.contrib import admin
from DjangoUeditor import urls as DjangoUeditor_urls

from website.views import index
from website.views import column_detail
from website.views import article_detail
from website.views import aboutus
from website.views import declaration
from website.views import comment
from website.views import archive

urlpatterns = [
    url(r'^$', index, name='index'),
    url(r'^index.html$', index, name='index'),
    url(r'^admin/', include(admin.site.urls)),
    url(r'^ueditor/', include(DjangoUeditor_urls)),

    url(r'^column/(?P<column_slug>[^/]+)/$', column_detail, name='column'),
    url(r'^article/(?P<pk>\d+)/(?P<article_slug>[^/]+)/$', article_detail, name='article'),
    url(r'^article/(?P<pk>\d+)/(?P<article_slug>[^/]+)/comment$', comment, name='comment'),
     # url(r'^/(?P<year>\d+)/(?P<month>\d+)/$', archive, name='archive'),
    url(r'^(?P<year>\d+)/(?P<month>\d+)/$', archive, name='archive'),

    url(r'^aboutus.html$', aboutus),
    url(r'^declaration.html$', declaration),
]
