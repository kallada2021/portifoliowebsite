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
 
sudo rm -rf EmailApi
sudo rm -rf consulting_portfolio_website
sudo rm -rf Terraform

cd django-api 

mkdir static 
mkdir staticfiles

echo "Creating .env file"
aws secretsmanager get-secret-value --secret-id $DB_SECRET --region $REGION | \
            jq -r '.SecretString' | \
            jq -r "to_entries|map(\"\(.key)=\\\"\(.value|tostring)\\\"\")|.[]" > .env


# cat .env
# change directory permissions
sudo chmod 755 static
sudo chmod 755 staticfiles

