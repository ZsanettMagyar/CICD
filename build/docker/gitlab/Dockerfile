FROM  gitlab/gitlab-ce:10.8.4-ce.0

RUN   apt-get update    && \
      apt-get install -y   \
      gettext-base         \
      less                 \
      lsof                 \
      netcat               \
      strace               \
      tcpdump              \
      telnet               \
      traceroute        && \
      rm -rf /var/lib/apt/lists/*


RUN   rm /etc/localtime && \
      ln -s /usr/share/zoneinfo/Europe/Budapest /etc/localtime