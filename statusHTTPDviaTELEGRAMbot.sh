#!/bin/bash


status="$(systemctl status httpd | grep dead | wc -l)"

for (( i=0;i<10;i++ ))
do

if [[ $i = 10  ]]
then
curl -s -X POST https://api.telegram.org/bot<YOU_KEY>/sendMessage -d chat_id=<YOU_CHAT_ID> -d text="WEB service <NAME_YOU_SERVICE> DEAD. FATAL ERROR !!! FATAL ERROR !!! FATAL ERROR !!!"
break
fi

if [[ $status != 0 ]]
then
echo "HTTPD DEAD"
curl -s -X POST https://api.telegram.org/bot<YOU_KEY>/sendMessage -d chat_id=<YOU_CHAT_ID> -d text="WEB service <NAME_YOU_SERVICE> DEAD. Now i restore workship. Wait..."
systemctl start httpd
sleep 5
status="$(systemctl status httpd | grep dead | wc -l)"
continue
fi

if [[ $status = 0 && $i != 0  ]]
then
curl -s -X POST https://api.telegram.org/bot<YOU_KEY>/sendMessage -d chat_id=<YOU_CHAT_ID> -d text="ALL OK <YOU_SERVICE_NAME> RUN"
break
fi


if [[ $status = 0 && $i = 0  ]]
then
echo 'HTTPD RUN' >> /dev/null
break
fi

done
