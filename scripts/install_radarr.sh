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
mkdir -p /home/$USER/radarr
check_success "Directory creation"

# Change to the created directory
cd /home/$USER/sonarr
check_success "Changing directory to /home/$USER/radarr"

# Create docker-compose.yml file
echo "Creating docker-compose.yml file..."
sudo cat <<EOL > docker-compose.yml
services:
  radarr:
    image: lscr.io/linuxserver/radarr:latest
    container_name: radarr
    environment:
      - PUID=1000
      - PGID=1000
      - TZ=Etc/UTC
    volumes:
      - "/home/$USER/radarr/config:/config"
      - "/mnt/sda/media/movies:/movies" #optional
      - "/mnt/sda/media/torrent:/downloads" #optional
    ports:
      - 7878:7878
    restart: unless-stopped
EOL
check_success "docker-compose.yml creation"

# Bring up the Radarr container using docker-compose
echo "Bringing up the Radarr container using docker-compose..."
sudo docker-compose up -d
check_success "docker-compose up"
