#!/bin/bash

# Function to check the success of the last command and exit if it failed
check_success() {
    if [ $? -ne 0 ]; then
        echo "Error: $1 failed."
        exit 1
    fi
}

# Update package list and install Samba
echo "Updating package list..."
sudo apt update -y
check_success "Package list update"

echo "Installing Samba..."
sudo apt install samba -y
check_success "Samba installation"

# Append Samba configuration to smb.conf
echo "Appending Samba configuration to smb.conf..."
sudo tee -a /etc/samba/smb.conf > /dev/null <<EOL
[shared]
   path = /mnt/sda
   browseable = yes
   read only = no
   guest ok = yes
EOL
check_success "Appending Samba configuration"

# Restart Samba service
echo "Restarting Samba service..."
sudo systemctl restart smbd
check_success "Samba service restart"