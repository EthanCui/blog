# -*- coding: utf-8 -*-
from collections import defaultdict
from django.shortcuts import redirect
from django.shortcuts import render
from website.models import Column, Article, Tag
from django.template import RequestContext
from django.core.paginator import Paginator, PageNotAnInteger, EmptyPage
from pytz import *
import django_comments

# Create your views here.

def get_default_data(request):
    columns = Column.objects.all()
    tags = Tag.objects.all()
    topArticles = Article.objects.all()[0:5]
    archiveList = Article.objects.datetimes('pub_date', 'month', order='DESC', tzinfo= timezone('Asia/Shanghai'))
    archiveDic = defaultdict(list)
    for d in archiveList:
        archiveDic[d.year].append(d.month)
    archiveDic = sorted(archiveDic.items(), reverse=True)
    return {'columns': columns, 'tags': tags, 'topArticles': topArticles, 'archiveDic': archiveDic}

def index(request):
    return render(request, 'index.html', RequestContext(request, {}, processors =[get_default_data]))

def column_detail(request, column_slug):
    page = request.GET.get('page')
    column = Column.objects.get(slug=column_slug)
    articles = column.article_set.all().order_by('-pub_date')
    paginator = Paginator(articles, 10)

    try:
        pagedArticles = paginator.page(page)
    except PageNotAnInteger:
        # If page is not an integer, deliver first page.
        pagedArticles = paginator.page(1)
    except EmptyPage:
        # If page is out of range (e.g. 9999), deliver last page of results.
        pagedArticles = paginator.page(paginator.num_pages)

    pageRange = range(1, paginator.num_pages+1)

    return render(request, 'news/column.html', RequestContext(request, {'column': column, 'pagedArticles': pagedArticles, 'pageRange': pageRange}, processors=[get_default_data]))

def article_detail(request, pk, article_slug):
    article = Article.objects.get(pk=pk)
    comments = django_comments.models.Comment.objects.filter(object_pk=pk)

    if article_slug != article.slug:
        return redirect(article, permanent=True)
    return render(request, 'news/article.html', RequestContext(request, {'article': article, 'comments': comments}, processors=[get_default_data]))

def aboutus(request):
    article = Article.objects.get(title='部署方法')
    return render(request, 'aboutus.html', RequestContext(request, {'article': article}, processors =[get_default_data]))

def declaration(request):
    article = Article.objects.get(title='免责声明')
    return render(request, 'declaration.html', RequestContext(request, {'article': article}, processors=[get_default_data]))

def comment(request,pk, article_slug):
    name = request.POST.get('name')
    contents = request.POST.get('comments')

    django_comments.models.Comment.objects.create(
        content_type_id=9,
        object_pk=pk,
        site_id=1,
        comment=contents,
        user_name=name,
    )
    return redirect('/article/' + pk + '/' + article_slug)

def archive(request, year, month):
    page = request.GET.get('page')
    article_list = Article.objects.filter(pub_date__year=year, pub_date__month=month)
    paginator = Paginator(article_list, 10)

    try:
        pagedArticles = paginator.page(page)
    except PageNotAnInteger:
        # If page is not an integer, deliver first page.
        pagedArticles = paginator.page(1)
    except EmptyPage:
        # If page is out of range (e.g. 9999), deliver last page of results.
        pagedArticles = paginator.page(paginator.num_pages)

    pageRange = range(1, paginator.num_pages+1)

    return render(request, 'news/column.html', RequestContext(request, {'column': None, 'pagedArticles': pagedArticles, 'pageRange': pageRange}, processors=[get_default_data]))


