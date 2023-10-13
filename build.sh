if [[ "$1" != "qb-core" && "$1" != "esx" ]]; then
  echo "[ERROR] Unknown framework '$1', please use either qb-core or esx"
  exit 1
fi

mkdir -p .source
git clone git@github.com:NoX-Scripts-and-Things/fivem-nox-public.git .source/fivem-nox-public
./.source/fivem-nox-public/src/prepare-env.sh ".source/fivem-nox-public/requirements.txt"

python .source/fivem-nox-public/init.py "$1"





# curl -sSL https://raw.githubusercontent.com/NoX-Scripts-and-Things/fivem-nox-public/master/src/prepare-python-env.sh | bash -s "$1"

# python lib/framework.py "$1"

# Determine framework
#  curl -sSL https://raw.githubusercontent.com/NoX-Scripts-and-Things/fivem-nox-public/master/importers/framework.sh | bash -s "qb-core"

#  # Import the source importer
#  curl -sSL -o .temp.source.importer.sh https://raw.githubusercontent.com/NoX-Scripts-and-Things/fivem-nox-public/master/importers/source.sh
#  source .temp.source.importer.sh
#  rm .temp.source.importer.sh

#  import_source "fivem-nox-core"

#  # Function internal to the nox core to refresh and pull the latest rouces inside the core
#  cd .source/fivem-nox-core || exit 1
#  ./refresh-source.sh
#  cd ../..


# import_source "fivem-nox-public"
# import_source "fivem-nox-server"


#   # Setup a basic environment for the server to work on
#   # Expects python3 to be installed
#   cd .source/fivem-nox-server || exit 1
#   ./setup-env.sh "copy-server-files"
#   cd ../..

# import_source "fivem-nox-testing-suite"


#  # Create the source directory if it does not exist, this will contain all the boilerplate for the project but no directly
#  # required when used on your fivem server
#  if [ ! -d ".source" ]; then
#    mkdir -p ".source"
#  fi



#  git init
#
#  curl -sSL https://raw.githubusercontent.com/NoX-Scripts-and-Things/fivem-nox-public/master/scripts/fivem-structure.sh | bash
#
#  curl -sSL https://raw.githubusercontent.com/NoX-Scripts-and-Things/fivem-nox-public/master/scripts/fivem-nox-public.sh | bash
#
#  curl -sSL https://raw.githubusercontent.com/NoX-Scripts-and-Things/fivem-nox-public/master/scripts/fivem-nox-testing-suite.sh | bash
#
#  curl -sSL https://raw.githubusercontent.com/NoX-Scripts-and-Things/fivem-nox-public/master/scripts/fivem-nox-core.sh | bash
#
#  curl -sSL https://raw.githubusercontent.com/NoX-Scripts-and-Things/fivem-nox-public/master/scripts/fivem-nox-server.sh | bash
#
#  curl -o refresh-source.sh https://raw.githubusercontent.com/NoX-Scripts-and-Things/fivem-nox-public/master/scripts/refresh-sources.sh
#
#  curl -sSL https://raw.githubusercontent.com/NoX-Scripts-and-Things/fivem-nox-public/master/templates/write-template.sh | bash -s -- "$FRAMEWORK"
#