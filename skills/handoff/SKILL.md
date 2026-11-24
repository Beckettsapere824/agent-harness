---
name: handoff
description: Produce a complete cross-dialog handoff so a fresh agent can resume from files alone.
---

# handoff

## When to use
End of every dialog that leaves work unfinished, or when switching identities.

## Required fields in session-handoff.md
- Active feature (id + title)
- Timing (last run duration, feature start, elapsed, expected remaining)
- What was done / what remains (actionable)
- Resume checklist (ordered)
- Known failure modes relevant to current work

Also:
- progress.md must contain an exact “Next exact” step.
- Prepend a runs.md entry (duration, feature, outcome, handoff quality).
