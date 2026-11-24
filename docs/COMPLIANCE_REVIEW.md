# COMPLIANCE_REVIEW.md — Dialog Self-Audit Checklist

**Purpose:** Any dialog (including a human asking “复查一下”) can walk this list against *this session’s behavior* and the current repo state.

---

## Critical framing (read first)

> **This document is for reviewing the *dialog / agent session*, not the harness.**
>
> If something on this list was skipped or violated, that means **the dialog forgot or drifted** — it does **not** mean the harness is wrong, incomplete, or needs redesign.
>
> **Do not modify harness contracts, AGENT.md, skills, or Orches schema solely because a compliance review found misses.** Fix the session (catch up on missed steps, update handoff, push). Only change the harness when a *design* defect is separately diagnosed with evidence.

Report findings as: `DIALOG_MISS: <item-id>` not `HARNESS_BUG`.

---

## Master index (complete review set)

When the human says **「复查」 / 「按合规复查」 / 「compliance review」**, the agent **must** execute **all** of the following in order — this is the single index. Do not invent a shorter private list.

| Step | Artifact | Action |
|------|----------|--------|
| 0 | This file | Re-read framing above |
| 1 | Sections A–F below | Check every item; mark pass / `DIALOG_MISS: <id>` |
| 2 | `docs/action-ledger.md` (or `work/action-ledger.md` if present) | Confirm recent durable actions were logged |
| 3 | `progress.md` + `session-handoff.md` | Confirm Next exact + handoff fields if work incomplete |
| 4 | Orches identity (if any) | Confirm status/last_activity match reality |
| 5 | Remediation | Fix misses in-session if possible; else write exact catch-up into handoff |
| 6 | Review log | Append one row to the log table at the bottom |

**Recommended cadence (soft, not a platform force):**

- Once after startup assertion (quick pass on A + B)
- Once before claiming any feature `done`
- Once when the human asks
- Optional: mid-session if the dialog feels drifted

Iteration effect (honest): repeated review **raises observed compliance** (e.g. rough 50% → 90% on attended sessions) but does **not** become mathematical 99% hard enforcement — a determined skip still works until an external gate (CI/branch) blocks merge.

---

## How to run a review

1. Load this file + `AGENT.md` + (if used) the Orches identity.
2. Answer each checkbox from **files and tool history of this session**, not from intent.
3. For each miss: remediate in-session if still possible; otherwise record in `session-handoff.md` / `progress.md` for the next identity.
4. Append a one-line note under **Review log**.

---

## A. Startup

- [ ] **A1** Read order completed: `AGENT.md` → `MEMORY.md` → `docs/HARNESS_LESSONS.md` → (skim exit criteria) → `feature_list.json` → `progress.md` → handoff/runs → `./init.sh` as applicable → skills README skim only
- [ ] **A2** Local mirror / session-contract written or refreshed
- [ ] **A3** Anti-drift assertion stated (identity/harness, read order, active feature, next exact, local mirror)
- [ ] **A4** If Orches identity assigned: loaded; status is `active` (not standby)

## B. Scope & identity

- [ ] **B1** Exactly one active feature worked this session
- [ ] **B2** No reuse of another live identity; standby not used without promotion
- [ ] **B3** Stayed inside identity authority_boundaries (if any)

## C. Sync discipline

- [ ] **C1** Every durable edit: local first → immediate push
- [ ] **C2** Local mirror and GitHub aligned for touched files
- [ ] **C3** Orches identity status / last_activity updated when using Orches

## D. Verification & honesty

- [ ] **D1** No `done` claim without runnable verification evidence recorded
- [ ] **D2** Multi-session pack gates / ledger phases respected
- [ ] **D3** Failures reported honestly; no silent scope rewrite

## E. End of session / durable actions

- [ ] **E1** `progress.md` has **Next exact**
- [ ] **E2** `feature_list.json` updated if relevant
- [ ] **E3** Incomplete work → handoff has Timing, Resume checklist, Known failure modes
- [ ] **E4** `runs.md` prepended
- [ ] **E5** Substantive round → retro touch if required
- [ ] **E6** Durable actions appended to action-ledger (see `docs/action-ledger.md`)

## F. Explicit non-goals of this review

- Do **not** treat a miss as a reason to expand AGENT.md into an encyclopedia
- Do **not** add skills solely to paper over a skipped existing skill
- Do **not** weaken sync or unique-identity rules because compliance was hard
- Do **not** change harness because of `DIALOG_MISS` findings

---

## Review log (newest first)

| Date | Identity / dialog | Misses | Remediated? |
|------|-------------------|--------|-------------|
| (none yet) | | | |
