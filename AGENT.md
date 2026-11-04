# AGENT.md — Operating Contract for Any Agent

This file is the **entry point**. Any coding agent (Grok, Claude, Codex, etc.) working in this repository must read it first.

Read order: `AGENT.md` → `MEMORY.md` → `feature_list.json` → `progress.md` (and `session-handoff.md` / `runs.md` if present) → run `./init.sh`.

---

## Mission

*(Replace this paragraph with the project mission. Keep it short.)*

Build and maintain a reliable, repo-native agent harness that can be copied into arbitrary repositories and used across dialogs via GitHub connector, without relying on chat history. Emphasize durable state and measurable session duration so work can persist across long or interrupted runs.

---

## Startup Workflow (mandatory)

Before writing code or claiming progress:

1. Confirm working directory / repo context.
2. Read this file completely.
3. Read `MEMORY.md` (status, pitfalls, recent log).
4. Run `./init.sh` (or the verification commands listed at the bottom). Fix failures before new scope.
5. Read `feature_list.json`. Select **exactly one** unfinished feature.
6. Read `progress.md`, `session-handoff.md`, and recent entries in `runs.md` if they exist.
7. Load additional docs under `docs/` only when needed for the chosen feature.

If baseline verification fails, repair that first.

---

## Working Rules (invariants)

- **One feature at a time.** Do not start a second feature until the current one has evidence of done.
- **Verification required.** Do not mark a feature done or say “done” without running the verification commands and recording evidence in `feature_list.json` or `progress.md`.
- **Repo is the system of record.** Chat history is ephemeral. All durable state lives in the files above.
- **Stay in scope.** Do not modify unrelated files or rewrite the feature list to hide unfinished work.
- **Leave clean state.** The next session/dialog must be able to run `./init.sh` immediately.
- **Honest reporting.** Mark drafts unfinished; report failures as failures; do not bypass limits to avoid asking.
- **Log every run.** Append a duration entry to `runs.md` before ending the dialog (see End of Session).

---

## Definition of Done

A feature is done only when **all** of the following are true:

- [ ] Target behavior is implemented
- [ ] Required verification actually ran (tests / lint / type-check / smoke)
- [ ] Evidence recorded in `feature_list.json` or `progress.md`
- [ ] Repository remains restartable from the standard startup path

---

## End of Session / Dialog

Before ending:

1. Update `progress.md` with current state and next concrete step.
2. Update `feature_list.json` status and evidence fields.
3. If work is incomplete, write or refresh `session-handoff.md`.
4. **Prepend a run entry to `runs.md`** (start/end approx, duration, feature, outcome, handoff quality).
5. Commit only when the tree is in a safe, restartable state.
6. Prefer short, actionable notes over long narrative.

---

## Verification Commands

```bash
# Primary entrypoint
./init.sh

# Optional structural self-check (core files + JSON validity)
./audit-harness.sh

# Or, if init.sh is not yet customized, run project-specific checks here:
# e.g. npm test / pytest / cargo test / make check
```

Replace the body of `init.sh` with the real commands for this project.

---

## Escalation

- Architecture or product decisions → consult `docs/` if present, otherwise ask the human.
- Unclear requirements → ask one concrete question; do not invent scope.
- Repeated verification failures → update progress, leave a clear blocker note, stop.

---

## Pointers (directory page)

| Path | Role |
|------|------|
| `MEMORY.md` | Status, pitfalls, decision log |
| `feature_list.json` | Structured features + evidence |
| `progress.md` | Live session continuity |
| `session-handoff.md` | Explicit handoff for next agent/dialog |
| `runs.md` | Per-session duration + outcome log |
| `init.sh` | Startup + verification |
| `audit-harness.sh` | Minimal structural self-check |
| `docs/` | Detailed knowledge (on-demand) |
| `.grok/README.md` | Grok-oriented notes |

Keep this file short. Put project facts in `docs/` or domain files, not here.
