#!/usr/bin/env bash

FRAMEWORK_ARG=$1
SOURCE_DIR=".source"
FRAMEWORK_DIR="$SOURCE_DIR/.framework"

clear
echo "[INFO] Attempting to determine framework ..."

if [ -z "$FRAMEWORK" ] && [ -e $FRAMEWORK_DIR ]; then
  echo "[INFO] Loading pre-existing framework from '$FRAMEWORK_DIR' ..."
  source "$FRAMEWORK_DIR"
fi

# Create framework cache based from the framework argument
if [ -n "$FRAMEWORK_ARG" ] && [ -z "$FRAMEWORK" ]; then
  FRAMEWORK="$FRAMEWORK_ARG"

  echo "[INFO] Framework Argument Detected"
  echo "[INFO] Setting framework to '$FRAMEWORK'"
  echo "[INFO] Writing framework to cache '$FRAMEWORK_DIR'"

  if [ ! -d $SOURCE_DIR ]; then
    echo "[INFO] Source directory '$SOURCE_DIR' does not exist, creating ..."
    mkdir -p $SOURCE_DIR;
  fi

  echo "FRAMEWORK=\"$FRAMEWORK\"" > $FRAMEWORK_DIR
fi

if [ -z "$FRAMEWORK" ]; then
  echo "[ERROR] Unable to determine framework!"
  exit 1
fi

echo "[INFO] Framework successfully detected as '$FRAMEWORK'"