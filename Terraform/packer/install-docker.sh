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

# install docker compose
# 1. Get pip3 
sudo yum install python3-pip
# 2. Then run any one of the following
sudo pip3 install docker-compose # with root access
 
# sudo curl -L https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose
# sudo chmod +x /usr/local/bin/docker-compose
docker-compose version
sudo yum install jq -y
jq --version

# Setup sudo to allow no-password sudo for "hashicorp" group and adding "terraform" user
sudo groupadd -r hashicorp
sudo useradd -m -s /bin/bash terraform
sudo usermod -a -G hashicorp terraform
sudo cp /etc/sudoers /etc/sudoers.orig
echo "terraform ALL=(ALL) NOPASSWD:ALL" | sudo tee /etc/sudoers.d/terraform

# Installing SSH key
sudo mkdir -p /home/terraform/.ssh
sudo chmod 700 /home/terraform/.ssh
sudo cp /tmp/portfolio-packer.pub /home/terraform/.ssh/authorized_keys
sudo chmod 600 /home/terraform/.ssh/authorized_keys
sudo chown -R terraform /home/terraform/.ssh
sudo usermod --shell /bin/bash terraform

# clone repo
git clone https://github.com/kallada2021/portifoliowebsite.git
# ssh-keyscan github.com >> /home/ec2-user/.ssh/known_hosts
# eval `ssh-agent`
# ssh-agent bash -c \
# 'ssh-add /home/ec2-user/.ssh/[privateKey]; git clone https://github.com/kallada2021/portifoliowebsite.git'
ls  
cd portifoliowebsite 
cd django-api 

export AWS_DEFAULT_REGION=$REGION
export AWS_ACCESS_KEY_ID=$ACCESSKEY 
export AWS_SECRET_ACCESS_KEY=$SECRETKEY

aws secretsmanager get-secret-value --secret-id $DB_SECRET --region $REGION | \
            jq -r '.SecretString' | \
            jq -r "to_entries|map(\"\(.key)=\\\"\(.value|tostring)\\\"\")|.[]" > .env


# docker compose up --file docker-compose.prod.yml 
# # check aws cli version
# aws --version
# # export AWS_DEFAULT_REGION=$REGION
# # export AWS_ACCESS_KEY_ID=$ACCESSKEY 
# # export AWS_SECRET_ACCESS_KEY=$SECRETKEY
# aws configure set aws_access_key_id $ACCESSKEY --profile portfolio
# aws configure set aws_secret_access_key $SECRETKEY --profile portfolio
# aws configure set default.region $REGION --profile portfolio
# # ECR login
# #sudo aws ecr get-login-password --region $REGION| sudo docker login --username $USERNAME --password-stdin $ACCOUNTID.dkr.ecr.$REGION.amazonaws.com/$ECRREPO 
# #$(aws ecr get-login-password --region $REGION)
# #$aws ecr get-login
# sudo aws ecr get-login --region $REGION| sudo docker login --username $USERNAME --password-stdin $ACCOUNTID.dkr.ecr.$REGION.amazonaws.com/$ECRREPO

# sudo docker pull $ACCOUNTID.dkr.ecr.$REGION.amazonaws.com/$ECRREPO/django-latest 
# sudo docker pull $ACCOUNTID.dkr.ecr.$REGION.amazonaws.com/$ECRREPO/nginx-latest

# sudo docker network create portfolio
# sudo docker run --name api --network portfolio $ACCOUNTID.dkr.ecr.$aws-region.amazonaws.com/$ECRREPO:django-latest
# sudo docker run -p 8080:80 --name nginx --network portfolio $ACCOUNTID.dkr.ecr.$aws-region.amazonaws.com/$ECRREPO:nginx-latest 