# MEMORY.md — Persistent Project Memory

Newest entries at the **top** of each section.

---

## Status

### Current focus

- F001–F006 complete.
- Next: **multi-session persistence test (B)** using `docs/PERSISTENCE_TEST.md`.
- Suggested vehicle: new F007 (version metadata + richer audit), implemented across ≥3 forced dialog boundaries.

### Done

- v1 core + README + audit (F001–F003).
- runs.md duration log (F004).
- Hard multi-session test protocol (F005).
- Strengthened session-handoff: Timing, Resume checklist, Known failure modes (F006).

### Next

- Run B: fresh dialogs only; record duration + handoff quality per leg.
- Optional later: multi-agent notes, example project migration.

---

## Pitfalls / decisions

- Prefer short root AGENT.md; do not grow it into an encyclopedia.
- Verification must be runnable commands, not model self-assessment.
- One active feature at a time unless multi-agent ownership is explicit.
- All durable continuity is file-based (GitHub connector / any agent).
- **Duration matters:** log approximate wall-clock per dialog in `runs.md`.
- **Handoff must stand alone:** Timing + resume checklist + failure modes required when incomplete.
- Soft tests (single dialog) do not validate persistence; force real boundaries.

---

## Log

### 2026-11-04

- User: 先A后B (implement F006, then multi-session test).
- F006 done: session-handoff + AGENT.md End of Session strengthened.
- Prepared handoff for B; suggested F007 as test vehicle.

### 2026-11-04 (earlier)

- F004 runs.md; F005 PERSISTENCE_TEST.md; shift to duration + persistence focus.

### 2026-11-03

- Initial v1 harness templates committed.
