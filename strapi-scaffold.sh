#!/bin/sh
TRY=20

APP_NAME=${1:-"strapi-app"}
cd $APP_NAME

while true
do
    STATUS=$(curl -s -o /dev/null -w '%{http_code}' localhost:1337)
    
    if [ "$STATUS" -eq 200 ]
    then
        echo -e "\033[0;32m\xe2\x9c\x94 \033[0mStrapi running."
        
        # install plugin
        strapi install graphql &
        wait "$!"
        
        # generate api
        sh ../strapi-generate.sh &
        wait "$!"
        echo -e "\xe2\x9d\x97 Make sure to manually add media and relations fields!"
        
        break
    elif [ "$TRY" -eq 0 ]
    then
        echo -e "\xe2\x9d\x97 Timeout."
        break
    fi
    
    TRY=$(($TRY-1))
    sleep 3
done