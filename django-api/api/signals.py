import json
import logging

import requests
from django.db.models.signals import post_save
from django.dispatch import receiver

from .models import Contact

logger = logging.getLogger(__name__)


@receiver(post_save, sender=Contact)
def sendContact(sender, instance, created: bool, **kwargs):
    if created:
        logger.info(f"{instance}'s message created.")
        email: str = instance.email
        message: str = instance.message
        name: str = instance.name
        logger.info(f"{email} message = {instance.message} ")
        sendEmail(email=email, name=name, message=message)


def sendEmail(email: str, name: str, message: str):
    url: str = "https://enmkotdau8.execute-api.us-east-1.amazonaws.com/prod/sendemail"
    payload = {"email": email, "name": name, "message": message}
    print("Payload ", payload)
    req = requests.post(url, json.dumps(payload))
    if req.status_code != 200:
        print("Contact us email not sent! Res status code ", req.status_code)
        return

    res = req.json()
    print(res)
