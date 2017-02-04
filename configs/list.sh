#!/bin/bash

duplicity collection-status  \
    --verbosity notice \
    --volsize=$VOLSIZE \
    --log-file "$HOME/notice.log" \
    file:///media/backups/$(hostname)
