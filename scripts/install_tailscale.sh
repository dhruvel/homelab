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

# Install Tailscale
echo "Installing Tailscale..."
curl -fsSL https://tailscale.com/install.sh | sh
check_success "Tailscale installation"

# Start Tailscale
echo "Starting Tailscale..."
sudo tailscale up
