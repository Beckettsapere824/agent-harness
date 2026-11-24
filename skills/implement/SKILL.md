---
name: implement
description: Implement exactly one unfinished feature under scope lock; produce evidence before claiming done.
---

# implement

## When to use
After plan is written and the next exact step is clear.

## Rules
- Touch only files required by the active feature.
- Do not start a second feature.
- After each meaningful change, run the relevant verification command.
- Record evidence in feature_list.json or progress.md before marking status=done.
- Leave the repository restartable (init.sh must pass).

## Definition of done (re-stated)
Target behavior implemented + verification ran + evidence recorded + repo restartable.
