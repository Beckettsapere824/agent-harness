# skills/ — Progressive Disclosure Skill Pack

This directory is the skills layer for the portable harness.

## Contract

- Each skill lives in its own folder: `skills/<name>/SKILL.md`.
- Front-matter must contain at least `name` and `description`.
- Agents keep only name + description in context by default.
- Full body is loaded only when the skill is selected (by name match or explicit request).
- Total skills kept ≤ 20; quality over quantity.

## Current pack (15)

| Skill | When to use |
|-------|-------------|
| brainstorm | Vague request → structured options + decision |
| plan | Produce ordered, verifiable steps before edits |
| implement | Single-feature implementation with scope lock |
| test-tdd | Write failing test first, then minimal code |
| debug | Systematic root-cause diagnosis |
| code-review | Structured review + risk notes |
| verify | Mechanical verification + evidence recording |
| handoff | Exact next step, timing, resume checklist |
| yagni | Prefer deletion / reuse / zero new abstraction |
| security-basics | Lightweight security checklist for the change |
| anti-drift | Identity assertion + required startup checklist |
| ledger | Multi-session phase ledger discipline |
| push-gate | No-stub / content-integrity enforcement |
| propose-improvement | Feed improvements back to base harness |
| status-report | Structured status for Orches registry |

## Discovery rule (for AGENT.md)

On startup, after the mandatory read order, an agent may skim this README and the descriptions. Full skill bodies are loaded on demand only.
