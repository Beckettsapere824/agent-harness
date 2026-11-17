# HARNESS_LESSONS.md — Binding Failure Ledger

Newest classes at the **top**. **This file is binding for agents.**

Read on every startup after AGENT.md. New failure classes discovered in any dialog must be appended here with a concrete mitigation. Do not rely on chat memory of past mistakes.

---

## Hard rules (extract)

### Continuity

- Chat is ephemeral. Only repo state counts across dialogs or accounts.
- `progress.md` must contain an **exact** next step (command, file, or phase). "Continue" alone is insufficient.
- `session-handoff.md` must include Timing, Resume checklist, and Known failure modes when work is incomplete.
- Multi-session packs (MS*) obey session gates and ledger phases; never one-shot all phases in a single dialog.

### Verification & evidence

- Never mark a feature `done` without runnable verification evidence recorded in `feature_list.json` or `progress.md`.
- Prefer mechanical checks (scripts, suites) over model self-assessment.
- Duration must be logged in `runs.md` before ending a dialog.

### File push / content integrity

- See `docs/HARNESS_PUSH_GATE.md`. No PLACEHOLDER / stub content for critical paths.
- After any non-trivial push, verify with `get_file_contents` (size + required markers).

### Scope

- Exactly one active feature (`in_progress`) at a time.
- Do not expand scope to hide unfinished work.

### Retro

- Substantive rounds require a write to `docs/RETRO_ROUND.md` (or dated section) plus state-file updates. Chat-only retro is invalid.

---

## Lessons captured

### 2026-11-17 — Phase 1/2 hardening (this repo)

1. **Missing mechanical push gate** — Agents under tool-size pressure sometimes emit stubs. Mitigation: `docs/HARNESS_PUSH_GATE.md` + `tools/assert_no_stub.sh`.
2. **Shallow handoff** — "Continue" without exact next step causes resume friction. Mitigation: enforce "Next exact" in progress.md and full handoff fields.
3. **Failure classes evaporate** — Pitfalls lived only in MEMORY.md narrative. Mitigation: this binding ledger + mandatory append on new classes.
4. **Static suites alone are insufficient** — Structural/continuity can score 100 while real multi-dialog continuity fails. Mitigation: MS packs + PERSISTENCE_TEST + EXIT_CRITERIA.

### From MS01 / early packs

5. **One-shot inflates score** — Collapsing session boundaries zeros scope-discipline credit. Mitigation: ledger phases required; fabricated multi-phase ledger capped.

### From portable-core design

6. **AGENT.md encyclopedia risk** — Long entry points degrade attention. Mitigation: keep AGENT.md short; details in docs/ and this ledger.
7. **Verification must be commands** — Model claims of "done" without `./init.sh` / suite / pack verify are invalid.

---

## How to add a new lesson

1. Reproduce or observe the failure class.
2. Write a short numbered entry under "Lessons captured" (date + one-line cause + mitigation).
3. If it becomes a hard rule, also add it under "Hard rules".
4. Update `MEMORY.md` Status/Log and, if needed, `feature_list.json` notes.
