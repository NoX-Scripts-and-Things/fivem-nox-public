#!/usr/bin/env bash

echo "Create Template"

if [ ! -f fxmanifest.lua ]; then
    echo "FX Manifest does not exist!"
    echo "Creating one ..."
    /usr/bin/cp -a -r "$(pwd)"/.source/fivem-nox-public/templates/esx/template/* .
    /usr/bin/cp "$(pwd)"/.source/fivem-nox-public/templates/esx/template/.gitignore .gitignore
    /usr/bin/cp "$(pwd)"/.source/fivem-nox-public/templates/esx/template/.env .env
fi
