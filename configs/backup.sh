#!/bin/bash

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
