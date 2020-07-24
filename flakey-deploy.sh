#!/bin/sh

ENGINE="$1"

echo "I am thinking that DB_ENGINE=${ENGINE}"
echo "Is that what you are thinking?"

curl https://wttr.in
