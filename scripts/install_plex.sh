#!bin/bash

# Install Plex Media Server
echo "deb https://downloads.plex.tv/repo/deb public main" | sudo tee /etc/apt/sources.list.d/plexmediaserver.list
curl https://downloads.plex.tv/plex-keys/PlexSign.key | sudo apt-key add -
sudo apt update
sudo apt install plexmediaserver -y

# Start Plex Media Server
sudo systemctl start plexmediaserver
sudo systemctl enable plexmediaserver
