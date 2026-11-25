# MEMORY.md — Persistent Project Memory

Newest entries at the **top** of each section.

---

## Status

### Current focus

- **Sandbox control:** `docs/SANDBOX_CONTROL.md` landed (P-NP 1.2GiB Lean lessons).
- **MS02:** implementation complete (add/list/done/rm + ledger 1–3). Marked done with honesty note on dialog isolation.
- **Orches + sync contract:** live.
- **Next:** real identity packs via orches-factory-1, or connector-driven capability expansion.

### Done

- F001–F006, F008–F011
- MS02 S1–S3 code path
- Orches identity system + local-mirror/sync
- SANDBOX_CONTROL from P-NP extreme utilization [2026-11-25]

### Next

- Provision real work identities when a project is named
- Optional: formal verify.sh re-run for score file under eval/scores/

---

## Scores

| When | Suite | Score | Notes |
|------|-------|------:|-------|
| 2026-11-24 | ms02 | done (functional) | ledger 1–3; isolation partial vs strict E3 |
| 2026-11-24 | Orches+sync | landed | |
| 2026-11-17 | soft-exit | E1/E2/E4–E7 | E3 partial |

---

## Pitfalls / decisions

- Local first → immediate push
- Shared harness per work repo
- Unique identity + standby slots
- Strict MS02 isolation ideal; user may prioritize throughput — record honesty in evidence
- Grok sandbox ≈1.2GiB: leaf modules only, LEAN_NUM_THREADS=1; see SANDBOX_CONTROL.md

---

## Log

### 2026-11-25

- Captured P-NP sandbox milestone into docs/SANDBOX_CONTROL.md + HARNESS_LESSONS hard rule. No changes to P-NP repo.

### 2026-11-24 (S3)

- MS02 rm + ledger phase 3; feature marked done with continuity note.

### 2026-11-24 (earlier)

- Orches factory/standby/local-mirror; S2 done command.
