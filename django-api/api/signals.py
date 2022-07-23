import json
import logging

import requests
from django.db.models.signals import post_save
from django.dispatch import receiver

from .models import Contact

logger = logging.getLogger(__name__)


def sendEmail(email: str, name: str, message: str):
    # TODO: implement send email lambda
    url: str = "lambda-endpoint-url"
    payload = {"email": email, "name": name, "message": message}
    print("Payload ", payload)
    req = requests.post(url, json.dumps(payload))
    if req.status_code != 200:
        print("Contact us email not sent! Res status code ", req.status_code)
        return

    res = req.json()
    print(res)
