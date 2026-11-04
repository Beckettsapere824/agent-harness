# session-handoff.md

Use this when work is incomplete and another agent or a new dialog must continue.

---

## Last updated

2026-11-04

## Active feature

none (F002 complete)

## What was done

- Core v1 files committed (F001).
- README.md documents copy steps, required customizations, and startup contract (F002).
- Evidence recorded; feature_list.json updated.

## What remains

- Optional: F003 — minimal audit / self-check script (presence + JSON validity; already partially covered by init.sh).
- When copying into a real project: customize Mission, init.sh verification, feature_list.json items.

## How to resume

1. Read AGENT.md → MEMORY.md → feature_list.json → this file.
2. Run `./init.sh`.
3. If continuing: pick F003 or leave template as-is. Do not invent new scope without human direction.

## Risks / notes

- Keep AGENT.md short when customizing for a real project.
- Replace verification commands in init.sh with project-real checks.
