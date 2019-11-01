FROM aiidateam/aiida-docker-base:v1.0.0
MAINTAINER AiiDA Team <developers@aiida.net>

USER root

# Install required ubuntu packages
RUN apt-get update && apt-get install -y --no-install-recommends  \
    bzip2                 \
    git                   \
    gir1.2-gtk-3.0        \
    gnupg                 \
    locales               \
    less                  \
    postgresql            \
    psmisc                \
    rabbitmq-server       \
    rsync                 \
    ssh                   \
    unzip                 \
    vim                   \
    wget                  \
    zip                   \
  && rm -rf /var/lib/apt/lists/* \
  && apt-get clean all

# Fix locales
RUN echo "en_US.UTF-8 UTF-8" > /etc/locale.gen && locale-gen
ENV LC_ALL en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8

# Launch postgres server
COPY opt/postgres.sh /opt/
COPY my_init.d/start-postgres.sh /etc/my_init.d/20_start-postgres.sh

# Launch start-singleuser
COPY opt/start-singleuser.sh /opt/start-singleuser-complete.sh
COPY my_init.d/start-singleuser.sh /etc/my_init.d/31_start-singleuser.sh

# Launch rabbitmq server
RUN mkdir /etc/service/rabbitmq
COPY service/rabbitmq /etc/service/rabbitmq/run

# Launch aiida daemon
RUN mkdir /etc/service/aiida
COPY service/aiida /etc/service/aiida/run

# Use baseimage-docker's init system.
CMD ["/sbin/my_init"]

#EOF
