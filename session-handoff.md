# session-handoff.md

Use this when work is incomplete and another agent or a new dialog must continue.

---

## Last updated

2026-11-04

## Active feature

none (F001–F005 done). Next recommended: **F006** (strengthen session-handoff) — also the natural subject of the first multi-session test.

## What was done

- v1 core + README + audit (F001–F003).
- `runs.md` duration log + AGENT/README wiring (F004).
- `docs/PERSISTENCE_TEST.md` hard multi-session protocol (F005).

## What remains

1. **F006** — Strengthen `session-handoff.md` template: last run duration, elapsed time since feature start, concrete resume checklist, known failure modes; document in AGENT.md.
2. **Run the protocol** — Use `docs/PERSISTENCE_TEST.md`: force 3+ dialog boundaries while implementing F006 (or another hard task); record durations and handoff quality in `runs.md`.

## How to resume

1. Read AGENT.md → MEMORY.md → feature_list.json → this file → recent `runs.md`.
2. Run `./init.sh` (and optionally `./audit-harness.sh`).
3. Set F006 to `in_progress` if starting it; follow one feature only.
4. If running the persistence test: stop deliberately after each leg and leave a perfect handoff — do not rely on chat history in the next dialog.

## Risks / notes

- Previous tests were too easy (structural only). Success now = resume correctness + measured duration across forced handoffs.
- Keep AGENT.md short when customizing for real projects.
