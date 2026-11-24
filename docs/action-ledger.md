# action-ledger.md — Soft black box (append-only)

Newest entries at the **top**.

## Purpose

Record **durable actions** this repo’s agents claim to have taken, so the next dialog or a compliance review can audit without chat history.

This is a **soft** ledger: it does not block tools. Lying or omitting entries is still possible; CI and branch rules are the hard gates. The ledger improves recoverability and review.

## When to append

After any of:

- Push that changes product or harness state
- Feature status change in `feature_list.json`
- Ledger phase advance (MS* packs)
- Orches identity status change affecting this repo
- Explicit compliance review completion

## Entry format (one block per event)

```markdown
### YYYY-MM-DDThh:mmZ | <identity-or-dialog> | <action-type>
- **summary**: one line
- **paths**: list of touched paths
- **evidence**: command run / PR URL / commit SHA / “none”
- **sync**: local→push done | pending
```

Action-type examples: `implement`, `verify`, `handoff`, `identity-update`, `compliance-review`, `merge-gate`.

---

## Log

### 2026-11-24 | system | bootstrap
- **summary**: action-ledger introduced; compliance master index added
- **paths**: docs/action-ledger.md, docs/COMPLIANCE_REVIEW.md, AGENT.md
- **evidence**: commit on main
- **sync**: local→push done
