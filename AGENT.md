# AGENT.md — Operating Contract for Any Agent

This file is the **entry point**. Any coding agent (Grok, Claude, Codex, etc.) working in this repository must read it first.

Read order: `AGENT.md` → `MEMORY.md` → `feature_list.json` → `progress.md` (and `session-handoff.md` / `runs.md` if present) → run `./init.sh`.

---

## Mission

Build and maintain a reliable, repo-native agent harness that can be copied into arbitrary repositories and used across dialogs via GitHub connector, without relying on chat history. In *this* repository, also raise measurable reliability via `eval/` multi-session packs and score history.

---

## Startup Workflow (mandatory)

Before writing code or claiming progress:

1. Confirm working directory / repo context.
2. Read this file completely.
3. Read `MEMORY.md` (status, pitfalls, recent log, scores).
4. Run `./init.sh` (or the verification commands listed at the bottom). Fix failures before new scope.
5. Read `feature_list.json`. Select **exactly one** unfinished feature.
6. Read `progress.md`, `session-handoff.md`, and recent entries in `runs.md` if they exist.
7. Load `eval/`, `TASKS.md`, or `docs/` only when needed for the chosen feature.

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
- **Multi-session packs.** For MS02-style packs, obey session gates in the pack SPEC (ledger phases); do not one-shot all phases.

---

## Definition of Done

A feature is done only when **all** of the following are true:

- [ ] Target behavior is implemented
- [ ] Required verification actually ran (tests / lint / type-check / smoke / pack verify)
- [ ] Evidence recorded in `feature_list.json` or `progress.md`
- [ ] Repository remains restartable from the standard startup path

---

## End of Session / Dialog

Before ending:

1. Update `progress.md` with current state and **exact** next concrete step.
2. Update `feature_list.json` status and evidence fields.
3. If work is incomplete, refresh `session-handoff.md` including **all** of:
   - Active feature (id + title)
   - **Timing**: last run duration, feature start, elapsed wall time, expected remaining
   - What was done / what remains (actionable)
   - **Resume checklist** (ordered steps for the next agent)
   - **Known failure modes** relevant to current work
4. **Prepend a run entry to `runs.md`** (approx duration, feature, outcome, handoff quality).
5. Commit only when the tree is in a safe, restartable state.
6. Prefer short, actionable notes over long narrative.

A fresh agent must be able to resume from files alone. If the next agent would need to ask “what were we doing?”, the handoff is incomplete.

---

## Verification Commands

```bash
# Primary entrypoint
./init.sh

# Optional structural self-check
./audit-harness.sh

# In-repo eval suites (this repo)
python3 -m eval.run_suite --suite structural
python3 -m eval.run_suite --suite continuity
# Pack verifies (when implementing MS packs):
# bash eval/tasks/ms01_counter/verify.sh
# bash eval/tasks/ms02_todo/verify.sh
```

When copying the harness into another project, replace project-specific checks in `init.sh`; you need not copy `eval/` or `work/`.

---

## Escalation

- Architecture or product decisions → consult `docs/` / `TASKS.md` if present, otherwise ask the human.
- Unclear requirements → ask one concrete question; do not invent scope.
- Repeated verification failures → update progress, leave a clear blocker note, stop.

---

## Pointers (directory page)

| Path | Role |
|------|------|
| `MEMORY.md` | Status, pitfalls, scores, log |
| `feature_list.json` | Structured features + evidence |
| `progress.md` | Live session continuity |
| `session-handoff.md` | Explicit handoff (timing + resume checklist + failure modes) |
| `runs.md` | Per-session duration + outcome log |
| `init.sh` | Startup + verification |
| `audit-harness.sh` | Minimal structural self-check |
| `TASKS.md` | Long-running eval program |
| `eval/` | Suites, task packs, historical scores |
| `work/` | Pack implementation workspace |
| `docs/` | PERSISTENCE_TEST, benchmarks, on-demand detail |
| `.grok/README.md` | Grok-oriented notes |

Keep this file short. Put project facts in `docs/` or domain files, not here.
