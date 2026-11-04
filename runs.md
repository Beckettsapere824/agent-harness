# runs.md — Session Run Log

Append-only. Newest entry at the **top**.

Purpose: measure wall-clock duration of each agent run, track outcome, and support analysis of how long the harness stays coherent before handoff or failure.

---

## How to log (mandatory before ending a dialog)

At end of every working session, prepend one block:

```markdown
### YYYY-MM-DD HH:MM (timezone) — duration ~Xm
- **Feature:** F00X or none
- **Outcome:** completed | partial | blocked | failed
- **What advanced:** one-line summary
- **Handoff quality:** clean | incomplete | missing next step
- **Notes:** (optional: context pressure, tool errors, premature-done risk)
```

Rough duration is fine (estimate from first tool call to last commit / handoff write). Prefer real wall-clock over token counts.

---

## Log

### 2026-11-04 ~03:32 HKT — duration ~35m
- **Feature:** F004, F005
- **Outcome:** completed
- **What advanced:** Added runs.md + AGENT/README wiring; wrote docs/PERSISTENCE_TEST.md (hard 3+ leg multi-session protocol)
- **Handoff quality:** clean
- **Notes:** Shifted from easy structural tests to duration + forced handoff testing. Next: F006 or execute the protocol.

### 2026-11-04 ~03:30 HKT — duration ~25m (partial, same dialog)
- **Feature:** F004 (started)
- **Outcome:** partial
- **What advanced:** Introduced runs.md + planned F004–F006
- **Handoff quality:** clean (superseded by later entry)
- **Notes:** Intermediate checkpoint while implementing.
