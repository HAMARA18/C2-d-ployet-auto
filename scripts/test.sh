#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
echo "=== C2 Lab static test ==="
for f in "$ROOT"/scripts/*.sh "$ROOT"/scripts/c2lab; do bash -n "$f"; echo "[OK] syntax: $(basename "$f")"; done
if command -v docker >/dev/null 2>&1 && docker info >/dev/null 2>&1; then
  docker compose -f "$ROOT/docker/compose.yaml" config >/dev/null
  echo "[OK] Docker Compose config"
else
  echo "[SKIP] Docker daemon unavailable"
fi
if command -v terraform >/dev/null 2>&1; then
  "$ROOT/scripts/cloud-validate.sh"
else
  echo "[SKIP] Terraform not installed"
fi
echo "[OK] Tests terminés."
