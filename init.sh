#!/usr/bin/env bash
# init.sh — Startup health check + verification entrypoint
# Customize the commands below for each target repository.
set -euo pipefail

echo "== agent-harness init =="

# --- Presence checks (template hygiene) ---
required_files=(
  "AGENT.md"
  "MEMORY.md"
  "feature_list.json"
  "progress.md"
)

missing=0
for f in "${required_files[@]}"; do
  if [[ ! -f "$f" ]]; then
    echo "MISSING: $f"
    missing=1
  else
    echo "OK: $f"
  fi
done

if [[ $missing -ne 0 ]]; then
  echo "init failed: required harness files missing"
  exit 1
fi

# Optional recommended Phase 1+2 files (warn only)
for f in docs/HARNESS_LESSONS.md docs/EXIT_CRITERIA.md tools/assert_no_stub.sh; do
  if [[ -f "$f" ]]; then
    echo "OK: $f"
  else
    echo "NOTE: $f not present (recommended for hardened harness)"
  fi
done

# Optional JSON sanity (python is widely available; skip if absent)
if command -v python3 >/dev/null 2>&1; then
  python3 -c "import json; json.load(open('feature_list.json'))" \
    && echo "OK: feature_list.json is valid JSON" \
    || { echo "FAIL: feature_list.json is not valid JSON"; exit 1; }
fi

# --- Project-specific verification (replace for real projects) ---
# Examples:
#   npm test
#   pytest -q
#   cargo test
#   make check
#
# For this template repo there is no application test suite yet.
echo "OK: template checks passed (add project tests here)"
echo "Hint: ./audit-harness.sh && ./tools/assert_no_stub.sh"
echo "== init complete =="
