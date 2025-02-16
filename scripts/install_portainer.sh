#!/bin/bash

sudo mkdir -p /portainer/Files/AppData/Config/portainer
sudo docker pull portainer/portainer-ce:latest
sudo docker run -d -p 9000:9000 -p 9443:9443 --name=portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v /portainer/Files/AppData/Config/portainer:/data portainer/portainer-ce:latest
