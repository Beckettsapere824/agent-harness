---
name: status-report
description: Emit a structured status suitable for Orches registry or human dashboard.
---

# status-report

## When to use
On request, at handoff, or when an Orches identity needs to update the registry.

## Format (copy into registry or identity)
- id
- status (active | blocked | handoff | finished)
- current_focus
- next_exact
- blockers (if any)
- last_activity (date)
- one-line evidence or risk note

Keep it short. Prefer updating the identity file and registry.md over long narrative.
