#!/bin/bash

# Update package list
sudo apt update -y

# Install Docker
curl -sSL https://get.docker.com | sh 
sudo usermod -aG docker $USER 
echo "Rebooting now..."
sudo reboot now
