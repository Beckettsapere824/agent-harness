# EXIT_CRITERIA.md — Measurable bars for this harness template

Updated: 2026-11-17 (Phase 2)

These bars define when the *harness itself* is considered sufficiently reliable for a given claim. They are independent of any product built on top of the harness.

## Thesis

A portable, repo-native harness is successful when a fresh agent (zero chat history) can resume correctly, leave measurable evidence, and cannot silently violate scope or content integrity.

## Exit bars

| ID | Bar | Status |
|----|-----|--------|
| **E1** | Structural suite ≥ 90 | Met (static ceiling 100 as of 2026-11-03) |
| **E2** | Continuity suite ≥ 90 | Met (static ceiling 100 as of 2026-11-03) |
| **E3** | MS02 fair multi-dialog (S1→S2→S3 across real dialogs) ≥ 75 with honest ledger | In progress (S1 done) |
| **E4** | Push-gate + assert_no_stub present and enforced in AGENT.md | Met (Phase 1) |
| **E5** | HARNESS_LESSONS.md binding + at least one real failure class recorded | Met (Phase 1) |
| **E6** | progress.md always contains "Next exact"; session-handoff contains Timing + Resume checklist + Known failure modes when incomplete | Met (template + audit) |
| **E7** | RETRO_ROUND write required for substantive rounds; runs.md duration logged | Met (Phase 2) |

### Soft exit (template ready to copy)

**DECLARED when E1 ∧ E2 ∧ E4 ∧ E5 ∧ E6 ∧ E7 are green.**  
E3 remains the primary ongoing pressure test; soft-exit does not require E3 complete.

### Hard exit residual

- E3 completed with ≥ 3 real dialog boundaries and score ≥ 75
- Optional external yardstick mapping exercised at least once (see docs/benchmarks.md)

## How agents use this file

- On startup, after AGENT.md and MEMORY.md, skim current status of open bars.
- Do not claim "harness complete" while E3 is still open unless the claim is explicitly limited to soft-exit.
- Evidence for bar changes goes into `eval/scores/`, `MEMORY.md`, or `docs/experiments/` if created.
