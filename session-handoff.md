# session-handoff.md

Use this when work is incomplete and another agent or a new dialog must continue.

---

## Last updated

2026-11-04

## Active feature

none (v1 features F001–F003 complete)

## What was done

- Core v1 files committed (F001).
- README documents copy steps and startup contract (F002).
- Minimal `audit-harness.sh` added and documented (F003).

## What remains

- Optional future work: version metadata, multi-agent notes, example migration of an existing project, richer audit checks.
- When copying into a real project: customize Mission, init.sh verification commands, and feature_list.json.

## How to resume

1. Read AGENT.md → MEMORY.md → feature_list.json → this file.
2. Run `./init.sh` (and optionally `./audit-harness.sh`).
3. Pick a new feature or start a real project adaptation; do not invent scope without human direction.

## Risks / notes

- Keep AGENT.md short when customizing for a real project.
- Replace verification commands in init.sh with project-real checks.
- `audit-harness.sh` is structural only; project tests still belong in init.sh.
