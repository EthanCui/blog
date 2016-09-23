# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
import datetime
from django.utils.timezone import utc


class Migration(migrations.Migration):

    dependencies = [
        ('website', '0001_initial'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='column',
            name='pub_date',
        ),
        migrations.RemoveField(
            model_name='column',
            name='update_time',
        ),
        migrations.AddField(
            model_name='article',
            name='pub_date',
            field=models.DateTimeField(default=datetime.datetime(2016, 9, 18, 9, 37, 56, 577000, tzinfo=utc), verbose_name='\u53d1\u8868\u65f6\u95f4', auto_now_add=True),
            preserve_default=False,
        ),
        migrations.AddField(
            model_name='article',
            name='update_time',
            field=models.DateTimeField(auto_now=True, verbose_name='\u66f4\u65b0\u65f6\u95f4', null=True),
        ),
    ]
