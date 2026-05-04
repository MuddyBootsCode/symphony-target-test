#!/usr/bin/env bash
# Lint check via stdlib AST parse — confirms every .py file has no syntax/parse error.
set -uo pipefail
mkdir -p .verification/runners
out=".verification/runners/lint.txt"

python3 - <<'PY' > "$out" 2>&1
import ast, glob, sys
errors = []
for f in sorted(glob.glob("src/**/*.py", recursive=True) + glob.glob("tests/**/*.py", recursive=True)):
    try:
        ast.parse(open(f).read(), filename=f)
    except SyntaxError as e:
        errors.append(f"{f}: {e}")
if errors:
    for e in errors:
        print(e)
    sys.exit(1)
print("ok")
PY
status=$?

if [ "$status" -eq 0 ]; then
  echo '{"runner":"lint","passed":true}'
  exit 0
else
  echo '{"runner":"lint","passed":false}'
  exit 1
fi
