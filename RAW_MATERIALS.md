# RAW_MATERIALS.md — Frontier Harness Engineering Synthesis

Single document consolidating relevant information from:
- https://github.com/Beckettsapere824/c-machine-learning (simple personal harness)
- https://github.com/walkinglabs/learn-harness-engineering (course + frontier breakdowns)
- https://github.com/Beckettsapere824/Library (Harness-Frameworks + Agents catalogs)

Goal: enable a portable, high-performance, repo-native harness that works across Grok.com dialogs via GitHub connector, without destroying any agent's working environment.

---

## 1. Simple Personal Harness (c-machine-learning)

### Core files (the minimal viable harness)

| File | Role |
|------|------|
| `AGENT.md` | Operating contract for **any** agent. Entry point. Mission, non-negotiables, workflow, current priority. |
| `MEMORY.md` | Persistent project memory. Newest entries at top. Status, formula/render pitfalls, log. |
| `CONSTRUCTION.md` | Construction standard / writing norms for the domain (node structure, bilingual rules, KaTeX pitfalls). |
| `.grok/README.md` | Points to the above; notes that this directory + root files are the persistent harness. |
| `data/prerequisite_tree.yaml` | Source of truth for structured plan (思路, prereqs, success criteria). |

### Design principles observed

- **Repo is the system of record.** Chat history is ephemeral; all durable state lives in files.
- **Progressive reading order**: AGENT.md → MEMORY.md → CONSTRUCTION.md → YAML.
- **Any agent can continue**: explicit “Operating Contract for Any Agent”.
- **Non-negotiables** listed first (YAML first, guided narrative, bilingual, safe KaTeX, live check, record bugs same session).
- **Status + Log** keep continuity across sessions/dialogs.
- **Domain-specific construction standard** (CONSTRUCTION.md) separate from agent operating rules.

### Limitations of the simple version
- No explicit verification gate / init script.
- No feature_list.json or structured scope control.
- No session-handoff template.
- No progressive disclosure beyond the three files.
- No audit tooling.
- Context coverage is high for this small project but would bloat for larger ones.

---

## 2. Five-Subsystem Framework (learn-harness-engineering)

From the course core and harness-creator skill:

| Subsystem | Minimal artifact | Purpose |
|-----------|------------------|---------|
| **Instructions** | `AGENTS.md` / `CLAUDE.md` / `AGENT.md` | Startup path, working rules, definition of done. Keep short; act as directory page. |
| **State** | `feature_list.json`, `progress.md` / `MEMORY.md` | Current feature, status, evidence, next step. Append-oriented. |
| **Verification** | `init.sh` or documented commands | Tests/checks the agent **must** run before claiming done. |
| **Scope** | Feature dependencies + done criteria | One feature at a time; prevent overreach and half-finished work. |
| **Session Lifecycle** | `session-handoff.md`, end-of-session routine, `init.sh` | Initialize cleanly; leave restartable state for next session/dialog. |

### Harness pattern (text)

```
You → give task → Agent reads harness files → Agent executes
                                          |
                                harness governs every step:
                                +--> Instructions
                                +--> Scope (one feature)
                                +--> State (progress / feature_list)
                                +--> Verification (must pass)
                                +--> Lifecycle (init + clean handoff)
                                          |
                                          v
                                 Agent stops only when verification passes
```

### Key lectures distilled

- **L01**: Capable agents still fail without harness (context loss, premature “done”, overreach).
- **L02**: Harness = environment + state + verification + control, not just better prompts.
- **L03**: Repository must be the system of record.
- **L04**: One giant instruction file fails → progressive disclosure / directory-page pattern.
- **L05**: Long-running tasks lose continuity → explicit state + handoff.
- **L06**: Initialization needs its own phase (`init.sh`).
- **L07**: Agents overreach and under-finish → hard scope + definition of done.
- **L08**: Feature lists are harness primitives.
- **L09–L10**: Agents declare victory too early; only end-to-end verification counts.
- **L13–L14**: Loop engineering and graph engineering (maker-checker, fan-out, conditional edges) for higher performance when single loop is insufficient.

### harness-creator skill (production templates)

Produces:
- Short `AGENTS.md` (routing + invariants)
- `feature_list.json` (+ schema)
- `progress.md`
- `init.sh`
- Optional `session-handoff.md`

Design rules:
- Keep root instruction file short.
- Put project facts in project docs.
- Make verification commands explicit and runnable.
- Require evidence before marking done.
- One active feature unless multi-agent ownership is explicit.
- Prefer append/update state files over chat history.
- Never hide destructive behavior.

---

## 3. Frontier Product Breakdowns (Aug 2026 section)

### 3.1 Claude Code (Anthropic)

- **Instructions**: Layered memory — org / user / project / local CLAUDE.md + auto-memory (≤200 lines / 25 KB). Subdirectory CLAUDE.md loaded on demand.
- **Context**: Five-layer compaction pipeline (lossless prune → structured distill → lossy summary + circuit breakers). Append-oriented `history.jsonl`.
- **Tools / Extensions**: Skills (procedural knowledge), MCP, Hooks (PreToolUse / PostToolUse / Stop), Subagents (isolated sidechain context).
- **Feedback**: Permission modes + deterministic hooks that force checks and block premature “done”.
- **Worth adopting**: Scope-layered instructions; staged compaction; hooks for verification; subagent context isolation; append-only session storage.

### 3.2 Codex (OpenAI)

- **Philosophy**: Repository is the system of record. AGENTS.md is only a **directory page** (~100 lines), points to `docs/`.
- **Instructions**: Enforce invariants, do not micromanage implementation. Verification commands live in the specification.
- **Context**: Write–Select–Compress–Isolate. Only environment deltas are injected.
- **Environment**: Git worktree isolation per task + local observability.
- **Subagents**: Core `spawn_agent` / `wait_agent` with independent context.
- **Worth adopting**: Directory-page AGENTS.md; invariants-only; worktree isolation; verification commands as first-class; subagent isolation.

### 3.3 Pi

- Minimal kernel + programmable expansion.
- Context engineering via “minimal system prompt + on-demand loading”.
- Worth adopting: extreme progressive disclosure; programmable extension points.

### 3.4 DeepSeek Harness

- “Everything is a plugin”, including the agent loop itself.
- Capability seams + event pipeline.
- Worth adopting: plugin architecture for tools/skills/lifecycle; model-independent runtime.

---

## 4. Catalog of Related Frameworks (Library/Harness-Frameworks.md)

Relevant references for further study / selective adoption:

- openai/codex — terminal coding agent reference
- xai-org/grok-build — SpaceXAI / xAI coding-agent harness + TUI, skills, MCP, subagents
- deepseek-ai/deepseek-harness — “everything is a plugin”
- HKUDS/OpenHarness + walkinglabs/learn-harness-engineering — open implementation + learning path
- oraios/serena — MCP semantic retrieval/editing
- browser-use, alibaba/page-agent — browser/page control gap
- Multi-agent / swarm: ClawTeam, MiroFish, etc. (evaluate security carefully)

Also: Anthropic “Effective harnesses for long-running agents” and OpenAI “Harness engineering” papers are the primary theory sources.

---

## 5. Context Coverage vs Performance Tension

**Observed trade-off**:

- High context coverage (loading everything) → better local coherence but burns tokens, increases latency, and eventually triggers aggressive compaction that loses nuance.
- Frontier practice converges on **progressive disclosure + selective loading**:
  - Root file = short directory / routing + hard invariants.
  - Domain knowledge, construction standards, detailed plans live in separate files loaded on demand.
  - State is append-only and small (progress + feature status).
  - Verification is externalized to runnable commands, not stored as long prose in context.
  - Subagents / worktrees isolate secondary context so the main loop stays lean.

**High performance does not require full context coverage.** It requires:
1. Correct *selection* of what enters the window,
2. Reliable *persistence* of what leaves the window,
3. Hard *gates* (verification, scope) that the model cannot talk its way around.

---

## 6. Grok.com + GitHub Connector Specific Constraints

- Harness must live **entirely inside the target repo** (cloud).
- Grok runs in SpaceXSI sandbox and reads/writes via GitHub tools.
- Any agent (even one with no prior harness knowledge) must be able to:
  1. Discover the entry point (AGENT.md / AGENTS.md),
  2. Follow the startup workflow,
  3. Update state files,
  4. Leave the repo in a restartable condition,
  without relying on chat history or external secrets.
- Cross-dialog continuity = files only. No reliance on Grok “memory” features outside the repo.
- Destructive operations (force-push, overwrite, delete) must be explicit and gated.

---

## 7. Selective Adoption Candidates for agent-harness

From the materials, the highest-ROI, portable pieces are:

1. **Short AGENT.md / AGENTS.md as directory page** (Codex + simple harness).
2. **MEMORY.md / progress.md + feature_list.json** for state (simple + course).
3. **CONSTRUCTION.md or domain docs** for project-specific norms (simple).
4. **init.sh + explicit verification commands** (course + Claude/Codex).
5. **session-handoff.md** for multi-dialog / multi-agent handoff (course).
6. **Layered / on-demand loading** instead of one giant file (Claude + Codex).
7. **Definition of Done that requires runnable evidence** (all frontier).
8. **Optional hooks / skills later** if Grok tooling supports them; not required for v1.
9. **Audit script** (audit-harness.sh or validate-harness.mjs pattern) for self-check.
10. **Versioning strategy**: harness itself versioned inside the repo; easy to fork/adapt per project.

These form the raw material for the selective plan that follows.
