#!/usr/bin/bash
# server install

# Setup repos
nano /etc/yum.repos.d/docker-ce.repo
# baseurl=https://[URL]/repository/Rockylinux-docker-proxy/$releasever/$basearch/stable

nano /etc/yum.repos.d/Rocky-AppStream.repo
# baseurl=https://[URL]/repository/Rockylinux-BaseOS-Proxy/$contentdir/$releasever/AppStream/$basearch/os/

nano /etc/yum.repos.d/Rocky-BaseOS.repo
# baseurl=https://[URL]/repository/Rockylinux-BaseOS-Proxy/$contentdir/$releasever/BaseOS/$basearch/os/

# install components
dnf update -y
dnf install 'dnf-command(config-manager)' git nano -y
sudo dnf config-manager --add-repo=https://download.docker.com/linux/centos/docker-ce.repo
sudo dnf install docker-ce docker-ce-cli containerd.io -y
systemctl enable docker --now

# setup automation
nano /etc/systemd/system/docker-compose.service
nano /etc/systemd/system/docker-cleanup.service
nano /etc/systemd/system/docker-cleanup.timer

# enable custom services
systemctl enable --now docker-cleanup.timer
systemctl enable --now docker-compose.service

# TODO: install compose service
# TODO: install clean up service

# get compose and config files
mkdir /opt/compose
# TODO: clone git repo into /opt/compose
