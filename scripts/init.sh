#!/usr/bin/env bash

FRAMEWORK="$1"

git init

curl -sSL https://raw.githubusercontent.com/NoX-Scripts-and-Things/fivem-nox-public/master/scripts/fivem-structure.sh | bash

curl -sSL https://raw.githubusercontent.com/NoX-Scripts-and-Things/fivem-nox-public/master/scripts/fivem-nox-public.sh | bash

curl -sSL https://raw.githubusercontent.com/NoX-Scripts-and-Things/fivem-nox-public/master/scripts/fivem-nox-testing-suite.sh | bash

curl -sSL https://raw.githubusercontent.com/NoX-Scripts-and-Things/fivem-nox-public/master/scripts/fivem-nox-core.sh | bash

curl -sSL https://raw.githubusercontent.com/NoX-Scripts-and-Things/fivem-nox-public/master/scripts/fivem-nox-server.sh | bash

curl -o refresh-source.sh https://raw.githubusercontent.com/NoX-Scripts-and-Things/fivem-nox-public/master/scripts/init.sh

if [ "$FRAMEWORK" == "qb-core" ]
then
  curl -sSL https://raw.githubusercontent.com/NoX-Scripts-and-Things/fivem-nox-public/master/templates/qb-core/write-template.sh | bash

  sed -i '/FRAMEWORK=/d' refresh-source.sh
  sed -i "2a\\FRAMEWORK=\"qb-core\"" refresh-source.sh

  sed -i '/FRAMEWORK=/d' start-server.sh
  sed -i "2a\\FRAMEWORK=\"qb-core\"" start-server.sh
fi

if [ "$FRAMEWORK" == "esx" ]
then
  curl -sSL https://raw.githubusercontent.com/NoX-Scripts-and-Things/fivem-nox-public/master/templates/esx/write-template.sh | bash

  sed -i '/FRAMEWORK=/d' refresh-source.sh
  sed -i "2a\\FRAMEWORK=\"esx\"" refresh-source.sh

  sed -i '/FRAMEWORK=/d' start-server.sh
  sed -i "2a\\FRAMEWORK=\"esx\"" start-server.sh
fi