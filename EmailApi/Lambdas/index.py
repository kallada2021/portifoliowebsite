import json
import logging
import os
from datetime import datetime
from email import message
from http import client

import boto3
from botocore.exceptions import ClientError

logger = logging.getLogger()
logger.setLevel(logging.INFO)

RECIPIENT = os.getenv("RECIPIENT")
AWS_REGION = os.getenv("AWS_REGION")

client = boto3.client("ses")


def index_handler(event, context):
    logger.info(f"Incoming request is: {event}")

    message = json.loads(event["message"])
    sender_email = json.loads(event["email"])
    client_name = json.loads(event["name"])

    if sender_email is None:
        raise Exception("No email provided.")

    body_html = f"""<html>
        <head></head>
        <body>
          <h2>Email from Prospective Client</h2>
          <br/>
          <p>{message}</p> 
        </body>
        </html>
                    """
    email_message = {
        "Body": {
            "Html": {
                "Charset": "utf-8",
                "Data": body_html,
            },
        },
        "Subject": {
            "Charset": "utf-8",
            "Data": "Message from Prospective Client",
        },
    }
    ses_response = client.send_email(
        Destination={
            "ToAddresses": [RECIPIENT],
        },
        Message=email_message,
        Source=sender_email,
        # ConfigurationSetName=config_set_name,
    )

    print(f"Prospective ClientID: {client_name}.")
    response = {"message": "Email successfully sent"}
    # return Body=json.dumps(response).encode()
    return json.dumps(response)
