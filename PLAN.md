# PLAN.md — Portable Repo-Native Agent Harness

**Version:** 1.0  
**Status:** Active  
**Target:** Grok.com (GitHub connector) + any coding agent; harness lives entirely inside the repository.

---

## Goal

A single, copyable harness that:

1. Lives **entirely in the repo** (cloud source of truth).
2. Enables **cross-dialog continuity** on Grok.com via GitHub connector; any agent (even with zero prior harness knowledge) can read/write without destroying the environment.
3. Matches or exceeds frontier reliability (Codex / Claude Code / Anthropic long-running / DeepSeek domain patterns) while remaining lightweight and progressive.
4. Is easy to fork into different project versions.

## Design Principles (synthesized)

| Principle | Source |
|-----------|--------|
| Repository is the system of record | OpenAI Codex, course L03, your c-machine-learning |
| AGENTS.md / AGENT.md = short directory page (~80–120 lines), not encyclopedia | Codex |
| Progressive disclosure + on-demand loading | Claude Code layered memory, Codex Write-Select-Compress-Isolate |
| Five subsystems: Instructions / State / Verification / Scope / Lifecycle | learn-harness-engineering |
| One feature / one unit of work at a time + evidence before “done” | Anthropic initializer+coding agent, course L07–L10 |
| Append-oriented state + clean handoff | Anthropic claude-progress.txt + git, course session-handoff |
| Default-FAIL verification; independent of model self-praise | Anthropic cwc-long-running-agents, Claude Code hooks |
| Minimal concepts, attention economy | DeepSeek dsh-superagent philosophy |
| Act only when asked or rule allows; speak only when human must act or can use result | DeepSeek |
| Environment isolation where available (worktree / sandbox) | Codex, xAI grok-build |

**Performance vs context coverage:** High reliability does **not** require loading everything. It requires correct selection into the window, reliable persistence of what leaves it, and hard external gates the model cannot talk around.

## v1 File Layout (copy these into any target repo)

```
.
├── AGENT.md                 # Entry point (directory page + invariants + startup)
├── MEMORY.md                # Persistent memory / status / pitfalls / log (newest on top)
├── feature_list.json        # Structured scope + done evidence
├── progress.md              # Current work, next step, blockers
├── session-handoff.md       # Explicit cross-dialog / cross-agent handoff
├── init.sh                  # Startup health + verification entrypoint
├── .grok/
│   └── README.md            # Grok-oriented pointer (compatible with your existing habit)
├── docs/                    # Optional detailed knowledge (loaded on demand)
│   └── (architecture, product, etc.)
└── PLAN.md / RAW_MATERIALS.md  # Only in the template repo itself
```

## Behavior Contract (enforced by AGENT.md text)

**Startup (any agent):**
1. Read `AGENT.md` fully.
2. Read `MEMORY.md` (latest status).
3. Run `./init.sh` (or documented equivalent).
4. Read `feature_list.json`; pick **exactly one** unfinished feature.
5. Read `progress.md` / `session-handoff.md` if present.
6. Load further docs only as needed.

**During work:**
- Stay inside the chosen feature’s scope.
- Update `progress.md` and `feature_list.json` as evidence accumulates.
- Do not mark done without runnable verification evidence.

**End of session / dialog:**
- Update state files.
- Write or refresh `session-handoff.md` if work is incomplete.
- Leave the repo in a state where the next agent can run `./init.sh` immediately.

## Implementation Steps (this repo)

1. ✅ RAW_MATERIALS.md written.
2. ✅ This PLAN.md written.
3. Land core templates: AGENT.md, MEMORY.md, feature_list.json, progress.md, session-handoff.md, init.sh, .grok/README.md, README.md.
4. Keep templates generic; project-specific content is filled after copy.
5. Later: optional audit script, version metadata, multi-agent notes, example migration of c-machine-learning.

## Non-goals for v1

- Full multi-agent orchestration runtime (DeepSeek-style domain model is reference only).
- Hook / plugin runtime (Claude Code / grok-build style) — document extension points only.
- Heavy Node/TS scaffolding; prefer shell + markdown + JSON so any agent can use it.

## Success Criteria

- A fresh Grok dialog with only GitHub connector can open this (or a target) repo, follow AGENT.md, and continue previous work solely from files.
- An agent without harness training still leaves the repo restartable.
- Copying the core files into a new repo + editing Mission / verification commands / feature_list is sufficient to adapt.
