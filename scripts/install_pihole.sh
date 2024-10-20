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
sudo mkdir -p /home/$USER/pi_hole
check_success "Directory creation"

# Create docker-compose.yml file
echo "Creating docker-compose.yml file..."
cat <<EOL > docker-compose.yml
services:
  pihole:
    container_name: pihole
    image: pihole/pihole:latest
    ports:
      - "53:53/tcp"
      - "53:53/udp"
      - "4000:80"
    environment:
      TZ: "${TZ:-Asia/Kolkata}"
      VIRTUAL_HOST: "${VIRTUAL_HOST:-pi.hole}"
      PROXY_LOCATION: "${PROXY_LOCATION:-pi.hole}"
      FTLCONF_LOCAL_IPV4: "${FTLCONF_LOCAL_IPV4:-127.0.0.1}"
    volumes:
      - "/home/$USER/pi_hole/etc-pihole:/etc/pihole"
      - "/home/$USER/pi_hole/etc-dnsmasq.d:/etc/dnsmasq.d"
    dns:
      - 127.0.0.1
      - 1.1.1.1
    restart: unless-stopped
    hostname: pi.hole
EOL
check_success "docker-compose.yml creation"

# Bring up the Pi-hole container using docker-compose
echo "Bringing up the Pi-hole container using docker-compose..."
sudo docker-compose up -d
check_success "docker-compose up"