#!/bin/bash

MACHINEIP=$1

if [ "$MACHINEIP" == "" ]
then
    echo "Pass the machine IP (or hostname) as parameter"
    exit 1
fi

scp example-submit.sh app@$MACHINEIP:example-submit.sh && \
ssh app@$MACHINEIP "qsub example-submit.sh"

