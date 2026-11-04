# PERSISTENCE_TEST.md — Hard Multi-Session Continuity Protocol

**Goal:** Stress the harness beyond smoke checks. Force real handoffs, measure duration per leg, and verify that a *fresh* agent (no chat history) can resume correctly.

This is intentionally harder than previous tests.

---

## Why previous tests were too easy

- Single-dialog structural checks (files exist, JSON valid) do not exercise cross-dialog memory.
- Short tasks finish inside one context window → no pressure on handoff quality.
- No measurement of wall-clock duration → cannot see whether runs die early or drift.

This protocol forces **at least three forced dialog boundaries** and treats resume correctness as the primary pass/fail.

---

## Scenario (the hard task)

Pick or invent a multi-step feature that **cannot** reasonably finish in one short dialog. Example patterns:

1. **Scaffold + implement + verify** a small but non-trivial change that needs research + code + test.
2. **Migrate** an existing file/set of files to a new convention (must touch multiple places and leave the tree green).
3. **Add a new optional subsystem** (e.g. richer audit, version metadata) that itself has sub-steps.

Concrete default for this template repo (use unless a better project-specific task exists):

> Implement F006 fully (strengthen session-handoff), **but** the human will deliberately end the dialog after each major sub-step. The next dialog starts with only GitHub access and the files — no prior chat.

Break the work into **forced legs**:

| Leg | Human action | Agent must leave |
|-----|--------------|------------------|
| 1   | Start dialog, stop after ~15–25 min or after first meaningful commit | Clean `session-handoff.md` + `runs.md` entry + concrete next step |
| 2   | New dialog, stop after next meaningful chunk | Same |
| 3   | New dialog, finish the feature or stop with clear remaining work | Same; if done, evidence in feature_list.json |

Minimum: **3 legs**. More is better for duration data.

---

## What the agent must do every leg

1. Follow normal startup: `AGENT.md` → `MEMORY.md` → `feature_list.json` → `progress.md` → `session-handoff.md` → recent `runs.md` → `./init.sh`.
2. Work **only** on the single active feature.
3. Before the dialog ends (or when human says stop):
   - Update `progress.md` (state + **exact** next step).
   - Refresh `session-handoff.md` (what done / what remains / how to resume).
   - **Prepend** a `runs.md` entry with approximate duration and outcome.
   - Leave the tree restartable (`./init.sh` must pass).

---

## Success criteria (pass / fail)

A leg **passes** only if **all** hold:

- [ ] A brand-new agent (or the same agent with chat cleared) can resume without asking “what were we doing?”
- [ ] `session-handoff.md` + `progress.md` together name the active feature and the single next concrete action.
- [ ] `runs.md` has a duration entry for the just-finished leg.
- [ ] `./init.sh` (and preferably `./audit-harness.sh`) exit 0.
- [ ] No silent scope creep onto other features.

Overall protocol **passes** if ≥ 3 consecutive legs pass and the feature either reaches `done` with evidence or has a clear, actionable remaining path.

Overall **fails** if any leg leaves ambiguous state, missing next step, or broken verification.

---

## Metrics to record (in runs.md and optionally MEMORY.md)

Per leg:

| Metric | How |
|--------|-----|
| Wall-clock duration | Approximate minutes from first tool use to last state-file update |
| Outcome | completed / partial / blocked / failed |
| Handoff quality | clean / incomplete / missing next step |
| Resume friction | Did the next agent need extra questions? (yes/no + note) |

Across legs:

- Total wall time to feature done (or to abandonment).
- Number of failed resumes.
- Whether duration shrinks or grows (context pressure, thrashing).

---

## How to run (human + agent)

1. Ensure F004 is done (`runs.md` exists and AGENT.md requires logging).
2. Set the active feature (e.g. F006) to `in_progress`.
3. Open a **fresh** dialog with only the GitHub connector (or equivalent).
4. Tell the agent: “Continue the active feature. Stop when I say, and leave a perfect handoff.”
5. After 15–25 minutes (or one coherent chunk), stop the dialog.
6. Open a **new** dialog. Repeat until 3+ legs or the feature is done.
7. Score each leg against the checklist above. Append notes to `MEMORY.md` Log.

Do **not** paste previous chat into the new dialog. That defeats the test.

---

## Known failure modes this protocol is designed to catch

- Handoff says “continue” without naming the next file/action.
- `feature_list.json` status drifts from reality.
- Agent marks done without evidence.
- Duration never recorded → cannot analyze early death vs long healthy runs.
- Init passes but progress/handoff are stale → next agent starts the wrong work.

---

## After the test

- Summarize durations and pass/fail in `MEMORY.md`.
- If handoff quality was weak, prioritize F006 (stronger template).
- If runs died early for non-harness reasons (tool limits, rate limits), note that separately from harness defects.
