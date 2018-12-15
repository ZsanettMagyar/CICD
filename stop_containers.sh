#!/bin/bash
/home/dockermgr/runtime/cicd/gitlab/stop.sh
/home/dockermgr/runtime/cicd/nexus/stop.sh
/home/dockermgr/runtime/cicd/buildjenkins/stop.sh
sudo systemctl stop docker