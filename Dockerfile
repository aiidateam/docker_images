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
RUN apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get -y install \
    mlocate \
    git \
    openssh-client \
    postgresql-10 \
    postgresql-server-dev-10 \
    python2.7 \
    && apt-get -y install \
    python-pip \
    ipython \
    python2.7-dev \
    && rm -rf /var/lib/apt/lists/* \
    && apt-get clean all \
    && updatedb

# update pip and setuptools, required for AiiDA
RUN pip install -U pip setuptools

# add USER (no password)
RUN useradd -m -s /bin/bash aiida

##########################################
############ Installation Setup ##########
##########################################

# install rest of the packages as normal user
USER aiida

# set $HOME, create directory
ENV HOME /home/aiida
RUN mkdir -p $HOME

WORKDIR /home/aiida
# make ssh dir and create host entry for bitbucket.org
RUN mkdir $HOME/.ssh/ && \
    touch $HOME/.ssh/known_hosts

# verdi auto-complete to bashrc - currently disabled
#RUN echo 'eval "$(verdi completioncommand)"' >> $HOME/.bashrc 

# Add the bin folder to the path (e.g. for verdi) so that
# it works also from non-login shells
RUN echo 'export PATH=~/.local/bin:$PATH' >> $HOME/.bashrc

# Install AiiDA
RUN pip install --upgrade pip setuptools --user
RUN pip install numpy==1.15.4 --user
RUN pip install pymatgen==2018.12.12 --no-binary pymatgen --user
RUN pip install aiida-core['rest','atomic_tools']==0.12.4 --user --no-build-isolation

# Important to end as user root!
USER root
