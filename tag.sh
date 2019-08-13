#!/bin/bash -e

set -x

VERSION="$(grep 'yakutovich/aiida-base' Dockerfile | cut -d':' -f2)"

docker tag yakutovich/aiida-complete:latest yakutovich/aiida-complete:${VERSION}

#EOF
