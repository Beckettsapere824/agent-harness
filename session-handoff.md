# session-handoff.md

Use this when work is incomplete and another agent or a new dialog must continue.
A fresh agent with **only** this file + the other harness files must be able to resume without chat history.

---

## Last updated

2026-11-04

## Active feature

none (F001–F006 done). **Next: multi-session persistence test (B).**

Suggested test feature to create when starting B:

> **F007** — Add version metadata (`VERSION` or harness version field) + optional richer audit checks (e.g. session-handoff required sections present).

## Timing

| Field | Value |
|-------|-------|
| Last run duration | ~20 min (F006 implementation) |
| Feature started | n/a (idle between features) |
| Elapsed wall time on feature | n/a |
| Expected remaining | Start B in a **new** dialog |

## What was done

- F001–F006 complete (core, README, audit, runs.md, persistence protocol, strengthened handoff).
- session-handoff now has Timing, Resume checklist, Known failure modes, Template fields.
- AGENT.md End of Session documents required handoff fields.

## What remains (B — multi-session test)

1. Open a **fresh** dialog (do not paste prior chat).
2. Add F007 (or another hard multi-step feature) to feature_list.json; set `in_progress`.
3. Work one leg (~15–25 min or one coherent chunk); stop deliberately.
4. Leave perfect handoff + `runs.md` entry.
5. Repeat in new dialogs until ≥3 legs; score each leg per `docs/PERSISTENCE_TEST.md`.

## Resume checklist (next agent — do in order)

- [ ] Read `AGENT.md` fully
- [ ] Read `MEMORY.md` (Status + recent Log)
- [ ] Read `feature_list.json`
- [ ] Read this file + latest `runs.md` entries
- [ ] Run `./init.sh` (fix failures before new work)
- [ ] Optionally run `./audit-harness.sh`
- [ ] Read `docs/PERSISTENCE_TEST.md` if starting the multi-session test
- [ ] Create/activate F007 (or chosen hard feature); one feature only
- [ ] Before ending each leg: refresh this file, prepend `runs.md`, update progress + feature_list

## Known failure modes (avoid these)

| Failure | Symptom | Mitigation |
|---------|---------|------------|
| Vague next step | Handoff says “continue” without file/action | Always name the next file or command |
| Status drift | feature_list says done but code incomplete | Evidence field required before done |
| Missing duration | Cannot analyze short vs long runs | Prepend `runs.md` every dialog |
| Stale handoff | progress updated but this file not | Update both together |
| Scope creep | Multiple features touched | One feature only until evidence of done |
| Chat dependence | Next agent asks “what were we doing?” | This file + progress must stand alone |
| Soft test | Single long dialog, no forced boundary | Human must end dialog and start fresh |

## Risks / notes

- B only counts if dialogs are **truly separate** (no prior chat in context).
- Keep AGENT.md short when customizing for real projects.

---

## Template fields (for copy into other repos)

When adapting this harness, keep these sections in `session-handoff.md`:

1. **Last updated** — date
2. **Active feature** — id + title + status
3. **Timing** — last run duration, feature start, elapsed wall time, expected remaining
4. **What was done** — short bullets
5. **What remains** — numbered, actionable
6. **Resume checklist** — ordered checkboxes for the next agent
7. **Known failure modes** — table of symptom + mitigation
8. **Risks / notes** — project-specific cautions
