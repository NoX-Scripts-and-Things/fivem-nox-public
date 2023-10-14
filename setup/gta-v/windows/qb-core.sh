# shellcheck disable=SC1090
source <(curl -s https://raw.githubusercontent.com/NoX-Scripts-and-Things/fivem-nox-public/master/src/scripts/prepare-scripts.sh)
# shellcheck disable=SC1090
source <(curl -s https://raw.githubusercontent.com/NoX-Scripts-and-Things/fivem-nox-public/master/src/scripts/prepare-env.sh)

git init

prepare_scripts

(
  cd ./.source/fivem-nox-public || exit 1
  activate_python
  GIT_PYTHON_GIT_EXECUTABLE="$(which git)" python ./src/init-base.py "qb-core"
)

(
  cd ./.source/fivem-nox-server || exit 1
  activate_python
  ./.source/fivem-nox-server/src/build-server.sh
)

(
  cd ./.source/fivem-nox-testing-suite || exit 1
  activate_python
)

(
  cd ./.source/fivem-nox-core || exit 1
  activate_python
)


# if [ "$1" == "copy-server-files" ]; then
#   /usr/bin/cp start-server.sh ../../start-server.sh
#   /usr/bin/cp build-server.sh ../../build-server.sh
# fi
