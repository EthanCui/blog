# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('website', '0005_auto_20160923_1150'),
    ]

    operations = [
        migrations.RenameField(
            model_name='column',
            old_name='new_nav',
            new_name='news_nav',
        ),
    ]
