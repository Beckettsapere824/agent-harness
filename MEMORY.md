# MEMORY.md — Persistent Project Memory

Newest entries at the **top** of each section.

---

## Status

### Current focus

- **Single repo:** agent-harness-test progress merged here. No separate test isolation.
- **Active:** MS02 at **S2** boundary (S1 done).

### Done

- Portable core F001–F006 (copy surface + runs.md + strong handoff + audit + PERSISTENCE_TEST).
- F008 merge: eval/, work/, TASKS.md, scores, benchmarks.
- MS02 S1 (add/list + ledger phase 1).

### Next

- New dialog: MS02 S2 (`done` only + ledger phase 2).
- Later: S3 (`rm` + full verify); optional F007 version/audit polish.

---

## Scores

| When | Suite | Score | Notes |
|------|-------|------:|-------|
| 2026-11-03 | structural baseline | 88.24 | early scorer |
| 2026-11-03 | structural v2 | 100 | static ceiling |
| 2026-11-03 | continuity | 100 | static ceiling |
| 2026-11-03 | ms01 | 70 | one-shot; not fair multi-dialog |
| 2026-11-04 | ms02 | in progress | S1 only until S3 + honesty |

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

---

## Log

### 2026-11-04

- User: stop isolating test repo; merge progress into agent-harness without destroying new harness results.
- Imported eval/work/TASKS/scores; set MS02 in_progress for S2.

### 2026-11-04 (earlier)

- F004–F006 on portable core.

### 2026-11-03

- Initial templates; parallel test-repo bootstrap (now merged).
