#!/bin/bash

# Function to check the success of the last command and exit if it failed
check_success() {
    if [ $? -ne 0 ]; then
        echo "Error: $1 failed."
        exit 1
    fi
}

# Update package list
echo "Updating package list..."
sudo apt update -y
check_success "Package list update"

# Check if docker-compose.yml already exists
if [ -f docker-compose.yml ]; then
    echo "Warning: docker-compose.yml already exists and will be overwritten."
fi

# Create docker-compose.yml file
echo "Creating docker-compose.yml file..."
sudo cat <<EOL > docker-compose.yml
version: '3'

services:
  portainer:
    image: portainer/portainer-ce:latest
    container_name: portainer
    ports:
      - 9000:9000
      - 9443
    volumes:
      - "/var/run/docker.sock:/var/run/docker.sock"
      - "portainer_data:/data"
    restart: always

volumes:
  portainer_data:
EOL
check_success "docker-compose.yml creation"

# Bring up the Portainer container using docker-compose
echo "Bringing up the Portainer container using docker-compose..."
sudo docker-compose up -d
check_success "docker-compose up"