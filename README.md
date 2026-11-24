# agent-harness

Portable, repo-native harness for coding agents (Grok, Claude, Codex, …).

Harness lives **entirely inside the repository**. Any agent can start, continue, and hand off work across dialogs or tools by reading files only—no reliance on chat history.

This repository is also the **measurement home**: multi-session task packs, scores, and duration logs live here. When adopting the harness elsewhere, copy only the core files (below)—not `eval/` or `work/` unless you want the packs.

Inspired by OpenAI Codex (AGENTS.md as directory page), Anthropic long-running harnesses, DeepSeek superagent domain ideas, learn-harness-engineering five-subsystem model, and battle-tested lessons from production use (failure ledger, push gate, exit criteria, skills layer).

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
   - `tools/assert_no_stub.sh` (content integrity)
   - `docs/HARNESS_LESSONS.md`
   - `docs/HARNESS_PUSH_GATE.md`
   - `docs/EXIT_CRITERIA.md`
   - `docs/RETRO_ROUND.md`
   - `skills/` (entire directory — progressive-disclosure skill pack)
   - `.grok/README.md` (optional but recommended for Grok)

2. Edit Mission / `init.sh` / `feature_list.json` / state files for the target project.

3. `chmod +x init.sh audit-harness.sh tools/assert_no_stub.sh` and commit.

## Skills layer

`skills/` contains 15 high-quality process skills (brainstorm, plan, implement, test-tdd, debug, code-review, verify, handoff, yagni, security-basics, anti-drift, ledger, push-gate, propose-improvement, status-report).  
Agents keep only name + description in context; full bodies load on demand. See `skills/README.md`.

## In this meta-repo (eval)

| Path | Role |
|------|------|
| `TASKS.md` | Long-running optimization program |
| `eval/` | Structural/continuity suites + MS task packs + scores |
| `work/` | Pack implementation workspace (MS01 counter, MS02 todo) |
| `docs/PERSISTENCE_TEST.md` | Forced multi-dialog protocol |
| `docs/benchmarks.md` | External yardstick mapping |
| `docs/HARNESS_LESSONS.md` | Binding failure ledger |
| `docs/HARNESS_PUSH_GATE.md` | Anti-placeholder gate |
| `docs/EXIT_CRITERIA.md` | Measurable harness bars |
| `docs/RETRO_ROUND.md` | Round retro template |
| `skills/` | Progressive skill pack |

```bash
./init.sh
./audit-harness.sh
./tools/assert_no_stub.sh
python3 -m eval.run_suite --suite all
```

## Core contract (summary)

| Subsystem | Artifact |
|-----------|----------|
| Instructions | `AGENT.md` (short directory page + invariants) + `skills/` |
| State | `MEMORY.md`, `feature_list.json`, `progress.md`, `runs.md`, `docs/HARNESS_LESSONS.md` |
| Verification | `init.sh` + `audit-harness.sh` + `tools/assert_no_stub.sh` + commands in AGENT.md (+ `eval/` here) |
| Scope | One feature at a time; definition of done requires evidence |
| Lifecycle | Startup checklist + anti-drift assertion + `session-handoff.md` + duration log + RETRO_ROUND |

## Duration & persistence

Every dialog should prepend an entry to `runs.md`. Multi-session packs under `eval/tasks/` add adversarial session gates (e.g. MS02 ledger). Soft-exit bars are defined in `docs/EXIT_CRITERIA.md`.

## Multi-agent orchestration

For multi-dialog / multi-agent management see the companion repo **Orches** (identity profiles + registry). Agent memory and harness stay in the target repositories; Orches only holds unique identities and the orchestration contract.

## License

MIT — see `LICENSE`.
