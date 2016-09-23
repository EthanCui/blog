# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('website', '0004_auto_20160919_1721'),
    ]

    operations = [
        migrations.CreateModel(
            name='Tag',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('name', models.CharField(max_length=16, verbose_name='\u540d\u79f0')),
            ],
            options={
                'verbose_name': '\u6807\u7b7e',
                'verbose_name_plural': '\u6807\u7b7e',
            },
        ),
        migrations.AlterModelOptions(
            name='article',
            options={'verbose_name': '\u535a\u6587', 'verbose_name_plural': '\u535a\u6587'},
        ),
        migrations.RemoveField(
            model_name='column',
            name='home_display',
        ),
        migrations.RemoveField(
            model_name='column',
            name='nav_display',
        ),
        migrations.AddField(
            model_name='column',
            name='blog_nav',
            field=models.BooleanField(default=False, verbose_name='\u535a\u5ba2\u5bfc\u822a'),
        ),
        migrations.AddField(
            model_name='column',
            name='new_nav',
            field=models.BooleanField(default=False, verbose_name='\u65b0\u95fb\u5bfc\u822a'),
        ),
        migrations.AddField(
            model_name='article',
            name='tags',
            field=models.ManyToManyField(to='website.Tag', verbose_name='\u6807\u7b7e'),
        ),
    ]
