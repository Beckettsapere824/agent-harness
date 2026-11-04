# agent-harness

Portable, repo-native harness for coding agents (Grok, Claude, Codex, …).

Harness lives **entirely inside the repository**. Any agent can start, continue, and hand off work across dialogs or tools by reading files only—no reliance on chat history.

This repository is also the **measurement home**: multi-session task packs, scores, and duration logs live here. When adopting the harness elsewhere, copy only the core files (below)—not `eval/` or `work/` unless you want the packs.

Inspired by OpenAI Codex (AGENTS.md as directory page), Anthropic long-running harnesses, DeepSeek superagent domain ideas, learn-harness-engineering five-subsystem model, and a minimal personal pattern from `c-machine-learning`.

## Quick start — copy into any repo

1. Copy these **core** files into the target repository root:

   - `AGENT.md`
   - `MEMORY.md`
   - `feature_list.json`
   - `progress.md`
   - `session-handoff.md`
   - `runs.md` (session duration log)
   - `init.sh`
   - `audit-harness.sh` (optional self-check)
   - `.grok/README.md` (optional but recommended for Grok)

2. Edit Mission / `init.sh` / `feature_list.json` / state files for the target project.

3. `chmod +x init.sh audit-harness.sh` and commit.

## In this meta-repo (eval)

| Path | Role |
|------|------|
| `TASKS.md` | Long-running optimization program |
| `eval/` | Structural/continuity suites + MS task packs + scores |
| `work/` | Pack implementation workspace (MS01 counter, MS02 todo) |
| `docs/PERSISTENCE_TEST.md` | Forced multi-dialog protocol |
| `docs/benchmarks.md` | External yardstick mapping |

```bash
./init.sh
./audit-harness.sh
python3 -m eval.run_suite --suite all
```

## Core contract (summary)

| Subsystem | Artifact |
|-----------|----------|
| Instructions | `AGENT.md` (short directory page + invariants) |
| State | `MEMORY.md`, `feature_list.json`, `progress.md`, `runs.md` |
| Verification | `init.sh` + commands in AGENT.md (+ `eval/` here) |
| Scope | One feature at a time; definition of done requires evidence |
| Lifecycle | Startup checklist + `session-handoff.md` + duration log |

## Duration & persistence

Every dialog should prepend an entry to `runs.md`. Multi-session packs under `eval/tasks/` add adversarial session gates (e.g. MS02 ledger).

## License

MIT — see `LICENSE`.
