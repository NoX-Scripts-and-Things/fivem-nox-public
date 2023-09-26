#!/usr/bin/env bash

if [ -e .source/.framework ]; then
  echo "[INFO] Loading framework from '.source/.framework' ..."
  source .source/.framework

elif [ -n "$1" ]; then
  echo "[INFO] Received framework argument, setting FRAMEWORK=$1"
  FRAMEWORK=$1

  if [ -n "$FRAMEWORK" ]; then
    echo "[INFO] Writing framework to cache '.source/.framework'"
    echo "FRAMEWORK=\"$FRAMEWORK\"" > .source/.framework
  fi
fi

if [ -z "$FRAMEWORK" ]; then
  echo "[ERROR] Unable to determine framework!"
  exit 1
fi

git init

curl -sSL https://raw.githubusercontent.com/NoX-Scripts-and-Things/fivem-nox-public/master/scripts/fivem-structure.sh | bash

curl -sSL https://raw.githubusercontent.com/NoX-Scripts-and-Things/fivem-nox-public/master/scripts/fivem-nox-public.sh | bash

curl -sSL https://raw.githubusercontent.com/NoX-Scripts-and-Things/fivem-nox-public/master/scripts/fivem-nox-testing-suite.sh | bash

curl -sSL https://raw.githubusercontent.com/NoX-Scripts-and-Things/fivem-nox-public/master/scripts/fivem-nox-core.sh | bash

curl -sSL https://raw.githubusercontent.com/NoX-Scripts-and-Things/fivem-nox-public/master/scripts/fivem-nox-server.sh | bash

curl -o refresh-source.sh https://raw.githubusercontent.com/NoX-Scripts-and-Things/fivem-nox-public/master/scripts/refresh-sources.sh

curl -sSL https://raw.githubusercontent.com/NoX-Scripts-and-Things/fivem-nox-public/master/templates/write-template.sh | bash -s -- "$FRAMEWORK"
