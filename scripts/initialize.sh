#!/usr/bin/env bash

INITIAL_SCRIPTS="$1"
ARG="$2"

# shellcheck disable=SC1090
source <(curl -s https://raw.githubusercontent.com/NoX-Scripts-and-Things/fivem-nox-public/master/scripts/common/prepare-scripts.sh)
# shellcheck disable=SC1090
source <(curl -s https://raw.githubusercontent.com/NoX-Scripts-and-Things/fivem-nox-public/master/scripts/common/prepare-env.sh)

git init

prepare_scripts

(
  cd ./.source/fivem-nox-public || exit 1
  activate_python
  GIT_PYTHON_GIT_EXECUTABLE="$(which git)" python ./src/"$INITIAL_SCRIPTS" "$ARG"
)