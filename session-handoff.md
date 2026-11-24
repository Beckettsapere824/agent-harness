# session-handoff.md

Use this when work is incomplete and another agent or a new dialog must continue.
A fresh agent with **only** this file + the other harness files must be able to resume without chat history.

---

## Last updated

2026-11-24 (S2 complete)

## Active feature

**MS02** — MS02 todo CLI adversarial multi-session pack (`in_progress`)

## Timing

| Field | Value |
|-------|-------|
| Last run duration | S2 dialog (done command only) |
| Feature started | 2026-11-04 (S1) |
| Elapsed wall time on feature | S1 + S2 done; S3 remaining |
| Expected remaining | One more dialog (S3 + verify) |

## What was done

- S1: add + list; ledger phase 1.
- S2 (this dialog): `done ID` implemented in `work/todo.py`; ledger phase 2 appended.
- Skills layer F011 and Orches bootstrap remain in place from earlier today.

## What remains (next dialog must do only this)

**S3**

1. Read this handoff + `eval/tasks/ms02_todo/SPEC.md`
2. Add `rm ID` to `work/todo.py`
3. Append ledger entry `{"phase": 3, "session": "S3", "note": "..."}`
4. Run `bash eval/tasks/ms02_todo/verify.sh` (must pass)
5. Record evidence / score; mark MS02 done in feature_list.json if green
6. Update progress + this handoff + runs.md

## Resume checklist (next agent — do in order)

- [ ] Read `AGENT.md` fully (skills + anti-drift assertion)
- [ ] Perform anti-drift assertion
- [ ] Read `MEMORY.md`
- [ ] Read `docs/HARNESS_LESSONS.md`
- [ ] Read `feature_list.json` — confirm MS02 still `in_progress`
- [ ] Read this file + latest `runs.md`
- [ ] Run `./init.sh` (optional audit / assert_no_stub)
- [ ] Read `eval/tasks/ms02_todo/SPEC.md`
- [ ] Implement **S3 only** (rm + ledger phase 3 + verify.sh)
- [ ] Before ending: refresh this file, prepend `runs.md`, update progress + feature_list

## Known failure modes (avoid these)

| Failure | Symptom | Mitigation |
|---------|---------|------------|
| One-shot residual | Anything beyond rm+verify in same dialog | Stop after S3 verify |
| Fabricated ledger | Phase 3 written without real dialog boundary | Append only at end of this dialog |
| Vague next step | Handoff says “continue” | Exact commands above |
| Missing duration | No `runs.md` entry | Prepend every dialog |
| Chat dependence | Next agent needs prior chat | This file + SPEC must suffice |

## Risks / notes

- Full `verify.sh` currently fails (missing phase 3 and `rm`) — expected until S3.
- Soft-exit E3 still open until S3 completes with honest ledger.
