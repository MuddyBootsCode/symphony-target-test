---
verification_policies:
  default:
    label_match: []
    required_runners: [typecheck, lint, test]
    visual_required: false

hooks: {}

high_risk_paths: []
---

# Symphony Workflow Prompt

You are working on the `paginator` repository.

## Ticket
{{ticket}}

## Plan
{{plan}}

## Subtask
{{subtask}}

## Files in scope
{{files_in_scope}}

## House rules
- The package source is under `src/paginator/`. Tests are under `tests/`.
- Tests use stdlib `unittest` (no third-party test runners required).
- Keep changes minimal and focused on the subtask description.
- Do not modify pyproject.toml, .gitignore, or anything in `.symphony/` unless the subtask explicitly requires it.
- Do not add new third-party dependencies.
