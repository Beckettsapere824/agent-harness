# AGENT.md — Operating Contract for Any Agent

This file is the **entry point**. Any coding agent (Grok, Claude, Codex, etc.) working in this repository must read it first.

**Read order (mandatory):**  
`AGENT.md` → `MEMORY.md` → `docs/HARNESS_LESSONS.md` → `docs/EXIT_CRITERIA.md` (skim) → `feature_list.json` → `progress.md` → `session-handoff.md` / `runs.md` (if present) → run `./init.sh`.

Load `docs/`, `eval/`, or other files **only on demand** for the single chosen feature. Default inject budget: the files above plus at most a few task-specific files. Do not load the entire tree into context.

---

## Mission

Build and maintain a reliable, repo-native agent harness that can be copied into arbitrary repositories and used across dialogs via GitHub connector, without relying on chat history. In *this* repository, also raise measurable reliability via `eval/` multi-session packs and score history.

---

## Startup Workflow (mandatory)

Before writing code or claiming progress:

1. Confirm working directory / repo context.
2. Read this file completely.
3. Read `MEMORY.md` (status, pitfalls, recent log, scores).
4. Read `docs/HARNESS_LESSONS.md` (binding failure ledger).
5. Skim `docs/EXIT_CRITERIA.md` for open bars.
6. Run `./init.sh` (or the verification commands listed at the bottom). Fix failures before new scope.
7. Optionally run `./audit-harness.sh` and `./tools/assert_no_stub.sh`.
8. Read `feature_list.json`. Select **exactly one** unfinished feature.
9. Read `progress.md` (must contain **Next exact**), `session-handoff.md`, and recent `runs.md`.
10. Load further docs or eval only when needed for the chosen feature.

If baseline verification fails, repair that first.

---

## Working Rules (invariants)

- **One feature at a time.** Do not start a second feature until the current one has evidence of done.
- **Verification required.** Do not mark a feature done or say “done” without running the verification commands and recording evidence in `feature_list.json` or `progress.md`.
- **Repo is the system of record.** Chat history is ephemeral. All durable state lives in the files above.
- **Stay in scope.** Do not modify unrelated files or rewrite the feature list to hide unfinished work.
- **Leave clean state.** The next session/dialog must be able to run `./init.sh` immediately.
- **Honest reporting.** Mark drafts unfinished; report failures as failures; do not bypass limits to avoid asking.
- **Log every run.** Prepend a duration entry to `runs.md` before ending the dialog.
- **Multi-session packs.** For MS02-style packs, obey session gates in the pack SPEC (ledger phases); do not one-shot all phases.
- **Push integrity.** Follow `docs/HARNESS_PUSH_GATE.md`. Never push PLACEHOLDER/stub content. Run `./tools/assert_no_stub.sh` when available.
- **Failure ledger.** New failure classes must be appended to `docs/HARNESS_LESSONS.md`.
- **Retro write-back.** Substantive rounds require an entry in `docs/RETRO_ROUND.md` (or equivalent dated note) in addition to state files.

---

## Definition of Done

A feature is done only when **all** of the following are true:

- [ ] Target behavior is implemented
- [ ] Required verification actually ran (tests / lint / type-check / smoke / pack verify / assert_no_stub)
- [ ] Evidence recorded in `feature_list.json` or `progress.md`
- [ ] Repository remains restartable from the standard startup path

---

## End of Session / Dialog

Before ending:

1. Update `progress.md` with current state and an **exact** next concrete step ("Next exact").
2. Update `feature_list.json` status and evidence fields.
3. If work is incomplete, refresh `session-handoff.md` including **all** of:
   - Active feature (id + title)
   - **Timing**: last run duration, feature start, elapsed wall time, expected remaining
   - What was done / what remains (actionable)
   - **Resume checklist** (ordered steps for the next agent)
   - **Known failure modes** relevant to current work
4. **Prepend a run entry to `runs.md`** (approx duration, feature, outcome, handoff quality).
5. For substantive rounds: append a short section to `docs/RETRO_ROUND.md`.
6. If a new failure class appeared: append to `docs/HARNESS_LESSONS.md`.
7. Commit only when the tree is in a safe, restartable state.
8. Prefer short, actionable notes over long narrative.

A fresh agent must be able to resume from files alone. If the next agent would need to ask “what were we doing?”, the handoff is incomplete.

---

## Verification Commands

```bash
# Primary entrypoint
./init.sh

# Structural self-check
./audit-harness.sh

# Content integrity (anti-stub)
./tools/assert_no_stub.sh

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
| `docs/HARNESS_LESSONS.md` | Binding failure ledger |
| `docs/HARNESS_PUSH_GATE.md` | Anti-placeholder procedure |
| `docs/EXIT_CRITERIA.md` | Measurable harness bars |
| `docs/RETRO_ROUND.md` | Round retro template + history |
| `feature_list.json` | Structured features + evidence |
| `progress.md` | Live session continuity (**Next exact** required) |
| `session-handoff.md` | Explicit handoff (timing + resume checklist + failure modes) |
| `runs.md` | Per-session duration + outcome log |
| `init.sh` | Startup + verification |
| `audit-harness.sh` | Structural self-check |
| `tools/assert_no_stub.sh` | Content integrity gate |
| `TASKS.md` | Long-running eval program |
| `eval/` | Suites, task packs, historical scores |
| `work/` | Pack implementation workspace |
| `docs/` | PERSISTENCE_TEST, benchmarks, on-demand detail |
| `.grok/README.md` | Grok-oriented notes |

Keep this file short. Put project facts and long lessons in `docs/` or domain files, not here.
