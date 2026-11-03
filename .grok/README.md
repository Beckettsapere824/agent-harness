# .grok / agent harness

This directory and the root harness files (`AGENT.md`, `MEMORY.md`, `feature_list.json`, `progress.md`, `session-handoff.md`, `init.sh`) are the **persistent harness** so any agent—including Grok on grok.com with GitHub connector—can continue work without the original chat.

| File | Purpose |
|------|---------|
| `../AGENT.md` | Operating contract, startup workflow, invariants |
| `../MEMORY.md` | Status, pitfalls, log |
| `../feature_list.json` | Structured scope + evidence |
| `../progress.md` | Live continuity |
| `../session-handoff.md` | Explicit handoff |
| `../init.sh` | Startup + verification |

Optional future: model-specific notes or skill pointers. Prefer keeping the root AGENT.md short and loading details on demand.
