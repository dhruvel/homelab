sudo apt update -y
curl -fsSL https://tailscale.com/install.sh | sh || error "Failed to install Tailscale"
sudo tailscale up