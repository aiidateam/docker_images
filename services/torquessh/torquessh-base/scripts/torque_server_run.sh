#!/bin/bash

# Exit if any command fails
set -e

# VARIABLES
PATH=/usr/sbin:/usr/bin:/sbin:/bin
DAEMON=/usr/sbin/pbs_server

# Include torque defaults if available
if [ -f /etc/default/torque-server ]; then
        . /etc/default/torque-server
elif [ -f /etc/default/torque ]; then
        . /etc/default/torque
fi

exec "$DAEMON" -D 

