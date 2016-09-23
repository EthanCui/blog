from django.contrib import admin
from models import Column, Article, Tag

# Register your models here.

class ColumnAdmin (admin.ModelAdmin):
    list_display = ('name', 'slug', 'intro', 'news_nav', 'blog_nav')

class ArticleAdmin (admin.ModelAdmin):
    list_display = ('title', 'slug', 'author', 'pub_date', 'update_time')

class TagAdmin (admin.ModelAdmin):
    list_display = ('name',)

admin.site.register(Column, ColumnAdmin)
admin.site.register(Article, ArticleAdmin)
admin.site.register(Tag, TagAdmin)