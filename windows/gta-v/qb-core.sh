mkdir -p .source
git init
git clone git@github.com:NoX-Scripts-and-Things/fivem-nox-public.git .source/fivem-nox-public
cd ./.source/fivem-nox-public || exit 1
./src/prepare-env.sh
GIT_PYTHON_GIT_EXECUTABLE="/mingw64/bin/git" python init.py "qb-core"
cd .source/fivem-nox-server || exit 1
./../fivem-nox-public/src/prepare-env.sh




# import_source "fivem-nox-server"

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