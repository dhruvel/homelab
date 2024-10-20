sudo apt update -y
curl -fsSL https://get.docker.com | sh || error "Failed to install Docker"
sudo usermod -aG docker $USER || error "Failed to add user to Docker group"
echo "Restarting system to apply changes..."
sudo shutdown -r now