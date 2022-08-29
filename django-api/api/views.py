import json

from django.http import JsonResponse
from django.shortcuts import render
from rest_framework import status
from rest_framework.decorators import api_view
from rest_framework.response import Response

from .models import Contact, MeetTheTeam, Project, Service, Technology
from .serializers import (
    ContactSerializer,
    MeetTheTeamSerializer,
    ProjectSerializer,
    ServiceSerializer,
    Technology,
    TechnologySerializer,
)


@api_view(["GET"])
def apiOverview(request):
    api_urls: dict = {
        "Technologies": "/technologies/",
        "Technology": "/technologies/<str:pk>",
        "Contacts": "/contacts",
        "Projects": "/projects/",
        "Project": "/projects/<str:pk>",
        "Services": "/services/",
        "Services": "/services/<str:pk>",
        "ContactUs": "/send-message",
    }
    return Response(api_urls, status=200)


@api_view(["GET"])
def contact(request):
    try:
        contact = Contact.objects.all()
        serializer = ContactSerializer(contact, many=True)
    except:
        return Response(
            {"error": True, "message": "Error retrieving contacts from the database"},
            status=status.HTTP_500_INTERNAL_SERVER_ERROR,
        )
    return Response(serializer.data, status=status.HTTP_200_OK)


@api_view(["POST"])
def createContact(request):
    serializer = ContactSerializer(data=request.data)

    if serializer.is_valid():
        serializer.save()
    else:
        return Response("Invalid contact data", status=status.HTTP_400_BAD_REQUEST)

    return Response(serializer.data, status=status.HTTP_201_CREATED)


@api_view(["GET"])
def services(request):
    try:
        services = Service.objects.all()
        serializer = ServiceSerializer(services, many=True)
    except:
        return Response(
            {"error": True, "message": "Error retrieving services from the database"},
            status=status.HTTP_500_INTERNAL_SERVER_ERROR,
        )
    return Response(serializer.data, status=status.HTTP_200_OK)


@api_view(["GET"])
def servicesDetail(request, pk: str):
    try:
        service = Service.objects.get(id=pk)
        serializer = ServiceSerializer(service, many=False)
    except:
        return Response(
            {"error": True, "message": f"Service with id {pk} wasn't found in the database"},
            status=status.HTTP_500_INTERNAL_SERVER_ERROR,
        )
    return Response(serializer.data, status=status.HTTP_200_OK)


@api_view(["GET"])
def projects(request):
    try:
        project = Project.objects.all()
        serializer = ProjectSerializer(project, many=True)
    except:
        return Response(
            {"error": True, "message": "Error retrieving projects from the database"},
            status=status.HTTP_500_INTERNAL_SERVER_ERROR,
        )
    return Response(serializer.data, status=status.HTTP_200_OK)


@api_view(["GET"])
def projectDetail(request, pk: str):
    try:
        project = Project.objects.get(id=pk)
        serializer = ProjectSerializer(project, many=False)
    except:
        return Response(
            {"error": True, "message": f"project with id {pk} wasn't found in the database"},
            status=status.HTTP_500_INTERNAL_SERVER_ERROR,
        )
    return Response(serializer.data, status=status.HTTP_200_OK)


@api_view(["GET"])
def technologies(request):
    try:
        technologies = Technology.objects.all()
        serializer = TechnologySerializer(technologies, many=True)
    except:
        return Response(
            {"error": True, "message": "Error retrieving technologies from the database"},
            status=status.HTTP_500_INTERNAL_SERVER_ERROR,
        )
    return Response(serializer.data, status=status.HTTP_200_OK)


@api_view(["GET"])
def technologiesDetail(request, pk: str):
    try:
        technology = Technology.objects.get(id=pk)
        serializer = TechnologySerializer(technology, many=False)
    except:
        return Response(
            {"error": True, "message": f"Technology with id {pk} wasn't found in the database"},
            status=status.HTTP_500_INTERNAL_SERVER_ERROR,
        )
    return Response(serializer.data, status=status.HTTP_200_OK)


@api_view(["GET"])
def meetTheTeam(request):
    try:
        meet_the_team_data = MeetTheTeam.objects.all()
        serializer = MeetTheTeamSerializer(meet_the_team_data, many=True)
    except:
        return Response(
            {"error": True, "message": f"No data was found in the database"},
            status=status.HTTP_500_INTERNAL_SERVER_ERROR,
        )
    return Response(serializer.data, status=status.HTTP_200_OK)


def displayFrontend(request):
    return render(request, "test.html")
