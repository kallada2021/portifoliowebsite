import json
from .serializers import Technology, TechnologySerializer
from django.http import JsonResponse
from .models import Project, Solution
from django.shortcuts import render
from rest_framework.decorators import api_view
from rest_framework.response import Response 


@api_view(["GET"])
def apiOverview(request):
    api_urls: dict = {
        "Technologies": "/technologies/<str:pk>",
        "Contacts": "/contacts",
        "Solutions": "/solutions/<str:pk>",
        "ContactUs": "/send-message",
    }
    return Response(api_urls)


@api_view(["GET","POST"])
def contact(request):
    error: str = "False"
    context: dict = {
        "error": error,
        "message": "Contact added"
    }
    return Response(context)


def solutions(request, pk: str):
    solutions = Solution.objects.get(id=pk)

    context: dict = {"solutions": solutions}


def projects(request, pk: str):
    projects = Project.objects.get(id=pk)


def technologies(request):
    technologies = Technology.objects.all()
    serializer = TechnologySerializer(technologies, many=True) 
    return Response(serializer.data)