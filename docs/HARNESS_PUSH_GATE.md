# HARNESS_PUSH_GATE.md — Anti-placeholder / content integrity

**Binding.** Agents must follow this before and after pushes that touch critical paths.

## Failure class

Tool calls under size or context pressure sometimes submit `PLACEHOLDER`, `SEE_LOCAL_FILE`, `TODO_STUB`, or near-empty content. The host accepts the commit; later sessions or deploys break.

## Hard procedure

1. **Materialize full content first.** Never invent a temporary stub "to replace later."
2. **Gate before push (when tools/ or scripts available):**
   ```bash
   ./tools/assert_no_stub.sh
   # or for a single path:
   ./tools/assert_no_stub.sh path/to/file
   ```
3. **Push only the gated body.** If the tool cannot carry the full file, do not push — report blocked and leave a note in progress.md.
4. **After push:** re-read via `get_file_contents` (or equivalent) and confirm size + required markers. If a stub is detected, restore in the **same turn**.

## Forbidden payload patterns (alone or as entire file body)

- `PLACEHOLDER`
- `PLACEHOLDER_WILL_FAIL`
- `SEE_LOCAL_FILE`
- `TODO_STUB`
- Empty or under ~80 characters for paths under `src/`, `eval/`, `docs/`, `tools/`, or any path the agent just claimed to implement fully

## Critical paths (always gate)

- `AGENT.md`, `feature_list.json`, `eval/**`, `tools/**`, `work/**` (when implementing packs)
- Any file the current feature's definition_of_done names

## Why intent is not enough

Intent under tool-size pressure is not a control. Mechanical reject + post-read verify is the control.
