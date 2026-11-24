---
name: yagni
description: Prefer the smallest change; delete or reuse before adding abstraction.
---

# yagni

## When to use
Any design or implementation decision that could grow scope.

## Rules
- Do not add a new file, layer, or dependency unless the current feature cannot be completed without it.
- Prefer editing an existing function over creating a parallel one.
- If a comment says “for future use”, delete the future-use code.
- Record the deliberate non-action in progress.md when relevant.
