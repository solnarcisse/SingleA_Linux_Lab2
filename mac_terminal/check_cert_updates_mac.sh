#!/bin/bash
set -e

BASE_DIR="${1:-$HOME/cert_lab_mac}"
LAB_ROOT="$BASE_DIR/mock_server"
MATCH="A1B2C3D4E5"
FAILURES=0

if [ ! -d "$LAB_ROOT" ]; then
  echo "Lab directory not found: $LAB_ROOT"
  exit 1
fi

echo "Checking certificate files under: $LAB_ROOT"
echo

while IFS= read -r file; do
  if grep -q "$MATCH" "$file"; then
    echo "[PASS] $file"
  else
    echo "[FAIL] $file"
    FAILURES=$((FAILURES + 1))
  fi
done < <(find "$LAB_ROOT" -type f -name "client_key.txt" | sort)

echo
if [ "$FAILURES" -eq 0 ]; then
  echo "All certificate files were updated successfully."
  exit 0
else
  echo "$FAILURES certificate file(s) are still outdated."
  exit 2
fi
