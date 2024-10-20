#!/bin/bash

# Update package list
sudo apt update -y

# Install Docker
if curl -fsSL https://get.docker.com | sh; then
    echo "Docker installed successfully."
else
    echo "Docker installation failed." >&2
    exit 1
fi

# Add user to Docker group
if sudo usermod -aG docker $USER; then
    echo "User added to Docker group successfully."
else
    echo "Failed to add user to Docker group." >&2
    exit 1
fi

# Prompt for system restart
read -p "Docker installation completed. Do you want to restart the system now? (y/n): " choice
if [[ "$choice" == "y" || "$choice" == "Y" ]]; then
    echo "Restarting system to apply changes..."
    sudo shutdown -r now
else
    echo "Please restart the system manually to apply changes."
fi