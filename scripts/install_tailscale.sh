#!/bin/bash

# Update package list
echo "Updating package list..."
sudo apt update -y

# Install Tailscale
echo "Installing Tailscale..."
curl -fsSL https://tailscale.com/install.sh | sh

# Start Tailscale
echo "Starting Tailscale..."
sudo tailscale up
