# AiiDA docker stack

This repository is based on [AiiDA docker base](https://github.com/aiidateam/aiida-docker-base/) image, but adds
[PostgreSQL](https://www.postgresql.org/) and [RabbitMQ](https://www.rabbitmq.com/) servers on top. Additionally, it creates an AiiDA profile in order to have a ready-to-use AiiDA environment.

## Updating the image
In order to update the AiiDA version, first update the [`aiida-docker-base`](https://hub.docker.com/r/aiidateam/aiida-docker-base) and then use the updated tag of the image in the `Dockerfile`:
```
FROM aiidateam/aiida-docker-base:vX.Y.Z

```
You need to adapt X.Y.Z numbers to the latest version of the [aiida-docker-base](https://hub.docker.com/r/aiidateam/aiida-docker-base) image.

## Docker image

The docker image contains:
 * Minimal AiiDA base image (aiidateam/aiida-docker-base)
 * [PostgreSQL](https://www.postgresql.org/)
 * [RabbitMQ](https://www.rabbitmq.com/)
 * Configured AiiDA environment for the `aiida` user

# Docker Hub repository

The docker image is built automatically on Docker Hub once new changes are pushed to the `master` or `develop` branches of this repository.
The `master` branch is available under the docker tag `latest`, while the `develop` branch is available under the docker tag `develop`.
In addition, any git tag pushed to the repository will trigger a build on Docker Hub with the same docker tag.

All the images are available following this link: https://hub.docker.com/r/aiidateam/aiida-docker-stack


# Acknowledgements

This work is supported by the [MARVEL National Centre for Competency in Research](<http://nccr-marvel.ch>)
funded by the [Swiss National Science Foundation](<http://www.snf.ch/en>), as well as by the [MaX
European Centre of Excellence](<http://www.max-centre.eu/>) funded by the Horizon 2020 EINFRA-5 program,
Grant No. 676598.

![MARVEL](miscellaneous/logos/MARVEL.png)
![MaX](miscellaneous/logos/MaX.png)
