#!/usr/bin/env bash

echo "Create Template"

if [ ! -f fxmanifest.lua ]; then
    echo "FX Manifest does not exist!"
    echo "Creating one ..."
    /usr/bin/cp -a -r "$(pwd)"/.source/fivem-nox-public/templates/esx/template/* .
    /usr/bin/cp "$(pwd)"/.source/fivem-nox-public/templates/esx/template/.gitignore .gitignore
fi

# curl -o refresh-source.sh https://raw.githubusercontent.com/NoX-Scripts-and-Things/fivem-nox-public/master/scripts/setup-project-scaffolding.sh
