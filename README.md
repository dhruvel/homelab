# HomeLab
Raspberry Pi HomeLab

# Installation Scripts

## 1. Install Docker
A simple script to install docker on Raspberry Pi (Or any Linux Distro)
```
wget -qO- https://raw.githubusercontent.com/dhruvel/homelab/main/scripts/install_docker.sh | bash
```

## 2. Install Tailscale
A simple script to install Tailscale on Raspberry Pi (Or any Linux Distro)
```
wget -qO- https://raw.githubusercontent.com/dhruvel/homelab/main/scripts/install_tailscale.sh | bash
```

## Mount External Hard Drive

```
# List all available disks and partitions
lsblk

# Identify the disk (e.g., /dev/sda1)

# Create a mount point (e.g., /mnt/external_disk)
sudo mkdir -p /mnt/external_disk

# Mount the disk
sudo mount /dev/sdb1 /mnt/external_disk

# Verify the disk is mounted
lsblk
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
dhruvel@raspberrypiHL:/ $ sudo mkdir -p /mnt/sda

# Mount the disk
dhruvel@raspberrypiHL:/ $ sudo mount /dev/sda1 /mnt/sda

# Verify the disk is mounted
dhruvel@raspberrypiHL:/ $ lsblk
NAME        MAJ:MIN RM  SIZE RO TYPE MOUNTPOINTS
sda           8:0    0  4.5T  0 disk 
└─sda1        8:1    0  4.5T  0 part /mnt/sda
mmcblk0     179:0    0 59.5G  0 disk 
├─mmcblk0p1 179:1    0  512M  0 part /boot/firmware
└─mmcblk0p2 179:2    0   59G  0 part /
```

