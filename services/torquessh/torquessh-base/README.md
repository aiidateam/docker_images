# Image for running simulations

This image has a basic environment with possibility to access
via ssh to the user 'app', and a torque scheduler enabled.

# How to start

You can run the image with the script `./start_container.sh`.

Some notes (already present in the `start_container.sh` script):

- you need to run the container with the `--privileged` option,
  because the `mom` component of torque needs to lock the memory

- if you bind port 80 to the container to a port on the host, you
  can then ssh to the container with username `app`. To be able
  to ssh without password, run the container passing the environment
  variable `AUTHORIZED_KEY`, whose value should be the public SSH key
  you want to be able to connect with. When starting, this key
  will be added to the `~/.ssh/authorized_keys` file of the 'app' 
  user in the container (but _only_ if the file is empty). If the 
  file is not empty, nothing will be added (but you can always connect
  to the container with `docker exec -it DOCKER_CONTAINER_ID bash`, 
  then, change the `/home/app/.ssh/authorized_keys` file.

# What does the container contains

Beside the typical basic ubuntu system, and a SSH server, it contains:

- the torque scheduler (you can e.g. submit with the `qsub` command),
  see the files in the folder submission_test for some examples

# Dockerfile repository

`https://github.com/aiidateam/aiida_docker_images`, folder `services/torquessh`.
