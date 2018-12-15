# Continous Integration / Continous Delivery

## Prerequisites:
1. install CentOS7 (e.g. http://ftp.bme.hu/centos/7.5.1804/isos/x86_64/CentOS-7-x86_64-Minimal-1804.iso)
2. copy "install_cicd.sh" to /root
3. chmod 755 install_cicd.sh
4. ./install_cicd.sh

## install_cicd.sh
    
    Installationn of telnet, Docker CE, and Docker Compose.
    
    Docker post-installation steps:
    - create dockergrp unix group
    - create dockermgr unix user
    - using systemd to start docker service when the system boots
    - dockermgr sudo permissions
    
    Pulling this git repository.
    
    Running create_scripts.sh
    
## create_scripts.sh
    
    Modifying .profile and .bash_profile for dockermgr user.
    Creating docker network.
    Setting permissions for scripts.

## build_images.sh
It builds the images after the first installation of CentOS.

## run_containers.sh
First run of the containers.

## start_containers.sh
You can use this script after an OS restart to start the containers.

## stop_containers.sh
You can use this script before an OS shut down to stop the running containers.
    
## Directories
    
    build
    |--- docker
         |--- gitlab
         |--- jenkins
         |--- nexus
    runtime
    |--- cicd
         |--- gitlab
              |--- conf
              |--- data
              |--- logs
              |--- tmp
         |--- buildjenkins
              |--- data
              |--- logs
              |--- tmp
         |--- nexus
              |--- data
              |--- logs
              |--- tmp
