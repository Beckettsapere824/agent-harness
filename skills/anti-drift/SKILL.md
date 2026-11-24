---
name: anti-drift
description: Enforce identity assertion and mandatory startup checklist so the agent cannot silently leave the harness contract.
---

# anti-drift

## When to use
At the very start of every dialog, and whenever context feels uncertain.

## Required startup assertion
Before any other work the agent must be able to state:
1. Which identity (Orches agents/<id>.md) or which repo harness it is operating under.
2. That it has completed the mandatory read order in AGENT.md.
3. The single active feature id from feature_list.json.
4. The exact next step from progress.md or session-handoff.md.

If any item cannot be answered from files, stop and repair the handoff or identity before proceeding.

## Rule
Chat history is not a substitute for the assertion. Files only.
