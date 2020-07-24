#!/bin/sh

ENGINE="$1"

echo "I am thinking that DB_ENGINE=${ENGINE}"
echo "Is that what you are thinking?"

# check ID of user
id

apk update
apk add --no-cache curl

# Install curl
#apk add curl

#curl https://wttr.in
