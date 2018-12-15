FROM sonatype/nexus3

USER  root

RUN   set -x && \
      yum install -y   \
      gettext          \
      git              \
      less             \
      lsof             \
      nc               \
      strace           \
      tcpdump          \
      telnet           \
      traceroute       \
      wget          && \
      yum clean all && \
      :

RUN   set -x && \
      unlink /etc/localtime                                    && \
      ln -s /usr/share/zoneinfo/Europe/Budapest /etc/localtime && \
      :

COPY  passwd /tmp

RUN   cat /tmp/passwd | passwd --stdin root                    && \
      rm /tmp/passwd                                           && \
      :

USER  nexus
