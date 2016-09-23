# -*- coding: utf-8 -*-
from django.shortcuts import redirect
from django.shortcuts import render
from website.models import Column, Article, Tag

import django_comments

# Create your views here.

def index(request):
    columns = Column.objects.all()
    tags = Tag.objects.all()
    topArticles = Article.objects.all()[0:4]
    return render(request, 'index.html', {'columns': columns, 'tags': tags, 'topArticles': topArticles})

def column_detail(request, column_slug):
    columns = Column.objects.all()
    column = Column.objects.get(slug=column_slug)
    topArticles = Article.objects.all()[0:4]
    articles = column.article_set.all().order_by('-pub_date')
    tags = Tag.objects.all()
    return render(request, 'news/column.html', {'columns': columns,'column': column, 'articles': articles, 'tags': tags, 'topArticles': topArticles})

def article_detail(request, pk, article_slug):
    columns = Column.objects.all()
    tags = Tag.objects.all()
    topArticles = Article.objects.all()[0:4]
    article = Article.objects.get(pk=pk)
    comments = django_comments.models.Comment.objects.filter(object_pk=pk)

    if article_slug != article.slug:
        return redirect(article, permanent=True)
    return render(request, 'news/article.html', {'columns': columns, 'article': article, 'comments': comments,'tags': tags, 'topArticles': topArticles})

def declaration(request):
    columns = Column.objects.all()
    tags = Tag.objects.all()
    topArticles = Article.objects.all()[0:4]
    article = Article.objects.get(title='免责声明')
    return render(request, 'declaration.html', {'columns': columns,'article': article,'tags': tags, 'topArticles': topArticles})

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
