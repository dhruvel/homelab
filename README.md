# HomeLab
Raspberry Pi HomeLab

# Configuration

Configure SSH - On your Mac
```
ssh-copy-id -R <USER>@<RPI-IP>
ssh-copy-id <USER>@<RPI-ID>
```

# Installation Scripts

## 1. Install Tailscale
A simple script to install Tailscale on Raspberry Pi (Or any Linux Distro)
```
wget -qO- https://raw.githubusercontent.com/dhruvel/homelab/main/scripts/install_tailscale.sh | bash
```

## 2. Install Docker
A simple script to install docker on Raspberry Pi (Or any Linux Distro)
```
wget -qO- https://raw.githubusercontent.com/dhruvel/homelab/main/scripts/install_docker.sh | bash
```
## 3. Install Portainer
A simple script to install portainer on Raspberry Pi
```
wget -qO- https://raw.githubusercontent.com/dhruvel/homelab/main/scripts/install_portainer.sh | bash
```
Portainer will be available at `http://<raspberrypi_ip>:9000`

## 4. Install Pi-hole
A simple script to install Pi-hole on Raspberry Pi
```
wget -qO- https://raw.githubusercontent.com/dhruvel/homelab/main/scripts/install_pihole.sh | bash
```
Pi-hole will be available at `http://<raspberrypi_ip>:4000/admin`

## 5. Install Plex
A simple script to install Plex on Raspberry Pi
```
wget -qO- https://raw.githubusercontent.com/dhruvel/homelab/main/scripts/install_plex.sh | bash
```
Plex will be available at `http://<raspberrypi_ip>:32400/web`

## 6. Install qBittorrent
A simple script to install qBittorrent on Raspberry Pi
```
wget -qO- https://raw.githubusercontent.com/dhruvel/homelab/main/scripts/install_qbittorrent.sh | bash
```
qBittorrent will be available at `http://<raspberrypi_ip>:8080`
```
The Web UI administrator username is: admin 
The Web UI administrator password has not been changed from the default: adminadmin
```

## Mount External Hard Drive

```
# List all available disks and partitions
lsblk

# Identify the disk (e.g., /dev/sda1)

# Create a mount point (e.g., /mnt/external_disk)
sudo mkdir -p /mnt/external_disk

# Mount the disk
sudo mount /dev/sda1 /mnt/external_disk

# Verify the disk is mounted
lsblk
```
## Automount on Boot (Optional)

```
# Add the external_disk entry to the fstab file
sudo nano /etc/fstab

# Add the following line at the end of the file
/dev/sda1 /mnt/external_hdd auto defaults 0 0
```
### Example:
```
# List all available disks and partitions
dhruvel@raspberrypiHL:/ $ lsblk
NAME        MAJ:MIN RM  SIZE RO TYPE MOUNTPOINTS
sda           8:0    0  4.5T  0 disk 
└─sda1        8:1    0  4.5T  0 part 
mmcblk0     179:0    0 59.5G  0 disk 
├─mmcblk0p1 179:1    0  512M  0 part /boot/firmware
└─mmcblk0p2 179:2    0   59G  0 part /

# Identify the disk (e.g., /dev/sda1)

# Create a mount point (e.g., /mnt/external_disk)
dhruvel@raspberrypiHL:/ $ sudo mkdir -p /media/hdd

# Mount the disk
dhruvel@raspberrypiHL:/ $ sudo mount /dev/sda1 /media/hdd

# Verify the disk is mounted
dhruvel@raspberrypiHL:/ $ lsblk
NAME        MAJ:MIN RM  SIZE RO TYPE MOUNTPOINTS
sda           8:0    0  4.5T  0 disk 
└─sda1        8:1    0  4.5T  0 part /media/hdd
mmcblk0     179:0    0 59.5G  0 disk 
├─mmcblk0p1 179:1    0  512M  0 part /boot/firmware
└─mmcblk0p2 179:2    0   59G  0 part /

# Add the external_disk entry to the fstab file
sudo nano /etc/fstab

# Add the following line at the end of the file
/dev/sda1 /media/hdd auto defaults 0 0
```

## Install and configure samba (SMB)

```
sudo apt update
sudo apt install samba
```

```
sudo nano /etc/samba/smb.conf
```

```
[shared]
path = /media/external_device
browseable = yes
read only = no
guest ok = yes
```
```
sudo systemctl restart smbd
```

![image](https://github.com/user-attachments/assets/abdaf63d-c807-4822-9db1-83554d13cb61)



