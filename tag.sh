#!/bin/bash -e

set -x

VERSION="$(grep 'aiidateam/aiida-docker-base' Dockerfile | cut -d':' -f2)"

docker tag aiidateam/aiida-docker-stack:latest aiidateam/aiida-docker-stack:${VERSION}

#EOF
