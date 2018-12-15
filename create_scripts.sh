#!/bin/bash
#=============================================================================
#
# File: create_scripts.sh
#
# Description:
#
#
# History:
#       11/16/2018    Magyar Zsanett      Creation
#
#=============================================================================

#BUILD_DIR="/home/dockermgr/build/docker/"
#RUNTIME_DIR="/home/dockermgr/runtime/cicd"

#dockermgr .profile / .bash_profile
#-------------------------------------#
cat > /home/dockermgr/.profile << EOF
alias docker="sudo /usr/bin/docker "
alias docker-compose="sudo /usr/bin/docker-compose "
EOF

cat >> /home/dockermgr/.bash_profile << EOF
#
# Environment specific profile:
#
if [ -f ~/.profile ]; then
   echo "~/.profile is executing..." 1>&2
   . ~/.profile
fi
EOF

# Create docker network for CI/CD containers
#-------------------------------------#
systemctl start docker
sudo /usr/bin/docker network create cicdnetwork
systemctl stop docker

# Set permissions for build scripts
#-------------------------------------#
GITLAB_BUILD_DIR="/home/dockermgr/build/docker/gitlab"
chmod 755 $GITLAB_BUILD_DIR/build.sh

JENKINS_BUILD_DIR="/home/dockermgr/build/docker/jenkins"
chmod 755 $JENKINS_BUILD_DIR/build.sh

NEXUS_BUILD_DIR="/home/dockermgr/build/docker/nexus"
chmod 755 $NEXUS_BUILD_DIR/build.sh

# Set permissions for runtime scripts
#-------------------------------------#
GITLAB_RUNTIME_DIR="/home/dockermgr/runtime/cicd/gitlab"
mkdir $GITLAB_RUNTIME_DIR/conf
mkdir $GITLAB_RUNTIME_DIR/data
mkdir $GITLAB_RUNTIME_DIR/logs
mkdir $GITLAB_RUNTIME_DIR/tmp
chmod 755 $GITLAB_RUNTIME_DIR/run.sh
chmod 755 $GITLAB_RUNTIME_DIR/stop.sh
chmod 755 $GITLAB_RUNTIME_DIR/rm.sh

JENKINS_RUNTIME_DIR="/home/dockermgr/runtime/cicd/buildjenkins"
mkdir $JENKINS_RUNTIME_DIR/data
mkdir $JENKINS_RUNTIME_DIR/logs
mkdir $JENKINS_RUNTIME_DIR/tmp
cat .passwd | su -c "chown -R 1000:1000 $JENKINS_RUNTIME_DIR/data/" root
chmod g+w $JENKINS_RUNTIME_DIR/logs/
chmod g+w $JENKINS_RUNTIME_DIR/tmp/
chmod 755 $JENKINS_RUNTIME_DIR/run.sh
chmod 755 $JENKINS_RUNTIME_DIR/stop.sh
chmod 755 $JENKINS_RUNTIME_DIR/rm.sh
chmod 755 $JENKINS_RUNTIME_DIR/enter.sh

NEXUS_RUNTIME_DIR="/home/dockermgr/runtime/cicd/nexus"
mkdir $NEXUS_RUNTIME_DIR/data
mkdir $NEXUS_RUNTIME_DIR/logs
mkdir $NEXUS_RUNTIME_DIR/tmp
cat .passwd | su -c "chown -R 200:dockergrp $NEXUS_RUNTIME_DIR/logs" root
cat .passwd | su -c "chown -R 200:dockergrp $NEXUS_RUNTIME_DIR/data" root
cat .passwd | su -c "chown -R 200:dockergrp $NEXUS_RUNTIME_DIR/tmp" root
chmod 755 $NEXUS_RUNTIME_DIR/run.sh
chmod 755 $NEXUS_RUNTIME_DIR/stop.sh
chmod 755 $NEXUS_RUNTIME_DIR/rm.sh

# Set permissions for first run scripts
#-------------------------------------#
chmod 755 /home/dockermgr/build_images.sh
chmod 755 /home/dockermgr/run_containers.sh

# Set permissions for start / stop scripts (after OS start / shut down)
#-------------------------------------#
chmod 755 /home/dockermgr/start_containers.sh
chmod 755 /home/dockermgr/stop_containers.sh
