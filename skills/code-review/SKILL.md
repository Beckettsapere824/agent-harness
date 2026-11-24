---
name: code-review
description: Structured review of the current change set for correctness, scope, and risk.
---

# code-review

## When to use
Before marking a feature done or before a non-trivial push.

## Checklist
- Scope: only the active feature is touched.
- Correctness: does the change match the definition_of_done?
- Evidence: verification commands actually ran.
- Safety: no stubs, no secrets, no accidental broad refactors.
- Clarity: next agent can understand the change from files alone.

## Output
Short review note (pass / issues) written into progress.md or the feature evidence field.
