---
name: test-tdd
description: Write a failing test (or verification) first, then the minimal code that makes it pass.
---

# test-tdd

## When to use
Any behavioral change that can be checked by a command or script.

## Steps
1. Write or extend the failing test / verify script.
2. Run it and confirm it fails for the right reason.
3. Implement the minimal change.
4. Re-run until green.
5. Record the command and result as evidence.

## Notes
Prefer existing verify.sh / init.sh / suite commands. Do not invent a large test framework unless the feature requires it.
