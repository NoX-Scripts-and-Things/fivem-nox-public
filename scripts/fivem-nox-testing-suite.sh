#!/usr/bin/env bash

# Pull the fivem testing suite if it does not exist, this library is usually required by all scripts
if [ ! -d ".source/fivem-nox-testing-suite" ]
then
    echo "Nox core does not exist, pulling repository"
    cd .source || exit 1
    git clone git@github.com:NoX-Scripts-and-Things/fivem-nox-testing-suite.git
    cd .. || exit 1
else
  cd .source/fivem-nox-testing-suite || exit 1
  git reset --hard
  git pull origin master
  cd ../.. || exit 1
fi
