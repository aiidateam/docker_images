#!/bin/bash -e

set -x

VERSION="$(grep 'yakutovich/aiida-base' Dockerfile | cut -d':' -f2)"

docker push yakutovich/aiida-complete:${VERSION}

#EOF
