#!/bin/bash

# Make GPG explicitly aware of our private key,
# since we'll be running this via cron as root
#export GNUPGHOME="/home/alex/.gnupg"
#HOME="/mnt/sdb1/bitswarming/backup"
#export HOME=$HOME
# Load our credentials
#source "$HOME/.credentials.conf"
#export PASSPHRASE
#GPG_KEY='64EAABA9'
# date +%z need to add time fix
#    --file-to-restore opt/backup/testfolder/consul_0.6.4_linux_amd64.zip \
# if no --file restore all
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
#unset PASSPHRASE
#--encrypt-key="$GPG_KEY" \
#--sign-key="$GPG_KEY" \
