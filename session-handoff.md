# session-handoff.md

Use this when work is incomplete and another agent or a new dialog must continue.

---

## Last updated

2026-11-03

## Active feature

F002 — Add README explaining how to copy the harness into any repo

## What was done

- Core v1 files committed.
- PLAN and RAW_MATERIALS present.

## What remains

- Write README.md (copy steps, customization points, startup contract).
- Optionally add a minimal audit script (F003).

## How to resume

1. Read AGENT.md → MEMORY.md → feature_list.json → this file.
2. Run `./init.sh`.
3. Continue F002; do not start unrelated features.

## Risks / notes

- Keep AGENT.md short when customizing for a real project.
- Replace verification commands in init.sh with project-real checks.
