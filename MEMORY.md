# MEMORY.md — Persistent Project Memory

Newest entries at the **top** of each section.

---

## Status

### Current focus

- **Single repo:** agent-harness (eval merged).
- **Active:** MS02 at **S2** boundary (S1 done).
- **Harness soft-exit:** E1/E2/E4–E7 met after Phase 1+2 (2026-11-17). E3 still open.

### Done

- Portable core F001–F006 (copy surface + runs.md + strong handoff + audit + PERSISTENCE_TEST).
- F008 merge: eval/, work/, TASKS.md, scores, benchmarks.
- F009 Phase 1 (HARNESS_LESSONS, PUSH_GATE, assert_no_stub, inject budget).
- F010 Phase 2 (EXIT_CRITERIA, RETRO_ROUND).
- MS02 S1 (add/list + ledger phase 1).

### Next

- New dialog: MS02 S2 (`done` only + ledger phase 2).
- Later: S3 (`rm` + full verify); optional F007 version polish.

---

## Scores

| When | Suite | Score | Notes |
|------|-------|------:|-------|
| 2026-11-03 | structural baseline | 88.24 | early scorer |
| 2026-11-03 | structural v2 | 100 | static ceiling |
| 2026-11-03 | continuity | 100 | static ceiling |
| 2026-11-03 | ms01 | 70 | one-shot; not fair multi-dialog |
| 2026-11-04 | ms02 | in progress | S1 only until S3 + honesty |
| 2026-11-17 | soft-exit bars | E1/E2/E4–E7 | Phase 1+2 complete |

Static suites catch regressions; true pressure is MS02 ledger + real dialog cuts.

---

## Pitfalls / decisions

- Prefer short root AGENT.md; do not grow it into an encyclopedia.
- Verification must be runnable commands, not model self-assessment.
- One active feature at a time.
- **Duration matters:** log wall-clock in `runs.md`.
- Soft tests (single dialog) do not validate persistence.
- MS01 taught: collapsing session boundaries inflates implementation score and zeros scope discipline.
- Copy-to-project surface = core harness files; `eval/` + `work/` stay in this meta-repo.
- Binding failure ledger lives in `docs/HARNESS_LESSONS.md` (not only narrative pitfalls).
- Push integrity is mechanical (`tools/assert_no_stub.sh`), not aspirational.

---

## Log

### 2026-11-17

- Phase 1+2 hardening: HARNESS_LESSONS, PUSH_GATE, assert_no_stub, EXIT_CRITERIA, RETRO_ROUND; AGENT.md and audit strengthened; F009/F010 done; soft-exit claimed for E1/E2/E4–E7.

### 2026-11-04

- User: stop isolating test repo; merge progress into agent-harness without destroying new harness results.
- Imported eval/work/TASKS/scores; set MS02 in_progress for S2.

### 2026-11-04 (earlier)

- F004–F006 on portable core.

### 2026-11-03

- Initial templates; parallel test-repo bootstrap (now merged).
