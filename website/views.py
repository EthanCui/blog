# -*- coding: utf-8 -*-
from django.shortcuts import redirect
from django.shortcuts import render
from website.models import Column, Article

import django_comments

# Create your views here.

def index(request):
    columns = Column.objects.all()
    return render(request, 'index.html', {'columns': columns})

def column_detail(request, column_slug):
    columns = Column.objects.all()
    column = Column.objects.get(slug=column_slug)
    return render(request, 'news/column.html', {'columns': columns,'column': column})

def article_detail(request, pk, article_slug):
    columns = Column.objects.all()
    article = Article.objects.get(pk=pk)
    comments = django_comments.models.Comment.objects.filter(object_pk=pk)

    if article_slug != article.slug:
        return redirect(article, permanent=True)
    return render(request, 'news/article.html', {'columns': columns, 'article': article, 'comments': comments})

def declaration(request):
    columns = Column.objects.all()
    article = Article.objects.get(pk=32)
    return render(request, 'declaration.html', {'columns': columns,'article': article})

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
