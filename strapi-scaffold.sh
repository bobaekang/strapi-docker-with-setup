#!/bin/sh

## define post type
TYPE_POST="post"
TYPE_POST+=" name:string description:text"

## define comment type
TYPE_COMMENT="comment"
TYPE_COMMENT+=" user:string body:text"

## generate api for content types
echo -e "\xe2\x8f\xb3 Scaffolding content types..."

eval "strapi generate:api $TYPE_POST"
eval "strapi generate:api $TYPE_COMMENT"

echo -e "\033[0;32m\xe2\x9c\x94 \033[0mScaffold content types."
echo -e "\xe2\x9d\x97 Make sure to manually add relevant media and relations fields!"