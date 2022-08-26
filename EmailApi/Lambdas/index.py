import json
import logging
import os
from datetime import datetime
from http import client

import boto3

logger = logging.getLogger()
logger.setLevel(logging.INFO)

RECIPIENT = os.getenv("RECIPIENT")

client = boto3.client("ses")


def index_handler(event, context):
    logger.info(f"Incoming request is: {event}")

    data = json.loads(event["body"])
    message: str = data["message"]
    sender_email: str = data["email"]
    client_name: str = data["name"]

    if sender_email is None:
        raise Exception("No email provided.")

    body_html = f"""<html>
        <head></head>
        <body>
          <h2>Email from Prospective Client</h2>
          <br/>
          <p>{message}</p> 
          <h4>Sent on {datetime.now()}</h4>
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
    )

    logger.info(f"Prospective ClientID: {client_name}.")
    logger.info(f"SES Response: ${ses_response}")

    body = {
        "message": "Email sent successfully!",
        "success": True,
    }

    return {
        "headers": {
            "Content-Type": "application/json",
            "Access-Control-Allow-Methods": "*",
            "Access-Control-Allow-Origin": "*",
        },
        "statusCode": 200,
        "body": json.dumps(body),
    }
