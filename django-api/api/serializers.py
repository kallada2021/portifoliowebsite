from rest_framework import serializers
from .models import Contact, Technology


class ContactSerializer(serializers.Serializer):
    name = serializers.CharField(max_length=100)
    email = serializers.EmailField()
    phone = serializers.CharField(max_length=13)
    message = serializers.CharField(max_length=2000)
    created_at = serializers.DateTimeField()
    updated_at = serializers.DateTimeField()

    class Meta:
        model = Contact
        fields = "__all__"
    

class TechnologySerializer(serializers.ModelSerializer):
    class Meta:
        model = Technology
        fields = "__all__"