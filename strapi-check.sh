#!/bin/sh
TRY=40

while true
do    
    STATUS=$(curl -s -o /dev/null -w '%{http_code}' localhost:1337)
    
    if [ "$STATUS" -eq 200 ]
    then
        echo -e "\033[0;32m\xe2\x9c\x94 \033[0mStrapi running."
        sh strapi-scaffold.sh
        break
    elif [ "$TRY" -eq 0 ]
    then
        echo -e "\xe2\x9d\x97 Timeout."
        break
    fi
    
    TRY=$(($TRY-1))
    sleep 3
done