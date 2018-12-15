#!/bin/bash
if [ "\$(sudo docker ps -a | grep  gitlab.cicd)" ]; then
        sudo docker start gitlab.cicd
else
        /home/dockermgr/runtime/cicd/gitlab/run.sh
fi

if [ "\$(sudo docker ps -a | grep  buildjenkins.cicd)" ]; then
        sudo docker start buildjenkins.cicd
else
        /home/dockermgr/runtime/cicd/buildjenkins/run.sh
fi

if [ "\$(sudo docker ps -a | grep  nexus.cicd)" ]; then
        sudo docker start nexus.cicd
else
        /home/dockermgr/runtime/cicd/nexus/run.sh
fi