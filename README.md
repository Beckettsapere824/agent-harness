# agent-harness

Portable, repo-native harness for coding agents (Grok, Claude, Codex, …).

Harness lives **entirely inside the repository**. Any agent can start, continue, and hand off work across dialogs or tools by reading files only—no reliance on chat history.

Inspired by OpenAI Codex (AGENTS.md as directory page), Anthropic long-running harnesses, DeepSeek superagent domain ideas, learn-harness-engineering five-subsystem model, and a minimal personal pattern from `c-machine-learning`.

## Quick start — copy into any repo

1. Copy these files into the target repository root:

   - `AGENT.md`
   - `MEMORY.md`
   - `feature_list.json`
   - `progress.md`
   - `session-handoff.md`
   - `init.sh`
   - `.grok/README.md` (optional but recommended for Grok)

2. Edit:

   - **AGENT.md** → Mission paragraph; verification commands section.
   - **init.sh** → real project checks (`npm test`, `pytest`, `cargo test`, …).
   - **feature_list.json** → replace template features with your actual work items.
   - **MEMORY.md** / **progress.md** → clear template status; write current state.

3. Make init executable:

   ```bash
   chmod +x init.sh
   ```

4. Commit. From then on, every agent (including a fresh Grok dialog with GitHub connector) should:

   - Read `AGENT.md` first
   - Follow the startup workflow
   - Update state files before ending the session

## Core contract (summary)

| Subsystem | Artifact |
|-----------|----------|
| Instructions | `AGENT.md` (short directory page + invariants) |
| State | `MEMORY.md`, `feature_list.json`, `progress.md` |
| Verification | `init.sh` + commands listed in AGENT.md |
| Scope | One feature at a time; definition of done requires evidence |
| Lifecycle | Startup checklist + `session-handoff.md` |

## Design notes

- **Short root file.** Keep `AGENT.md` ~80–120 lines. Put architecture/product detail under `docs/` and load on demand.
- **Evidence over claims.** “Done” only with runnable verification recorded in files.
- **Progressive disclosure.** High performance does not require full context coverage; it requires correct selection, durable state, and hard gates.
- **Any agent.** The harness must work even if the agent has never seen this template before.

## Template repo contents

| Path | Role |
|------|------|
| `PLAN.md` | Design plan and success criteria |
| `RAW_MATERIALS.md` | Synthesized sources from frontier labs and open practices |
| Core files above | What you copy |

## License

Use freely; adapt to your projects. Attribution appreciated but not required.
