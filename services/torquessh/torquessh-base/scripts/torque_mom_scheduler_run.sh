#!/bin/bash

# Exit if any command fails
set -e

# VARIABLES
PATH=/usr/sbin:/usr/bin:/sbin:/bin
DAEMON=/usr/sbin/pbs_mom

# Include torque defaults if available
if [ -f /etc/default/torque-mom ]; then
        . /etc/default/torque-mom
elif [ -f /etc/default/torque ]; then
        . /etc/default/torque
fi

# This is always daemonized, so I run it here
/usr/sbin/pbs_sched

## ulimit -l unlimited is needed for mom, otherwise it crashes at startup
## as it tries to lock the memory
## NOTE! This requires to run the container with the --privileged option
ulimit -l unlimited || ( echo "You must run the container with the --privileged option" ; exit 1 )
ulimit -s unlimited

exec "$DAEMON" -D 

