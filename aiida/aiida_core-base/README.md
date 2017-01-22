# AiiDA (aiida_core) base image

This image just installs the aiida_core code (and its dependencies)
in a `aiida` account, located in `/home/aiida/code/aiida_core`, and
sets up `PATH` (in ~/.bashrc) to point to verdi.

Note: it does not set up AiiDA (it requires a database, etc.). For this,
look at extensions of this package, or at the docker-compose files.

# Dockerfile repository

`https://github.com/aiidateam/aiida_docker_images`, folder `aiida/aiida_core-base`.
