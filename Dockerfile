FROM phusion/baseimage:0.11
MAINTAINER AiiDA Team <info@aiida.net>

# Set correct environment variables.
ENV HOME /root

# Use baseimage-docker's init system.
CMD ["/sbin/my_init"]

# TODO: probably postgresql-server-dev-9.5 are needed only during
# the pip install phase, so could be removed afterwards (and maybe
# used in the same layer)

# install required software
#   python*-dev is pulled in by python*-pip
RUN apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get -y install \
        mlocate \
        git \
        openssh-client \
        postgresql-10 \
        postgresql-server-dev-10 \
        python2.7 \
        python3.6 \
        python-pip \
        python3-pip \
        virtualenv \
    && rm -rf /var/lib/apt/lists/* \
    && apt-get clean all \
    && updatedb

# update build-tools
# restrict pip version to below 19, until
#   https://github.com/aiidateam/aiida_core/pull/2640
RUN pip install -U 'pip<19' setuptools wheel
RUN pip3 install -U 'pip<19' setuptools wheel

# add USER (no password)
RUN useradd -m -s /bin/bash aiida

##########################################
############ Installation Setup ##########
##########################################

# install rest of the packages as normal user
USER aiida

# set $HOME, create git directory
ENV HOME /home/aiida

# make ssh dir and create host entry for bitbucket.org
RUN mkdir --mode=0700 $HOME/.ssh/ && \
    touch $HOME/.ssh/known_hosts

# Install AiiDA
RUN mkdir -p $HOME/code/

## Prepare the virtual environments for Python 2 and 3
RUN virtualenv --python=python3 $HOME/.venv-py3
RUN virtualenv --python=python2 $HOME/.venv-py2

## Specify build-arg here to cache layers above
ARG AIIDA_VERSION=develop

## Get latest release from git
RUN git clone --branch $AIIDA_VERSION https://github.com/aiidateam/aiida_core.git /home/aiida/code/aiida_core

WORKDIR /home/aiida/code/aiida_core
RUN $HOME/.venv-py2/bin/pip install --no-cache-dir --no-build-isolation --editable .
RUN $HOME/.venv-py3/bin/pip install --no-cache-dir --no-build-isolation --editable .

COPY bashrc /home/aiida/.bashrc
COPY bash_profile /home/aiida/.bash_profile

# Important to end as user root!
USER root
RUN chown aiida:aiida /home/aiida/.bashrc
RUN chown aiida:aiida /home/aiida/.bash_profile