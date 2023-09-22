#!/usr/bin/env bash

# TODO: Split all functions out in separate files cleaning up things

if [ ! -f fxmanifest.lua ]; then
    echo "FX Manifest does not exist!"
    echo "Creating one ..."

    cat <<EOT >> fxmanifest.lua
fx_version 'cerulean'
game 'gta5'

author 'NoX Script and Things'
description 'Oh my word, another mod from NoX, Amazing ;)'

shared_scripts {
	"config.lua"
}

client_scripts {
	"client/*.lua"
}

server_scripts {
	"server/*.lua"
}

dependencies {
    -- 'qb-core', -- Uncomment this line if you use qb-core to make sure it is loaded before this script executes
    -- 'esx', -- Uncomment this line if you use esx to make sure it is loaded before this script executes
    -- 'oxmysql', -- Uncomment this if you use oxmysql, or changing it to your mysql wrapper
    'nox-core'
}

lua54 'yes'
EOT

  if [ ! -d client ]; then
    mkdir -p client;
    cat <<EOT >> client/hello-world.lua
-- Hello World Client
print("Client Script")
EOT
  fi

  if [ ! -d server ]; then
    mkdir -p server;
    cat <<EOT >> server/hello-world.lua
-- Hello World Server
print("Server Script")
EOT
  fi

  if [ ! -f config.lua ]; then
    cat <<EOT >> config.lua
TEST = {}
EOT
  fi

  if [ ! -f .gitignore ]; then
    cat <<EOT >> .gitignore
.idea
.source
EOT
  fi

  if [ ! -f custom.server.settings.json ]; then
    cat <<EOT >> custom.server.settings.json
{
  "server": {
    "ensure": {
      "normal": [
      ],
      "priority": [
      ]
    }
  }
}
EOT
  fi
fi

curl -o refresh-source.sh https://raw.githubusercontent.com/NoX-Scripts-and-Things/fivem-nox-public/master/scripts/setup-project-scaffolding.sh
