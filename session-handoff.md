# session-handoff.md

Use this when work is incomplete and another agent or a new dialog must continue.
A fresh agent with **only** this file + the other harness files must be able to resume without chat history.

---

## Last updated

2026-11-17

## Active feature

**MS02** — MS02 todo CLI adversarial multi-session pack (`in_progress`)

## Timing

| Field | Value |
|-------|-------|
| Last run duration | ~Phase 1+2 dialog (hardening) |
| Feature started | 2026-11-04 (S1 in test repo; continued here) |
| Elapsed wall time on feature | S1 done; S2 not started |
| Expected remaining | S2 + S3 across ≥2 more dialogs |

## What was done

- Portable harness F001–F006 intact.
- F008 merge of eval/work/TASKS/scores.
- **Phase 1+2 (2026-11-17):** `docs/HARNESS_LESSONS.md`, `docs/HARNESS_PUSH_GATE.md`, `tools/assert_no_stub.sh`, `docs/EXIT_CRITERIA.md`, `docs/RETRO_ROUND.md`; AGENT.md read-order/inject-budget/push/retro rules; audit-harness.sh strengthened; feature_list F009/F010 marked done.
- MS02 **S1**: `work/todo.py` has `add` + `list` only; `work/session_ledger.json` phase 1 only.

## What remains (next dialog must do only this)

**S2**

1. Read this handoff + `eval/tasks/ms02_todo/SPEC.md`
2. Add `done ID` to `work/todo.py`
3. Append ledger entry `{"phase": 2, "session": "S2", "note": "..."}`
4. Smoke: add item → done → list shows done
5. **Stop.** Do not implement `rm`. Update progress + this handoff + `runs.md` for S3.

**S3 (later dialog)**

- Add `rm`; ledger phase 3; `bash eval/tasks/ms02_todo/verify.sh`; record score/evidence.

## Resume checklist (next agent — do in order)

- [ ] Read `AGENT.md` fully (new read order includes HARNESS_LESSONS + EXIT_CRITERIA)
- [ ] Read `MEMORY.md` (Status + Scores + Log)
- [ ] Read `docs/HARNESS_LESSONS.md`
- [ ] Read `feature_list.json` — confirm **MS02** is the single `in_progress` feature
- [ ] Read this file + latest `runs.md`
- [ ] Run `./init.sh` and optionally `./audit-harness.sh` + `./tools/assert_no_stub.sh`
- [ ] Read `eval/tasks/ms02_todo/SPEC.md`
- [ ] Implement **S2 only** (done + ledger phase 2)
- [ ] Before ending: refresh this file, prepend `runs.md`, update progress + feature_list; consider RETRO_ROUND entry

## Known failure modes (avoid these)

| Failure | Symptom | Mitigation |
|---------|---------|------------|
| One-shot S2+S3 | `rm` appears in same dialog as `done` | Stop after S2; real dialog cut |
| Fabricated ledger | All phases written at once | Append phase only at each boundary |
| Vague next step | Handoff says “continue” | Name exact command/file |
| Missing duration | No `runs.md` entry | Prepend every dialog |
| Chat dependence | Next agent needs prior chat | This file + SPEC must suffice |
| Placeholder push | Stub content committed | HARNESS_PUSH_GATE + assert_no_stub |

## Risks / notes

- Full `verify.sh` fails until S3 completes — expected.
- When copying harness to other projects, copy core files only; leave `eval/` / `work/` here.
- Soft-exit (E1/E2/E4–E7) is met; E3 (MS02 fair multi-dialog) remains open.

---

## Template fields (for copy into other repos)

1. **Last updated** — date
2. **Active feature** — id + title + status
3. **Timing** — last run duration, feature start, elapsed wall time, expected remaining
4. **What was done** — short bullets
5. **What remains** — numbered, actionable
6. **Resume checklist** — ordered checkboxes
7. **Known failure modes** — table
8. **Risks / notes** — project-specific cautions
