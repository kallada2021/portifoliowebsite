from rest_framework import serializers
from .models import Contact, Project, Solution, Technology


class ContactSerializer(serializers.ModelSerializer):
    class Meta:
        model = Contact
        # fields = "__all__"
        fields = ["name", "email", "phone", "message",]
    

class TechnologySerializer(serializers.ModelSerializer):
    class Meta:
        model = Technology
        fields = "__all__"


class ProjectSerializer(serializers.ModelSerializer):
    class Meta:
        model = Project
        fields = "__all__"


class SolutionSerializer(serializers.ModelSerializer):
    class Meta:
        model = Solution
        fields = "__all__"