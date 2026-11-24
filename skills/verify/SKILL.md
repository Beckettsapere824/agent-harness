---
name: verify
description: Run mechanical verification and record evidence; never mark done on self-assessment alone.
---

# verify

## When to use
Before any “done” claim and at the end of a substantive step.

## Steps
1. Run `./init.sh` (or project equivalent).
2. Run `./audit-harness.sh` and `./tools/assert_no_stub.sh` when present.
3. Run feature-specific verify commands or suites.
4. Capture exit codes / key output.
5. Write evidence into feature_list.json or progress.md.

## Rule
Model self-praise is not evidence. Only command results count.
