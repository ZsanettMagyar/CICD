#!/bin/bash
sudo systemctl start docker
cd /home/dockermgr/build/docker/gitlab
./build.sh
cd /home/dockermgr/build/docker/jenkins
./build.sh
cd /home/dockermgr/build/docker/nexus
./build.sh
cd /home/dockermgr