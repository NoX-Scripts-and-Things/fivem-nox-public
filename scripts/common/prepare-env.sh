#!/usr/bin/env bash

function activate_python() {
  if [ -z "$1" ]; then
    REQUIREMENTS_FILE="requirements.txt"
  else
    REQUIREMENTS_FILE="$1"
  fi

  pip3 install virtualenv
  python3 -m venv venv
  source venv/Scripts/activate
  pip install -r "$REQUIREMENTS_FILE"
}
