#!/bin/sh
generate_api() {
    if [ ! -d "api/$NAME" ]
    then
        eval "strapi generate:api $NAME $ATTRS"
    fi
}

## post type
NAME="post"
ATTRS="name:string description:text"
generate_api

## commnet type
NAME="comment"
ATTRS="username:string body:text"
generate_api