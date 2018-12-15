sudo docker run                 \
   --hostname gitlab.cicd       \
   --env GITLAB_OMNIBUS_CONFIG="external_url 'http://gitlab.cicd/'; gitlab_rails['lfs_enabled'] = true;" \
   -p 80:80                     \
   -p 443:443                   \
   -v $PWD/data:/var/opt/gitlab \
   -v $PWD/logs:/var/log/gitlab \
   -v $PWD/conf:/etc/gitlab     \
   -d                           \
   --name gitlab.cicd           \
   --network cicdnetwork        \
  docker/gitlab10.8
