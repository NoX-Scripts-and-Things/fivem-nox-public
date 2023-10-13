#!/usr/bin/env bash

if [ -n "$1" ]
then
  FRAMEWORK=$1
else
  source .env
fi

if [ -z "$FRAMEWORK" ]
then
  echo "Framework not set!"
  exit 1
fi

echo "Create Template"

if [ ! -f fxmanifest.lua ]; then
    echo "FX Manifest does not exist!"
    echo "Creating one ..."
    /usr/bin/cp -a -r "$(pwd)"/.source/fivem-nox-public/templates/"$FRAMEWORK"/* .
    /usr/bin/cp "$(pwd)"/.source/fivem-nox-public/templates/"$FRAMEWORK"/.gitignore .gitignore
    /usr/bin/cp "$(pwd)"/.source/fivem-nox-public/templates/.env .env
fi
