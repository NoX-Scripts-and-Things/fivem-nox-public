#!/usr/bin/env bash

FRAMEWORK="$1"

# # We double check to make sure the server has the correct env requirements
cd .source/fivem-nox-server || exit 1

./setup-env.sh

python setup-headless-"$FRAMEWORK".py

python run-server.py