#!/bin/bash -e

set -x

VERSION="$(grep 'aiidateam/aiida-docker-base' Dockerfile | cut -d':' -f2)"

docker push aiidateam/aiida-docker-stack:${VERSION}

#EOF
