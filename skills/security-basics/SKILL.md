---
name: security-basics
description: Lightweight security checklist for the change under review.
---

# security-basics

## When to use
Before pushing changes that touch input handling, auth, secrets, file writes, or external calls.

## Checklist
- No secrets or tokens committed.
- Inputs validated or rejected at the boundary.
- File/path operations stay inside intended directories.
- No new eval/exec of untrusted strings.
- Dependency additions are justified and pinned if critical.

## Output
One-line pass or list of issues in the review / progress note.
