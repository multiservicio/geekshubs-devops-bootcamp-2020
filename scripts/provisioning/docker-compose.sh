#! /bin/bash

# Guia -> https://docs.docker.com/install/linux/docker-ce/ubuntu/

# Instalando Dependencias
sudo apt-get install -y -q \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

sudo apt-get update

sudo apt-get install -y -q docker-ce docker-ce-cli containerd.io
echo "Docker install completado!"

# Guia https://docs.docker.com/compose/install/
echo "Instalando Docker-compose"
sudo curl -L "https://github.com/docker/compose/releases/download/1.25.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

sudo chmod +x /usr/local/bin/docker-compose

sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
echo "Instalado Docker-compose!"
