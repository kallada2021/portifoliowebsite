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
# sudo apt-get install -y awscli
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install

# install aws-cli with pip3
# sudo apt install python3-pip -y
# pip3 install awscli --upgrade --user
export AWS_ACCESS_KEY_ID=$ACCESSKEY 
export AWS_SECRET_ACCESS_KEY=$SECRETKEY

# ECR login
aws ecr get-login-password --region $aws-region | sudo docker login --username $USERNAME --password-stdin $ACCOUNTID.dkr.ecr.$REGION.amazonaws.com/$ECRREPO 
# docker login -u $USERNAME -p $(aws ecr get-login-password --region $REGION) $ACCOUNTID.dkr.ecr.$REGION.amazonaws.com/$ECRREPO

#Pull docker containers from ECR
docker pull $ECR_REGISTRY/$ECRREPO:django-latest
docker pull $ECR_REGISTRY/$ECRREPO:nginx-latest
docker network create portfolio
docker run --name api --network portfolio $ECR_REGISTRY/$ECR_REPOSITORY:django-latest
docker run -p 8080:80 --name nginx --network portfolio $ECR_REGISTRY/$ECRREPO:nginx-latest 