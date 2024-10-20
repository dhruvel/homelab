sudo apt update -y
curl -fsSL https://get.docker.com | sh
sudo usermod -aG docker $USER
echo "Restarting system to apply changes..."
sudo shutdown -r now