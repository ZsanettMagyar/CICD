#!/bin/bash
#=============================================================================
#
# File: install_cicd.sh
#
# Description:
#
#
# History:
#       11/16/2018    Magyar Zsanett      Creation
#
#=============================================================================

#----------------------------------------------------------------------------#
# Use these commands as root user
#----------------------------------------------------------------------------#

# Install telnet
#-------------------------------------#
yum install telnet

# Install git
#-------------------------------------#
yum install git

#-------------------------------------#
# Install Docker CE
# https://docs.docker.com/install/linux/docker-ce/centos/#install-docker-ce
#-------------------------------------#
sudo yum install -y yum-utils \
  device-mapper-persistent-data \
  lvm2

sudo yum-config-manager \
    --add-repo \
    https://download.docker.com/linux/centos/docker-ce.repo

sudo yum install -y docker-ce

# sudo systemctl start docker

#-------------------------------------#
# Install Docker Compose
# https://docs.docker.com/compose/install/
#-------------------------------------#
sudo curl -L "https://github.com/docker/compose/releases/download/1.23.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

sudo chmod +x /usr/local/bin/docker-compose

#-------------------------------------#
# Post-installation steps for Linux
# https://docs.docker.com/install/linux/linux-postinstall/
#-------------------------------------#
sudo groupadd -g 8000 dockergrp
sudo useradd dockermgr -u 8000 -g 8000
# change password for dockermgr user
cat .passwd | passwd --stdin dockermgr

# dockermgr user sudo permissions
echo "dockermgr           ALL=NOPASSWD: /bin/systemctl enable docker, /bin/systemctl start docker, /bin/systemctl stop docker, /bin/systemctl daemon-reload, /bin/systemctl restart docker, /usr/bin/docker-compose, /bin/docker, /sbin/service docker" \
    >> /etc/sudoers

# Update /etc/hosts
#-------------------------------------#
echo "127.0.0.1 gitlab.cicd nexus.cicd buildjenkins.cicd deployjenkins.cicd" >> /etc/hosts

#----------------------------------------------------------------------------#
# Use these commands as dockermgr user
#----------------------------------------------------------------------------#
su -c "git pull https://github.com/ZsanettMagyar/cicd.git" dockermgr

# using systemd to start docker service when the system boots
#su -c "sudo systemctl enable docker" dockermgr

chmod 755 create_scripts.sh

chmod o+x /root
su -c "./create_scripts.sh" dockermgr
