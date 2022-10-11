#!/bin/bash

cd portifoliowebsite
cd django-api  
#$DB_SECRET
#$REGION
aws secretsmanager get-secret-value --secret-id $DB_SECRET --region $REGION | \
            jq -r '.SecretString' | \
            jq -r "to_entries|map(\"\(.key)=\\\"\(.value|tostring)\\\"\")|.[]" > .env
docker-compose up -d 