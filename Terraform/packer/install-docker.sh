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
sudo apt install docker-compose

# run hello-world container for testing
sudo docker run hello-world

#install aws-cli
# sudo apt-get install -y awscli
# curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
# unzip awscliv2.zip
# sudo ./aws/install

#install aws-cli with pip3
sudo apt install python3-pip -y
pip3 install awscli --upgrade --user
python3 -m awscli --version
export AWS_ACCESS_KEY_ID=$ACCESSKEY 
export AWS_SECRET_ACCESS_KEY=$SECRETKEY
export AWS_DEFAULT_REGION=$REGION

#install jq
sudo apt update 
sudo apt install -y jq
jq --version

git clone https://github.com/kallada2021/portifoliowebsite.git
# ssh-keyscan github.com >> /home/ec2-user/.ssh/known_hosts
# eval `ssh-agent`
# ssh-agent bash -c \
# 'ssh-add /home/ec2-user/.ssh/[privateKey]; git clone https://github.com/kallada2021/portifoliowebsite.git'
ls  
cd portifoliowebsite 
cd django-api 

echo "Creating .env file"
aws secretsmanager get-secret-value --secret-id $DB_SECRET --region $REGION | \
            jq -r '.SecretString' | \
            jq -r "to_entries|map(\"\(.key)=\\\"\(.value|tostring)\\\"\")|.[]" > .env


cat .env

#if top value doesn't work
# aws secretsmanager get-secret-value --secret-id $DB_SECRET --region $REGION --query SecretString --output text | jq -r 'to_entries|map("\(.key)=\(.value|tostring)")|.[]' > .env
# eval $(cat .env | sed 's/^/export /')

# echo "::set-output name=POSTGRES_HOST::$(aws rds describe-db-instances \
#           --query="DBInstances[*].Endpoint.Address" \
#           --db-instance-identifier main-db \
#           --region $REGION --output text)"

# # ECR login
# sudo aws ecr get-login-password --region $aws-region | sudo docker login --username $USERNAME --password-stdin $ACCOUNTID.dkr.ecr.$REGION.amazonaws.com/$ECRREPO 
# # docker login -u $USERNAME -p $(aws ecr get-login-password --region $REGION) $ACCOUNTID.dkr.ecr.$REGION.amazonaws.com/$ECRREPO

# #Pull docker containers from ECR
# sudo docker pull $ECR_REGISTRY/$ECRREPO:django-latest
# sudo docker pull $ECR_REGISTRY/$ECRREPO:nginx-latest
# sudo docker network create portfolio
# sudo docker run --name api --network portfolio $ECR_REGISTRY/$ECR_REPOSITORY:django-latest
# sudo docker run -p 8080:80 --name nginx --network portfolio $ECR_REGISTRY/$ECRREPO:nginx-latest 