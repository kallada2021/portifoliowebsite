from email import message
from http import client
import boto3
import os
from botocore.exceptions import ClientError
import random
import json
from datetime import datetime

RECIPIENT = “paremodelingautomation@gmail.com”
AWS_REGION = "us-east-1"
client = boto3.client("ses")
def index_handler(event,context):
    message = event["message"]
    body_html = f"""<html>
        <head></head>
        <body>
          <h2>Email from Prospective Client</h2>
          <br/>
          <p>${message}</p> 
        </body>
        </html>
                    """
    email_message = {
        'Body': {
            'Html': {
                'Charset': 'utf-8',
                'Data': body_html,
            },
        },
        'Subject': {
            'Charset': 'utf-8',
            'Data': "Message from Prospective Client",
        },
    }
    ses_response = client.send_email(
        Destination={
            'ToAddresses': [RECIPIENT],
        },
        Message=email_message,
        Source= event["email"],
        ConfigurationSetName=config_set_name,
    )

    print(f"Prospective ClientID: ${event['name']}.")