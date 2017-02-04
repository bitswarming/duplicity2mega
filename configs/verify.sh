#!/bin/bash

# Make GPG explicitly aware of our private key,
# since we'll be running this via cron as root
#export GNUPGHOME="/home/porky/.gnupg"
#HOME="/opt/backup/mega"
#export HOME=$HOME
# Load our credentials
#source "$HOME/.credentials.conf"
#export PASSPHRASE
#GPG_KEY='6FBCFBDC'
VERFOLDER=$1
duplicity verify \
    --verbosity notice \
    --volsize=$VOLSIZE \
    --log-file "$HOME/notice.log" \
    file:///media/backups/$(hostname) \
    /hostdisk$VERFOLDER
#unset PASSPHRASE
#    --encrypt-key="$GPG_KEY" \
#    --sign-key="$GPG_KEY" \
