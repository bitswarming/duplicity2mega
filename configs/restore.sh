#!/bin/bash

DATE=$1
TIMEZONE=$(date +%z)
DATE=$(date -d"$DATE" +%Y-%m-%dT%H:%M:%S)
ADDON="--time $DATE "
if [ ! -z $2 ] 
then 
    ADDON="$ADDON --file-to-restore $2"
fi
echo $ADDON
duplicity \
    $ADDON \
    --verbosity notice \
    --asynchronous-upload \
    --volsize=$VOLSIZE \
    --log-file "$HOME/notice.log" \
    file:///media/backups/$(hostname) \
    /root/megarestored
