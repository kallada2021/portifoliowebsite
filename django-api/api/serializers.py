from rest_framework import serializers

from .models import Contact, MeetTheTeam, Project, Service, Technology

#Todo fix send email function
class ContactSerializer(serializers.ModelSerializer):
    class Meta:
        model = Contact
        fields = [
            "name",
            "email",
            "phone",
            "message",
        ]


class TechnologySerializer(serializers.ModelSerializer):
    class Meta:
        model = Technology
        fields = "__all__"


class ProjectSerializer(serializers.ModelSerializer):
    class Meta:
        model = Project
        fields = "__all__"


class ServiceSerializer(serializers.ModelSerializer):
    class Meta:
        model = Service
        fields = "__all__"


class MeetTheTeamSerializer(serializers.ModelSerializer):
    class Meta:
        model = MeetTheTeam
        fields = "__all__"
