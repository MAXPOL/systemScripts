#!/bin/bash

user="$(whoami)"

date="$(date)"

curl -s -X POST https://api.telegram.org/bot<YOU_KEY>/sendMessage -d chat_id=<YOU_CHAT_ID> -d text="Access to the web server <YOU_SERVICE_NAME> via user: $user in $date ."

exit
