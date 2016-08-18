from __future__ import unicode_literals

from django.db import models

class DataList(models.Model):
    foo = models.CharField(max_length=100, default='1024')

    def __unicode__(self):
        return self.foo
    def __str__(self):
        return self.foo



