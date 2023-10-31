#!/usr/bin/env bash

INITIAL_SCRIPTS="$1"
ARG1="$2"
ARG2="$3"

# shellcheck disable=SC1090
source <(curl -s https://raw.githubusercontent.com/NoX-Scripts-and-Things/fivem-nox-public/master/scripts/common/prepare-scripts.sh)
# shellcheck disable=SC1090
source <(curl -s https://raw.githubusercontent.com/NoX-Scripts-and-Things/fivem-nox-public/master/scripts/common/prepare-env.sh)

git init

prepare_scripts


case $INITIAL_SCRIPTS in
  base)
    (
      cd ./.source/fivem-nox-public || exit 1
      activate_python
      GIT_PYTHON_GIT_EXECUTABLE="$(which git)" python ./src/init-base.py "$ARG1" "$ARG2"
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
    ;;

  test-framework)
    (
      cd ./.source/fivem-nox-public || exit 1
      activate_python
      GIT_PYTHON_GIT_EXECUTABLE="$(which git)" python ./src/init-test-framework.py "$ARG1" "$ARG2"
    )
    ;;

  *)
    echo -n "Unknown scripts ..."
    ;;
esac

