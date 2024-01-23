#!/bin/bash
clear
# portainer_data
 docker run -d -p 8000:8000 -p 9443:9443 --name portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce:latest

# docker run -d -p 8000:8000 -p 9443:9443 --name portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce:latest --sslcert /docker/ssl.crt --sslkey /docker/ssl.key

# docker run -d -p 9443:9443 -p 8000:8000 --name portainer --restart always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data -v /etc/letsencrypt/live/paqo.de:/certs/live/paqo.de:ro -v /etc/letsencrypt/archive/paqo.de:/certs/archive/paqo.de:ro portainer/portainer-ce:latest --sslcert /certs/live/paqo.de/fullchain.pem --sslkey /certs/live/yourdomain/privkey.pem

# docker run -d -p 9443:9443 -p 8000:8000 --name portainer --restart always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data -v /etc/letsencrypt/live/paqo.de:/certs/live/paqo.de:ro -v /etc/letsencrypt/archive/paqo.de:/certs/archive/paqo.de:ro portainer/portainer-ee:latest --sslcert /certs/live/paqo.de/fullchain.pem --sslkey /certs/live/yourdomain/privkey.pem

echo
echo “##################“
echo “Laufende Container“
echo “##################“;echo
docker ps
echo
echo “############“
echo “Offene Ports“
echo “############“;echo
netstat -tulpen | grep 443
