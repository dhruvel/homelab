#!/bin/bash


# Update package list and install Samba
sudo apt update -y
sudo apt install samba -y


# Append Samba configuration to smb.conf
sudo tee -a /etc/samba/smb.conf > /dev/null <<EOL
[shared]
   path = /mnt/sda
   browseable = yes
   read only = no
   guest ok = yes
EOL

# Restart Samba service
sudo systemctl restart smbd