---
name: push-gate
description: Enforce content integrity; never push placeholders or stubs for critical paths.
---

# push-gate

## When to use
Before every non-trivial push, especially AGENT.md, feature_list.json, tools/, eval/, work/.

## Procedure
1. Materialize full content first.
2. Run `./tools/assert_no_stub.sh` (or path-specific).
3. Push only gated content.
4. After push, re-read via get_file_contents and confirm size + required markers.

See docs/HARNESS_PUSH_GATE.md for forbidden patterns and critical paths.
