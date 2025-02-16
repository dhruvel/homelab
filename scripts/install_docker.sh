#!/bin/bash


function error {
  echo -e "\\e[91m$1\\e[39m"
  exit 1
}

function check_internet() {
  printf "Checking if you are online..."
  wget -q --spider http://github.com
  if [ $? -eq 0 ]; then
    echo "Online. Continuing."
  else
    error "Offline. Please connect to the internet then run the script again."
  fi
}

check_internet

# Update package list
sudo apt update -y || error "Failed to update."

# Install Docker
curl -sSL https://get.docker.com | sh || error "Failed to install Docker."
sudo usermod -aG docker $USER || error "Failed to add user to Docker usergroup."
echo "Please logoff/reboot before running docker."
