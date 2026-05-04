# symphony-target-test

Throwaway target repo for symphony's first end-to-end run. Contains a deliberate
off-by-one bug in `src/paginator/paginate.py` that the unit tests catch.

Symphony's job: read the failing test, fix the bug, push a PR.

This repo is not meant for production use; it's a sandbox for validating that the
symphony orchestrator pipeline works end-to-end.
