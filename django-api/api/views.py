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
    return Response(api_urls, status=200)


@api_view(["GET"])
def contact(request):
    try:
        contact = Contact.objects.all()
        serializer = ContactSerializer(contact, many=True)
    except:
         return Response({"error": True, "message": "Error retrieving contacts from the database"}, status=500)
    return Response(serializer.data, status=200)


@api_view(["POST"])
def createContact(request):
    serializer = ContactSerializer(data=request.data)
 
    if serializer.is_valid():
        serializer.save()
    else:
        return Response("Invalid contact data", status=400)

    return Response(serializer.data, status=200)

@api_view(["GET"])
def solutions(request):
    try:
        solutions = Solution.objects.all()
        serializer = SolutionSerializer(solutions, many=True)
    except: 
        return Response({"error": True, "message": "Error retrieving solutions from the database"}, status=500)
    return Response(serializer.data, status=200)


@api_view(["GET"])
def solutionsDetail(request, pk: str):
    try:
        solution = Solution.objects.get(id=pk)
        serializer = SolutionSerializer(solution, many=False)
    except:
        return Response({"error": True, "message": f"solution with id {pk} wasn't found in the database"}, status=500)
    return Response(serializer.data, status=200)


@api_view(["GET"])
def projects(request):
    try:
        project = Project.objects.all()
        serializer = ProjectSerializer(project, many=True)
    except:
        return Response({"error": True, "message": "Error retrieving projects from the database"}, status=500)
    return Response(serializer.data, status=200)


@api_view(["GET"])
def projectDetail(request, pk: str):
    try:
        project = Project.objects.get(id=pk)
        serializer = ProjectSerializer(project, many=False)
    except:
        return Response({"error": True, "message": f"project with id {pk} wasn't found in the database"}, status=500)
    return Response(serializer.data, status=200)


@api_view(["GET"])
def technologies(request):
    try:
        technologies = Technology.objects.all()
        serializer = TechnologySerializer(technologies, many=True) 
    except:
         return Response({"error": True, "message": "Error retrieving technologies from the database"}, status=500)
    return Response(serializer.data, status=200)


@api_view(["GET"])
def technologiesDetail(request, pk:str):
    try:
        technology = Technology.objects.get(id=pk)
        serializer = TechnologySerializer(technology, many=False) 
    except:
        return Response({"error": True, "message": f"Technology with id {pk} wasn't found in the database"}, status=500)
    return Response(serializer.data, status=200)