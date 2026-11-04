# Multi-session task packs

Each pack under `msXX_*/` defines a small software goal split across sessions.
The agent must leave state only in the repo so the next session can continue.

## Pack layout (convention)

```
ms01_counter/
  SPEC.md           # overall goal + session boundaries
  verify.sh         # golden checks; exit 0 = pass
```

Agent workspace for implementations: repo-root `work/` (shared).

See SPEC files in each pack. Runtime state and scores: `work/`, `eval/scores/`.
