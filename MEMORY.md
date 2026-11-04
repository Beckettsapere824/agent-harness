# MEMORY.md — Persistent Project Memory

Newest entries at the **top** of each section.

---

## Status

### Current focus

- Shift from easy structural tests to **duration measurement** and **multi-session persistence**.
- F004 (`runs.md`) and F005 (`docs/PERSISTENCE_TEST.md`) complete.
- Next: F006 (stronger handoff) and/or execute the multi-session test protocol.

### Done

- v1 core templates + README + audit-harness.sh (F001–F003).
- Per-session duration log (`runs.md`) and mandatory logging in AGENT.md (F004).
- Hard multi-session persistence test protocol (F005).

### Next

- Strengthen session-handoff template (F006).
- Run forced multi-dialog tests; record wall-clock duration and resume quality.
- Optional: version metadata, multi-agent notes, example project migration.

---

## Pitfalls / decisions

- Prefer short root AGENT.md; do not grow it into an encyclopedia.
- Verification must be runnable commands, not model self-assessment.
- One active feature at a time unless multi-agent ownership is explicit.
- All durable continuity is file-based (GitHub connector / any agent).
- **Duration matters:** log approximate wall-clock per dialog in `runs.md`; easy smoke tests hide early death and bad handoffs.
- audit-harness.sh is structural only; project-specific tests stay in init.sh.

---

## Log

### 2026-11-04

- User: previous tests too easy; focus on run duration and persistent operation.
- Added F004–F006. Implemented F004 (runs.md + wiring) and F005 (PERSISTENCE_TEST.md).
- F001–F005 now done. Ready for F006 or first forced multi-session run.

### 2026-11-03

- Initial v1 harness templates committed.
- Sources: walkinglabs/learn-harness-engineering, Beckettsapere824/c-machine-learning & Library, deepseek-ai/dsh-superagent-prototype, Anthropic effective-harnesses + cwc-long-running-agents, OpenAI harness-engineering / Codex AGENTS.md, xAI grok-build.
