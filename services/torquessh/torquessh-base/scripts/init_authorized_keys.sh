#!/bin/bash
### First initialization of the container
### This adds the ssh public key passed as parameter 
### to the authorized_keys file of the 'app' user

if [ "$AUTHORIZED_KEY" == "" ]
then
    echo "No key provided to inject..."
    echo "You will not be able to ssh into user 'app' until when you don't"
    echo "setup the authorized_keys (via docker exec)"

else
    file_size=`wc -c /home/app/.ssh/authorized_keys | cut -f 1 -d\ `
    # I put three to consider for a potentially empty file, with just
    # a newline
    if [ "$file_size" -lt 3 ]
    then
	echo "$AUTHORIZED_KEY" >> /home/app/.ssh/authorized_keys
        echo "You should now be able to ssh into user 'app' with the provided key"
    else
        echo "authorized_keys file not empty: I do NOT inject the key"
   fi
fi

