#!/usr/bin/env bash

source .env

git init

curl -sSL https://raw.githubusercontent.com/NoX-Scripts-and-Things/fivem-nox-public/master/scripts/fivem-structure.sh | bash

curl -sSL https://raw.githubusercontent.com/NoX-Scripts-and-Things/fivem-nox-public/master/scripts/fivem-nox-public.sh | bash

curl -sSL https://raw.githubusercontent.com/NoX-Scripts-and-Things/fivem-nox-public/master/scripts/fivem-nox-testing-suite.sh | bash

curl -sSL https://raw.githubusercontent.com/NoX-Scripts-and-Things/fivem-nox-public/master/scripts/fivem-nox-core.sh | bash

curl -sSL https://raw.githubusercontent.com/NoX-Scripts-and-Things/fivem-nox-public/master/scripts/fivem-nox-server.sh | bash

curl -o refresh-source.sh https://raw.githubusercontent.com/NoX-Scripts-and-Things/fivem-nox-public/master/scripts/refresh-sources.sh

if [ "$FRAMEWORK" == "qb-core" ]
then
  curl -sSL https://raw.githubusercontent.com/NoX-Scripts-and-Things/fivem-nox-public/master/templates/qb-core/write-template.sh | bash
fi

if [ "$FRAMEWORK" == "esx" ]
then
  curl -sSL https://raw.githubusercontent.com/NoX-Scripts-and-Things/fivem-nox-public/master/templates/esx/write-template.sh | bash
fi