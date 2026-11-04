# session-handoff.md

Use this when work is incomplete and another agent or a new dialog must continue.
A fresh agent with **only** this file + the other harness files must be able to resume without chat history.

---

## Last updated

2026-11-04

## Active feature

F006 — Strengthen session-handoff for long-running resume (**closing this dialog**)

## Timing

| Field | Value |
|-------|-------|
| Last run duration | ~15–20 min (this leg) |
| Feature started | 2026-11-04 (this dialog) |
| Elapsed wall time on feature | ~20 min |
| Expected remaining | small (docs + state updates) |

## What was done

- v1 core + README + audit (F001–F003).
- `runs.md` + duration logging (F004).
- `docs/PERSISTENCE_TEST.md` (F005).
- **This leg:** expanded this file with Timing, Resume checklist, Known failure modes; updating AGENT.md End of Session.

## What remains

1. Finish F006 evidence + mark done in feature_list.json.
2. Update progress / MEMORY / runs for clean close.
3. Then **B**: run multi-session persistence test (see `docs/PERSISTENCE_TEST.md`) on a new hard task — force 3+ dialog boundaries.

## Resume checklist (next agent — do in order)

- [ ] Read `AGENT.md` fully
- [ ] Read `MEMORY.md` (Status + recent Log)
- [ ] Read `feature_list.json` — confirm single active / next feature
- [ ] Read this file + latest `runs.md` entries
- [ ] Run `./init.sh` (fix failures before new work)
- [ ] Optionally run `./audit-harness.sh`
- [ ] Execute **exactly one** concrete next step from “What remains”
- [ ] Before ending: refresh this file, prepend `runs.md`, update progress + feature_list

## Known failure modes (avoid these)

| Failure | Symptom | Mitigation |
|---------|---------|------------|
| Vague next step | Handoff says “continue” without file/action | Always name the next file or command |
| Status drift | feature_list says done but code incomplete | Evidence field required before done |
| Missing duration | Cannot analyze short vs long runs | Prepend `runs.md` every dialog |
| Stale handoff | progress updated but this file not | Update both together |
| Scope creep | Multiple features touched | One feature only until evidence of done |
| Chat dependence | Next agent asks “what were we doing?” | This file + progress must stand alone |

## Risks / notes

- Keep AGENT.md short when customizing for real projects.
- Replace init.sh checks with project-real tests after copy.
- For multi-session tests: do **not** paste prior chat into a new dialog.

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
