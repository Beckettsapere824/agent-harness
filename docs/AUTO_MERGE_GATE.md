# AUTO_MERGE_GATE.md — External hard gate (no human review required)

Optional path toward unattended merge **without** relying on dialog hooks.

## Model

1. Agent works on a branch (or opens a PR).
2. **CI** runs factory-owned checks (tests, `assert_no_stub`, pack verify, lint).
3. If CI is green, **automation merges** (branch protection allows merge only via green checks; no human approval required if you configure it that way).
4. Agent (or next dialog) reads merge/check status via GitHub connector and updates progress / action-ledger.

Human review is **optional**, not required by this design. You can still require it later by flipping branch rules.

## What is “hard”

| Gate | Enforced by | Bypass |
|------|-------------|--------|
| Cannot merge red CI | GitHub branch protection + required checks | Admin override only |
| Cannot push secrets (if enabled) | Push protection | Logged bypass |
| Dialog forgot compliance | Not blocked by git | Soft only — use COMPLIANCE_REVIEW |

## Minimal setup (pilot)

1. Protect `main`: require status checks; allow merge when green.
2. Workflow on PR/push: run `./tools/assert_no_stub.sh`, unit/pack tests you care about.
3. Optional: auto-merge Action when checks succeed (GitHub auto-merge or a small workflow).
4. Agent rule: never push directly to `main` for product changes — branch → CI → merge.

## Relation to Grok dialogs

- Dialogs still use Orches identities + shared harness + soft ledger.
- Hard quality floor moves to **CI + merge policy**, not to in-chat hooks.
- Connector is used to open PR / read checks / confirm merge — not to implement a tool loop inside the chat host.

## Pilot suggestion (when you want it)

- Pick one work repo; add a single required workflow; enable auto-merge on green.
- First agent change must go through a PR once; record SHA + check URL in action-ledger.
- Orches Automations trigger can wait until you want scheduled pings.
