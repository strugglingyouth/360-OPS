# coding:utf-8

from django.shortcuts import render,render_to_response
from rest_framework import viewsets
from demo.models import DataList
from demo.serializers import DataListSerializer

#def index(request):
    #data = {}
    #data['foo'] = 1024
    #return render_to_response('index.html',{'data':data})

class DataListViewSet(viewsets.ReadOnlyModelViewSet):
    """
        数据列表  
    """

    queryset = DataList.objects.all()
    serializer_class = DataListSerializer







