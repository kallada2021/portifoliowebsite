#!/bin/bash

cd portifoliowebsite
cd django-api  
/home/ubuntu/.local/aws-cli/aws secretsmanager get-secret-value --secret-id $DB_SECRET--region $REGION | \
            jq -r '.SecretString' | \
            jq -r "to_entries|map(\"\(.key)=\\\"\(.value|tostring)\\\"\")|.[]" > .env
docker-compose up -d 