#!/usr/bin/env bash
# Run unit tests via stdlib unittest. Captures pass/fail per §7.1.
set -uo pipefail
mkdir -p .verification/runners
out=".verification/runners/test.txt"

python3 -m unittest discover -s tests -v > "$out" 2>&1
status=$?

if [ "$status" -eq 0 ]; then
  echo '{"runner":"test","passed":true}'
  exit 0
else
  # tail the output for the JSON summary
  tail_lines=$(tail -c 500 "$out" | tr '\n' ' ')
  echo "{\"runner\":\"test\",\"passed\":false,\"tail\":\"${tail_lines}\"}"
  exit 1
fi
