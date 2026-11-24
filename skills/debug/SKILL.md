---
name: debug
description: Systematic root-cause diagnosis before applying a patch.
---

# debug

## When to use
Verification fails, unexpected behavior, or a previous fix did not stick.

## Steps
1. Reproduce the failure with a concrete command.
2. Collect the minimal failing evidence (log, exit code, file state).
3. Form one or two hypotheses; test the cheapest first.
4. Only after root cause is identified, apply the smallest patch.
5. Re-run the original failure case and record the outcome.

## Forbidden
Guess-and-patch loops without reproduction evidence.
