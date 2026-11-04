# runs.md — Session Run Log

Append-only. Newest entry at the **top**.

Purpose: measure wall-clock duration of each agent run, track outcome, and support analysis of how long the harness stays coherent before handoff or failure.

---

## How to log (mandatory before ending a dialog)

At end of every working session, prepend one block:

```markdown
### YYYY-MM-DD HH:MM (timezone) — duration ~Xm
- **Feature:** F00X / MS02 / none
- **Outcome:** completed | partial | blocked | failed
- **What advanced:** one-line summary
- **Handoff quality:** clean | incomplete | missing next step
- **Notes:** (optional)
```

---

## Log

### 2026-11-04 ~14:20 HKT — duration ~25m
- **Feature:** F008 + MS02 (state only)
- **Outcome:** completed (merge); MS02 still in_progress at S2 gate
- **What advanced:** Merged agent-harness-test eval/work/scores into agent-harness; preserved F001–F006 portable core; handoff points at MS02 S2
- **Handoff quality:** clean
- **Notes:** Next dialog must only do S2 (done + ledger phase 2).

### 2026-11-04 ~04:10 HKT — duration ~20m
- **Feature:** F006
- **Outcome:** completed
- **What advanced:** Strengthened session-handoff + AGENT.md End of Session
- **Handoff quality:** clean
- **Notes:** —

### 2026-11-04 ~03:32 HKT — duration ~35m
- **Feature:** F004, F005
- **Outcome:** completed
- **What advanced:** runs.md + PERSISTENCE_TEST.md
- **Handoff quality:** clean
- **Notes:** —
