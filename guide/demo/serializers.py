#!/usr/bin/env python
# coding:utf-8

from models import DataList
from rest_framework import serializers

class DataListSerializer(serializers.ModelSerializer):
    """
        数据列表
    """

    class Meta:
        model = DataList
        fileds = ('foo')


