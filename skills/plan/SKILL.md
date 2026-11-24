---
name: plan
description: Produce an ordered, verifiable step list for the single active feature before any file edits.
---

# plan

## When to use
Before implementing a feature or after brainstorm selects a direction.

## Steps
1. Confirm the single active feature from feature_list.json.
2. Break work into the smallest sequence of verifiable steps.
3. Each step must end with a checkable outcome (command, file state, or test).
4. Identify the exact next step (“Next exact”).
5. Write the plan into progress.md (replace any vague “continue”).

## Rules
- One feature only.
- No step may assume later steps already exist.
- If the plan exceeds a single dialog, mark the handoff boundary explicitly.
