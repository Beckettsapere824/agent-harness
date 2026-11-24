# COMPLIANCE_REVIEW.md — Dialog Self-Audit Checklist

**Purpose:** Any dialog (including a human asking “复查一下”) can walk this list against *this session’s behavior* and the current repo state.

---

## Critical framing (read first)

> **This document is for reviewing the *dialog / agent session*, not the harness.**
>
> If something on this list was skipped or violated, that means **the dialog forgot or drifted** — it does **not** mean the harness is wrong, incomplete, or needs redesign.
>
> **Do not modify harness contracts, AGENT.md, skills, or Orches schema solely because a compliance review found misses.** Fix the session (catch up on missed steps, update handoff, push pending state). Only change the harness when a *design* defect is separately diagnosed with evidence.

Reviewers should report findings as: `DIALOG_MISS: <item>` not `HARNESS_BUG: ...`.

---

## How to run a review

1. Load this file + `AGENT.md` + (if used) the Orches identity.
2. Answer each checkbox from **files and tool history of this session**, not from intent.
3. For each miss: remediate in-session if still possible; otherwise record in `session-handoff.md` / `progress.md` for the next identity.
4. Optionally append a one-line note under **Review log** at the bottom (date, identity, miss count).

---

## A. Startup

- [ ] Read order completed: `AGENT.md` → `MEMORY.md` → `docs/HARNESS_LESSONS.md` → (skim exit criteria) → `feature_list.json` → `progress.md` → handoff/runs → `./init.sh` as applicable → skills README skim only
- [ ] **Local mirror / session-contract** written or refreshed (paths per Orches identity if any)
- [ ] **Anti-drift assertion** stated: identity/harness, read order done, single active feature id, next exact, local mirror present
- [ ] If Orches identity assigned: identity file loaded; status is `active` (not standby)

## B. Scope & identity

- [ ] Exactly **one** active feature (`in_progress`) worked this session
- [ ] Did not reuse another live identity; standby not used as active without promotion
- [ ] Work stayed inside authority_boundaries of the identity (if any)

## C. Sync discipline

- [ ] Every durable edit: **local first → immediate push** (no end-of-dialog-only batch)
- [ ] Touched state files updated on both local mirror and GitHub where applicable
- [ ] Orches identity status / last_activity updated when using Orches

## D. Verification & honesty

- [ ] No `done` claim without runnable verification evidence recorded
- [ ] Multi-session pack gates / ledger phases respected (no fabricated burst ledger)
- [ ] Failures reported as failures; no silent scope rewrite to hide unfinished work

## E. End of session

- [ ] `progress.md` has **Next exact** (command/file/phase — not “continue”)
- [ ] `feature_list.json` status/evidence updated if relevant
- [ ] Incomplete work → `session-handoff.md` has Timing, Resume checklist, Known failure modes
- [ ] `runs.md` prepended with duration/outcome
- [ ] Substantive round → `docs/RETRO_ROUND.md` touch if required by AGENT.md
- [ ] New failure *class* (not one-off forgetfulness) → append `docs/HARNESS_LESSONS.md` only when it is a reusable lesson

## F. Explicit non-goals of this review

- Do **not** treat a miss as a reason to expand AGENT.md into an encyclopedia
- Do **not** add new skills solely to paper over a dialog that skipped existing ones
- Do **not** weaken sync or unique-identity rules because compliance was hard

---

## Review log (optional, newest first)

| Date | Identity / dialog | Misses (count or ids) | Remediated? |
|------|-------------------|------------------------|-------------|
| (none yet) | | | |
