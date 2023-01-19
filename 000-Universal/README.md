# 000-Universal
This repository contains universally used files for provisioning the servers that run the URL infrastructure.

## Base install:
The `install.sh` file includes all necessary commands to install docker and needed tools.

## Docker-compose service
URL is powered by docker compose. to avoid installing docker compose natively, we are running it inside of a docker container. To start the docker compose docker container, we are using a custom systemd service. The following code installs and enables the service.

### Universal setup
The following code will setup the docker compose service on universal machines.
```bash
# open the file and paste the right service file
nano /usr/lib/systemd/system/docker-compose.service
systemctl enable docker-compose
# to start it now
systemctl start docker-compose
```

### Setup on 103-Nexus
The server 103 needs a slightly modified systemd service because we can't pull the docker compose container that is stored inside the nexus service run on this server. Also we need to mount the local docker config file because nexus is pulled from the redhat container registry which needs authentication

## Docker-cleanup service
The docker cleanup service removed old images on a regular basis. This makes sure that the machines are not running out of space. The following will setup the service.
```bash
# open the service file and paste the content
nano /usr/lib/systemd/system/docker-cleanup.service
# create the timer to execute the service on a regular basis
nano /usr/lib/systemd/system/docker-cleanup.timer
# enable ad start the service
systemctl enable docker-cleanup.timer --now
```

## Getting configs
This step retrieves the needed config files, like `docker-compose.yml` and `Caddyfile`.
```bash
git clone <repo url>
```

## Copyright
This code is licensed as MIT.
