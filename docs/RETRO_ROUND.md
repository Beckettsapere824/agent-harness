# RETRO_ROUND.md — Round retro template

Fill at the end of each **substantive** dialog/round. Keep short. Append dated sections below the template. Chat-only retros are invalid; this file (or an equivalent dated experiment note) must be written.

## Template

### Meta

- Date:
- Feature / focus:
- Duration (approx):

### What advanced

-

### What failed or stalled

-

### Ceiling hit? (scale / execution / measurement / other)

-

### Optimize next round (max 3 bullets)

1.
2.
3.

### Memory write-back checklist

- [ ] progress.md Next exact updated
- [ ] feature_list.json status/evidence updated if needed
- [ ] session-handoff.md refreshed if work incomplete
- [ ] runs.md entry prepended
- [ ] HARNESS_LESSONS.md if new failure class
- [ ] EXIT_CRITERIA.md if a bar changed

---

## 2026-11-17 — Phase 1+2 hardening

### Meta

- Date: 2026-11-17
- Feature / focus: Phase 1 (HARNESS_LESSONS, PUSH_GATE, assert_no_stub, read-order) + Phase 2 (EXIT_CRITERIA, RETRO_ROUND, audit/eval tightening)
- Duration: single dialog implementation

### What advanced

- Added binding failure ledger and push gate
- Added mechanical `tools/assert_no_stub.sh`
- Added EXIT_CRITERIA and RETRO_ROUND templates
- Strengthened AGENT.md startup/read-order/inject budget and end-of-session rules
- Extended audit-harness.sh and structural/continuity awareness

### What failed or stalled

- MS02 still at S2 gate (intentional; not in scope of this phase)

### Ceiling hit?

- Measurement: soft-exit bars E1/E2/E4–E7 can be claimed after this commit; E3 remains the hard continuity pressure

### Optimize next round

1. Execute MS02 S2 only (done + ledger phase 2) in a fresh dialog
2. Keep AGENT.md short; push further detail into docs/ only
3. After S3, record honest multi-dialog score and update EXIT_CRITERIA E3

### Memory write-back checklist

- [x] progress.md
- [x] feature_list.json (new features for Phase 1/2)
- [x] session-handoff.md
- [x] runs.md
- [x] HARNESS_LESSONS.md
- [x] EXIT_CRITERIA.md
