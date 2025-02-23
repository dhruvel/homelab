#!/bin/bash

# Stop and remove Portainer container:
sudo docker stop portainer
sudo docker rm portainer

# Remove Portainer image:
sudo docker rmi portainer/portainer-ce

# Remove Portainer data directory:
sudo rm -rf /opt/portainer




# Stop Docker service:
sudo systemctl stop docker

# Uninstall Docker packages:
sudo apt-get purge -y docker-engine docker docker.io docker-ce docker-ce-cli

# Remove Docker dependencies:
sudo apt-get autoremove -y --purge docker-engine docker docker.io docker-ce

# Remove Docker directories:
sudo rm -rf /var/lib/docker /etc/docker
sudo rm /etc/apparmor.d/docker
sudo groupdel docker
sudo rm -rf /var/run/docker.sock




# Remove Docker and Portainer configuration files:
sudo rm -rf /etc/docker
sudo rm -rf /var/lib/docker
sudo rm -rf /var/lib/portainer

# Remove Docker and Portainer logs:
sudo rm -rf /var/log/docker
sudo rm -rf /var/log/portainer
