import json
from .forms import ContactForm
from .models import *
from django.shortcuts import render


def contact(request):
    form = ContactForm()
    error: str = ""
    if request.method == "POST":
        form = ContactForm(request.POST)
        if form.is_valid():
            print("Form", form)
            new_contact = form.save()
            new_contact.save()
            return json.dumps({"message": "Contact message sent"})
        else:
            context: dict = {"form": form}
            print("Invalid form")
            # messages.error(request, "An error occurred")
            return json.dumps({"message": "An error occurred"})
    context: dict = {"form": form, "error": error, "msg": error}
    return json.dumps(dict)


def solutions(request, pk: str):
    solutions = Solution.objects.get(id=pk)

    context: dict = {"solutions": solutions}


def projects(request, pk: str):
    projects = Project.objects.get(id=pk)
