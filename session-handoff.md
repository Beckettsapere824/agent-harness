# session-handoff.md

Use this when work is incomplete and another agent or a new dialog must continue.
A fresh agent with **only** this file + the other harness files must be able to resume without chat history.

---

## Last updated

2026-11-24

## Active feature

**F011** Skills layer — **done**. Residual focus: **MS02** at S2 boundary (`in_progress`).

## Timing

| Field | Value |
|-------|-------|
| Last run duration | ~Orches + skills dialog (2026-11-24) |
| Feature started (MS02) | 2026-11-04 (S1 in test repo; continued here) |
| Elapsed wall time on MS02 | S1 done; S2 not started |
| Expected remaining | S2 + S3 across ≥2 more dialogs |

## What was done

- Portable harness F001–F006 intact.
- F008–F010 complete.
- **F011 (2026-11-24):** skills/ with 15 SKILL.md + README; AGENT.md skills section + mandatory anti-drift assertion; state files updated.
- **Orches (2026-11-24):** initialized with Orchestrator AGENT.md, registry.md, schemas/identity.md, example identity; unique-identity-per-dialog rule.
- MS02 **S1**: `work/todo.py` has `add` + `list` only; `work/session_ledger.json` phase 1 only.

## What remains (next dialog must do only this)

**Option A — MS02 S2 (reliability measurement)**

1. Read this handoff + `eval/tasks/ms02_todo/SPEC.md`
2. Add `done ID` to `work/todo.py`
3. Append ledger entry `{"phase": 2, "session": "S2", "note": "..."}`
4. Smoke: add item → done → list shows done
5. **Stop.** Do not implement `rm`. Update progress + this handoff + `runs.md` for S3.

**Option B — First real Orches work identity**

1. Load Orches, create a new unique identity under agents/
2. Register it in registry.md
3. Follow its startup_path into the target repo(s)

**S3 (later dialog, after S2)**

- Add `rm`; ledger phase 3; `bash eval/tasks/ms02_todo/verify.sh`; record score/evidence.

## Resume checklist (next agent — do in order)

- [ ] Read `AGENT.md` fully (includes skills section + anti-drift assertion)
- [ ] Perform anti-drift assertion (identity/harness, read order, active feature, next exact)
- [ ] Read `MEMORY.md` (Status + Scores + Log)
- [ ] Read `docs/HARNESS_LESSONS.md`
- [ ] Read `feature_list.json` — confirm active focus
- [ ] Read this file + latest `runs.md`
- [ ] Run `./init.sh` and optionally `./audit-harness.sh` + `./tools/assert_no_stub.sh`
- [ ] Skim `skills/README.md`; load specific skill bodies only as needed
- [ ] Choose Option A or B above and execute only that scope
- [ ] Before ending: refresh this file, prepend `runs.md`, update progress + feature_list; consider RETRO_ROUND entry

## Known failure modes (avoid these)

| Failure | Symptom | Mitigation |
|---------|---------|------------|
| One-shot S2+S3 | `rm` appears in same dialog as `done` | Stop after S2; real dialog cut |
| Fabricated ledger | All phases written at once | Append phase only at each boundary |
| Vague next step | Handoff says “continue” | Name exact command/file |
| Missing duration | No `runs.md` entry | Prepend every dialog |
| Chat dependence | Next agent needs prior chat | This file + SPEC must suffice |
| Placeholder push | Stub content committed | HARNESS_PUSH_GATE + assert_no_stub + skills/push-gate |
| Shared identity | Two live dialogs use same Orches id | Unique identity rule |
| Skill body bloat | Loading all 15 full texts | Progressive disclosure only |

## Risks / notes

- Full `verify.sh` fails until S3 completes — expected.
- When copying harness to other projects, copy core files + skills/; leave `eval/` / `work/` here.
- Soft-exit (E1/E2/E4–E7) is met; E3 (MS02 fair multi-dialog) remains open.
- Orches example identity is bootstrap only; replace with real work identities.

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
