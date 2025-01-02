#!/bin/bash

# Update package list
echo "Updating package list..."
sudo apt update -y
sudo apt full-upgrade -y

# Install headless qBittorrent
echo "Installing headless(nox) qBittorrent..."
sudo apt install qbittorrent-nox

# Start Tailscale
echo "Starting qBittorrent..."
qbittorrent-nox
