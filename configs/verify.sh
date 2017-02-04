#!/bin/bash

VERFOLDER=$1
duplicity verify \
    --verbosity notice \
    --volsize=$VOLSIZE \
    --log-file "$HOME/notice.log" \
    file:///media/backups/$(hostname) \
    /hostdisk$VERFOLDER
