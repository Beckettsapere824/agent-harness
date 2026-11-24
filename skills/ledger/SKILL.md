---
name: ledger
description: Maintain an append-only multi-session phase ledger; never collapse session boundaries.
---

# ledger

## When to use
Any multi-dialog pack (MS*) or long-running feature that defines explicit phases.

## Rules
- Append a ledger entry only at the end of the phase the current dialog is allowed to complete.
- Never write future phases in advance.
- One-shot completion of multiple phases in a single dialog is a failure (score honesty).
- Ledger format is defined by the pack SPEC; default is a JSON array of {phase, session, note}.
