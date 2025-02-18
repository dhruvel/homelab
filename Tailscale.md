# Tailscale Installation & Configuration Guide

## 1. Basic Installation

### 1.1 Update Package List
```sh
echo "Updating package list..."
sudo apt update -y
```

### 1.2 Install Tailscale
```sh
echo "Installing Tailscale..."
curl -fsSL https://tailscale.com/install.sh | sh
```

### 1.3 Start Tailscale
```sh
echo "Starting Tailscale..."
sudo tailscale up
```
[Official Installation Guide](https://tailscale.com/download/linux)

---

## 2. Advertise Exit Node

### 2.1 Enable IP Forwarding
```sh
echo 'net.ipv4.ip_forward = 1' | sudo tee -a /etc/sysctl.conf
echo 'net.ipv6.conf.all.forwarding = 1' | sudo tee -a /etc/sysctl.conf
sudo sysctl -p /etc/sysctl.conf
```
[More Details on Exit Nodes](https://tailscale.com/kb/1103/exit-nodes?tab=linux)

### 2.2 Install `networkd-dispatcher`
```sh
sudo apt-get install networkd-dispatcher
sudo systemctl is-enabled networkd-dispatcher
```
[Package Info](https://debian.pkgs.org/12/debian-main-amd64/networkd-dispatcher_2.2.3-1_all.deb.html#:~:text=Install%20Howto%20*%20Update%20the%20package%20index:,deb%20package:%20%EF%BC%84%20sudo%20apt%2Dget%20install%20networkd%2Ddispatcher.)

### 2.3 Improve Exit Node Performance
```sh
NETDEV=$(ip -o route get 8.8.8.8 | cut -f 5 -d " ")
sudo ethtool -K $NETDEV rx-udp-gro-forwarding on rx-gro-list off
```

### 2.4 Persist Changes After Reboot
```sh
printf '#!/bin/sh\n\nethtool -K %s rx-udp-gro-forwarding on rx-gro-list off \n' "$(ip -o route get 8.8.8.8 | cut -f 5 -d " ")" | sudo tee /etc/networkd-dispatcher/routable.d/50-tailscale
sudo chmod 755 /etc/networkd-dispatcher/routable.d/50-tailscale
```

### 2.5 Testing Configuration
```sh
sudo /etc/networkd-dispatcher/routable.d/50-tailscale
test $? -eq 0 || echo 'An error occurred.'
```
[Performance Optimization Guide](https://tailscale.com/kb/1320/performance-best-practices#ethtool-configuration)

---

## References
- [Tailscale Installation](https://tailscale.com/download/linux)
- [Exit Node Configuration](https://tailscale.com/kb/1103/exit-nodes?tab=linux)
- [Networkd Dispatcher Package](https://debian.pkgs.org/12/debian-main-amd64/networkd-dispatcher_2.2.3-1_all.deb.html#:~:text=Install%20Howto%20*%20Update%20the%20package%20index:,deb%20package:%20%EF%BC%84%20sudo%20apt%2Dget%20install%20networkd%2Ddispatcher.)
- [Performance Best Practices](https://tailscale.com/kb/1320/performance-best-practices#ethtool-configuration)
