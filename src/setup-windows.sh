#!/usr/bin/env bash

if [ ! -d ".source" ]
then
  mkdir .source
fi

if [ ! -d ".source/fivem-nox-public" ]
then
    cd .source || exit 1
    git clone git@github.com:NoX-Scripts-and-Things/fivem-nox-public.git
    cd .. || exit 1
fi

./.source/fivem-nox-public/src/lib/env/prepare-python-env.sh