#!/usr/bin/env bash

# Pull the latest fivem nox server, this will do all the work to create a fivem server with the correct settings to test the mod with
if [ ! -d ".source/fivem-nox-server" ]
then
    echo "Nox public code does not exist, pulling repository"
    cd .source || exit 1
    git clone git@github.com:NoX-Scripts-and-Things/fivem-nox-server.git
    cd .. || exit 1
else
  cd .source/fivem-nox-server || exit 1
  git pull origin master
  cd ../.. || exit 1
fi

# Setup the basic server env
cd .source/fivem-nox-server || exit 1
./setup-env.sh
cd ../..