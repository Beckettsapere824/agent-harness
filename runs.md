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

### 2026-11-04 ~04:10 HKT — duration ~20m
- **Feature:** F006
- **Outcome:** completed
- **What advanced:** Strengthened session-handoff (Timing, Resume checklist, Known failure modes); AGENT.md End of Session documented required fields
- **Handoff quality:** clean
- **Notes:** A done. Ready for B (multi-session test) in fresh dialogs only.

### 2026-11-04 ~03:32 HKT — duration ~35m
- **Feature:** F004, F005
- **Outcome:** completed
- **What advanced:** runs.md + PERSISTENCE_TEST.md
- **Handoff quality:** clean
- **Notes:** Shifted from easy structural tests to duration + forced handoff testing.
