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
#collection-status
# list-current-files
duplicity collection-status  \
    --verbosity notice \
    --volsize=$VOLSIZE \
    --log-file "$HOME/notice.log" \
    file:///media/backups/$(hostname)
#unset PASSPHRASE
#--encrypt-key="$GPG_KEY" \
#--sign-key="$GPG_KEY" \
