#!/usr/bin/env bash
# Verifies all .py files in src/ compile cleanly.
set -uo pipefail
mkdir -p .verification/runners
out=".verification/runners/typecheck.txt"

# Use stdlib py_compile for byte-compile check (no external deps).
if python3 -m compileall -q src/ 2> "$out"; then
  echo '{"runner":"typecheck","passed":true}'
  exit 0
else
  echo "{\"runner\":\"typecheck\",\"passed\":false,\"output\":\"$(tr '\n' ' ' < "$out" | head -c 500)\"}"
  exit 1
fi
