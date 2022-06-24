import json
from .serializers import ProjectSerializer, SolutionSerializer, Technology, TechnologySerializer, ContactSerializer
from django.http import JsonResponse
from .models import Project, Solution, Technology, Contact
from django.shortcuts import render
from rest_framework.decorators import api_view
from rest_framework.response import Response 


@api_view(["GET"])
def apiOverview(request):
    api_urls: dict = {
        "Technologies": "/technologies/",
        "Technology": "/technologies/<str:pk>",
        "Contacts": "/contacts",
        "Projects": "/projects/",
        "Project": "/projects/<str:pk>",
        "Solutions": "/solutions/",
        "Solution": "/solutions/<str:pk>",
        "ContactUs": "/send-message",
    }
    return Response(api_urls)


@api_view(["GET"])
def contact(request):
    project = Contact.objects.all()
    serializer = ContactSerializer(project, many=True)
    return Response(serializer.data)


@api_view(["POST"])
def createContact(request):
    serializer = ContactSerializer(data=request.data)
    print(request.data)
    print("Serialized data")
    if serializer.is_valid():
        print("Serializer is valid")
        serializer.save()
    else:
        return Response("Invalid data", status=500)

    return Response(serializer.data)

@api_view(["GET"])
def solutions(request):
    solutions = Solution.objects.all()
    serializer = SolutionSerializer(solutions, many=True)
    return Response(serializer.data)


@api_view(["GET"])
def solutionsDetail(request, pk: str):
    solution = Solution.objects.get(id=pk)
    serializer = SolutionSerializer(solution, many=False)
    return Response(serializer.data)


@api_view(["GET"])
def projects(request):
    project = Project.objects.all()
    serializer = ProjectSerializer(project, many=True)
    return Response(serializer.data)


@api_view(["GET"])
def projectDetail(request, pk: str):
    project = Project.objects.get(id=pk)
    serializer = ProjectSerializer(project, many=False)
    return Response(serializer.data)


@api_view(["GET"])
def technologies(request):
    technologies = Technology.objects.all()
    serializer = TechnologySerializer(technologies, many=True) 
    return Response(serializer.data)


@api_view(["GET"])
def technologiesDetail(request, pk:str):
    technology = Technology.objects.get(id=pk)
    serializer = TechnologySerializer(technology, many=False) 
    return Response(serializer.data)