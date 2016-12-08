# telegram-gdrive-backup
Backing up your linux /home folder as a password protected zip file using google drive receiving the randomly generated password via telegram using the bot api.

**Although this script is backing up /home, you have to keep in mind that the communication between the telegram bot and the user/channel is unsecure since telegram bots do not support encrypted chats by default. I would recommend not to use this backup script with any sensitive or important data.**

##Requirements
* [gdrive - Google Drive CLI Client](https://github.com/prasmussen/gdrive)
* [Telegram BOT Key](https://core.telegram.org/bots/api)
* [Telegram User ID](https://core.telegram.org/bots/api)

##Setting up Telegram
Registring a [Telegram BOT](https://core.telegram.org/bots/api) via [@botfather](https://telegram.me/botfather) optaining the API Key.

Send a message to your bot then retrieve the update with:
[https://api.telegram.org/bot<BOTID>/sendMessage?chat_id="yourchatid"&text="Hello World!"](https://api.telegram.org/bot<BOTID>/sendMessage?chat_id="yourchatid"&text="Hello World!")

`chat_id` is equal to `USERID`.
`KEY` is equal to the bot api key.

##Setting up gdrive
You can install gdrive using the github repository linked above or if you're using arch linux via `yaourt gdrive".

##Scheduling backups
You can use a cronjob or systemd/Timers to schedule Backups.

**Cronjob example (run backup every day at 00:00):**

`0    0    * * *   /path/to/telegram-gdrive-backup/backup.sh`
`
