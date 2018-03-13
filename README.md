# AiiDA (aiida_core) base docker image

This repository contains the Dockerfile for a basic installation of the [AiiDA](www.aiida.net) python framework.

The docker image contains
 * minimal Ubuntu base image (phusion/baseimage)
 * user `aiida`
 * [aiida-core](https://github.com/aiidateam/aiida_core) source in `/home/aiida/code/aiida_core`
 * aiida-core and its dependencies pip-installed
 * `PATH` (in ~/.bashrc) points to verdi

Note: It does **not** set up AiiDA (it requires a database, etc.). For this,
look at extensions of this package or at the docker-compose files
(e.g. in the [aiida_docker_compose repository](https://github.com/aiidateam/aiida_docker_compose)).

# Dockerhub repository

The corresponding docker image is built automatically on Dockerhub:

https://hub.docker.com/r/aiidateam/aiida_core_base/
