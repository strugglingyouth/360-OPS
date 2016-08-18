from django.shortcuts import render, render_to_response
from django.views.generic import TemplateView
from demo import file


def index(request): 

    
    file_list = file.file_details()
    return render_to_response('index.html',{'file_list':file_list})
    





