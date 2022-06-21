from django.forms import ModelForm
from django import forms
from .models import Contact


# Model form for the contact model
class ContactForm(forms.ModelForm):
    name = forms.CharField(
        max_length=100, required=True,
        widget=forms.TextInput(
            attrs={
                "placeholder": "Full Name...",
                "class": "form-control",
            }))
    email = forms.EmailField(
        max_length=254, required=True,
        widget=forms.TextInput(
            attrs={
                "placeholder": "Email...",
                "class": "form-control",
            }))
    message = forms.CharField(
        max_length=2000, required=True,
        widget=forms.Textarea(
            attrs={
                "placeholder": "Your Message...",
                "class": "form-control",
            }))

    phone_number = forms.CharField(
        max_length=13, required=True,
        widget=forms.Textarea(
            attrs={
                "placeholder": "Your Message...",
                "class": "form-control",
            }))

    class Meta:
        model = Contact
        fields = ("name", "email", "message", "phone_number")
