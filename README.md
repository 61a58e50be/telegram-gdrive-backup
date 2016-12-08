# telegram-gdrive-backup
Backs up your linux `/home` folder as a password protected zip file using Google Drive and receiving the randomly generated password via telegram using the Bot API.

**Although this script backs up `/home`, you have to keep in mind that the communication between the telegram bot and the user/channel is not secure since telegram bots do not support encrypted chats yet. I would recommend to not use this script for backing up sensitive or important data.**

##Requirements
* [gdrive - Google Drive CLI Client](https://github.com/prasmussen/gdrive)
* [Telegram Bot Key](https://core.telegram.org/bots/api)
* [Telegram User ID](https://core.telegram.org/bots/api)

##Setting up Telegram
Register a [Telegram Bot](https://core.telegram.org/bots/api) via [@botfather](https://telegram.me/botfather) to obtain the API Key.

Send a message to your bot and get the update with:
[https://api.telegram.org/bot<BOTID>/sendMessage?chat_id="yourchatid"&text="Hello World!"](https://api.telegram.org/bot<BOTID>/sendMessage?chat_id="yourchatid"&text="Hello World!")

`chat_id` is equal to `USERID`.
`KEY` is equal to the bot api key.

##Setting up gdrive
You can install gdrive using the [github repository](https://github.com/prasmussen/gdrive) or, if you're using Arch linux, via `yaourt gdrive`.

##Scheduling backups
You can use a cronjob or systemd/Timers to schedule backups.

**Cronjob example (run backup every day at 00:00):**

`0    0    * * *   /path/to/telegram-gdrive-backup/backup.sh`
`
