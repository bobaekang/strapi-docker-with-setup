#!/bin/sh
set -ea

_stopStrapi() {
  echo "Stopping strapi"
  kill -SIGINT "$strapiPID"
  wait "$strapiPID"
}

trap _stopStrapi SIGTERM SIGINT

cd /usr/src/api

APP_NAME=${APP_NAME:-strapi-app}

if [ ! -f "$APP_NAME/package.json" ]
then
    strapi new $APP_NAME --dbclient=sqlite &
    wait "$!"
    
    cp -f index.html $APP_NAME/public
elif [ ! -d "$APP_NAME/node_modules" ]
then
    npm install --prefix ./$APP_NAME
fi

cd $APP_NAME

strapi start &
strapiPID=$!

wait "$strapiPID"