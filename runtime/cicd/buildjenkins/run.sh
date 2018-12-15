sudo docker run                             \
   --hostname buildjenkins.cicd             \
   -p 8080:8080                             \
   -p 50000:50000                           \
   -v $PWD/data:/var/jenkins_home           \
   -v $PWD/logs:/var/jenkins_home/logs      \
   -v $PWD/tmp:/var/jenkins_home/tmp        \
   -v /var/run/docker.sock:/var/run/docker.sock \
   --privileged                             \
   --group-add 996                          \
   -d                                       \
   --name buildjenkins.cicd                 \
   --network cicdnetwork                    \
  docker/jenkins2.151