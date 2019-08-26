#!/bin/bash

PGBIN=/usr/lib/postgresql/10/bin

# -w waits until server is up
PSQL_START_CMD="${PGBIN}/pg_ctl --timeout=180 -w -D /home/aiida/.postgresql -l /home/aiida/.postgresql/logfile start"
PSQL_STOP_CMD="${PGBIN}/pg_ctl -w -D /home/aiida/.postgresql stop"
PSQL_STATUS_CMD="${PGBIN}/pg_ctl -D /home/aiida/.postgresql status"

# make DB directory, if not existent
if [ ! -d /home/aiida/.postgresql ]; then
   mkdir /home/aiida/.postgresql
   ${PGBIN}/initdb -D /home/aiida/.postgresql
   echo "unix_socket_directories = '/home/aiida/.postgresql'" >> /home/aiida/.postgresql/postgresql.conf
   ${PSQL_START_CMD}
   psql -h localhost -d template1 -c "CREATE USER aiida WITH PASSWORD 'aiida_db_passwd';"
   psql -h localhost -d template1 -c "CREATE DATABASE aiidadb OWNER aiida;"
   psql -h localhost -d template1 -c "GRANT ALL PRIVILEGES ON DATABASE aiidadb to aiida;"

# else don't
else

    # stores return value in $?
    running=true
    ${PSQL_STATUS_CMD} || running=false

    # Postgresql was probably not shutdown properly. Cleaning up the mess...
    if ! $running ; then
       echo "" > /home/aiida/.postgresql/logfile # empty log files
       rm -vf /home/aiida/.postgresql/.s.PGSQL.5432
       rm -vf /home/aiida/.postgresql/.s.PGSQL.5432.lock
       rm -vf /home/aiida/.postgresql/postmaster.pid
       ${PSQL_START_CMD}
   fi
fi
