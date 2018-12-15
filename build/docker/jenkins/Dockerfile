FROM jenkins/jenkins:2.151

USER  root

RUN   apt-get update    && \
      apt-get install -y   \
      expect               \
      file                 \
      gettext-base         \
      git                  \
      jq                   \
      less                 \
      lsof                 \
      netcat               \
      strace               \
      tcpdump              \
      telnet               \
      traceroute           \
      vim                  \
      apt-transport-https  \
         ca-certificates      \
         gnupg2               \
         software-properties-common && \
      curl -fsSL https://download.docker.com/linux/$(. /etc/os-release; echo "$ID")/gpg > /tmp/dkey; apt-key add /tmp/dkey && \
      add-apt-repository      \
         "deb [arch=amd64] https://download.docker.com/linux/$(. /etc/os-release; echo "$ID") \
         $(lsb_release -cs)   \
         stable"           && \
      apt-get update       && \
      apt-get -y install docker-ce && \
      rm -rf /var/lib/apt/lists/*

RUN   rm /etc/localtime                                        && \
      ln -s /usr/share/zoneinfo/Europe/Budapest /etc/localtime && \
      chmod o+w /etc/ssl/certs/ca-certificates.crt

COPY  passwd /tmp

RUN   echo "root:`cat /tmp/passwd`" | /usr/sbin/chpasswd       && \
      rm /tmp/passwd                                           && \
      :

USER  jenkins