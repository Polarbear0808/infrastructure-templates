#!/bin/bash
set -eux

# update repositories
apt update -y
apt upgrade -y

# install common softwares
apt install -y \
    git \
    gnupg \
    apt-transport-https \
    software-properties-common \
    ca-certificates \
    curl \
    unzip

# install docker 
# See. https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-ubuntu-20-04-ja
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
add-apt-repository "deb [arch=arm64] https://download.docker.com/linux/ubuntu focal stable"
apt update -y && apt install -y docker-ce
usermod -aG docker ubuntu 

# install docker-compose
apt install -y docker-compose
