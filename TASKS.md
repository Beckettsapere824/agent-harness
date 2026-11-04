# TASKS.md — Solidified Long-Running Program

This document freezes the multi-session optimization program. Agents must follow it; humans review scores, not ad-hoc goals.

**Note:** Portable harness core files remain the copy surface (`README.md`). `eval/`, `work/`, and this file live in *this* repo for measurement; they are not required when copying the harness into an unrelated project.

---

## Objective

Raise measurable harness reliability on:

1. **Structural suite** (always on, fast) — five subsystems + file contracts.
2. **Multi-session in-repo tasks** (primary training loop) — agent must continue across simulated dialog boundaries using only repo files.
3. **External yardsticks** (offline / aspirational) — map progress to Terminal-Bench, SWE-bench family, TraceTrial-Bench dimensions when infrastructure allows.

---

## Selected frontier references (test sets & rubrics)

| Reference | What we take |
|-----------|----------------|
| **TraceTrial-Bench** (7 components) | Mechanism-oriented reliability axes; failure attribution mindset |
| **Harness-Bench** | Realistic workflow delivery under constraints |
| **Doc2Harness** | Long-horizon harness *construction* evaluation |
| **learn-harness-engineering five subsystems** | Instructions / State / Verification / Scope / Lifecycle |
| **Anthropic effective harnesses** | Initializer + coding agent; progress file; one feature; clean git state |
| **Terminal-Bench / SWE-bench** | External coding-agent yardsticks (containerized; not primary CI here) |

Primary executable suite lives under `eval/`. External benches: `docs/benchmarks.md`.
Protocol text: `docs/PERSISTENCE_TEST.md`. Duration log: `runs.md`.

---

## Loop (repeat until scores plateau)

```
1. Pick exactly one unfinished feature from feature_list.json
2. Implement under harness discipline (AGENT.md)
3. Run verification (./init.sh / ./audit-harness.sh / python3 -m eval.run_suite)
4. Record scores under eval/scores/ when applicable
5. Analyze failures → update MEMORY.md pitfalls
6. Optimize harness; require measurable lift before marking done
7. Update progress.md + session-handoff.md + runs.md; commit
```

---

## Score targets (v1)

| Suite | Baseline | Target |
|-------|----------|--------|
| Structural (0–100) | 88.24 → 100 (static ceiling) | ≥ 90 |
| Continuity (static) | 100 when disciplined | ≥ 90 |
| Multi-session pack MS01 | 70 (one-shot honesty) | ≥ 80 fair multi-dialog |
| Multi-session pack MS02 | in progress (S1 done) | ≥ 75 fair multi-dialog |
| External | N/A in this env | mapping only |

---

## Non-goals

- Full Harbor / Docker Terminal-Bench runs inside Grok sandbox (unless infra becomes available).
- Training models; only harness artifacts and task packs.
- Separate test-only repository (merged back into this repo 2026-11-04).

---

## Ownership

Any agent may continue from `session-handoff.md`. The human owner reviews score trends and may reprioritize features in `feature_list.json`.
