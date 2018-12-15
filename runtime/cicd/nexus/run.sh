sudo docker run                 \
   -p 8081:8081                 \
   -p 5000-5010:5000-5010       \
   -v $PWD/data:/nexus-data     \
   -v $PWD/logs:/nexus-data/log \
   -v $PWD/tmp:/tmp             \
   -d                           \
   --name nexus.cicd            \
  docker/nexus3