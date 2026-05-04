#!/usr/bin/env bash
# Build check — confirms package metadata is parseable. Stdlib only.
set -uo pipefail
mkdir -p .verification/runners
out=".verification/runners/build.txt"

python3 - <<'PY' > "$out" 2>&1
import tomllib
from pathlib import Path
data = tomllib.loads(Path("pyproject.toml").read_text())
print("project name:", data["project"]["name"])
print("project version:", data["project"]["version"])
print("ok")
PY
status=$?

if [ "$status" -eq 0 ]; then
  echo '{"runner":"build","passed":true}'
  exit 0
else
  echo '{"runner":"build","passed":false}'
  exit 1
fi
