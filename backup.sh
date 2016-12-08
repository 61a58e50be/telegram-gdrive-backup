#!/bin/bash
#Purpose = /home backup script with sync to gdrive
#Created on 12-08-2016
#Author = @wolki
#Version 0.1

#Config Backup
TIMESTAMP=`date +%d-%b-%Y-%H-%M`
BACKUPNAME=$HOSTNAME-$TIMESTAMP.zip #Backup Fileformat
CREDS=`openssl rand -base64 64` 
LOCATION=/home/$USER/ #Location which should be backuped

#Config Telegram
USERID="" #Telegram Channel or Contact ID
KEY="" #Botkey
URL="https://api.telegram.org/bot$KEY/sendMessage"
IPADDR=$(curl ipecho.net/plain ; echo)
TEXT="$HOSTNAME (Public: $IPADDR) backuped $LOCATION to Google Drive.

$CREDS to decrypt $BACKUPNAME." #Telegram Message Text

#Backing Up Process
zip -r $BACKUPNAME $LOCATION -P $CREDS #Create the backup as a password protected .zip file
gdrive upload $BACKUPNAME #upload backup to google drive
rm $BACKUPNAME #remove local file when upload has finished
curl -s -d "chat_id=$USERID&disable_web_page_preview=1&text=$TEXT" $URL > /dev/null #send message via telegram
