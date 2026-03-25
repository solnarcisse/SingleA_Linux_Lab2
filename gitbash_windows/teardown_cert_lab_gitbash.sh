#!/usr/bin/env bash
set -e

BASE_DIR="${1:-$HOME/cert_lab_gitbash}"

if [ -d "$BASE_DIR" ]; then
  rm -rf "$BASE_DIR"
  echo "Removed: $BASE_DIR"
else
  echo "Nothing to remove. Directory not found: $BASE_DIR"
fi
