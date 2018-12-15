#!/bin/bash
cd /home/dockermgr/runtime/cicd/gitlab
./run.sh
cd /home/dockermgr/runtime/cicd//buildjenkins
./run.sh
cd /home/dockermgr/runtime/cicd//nexus
./run.sh
cd /home/dockermgr