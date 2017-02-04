#!/bin/bash

#export PASSPHRASE
#export GNUPGHOME="/home/porky/.gnupg"
#HOME="/opt/backup/mega"
#export HOME=$HOME
# Load our credentials
#source "$HOME/.credentials.conf"
#export PASSPHRASE
#export VOLSIZE
#GPG_KEY='6FBCFBDC'

duplicity \
    --verbosity notice \
    --full-if-older-than $OLDERTHAN \
    --asynchronous-upload \
    --volsize=$VOLSIZE \
    --log-file "$HOME/notice.log" \
    --include-filelist=$HOME/configs/include.txt \
    --exclude '**' \
    /hostdisk \
    file:///media/backups/$(hostname) -v info

#unset PASSPHRASE
# sudo docker exec -it megafuse bash /root/backup.sh
#    --encrypt-key="$GPG_KEY" \
#    --sign-key="$GPG_KEY" \
