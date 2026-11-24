# MEMORY.md — Persistent Project Memory

Newest entries at the **top** of each section.

---

## Status

### Current focus

- **Single repo:** agent-harness (eval merged).
- **Active:** MS02 at **S3** boundary (S1 + S2 done).
- **Harness soft-exit:** E1/E2/E4–E7 met. E3 still open until S3 fair multi-dialog completes.
- **Orches + skills:** Initialized / F011 done (2026-11-24).

### Done

- Portable core F001–F006.
- F008–F011 (eval merge, Phase 1/2 hardening, skills layer).
- MS02 S1 (add/list + ledger phase 1).
- MS02 S2 (done + ledger phase 2) — 2026-11-24.

### Next

- Fresh dialog: MS02 S3 (`rm` + ledger phase 3 + verify.sh green).

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
| 2026-11-24 | skills layer | landed | F011 |
| 2026-11-24 | ms02 S2 | phase 2 | done command; ledger honest |

---

## Pitfalls / decisions

- Prefer short root AGENT.md; do not grow it into an encyclopedia.
- Verification must be runnable commands, not model self-assessment.
- One active feature at a time.
- **Duration matters:** log wall-clock in `runs.md`.
- Soft tests (single dialog) do not validate persistence.
- MS01 taught: collapsing session boundaries inflates implementation score and zeros scope discipline.
- Copy-to-project surface = core harness files + skills/; `eval/` + `work/` stay in this meta-repo.
- Binding failure ledger lives in `docs/HARNESS_LESSONS.md`.
- Push integrity is mechanical (`tools/assert_no_stub.sh`).
- **Unique identity per dialog** (Orches rule).
- Skills use progressive disclosure.

---

## Log

### 2026-11-24 (S2)

- MS02 S2: implemented `done ID` only; ledger phase 2 appended; stopped before `rm`.

### 2026-11-24 (earlier)

- Orches initialized; skills layer F011 landed; anti-drift assertion added.

### 2026-11-17

- Phase 1+2 hardening; soft-exit E1/E2/E4–E7.

### 2026-11-04

- Merged eval/work; MS02 set at S2 boundary.

### 2026-11-03

- Initial templates.
