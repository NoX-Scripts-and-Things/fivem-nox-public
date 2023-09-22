#!/usr/bin/env bash

# Create the source directory if it does not exist, this will contain all the boilerplate for the project but no directly
# required when used on your fivem server
if [ ! -d ".source" ]; then
  mkdir -p ".source"
fi