#!/bin/bash
# prints output
set -x 

# update and install docker
sudo apt-get update -y  
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
sudo apt install docker-compose -y

sudo apt install unzip -y

#install aws-cli
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install

which aws 

export AWS_ACCESS_KEY_ID=$ACCESSKEY 
export AWS_SECRET_ACCESS_KEY=$SECRETKEY
export AWS_DEFAULT_REGION=$REGION

#install jq
sudo apt update 
sudo apt install -y jq
jq --version

git clone https://github.com/kallada2021/portifoliowebsite.git  
cd portifoliowebsite 
cd django-api 
ls 
# echo "Creating .env file"
aws secretsmanager get-secret-value --secret-id $DB_SECRET --region $REGION | \
            jq -r '.SecretString' | \
            jq -r "to_entries|map(\"\(.key)=\\\"\(.value|tostring)\\\"\")|.[]" > .env


# cat .env
# change directory permissions
sudo chmod 755 static
sudo chmod 755 staticfiles


# # ECR login
# sudo aws ecr get-login-password --region $aws-region | sudo docker login --username $USERNAME --password-stdin $ACCOUNTID.dkr.ecr.$REGION.amazonaws.com/$ECRREPO 
# # docker login -u $USERNAME -p $(aws ecr get-login-password --region $REGION) $ACCOUNTID.dkr.ecr.$REGION.amazonaws.com/$ECRREPO

# #Pull docker containers from ECR
# sudo docker pull $ECR_REGISTRY/$ECRREPO:django-latest
# sudo docker pull $ECR_REGISTRY/$ECRREPO:nginx-latest
# sudo docker network create portfolio
# sudo docker run --name api --network portfolio $ECR_REGISTRY/$ECR_REPOSITORY:django-latest
# sudo docker run -p 8080:80 --name nginx --network portfolio $ECR_REGISTRY/$ECRREPO:nginx-latest 