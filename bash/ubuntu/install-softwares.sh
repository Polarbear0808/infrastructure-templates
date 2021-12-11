#!/bin/bash
# run this script with administrator access
# sudo -E ./install-softwares.sh
set -eux

# update repositories
apt update -y

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
usermod -aG docker ${USER}

# install docker-compose
# See. https://docs.docker.com/compose/install/
curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
ln -snf /usr/local/bin/docker-compose /usr/bin/docker-compose

# install terraform
# See. https://learn.hashicorp.com/tutorials/terraform/install-cli?in=terraform/docker-get-started
curl -fsSL https://apt.releases.hashicorp.com/gpg | apt-key add -
apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
apt update -y && apt install -y terraform

# install volta, nodejs
# See. https://docs.volta.sh/guide/understanding#managing-your-toolchain
curl https://get.volta.sh | bash
cat - <<- 'EOF' >> ${HOME}/.bashrc
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"
EOF
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"
volta install node
volta install npm
volta install yarn

# install awscli
# See. https://docs.aws.amazon.com/ja_jp/cli/latest/userguide/install-cliv2-linux.html#cliv2-linux-install
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
