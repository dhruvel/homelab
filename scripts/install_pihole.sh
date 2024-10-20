sudo apt update -y
sudo mkdir -p /home/$USER/pi_hole
docker run -d \
    --name pihole \
    -p 53:53/tcp -p 53:53/udp \
    -p 4000:80 \
    -e TZ="Asia/Kolkata" \
    -v "/home/$USER/pi_hole/etc-pihole:/etc/pihole/" \
    -v "/home/$USER/pi_hole/etc-dnsmasq.d:/etc/dnsmasq.d/" \
    --dns=127.0.0.1 --dns=1.1.1.1 \
    --restart=unless-stopped \
    --hostname pi.hole \
    -e VIRTUAL_HOST="pi.hole" \
    -e PROXY_LOCATION="pi.hole" \
    -e FTLCONF_LOCAL_IPV4="127.0.0.1" \
    pihole/pihole:latest