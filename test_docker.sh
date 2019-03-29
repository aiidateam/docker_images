#!/bin/bash
docker exec -e AIIDA_DOCKER_VENV=aiida1.0-py2 -u aiida testing bash -lc 'verdi --version'
docker exec -e AIIDA_DOCKER_VENV=aiida1.0-py3 -u aiida testing bash -lc 'verdi --version'

docker exec -e AIIDA_DOCKER_VENV=aiida1.0-py2 -u aiida testing bash -lc 'python --version'
docker exec -e AIIDA_DOCKER_VENV=aiida1.0-py3 -u aiida testing bash -lc 'python  --version'

# This does not work
docker exec -e AIIDA_DOCKER_VENV=aiida1.0-py2 -u aiida testing bash -c 'verdi --version'
docker exec -e AIIDA_DOCKER_VENV=aiida1.0-py3 -u aiida testing bash -c 'verdi --version'

docker exec testing bash -c 'verdi --version'
docker exec testing bash -c 'python --version'
