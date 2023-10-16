#!/usr/bin/env bash

function prepare_scripts () {
  if [ ! -d ".source" ]
  then
    mkdir .source
  fi

  if [ ! -d ".source/fivem-nox-public" ]
  then
    git clone git@github.com:NoX-Scripts-and-Things/fivem-nox-public.git .source/fivem-nox-public
  fi
}
