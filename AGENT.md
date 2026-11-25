# AGENT.md — Operating Contract for Any Agent

This file is the **entry point**. Any coding agent (Grok, Claude, Codex, etc.) working in this repository must read it first.

**Read order (mandatory):**  
`AGENT.md` → `MEMORY.md` → `docs/HARNESS_LESSONS.md` → `docs/EXIT_CRITERIA.md` (skim) → `feature_list.json` → `progress.md` → `session-handoff.md` / `runs.md` (if present) → run `./init.sh` → skim `skills/README.md` (descriptions only).

Load full skill bodies, `docs/`, `eval/`, or other files **only on demand** for the single chosen feature or selected skill. Default inject budget: the files above plus at most a few task-specific files. Do not load the entire tree into context.

**Compliance review:** When the human asks to audit this session, use `docs/COMPLIANCE_REVIEW.md`. Findings mean the *dialog* missed a step — do **not** change the harness solely because of review misses.

---

## Mission

Build and maintain a reliable, repo-native agent harness that can be copied into arbitrary repositories and used across dialogs via GitHub connector, without relying on chat history. In *this* repository, also raise measurable reliability via `eval/` multi-session packs and score history.

**Multi-agent rule:** One work repo = **one shared harness** (this `AGENT.md` + `skills/` + shared state files). Multiple Orches identities may work this repo; role/persona differences live in Orches identities only, not in forked copies of this file.

---

## Startup Workflow (mandatory)

Before writing code or claiming progress:

1. Confirm working directory / repo context (and Orches identity if one was assigned).
2. **Local mirror + session contract (required):**
   - Ensure core harness files are present in the local workspace the dialog can write to (sandbox/project folder). If this dialog was started via Orches, follow the identity’s `local_mirror` paths.
   - Write or refresh `session-contract.md` in the local cache (identity id if any, primary repo, sync rule: local first → immediate push, memory targets).
   - Prefer reading from the local mirror after the first successful sync; still treat GitHub as system of record on conflict.
3. Read this file completely.
4. Read `MEMORY.md` (status, pitfalls, recent log, scores).
5. Read `docs/HARNESS_LESSONS.md` (binding failure ledger).
6. Skim `docs/EXIT_CRITERIA.md` for open bars.
7. Run `./init.sh` (or the verification commands listed at the bottom). Fix failures before new scope.
8. Optionally run `./audit-harness.sh` and `./tools/assert_no_stub.sh`.
9. Read `feature_list.json`. Select **exactly one** unfinished feature.
10. Read `progress.md` (must contain **Next exact**), `session-handoff.md`, and recent `runs.md`.
11. Skim `skills/README.md` (descriptions only). Load a full skill body only when that skill is selected.
12. Load further docs or eval only when needed for the chosen feature.

**Anti-drift assertion (required):** Before any other work the agent must be able to state from files alone: (a) which identity or repo harness it is under, (b) that the mandatory read order is complete, (c) the single active feature id, (d) the exact next step, (e) that local mirror / session-contract exists. If any item cannot be answered, stop and repair handoff/identity/mirror first. See `skills/anti-drift/SKILL.md`.

If baseline verification fails, repair that first.

---

## Sync discipline (binding)

- **Local first, cloud second.** Any edit to harness files, progress, memory, handoff, skills, or feature_list: write the local copy → **immediately** push to GitHub via connector. Do not batch changes for a single end-of-dialog push.
- Memory / progress / handoff updates also reflect status on the Orches identity when one is in use.
- If push fails: keep local correct, note pending sync, retry on the next write.
- Adding or removing a skill (or editing AGENT.md) follows the same path: local → immediate push so the next dialog never sees a stale cloud tree.

---

## Skills layer

Skills live under `skills/`. Each skill is a folder with a `SKILL.md` (name + description in front-matter; body loaded on demand).  
Current pack (15): brainstorm, plan, implement, test-tdd, debug, code-review, verify, handoff, yagni, security-basics, anti-drift, ledger, push-gate, propose-improvement, status-report.  
See `skills/README.md` for the discovery contract. Prefer invoking a named skill over improvising process.

---

## Working Rules (invariants)

- **One feature at a time.** Do not start a second feature until the current one has evidence of done.
- **Verification required.** Do not mark a feature done or say “done” without running the verification commands and recording evidence in `feature_list.json` or `progress.md`.
- **Repo is the system of record; local is the working truth.** Chat history is ephemeral. Durable state lives in files; local mirror must stay aligned via immediate push.
- **Stay in scope.** Do not modify unrelated files or rewrite the feature list to hide unfinished work.
- **Leave clean state.** The next session/dialog must be able to run `./init.sh` immediately.
- **Honest reporting.** Mark drafts unfinished; report failures as failures; do not bypass limits to avoid asking.
- **Log every run.** Prepend a duration entry to `runs.md` before ending the dialog.
- **Multi-session packs.** For MS02-style packs, obey session gates in the pack SPEC (ledger phases); do not one-shot all phases. Use `skills/ledger`.
- **Push integrity.** Follow `docs/HARNESS_PUSH_GATE.md` and `skills/push-gate`. Never push PLACEHOLDER/stub content. Run `./tools/assert_no_stub.sh` when available.
- **Failure ledger.** New failure classes must be appended to `docs/HARNESS_LESSONS.md`.
- **Retro write-back.** Substantive rounds require an entry in `docs/RETRO_ROUND.md` (or equivalent dated note) in addition to state files.
- **Anti-drift.** Perform the startup assertion every dialog. See `skills/anti-drift`.
- **Compliance review.** Use `docs/COMPLIANCE_REVIEW.md` when asked to audit the session; attribute misses to the dialog, not the harness.

---

## Definition of Done

A feature is done only when **all** of the following are true:

- [ ] Target behavior is implemented
- [ ] Required verification actually ran (tests / lint / type-check / smoke / pack verify / assert_no_stub)
- [ ] Evidence recorded in `feature_list.json` or `progress.md`
- [ ] Repository remains restartable from the standard startup path
- [ ] Local and cloud copies of touched files were synced (local → push)

---

## End of Session / Dialog

Before ending:

1. Update `progress.md` with current state and an **exact** next concrete step ("Next exact") — local → push.
2. Update `feature_list.json` status and evidence fields — local → push.
3. If work is incomplete, refresh `session-handoff.md` including **all** of:
   - Active feature (id + title)
   - **Timing**: last run duration, feature start, elapsed wall time, expected remaining
   - What was done / what remains (actionable)
   - **Resume checklist** (ordered steps for the next agent)
   - **Known failure modes** relevant to current work
4. **Prepend a run entry to `runs.md`** (approx duration, feature, outcome, handoff quality).
5. For substantive rounds: append a short section to `docs/RETRO_ROUND.md`.
6. If a new failure class appeared: append to `docs/HARNESS_LESSONS.md`.
7. If using an Orches identity: update its status / last_activity / next_exact (local Orches cache → push Orches).
8. Prefer short, actionable notes over long narrative.

A fresh agent must be able to resume from files alone (local mirror + GitHub). If the next agent would need to ask “what were we doing?”, the handoff is incomplete. Use `skills/handoff`.

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

When copying the harness into another project, replace project-specific checks in `init.sh`; you need not copy `eval/` or `work/`. Copy `skills/` when you want the process pack.

---

## Escalation

- Architecture or product decisions → consult `docs/` / `TASKS.md` if present, otherwise ask the human.
- Unclear requirements → ask one concrete question; do not invent scope.
- Repeated verification failures → update progress, leave a clear blocker note, stop.
- Dialog limit / drift → mark Orches identity `handoff` or `blocked`, promote `standby_next`, leave work repo restartable.

---

## Pointers (directory page)

| Path | Role |
|------|------|
| `MEMORY.md` | Status, pitfalls, scores, log |
| `docs/HARNESS_LESSONS.md` | Binding failure ledger |
| `docs/SANDBOX_CONTROL.md` | Low-RAM / Grok sandbox discipline (leaf builds, threads=1) |
| `docs/COMPLIANCE_REVIEW.md` | Dialog self-audit (misses = dialog, not harness) |
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
| `skills/` | Progressive-disclosure skill pack (15) |
| `TASKS.md` | Long-running eval program |
| `eval/` | Suites, task packs, historical scores |
| `work/` | Pack implementation workspace |
| `docs/` | PERSISTENCE_TEST, benchmarks, on-demand detail |
| `.grok/README.md` | Grok-oriented notes |

Keep this file short. Put project facts and long lessons in `docs/` or domain files, not here.
