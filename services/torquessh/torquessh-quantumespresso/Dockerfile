# base image needs to be moved under the aiidateam account, and this
# link needs to be updated
FROM giovannipizzi/torquessh-base
MAINTAINER AiiDA Team <info@aiida.net>

# Use baseimage-docker's init system.
CMD ["/sbin/my_init"]

# Install required packages
RUN apt-get update \ 
    && apt-get install -y \
    openmpi-bin \
    quantum-espresso \
    && rm -rf /var/lib/apt/lists/* \
    && apt-get clean all


