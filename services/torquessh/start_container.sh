#/bin/bash

imagename=torquessh

echo "I will start (run) a new container from image $imagename - press CTRL+C to stop, enter to continue"
read

if [ "$1" == "" ]
then
    echo "Pass as parameter the path to the file containing the public SSH key to inject."
    exit 1
fi

if [ ! -e "$1" ]
then
    echo "File '$1' does not exist"
    exit 1
fi

THEKEY=`cat "$1"`
pieces_count=`echo "$THEKEY" | awk '{print NF;}'`
if [ "$pieces_count" != "3" ]
then
    echo "Malformed public key..."
    exit 2
fi

docker run -P --privileged -e AUTHORIZED_KEY="$THEKEY" $imagename

