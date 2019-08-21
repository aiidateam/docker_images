# AiiDA docker stack

This repository is based on [AiiDA docker base](https://github.com/aiidateam/aiida-docker-base/) image, but adds
[PostgreSQL](https://www.postgresql.org/) and [RabbitMQ](https://www.rabbitmq.com/) servers on top. Additionally, it performs
initial AiiDA configuration allowing to have a ready-to-use AiiDA environment.

## Updating the image
In order to update the AiiDA version you should update the version of the base image. Go to the Docker file and simply replace the following line:
```
FROM aiidateam/aiida-docker-base:vX.Y.Z

```
You should adapt X.Y.Z numbers to the latest version of the [aiida-docker-base](https://hub.docker.com/r/aiidateam/aiida-docker-base) image.
Once this is done, run the following commands:

```
./build.sh # to build the new aiida-docker-stack image locally and tag it as 'latest'
./tag.sh # to specify the AiiDA version number as the image's tag
./push.sh # to push the image tagged with the version number to the Docker Hub
./push_latest.sh # to push the image tagged with 'latest' to the Docker Hub
```

The docker image contains:
 * Minimal AiiDA base image (aiidateam/aiida-docker-base)
 * [PostgreSQL](https://www.postgresql.org/)
 * [RabbitMQ](https://www.rabbitmq.com/)
 * Configured AiiDA environment for the `aiida` user

# Docker Hub repository

The corresponding docker image is built automatically on Docker Hub:

https://hub.docker.com/r/aiidateam/aiida-docker-stack


# Acknowledgements

This work is supported by the [MARVEL National Centre for Competency in Research](<http://nccr-marvel.ch>)
funded by the [Swiss National Science Foundation](<http://www.snf.ch/en>), as well as by the [MaX
European Centre of Excellence](<http://www.max-centre.eu/>) funded by the Horizon 2020 EINFRA-5 program,
Grant No. 676598.

![MARVEL](miscellaneous/logos/MARVEL.png)
![MaX](miscellaneous/logos/MaX.png)
