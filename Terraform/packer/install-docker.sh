#!/bin/bash
# prints output
set -x 

# update and install docker
sudo apt-get update -y &&
sudo apt-get install -y \
apt-transport-https \
ca-certificates \
curl \
gnupg-agent \
software-properties-common &&
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add - &&
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" &&
sudo apt-get update -y &&
sudo apt-get install docker-ce docker-ce-cli containerd.io -y &&
sudo usermod -aG docker ubuntu

# run hello-world container for testing
sudo docker run hello-world

#install aws-cli
sudo apt-get install -y awscli
export AWS_ACCESS_KEY_ID=$ACCESSKEY 
export AWS_SECRET_ACCESS_KEY=$SECRETKEY

# ECR login
aws ecr get-login-password --region $aws-region | docker login --username $USERNAME --password-stdin $ACCOUNTID.dkr.ecr.$REGION.amazonaws.com/$ECRREPO 

#Pull docker containers from ECR
docker pull $ECR_REGISTRY/$ECRREPO:Django-$IMAGE_TAG
docker pull $ECR_REGISTRY/$ECRREPO:Nginx-$IMAGE_TAG
docker network create portfolio
docker run --name api --network portfolio $ECR_REGISTRY/$ECRREPO:Django-$IMAGE_TAG
docker run -p 8080:80 --name nginx --network portfolio $ECR_REGISTRY/$ECRREPO:Nginx-$IMAGE_TAG