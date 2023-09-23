#!/usr/bin/env bash

# Pull the fivem nox core if it does not exist, this library is usually required by all scripts
if [ ! -d ".source/fivem-nox-core" ]
then
    echo "Nox core does not exist, pulling repository"
    cd .source || exit 1
    git clone git@github.com:NoX-Scripts-and-Things/fivem-nox-core.git
    cd .. || exit 1
else
  cd .source/fivem-nox-core || exit 1
  git pull origin master
  cd ../.. || exit 1
fi

# Function internal to the nox core to refresh and pull the latest rouces inside the core
cd .source/fivem-nox-core || exit 1
./refresh-source.sh
cd ../..
