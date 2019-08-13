# AiiDA (aiida_core) base docker image

This repository contains the Dockerfile for a basic installation of the [AiiDA](www.aiida.net) python framework.

## Updating the image
In order to update the AiiDA version, go to Docker file and change the following line:
```
FROM yakutovich/aiida-base:vX.Y.Z

```
You should adapt X.Y.Z numbers to the latest version of aiida-base docker container.
Once this is done, run the following commands:

```
./build.sh # to build the new aiida-complete docker container locally
./tag.sh # to specify the AiiDA version number as the image's tag
./push.sh # to push the image tagged with the version number to the Docker Hub
./push_latest.sh # to push the image tagged with 'latest' to the Docker Hub
```

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
