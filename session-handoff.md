# session-handoff.md

Use this when work is incomplete and another agent or a new dialog must continue.
A fresh agent with **only** this file + the other harness files must be able to resume without chat history.

---

## Last updated

2026-11-24 (Orches identity + local-mirror/sync contract landed)

## Active feature

**MS02** — MS02 todo CLI adversarial multi-session pack (`in_progress`)

## Timing

| Field | Value |
|-------|-------|
| Last run duration | design + Orches/harness contract update |
| Feature started | 2026-11-04 (S1) |
| Elapsed wall time on feature | S1 + S2 done; S3 remaining |
| Expected remaining | One more dialog (S3 + verify) |

## What was done

- S1: add + list; ledger phase 1.
- S2: `done ID`; ledger phase 2.
- Orches: naming, standby, local_mirror, sync_rules, identity factory (orches-factory-1..4).
- agent-harness AGENT.md: local mirror + session-contract on startup; immediate push discipline; shared harness for multi-agent.

## What remains (next dialog — pick one focus)

**A — MS02 S3 only**

1. Read this handoff + `eval/tasks/ms02_todo/SPEC.md`
2. Add `rm ID` to `work/todo.py` only
3. Append ledger `{"phase": 3, "session": "S3", "note": "..."}`
4. Run `bash eval/tasks/ms02_todo/verify.sh` (must pass)
5. Record evidence; mark MS02 done if green; update progress + handoff + runs.md

**B — Provision real work identities** via Orches `orches-factory-1`

## Resume checklist (next agent — do in order)

- [ ] If Orches identity assigned: load it, write local session-contract + mirrors
- [ ] Read `AGENT.md` fully (skills + anti-drift + sync discipline)
- [ ] Perform anti-drift assertion including local mirror present
- [ ] Read `MEMORY.md`
- [ ] Read `docs/HARNESS_LESSONS.md`
- [ ] Read `feature_list.json`
- [ ] Read this file + latest `runs.md`
- [ ] Run `./init.sh` (optional audit / assert_no_stub)
- [ ] Execute **one** focus only (S3 or factory provisioning)
- [ ] Every edit: local first → immediate push
- [ ] Before ending: refresh this file, prepend `runs.md`, update progress + feature_list

## Known failure modes (avoid these)

| Failure | Symptom | Mitigation |
|---------|---------|------------|
| One-shot residual | Anything beyond single focus in same dialog | Stop after chosen focus |
| Fabricated ledger | Phase 3 without real dialog boundary | Append only at end of S3 dialog |
| Stale cloud | Local changed but no push | Sync discipline |
| Missing local mirror | Next dialog cannot find contract | Startup step 2 mandatory |
| Chat dependence | Next agent needs prior chat | This file + SPEC + identity must suffice |

## Risks / notes

- Full `verify.sh` fails until S3 (missing phase 3 and `rm`) — expected.
- Soft-exit E3 still open until S3 completes with honest ledger.
