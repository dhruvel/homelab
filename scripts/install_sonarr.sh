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

# Create necessary directories
echo "Creating necessary directories..."
sudo mkdir -p /home/$USER/sonarr
check_success "Directory creation"

# Create docker-compose.yml file
sudo cd /home/$USER/sonarr
echo "Creating docker-compose.yml file..."
cat <<EOL > docker-compose.yml
services:
  sonarr:
    image: lscr.io/linuxserver/sonarr:latest
    container_name: sonarr
    environment:
      - PUID=1000
      - PGID=1000
      - TZ=Etc/UTC
    volumes:
      - "${/path/to/sonarr/data}":/config
      - "${/path/to/tvseries}":/tv #optional
      - "${/path/to/downloadclient-downloads}":/downloads #optional
    ports:
      - 8989:8989
    restart: unless-stopped
EOL
check_success "docker-compose.yml creation"

# Bring up the Sonarr container using docker-compose
echo "Bringing up the Sonarr container using docker-compose..."
sudo docker-compose up -d
