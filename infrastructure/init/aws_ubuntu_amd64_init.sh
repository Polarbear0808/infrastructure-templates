#!/bin/bash
set -eux

# update repositories
apt update -y

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
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"
apt update -y && apt install -y docker-ce
usermod -aG docker ubuntu 

# install docker-compose
# See. https://docs.docker.com/compose/install/
curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
ln -snf /usr/local/bin/docker-compose /usr/bin/docker-compose

# download this repository
cd /home/ubuntu
git clone https://github.com/Polarbear0808/infrastructure-templates.git
chown -R ubuntu:ubuntu infrastructure-templates