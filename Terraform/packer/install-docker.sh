#!/bin/bash
# prints output
set -x 

# update and install docker
sudo yum update -y
sudo amazon-linux-extras install -y docker  
# sudo yum search docker 
# sudo yum install docker -y 

#Add group membership for the default ec2-user so you can run all docker commands
sudo groupadd docker
sudo usermod -a -G docker ec2-user
id ec2-user

# add git
sudo yum install git -y

sudo systemctl enable docker.service
sudo systemctl start docker.service
sudo systemctl status docker.service

# check aws cli version
aws --version
# export AWS_DEFAULT_REGION=$REGION
# export AWS_ACCESS_KEY_ID=$ACCESSKEY 
# export AWS_SECRET_ACCESS_KEY=$SECRETKEY
aws configure set aws_access_key_id $ACCESSKEY --profile portfolio
aws configure set aws_secret_access_key $SECRETKEY --profile portfolio
aws configure set default.region $REGION --profile portfolio
# ECR login
#sudo aws ecr get-login-password --region $REGION| sudo docker login --username $USERNAME --password-stdin $ACCOUNTID.dkr.ecr.$REGION.amazonaws.com/$ECRREPO 
#$(aws ecr get-login-password --region $REGION)
#$aws ecr get-login
sudo aws ecr get-login --region $REGION| sudo docker login --username $USERNAME --password-stdin $ACCOUNTID.dkr.ecr.$REGION.amazonaws.com/$ECRREPO

sudo docker pull $ACCOUNTID.dkr.ecr.$REGION.amazonaws.com/$ECRREPO/django-latest 
sudo docker pull $ACCOUNTID.dkr.ecr.$REGION.amazonaws.com/$ECRREPO/nginx-latest

sudo docker network create portfolio
sudo docker run --name api --network portfolio $ACCOUNTID.dkr.ecr.$aws-region.amazonaws.com/$ECRREPO:django-latest
sudo docker run -p 8080:80 --name nginx --network portfolio $ACCOUNTID.dkr.ecr.$aws-region.amazonaws.com/$ECRREPO:nginx-latest 