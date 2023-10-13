#!/usr/bin/env bash

function import_source () {
  source_folder="$1"

  echo "[INFO] Checking if source '$source_folder' exists ..."
  if [ ! -d ".source/$source_folder" ]
  then
      echo "[INFO] Source '$source_folder' does not exist, cloning repository ..."
      cd .source || exit 1
      git clone git@github.com:NoX-Scripts-and-Things/"$source_folder".git
      cd .. || exit 1
  else
    echo "[INFO] Source '$source_folder' exists, pulling repository master branch ..."
    cd .source/"$source_folder" || exit 1
    git reset --hard
    git pull origin master
    cd ../.. || exit 1
  fi

  echo "[INFO] $source_folder imported successfully!"
}
