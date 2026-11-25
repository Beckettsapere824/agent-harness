# SANDBOX_CONTROL.md — Grok.com / low-RAM sandbox discipline

Binding guidance for any agent that must build, compile, or run heavy workloads inside the Grok dialog sandbox (typical ~1.2 GiB RAM Hades-class VM).

Source of truth for the numbers: `Beckettsapere824/P-NP` notes/SANDBOX_BUILD_MILESTONE.md and OPERATING_NOTES.md (2026-11-24/25). Do not re-derive by trial-and-error that kills the session.

---

## Hard limits observed (Grok sandbox)

- **RAM ceiling**: ~1.2 GiB usable. Full Mathlib + Lean 4.36 + large aggregator modules exceed it.
- **Thread discipline**: `LEAN_NUM_THREADS=1` (or equivalent single-thread) is mandatory for heavy Lean/C++ builds. Higher values OOM or get killed.
- **Persistence**: `/home/workdir/artifacts` (and project folder) survive; `/tmp` is wiped on VM recycle / session expiry.
- **Session risk**: Building a full root aggregator (e.g. `PEqualNP.Defs`) can recycle the host; prefer leaf modules.

---

## Safe vs unsafe patterns (Lean / large projects)

| Pattern | Verdict | Why |
|---------|---------|-----|
| `lake build +Package.Defs.LeafModule` | SAFE | ~25–30 s, memory stays ~350–565 Mi |
| Bootstrap + `lake exe cache get` then leaf builds | SAFE | Prebuilt oleans keep peak low |
| Outside / test file that imports only narrow modules | SAFE | Avoids elaborating the whole tree |
| `lake build Package.Defs` (full root) | UNSAFE | Compiles every Defs module; kills 1.2 GiB box |
| Import only the aggregator `Package.Defs` in a test | UNSAFE | Same explosion |
| Raise threads above 1 | UNSAFE | Memory multiplies |

Realistic path for Lean work on this class of sandbox:

```text
bootstrap_lean.sh
  → lake build +PEqualNP.Defs.Base
  → lake build +PEqualNP.Defs.<one leaf>
  → write Outside / proof that imports narrow modules only
  → lake build +PEqualNP.Outside.<one_module>
```

Official CI / pequalnp.com checker may still require the full Defs root. When the local VM cannot finish an equivalent check, **release the lease honestly** (reason = resource / missing full check) and prefer synthesis + PR from a ≥8–16 GiB machine, or mark the gap for a better environment.

---

## General sandbox control rules (all languages)

1. **Measure first**. Before a heavy compile, record baseline `free -h` / process RSS. Prefer incremental / leaf targets.
2. **One heavy job at a time**. Do not parallelize large builds inside the dialog sandbox.
3. **Prefer sparse / cached artifacts**. Use prebuilt caches (lake exe cache, nix, cargo vendor, etc.) rather than cold full builds.
4. **Write durable results to artifacts/**. Treat `/tmp` as ephemeral.
5. **Honest release**. If the sandbox cannot complete a required check, do not invent success; log the limit and hand off.
6. **External free sandboxes** (when Grok VM is insufficient): E2B (~$100 free credit), Daytona (~$200), Prized (~$30), Modal ($30/mo), OpenSandbox (self-host). None are native Grok connectors today; use API keys + shell / Zapier / custom code. Prefer them for multi-hour or multi-GiB work, not for every small edit.

---

## Manus-style persistent cloud computers

Manus offers:

- Temporary **Sandbox** (per-task VM)
- **Cloud Computer** (persistent, always-on, paid)
- **My Computer / Studio** (local desktop control)

Grok has no equivalent native connector as of 2026-11-25. Closest practical options: self-hosted OpenSandbox / Cua on a cheap VPS, or paid agent sandboxes above. Do not assume an "Atlas" connector exists; the useful Manus concept is the persistent cloud computer, not a specific product name.

---

## Checklist before a heavy sandbox job

- [ ] Target is a leaf / narrow module, not the full root
- [ ] Thread count capped (Lean: `LEAN_NUM_THREADS=1`)
- [ ] Cache / prebuilts present
- [ ] Result path is under artifacts/ or the project folder
- [ ] Fallback plan if OOM / kill (honest release + handoff note)

Append new measured limits to this file and to `docs/HARNESS_LESSONS.md` when a new failure class appears.
