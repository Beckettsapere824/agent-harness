# MEMORY.md — Persistent Project Memory

Newest entries at the **top** of each section.

---

## Status

### Current focus

- Harness v1 complete (F001–F003).
- Ready to be copied into target repositories.

### Done

- RAW_MATERIALS.md synthesized from c-machine-learning, learn-harness-engineering, Library, DeepSeek dsh-superagent-prototype, Anthropic / OpenAI / xAI open practices.
- PLAN.md written.
- Core portable files: AGENT.md, MEMORY.md, feature_list.json, progress.md, session-handoff.md, init.sh, .grok/README.md, README.md.
- audit-harness.sh (minimal structural self-check).

### Next

- Customize Mission / verification commands when copying into a real project.
- Optional later: version metadata, multi-agent notes, example migration of c-machine-learning, richer audit.

---

## Pitfalls / decisions

- Prefer short root AGENT.md; do not grow it into an encyclopedia.
- Verification must be runnable commands, not model self-assessment.
- One active feature at a time unless multi-agent ownership is explicit.
- All durable continuity is file-based (GitHub connector / any agent).
- audit-harness.sh is structural only; project-specific tests stay in init.sh.

---

## Log

### 2026-11-04

- F002 closed (README already met DoD).
- Implemented F003: added audit-harness.sh, documented in README + AGENT.md.
- v1 feature set complete.

### 2026-11-03

- Initial v1 harness templates committed.
- Sources: walkinglabs/learn-harness-engineering, Beckettsapere824/c-machine-learning & Library, deepseek-ai/dsh-superagent-prototype, Anthropic effective-harnesses + cwc-long-running-agents, OpenAI harness-engineering / Codex AGENTS.md, xAI grok-build.
