#!/usr/bin/env bash

set -eo pipefail

KEYFILE=$HOME/.expo-internal/turtle-v2-git-crypt-key

if [ ! -f "$KEYFILE" ]; then
  echo "Missing keyfile, fetching from the GCloud bucket"
  gsutil cp gs://expo-secrets/turtle-v2-git-crypt-key $KEYFILE
fi

if ! command -v git-crypt >/dev/null 2>&1 ; then
  echo "You need to have git-crypt installed."
  exit 1
fi

git-crypt unlock "$KEYFILE"
