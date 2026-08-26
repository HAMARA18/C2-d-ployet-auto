#!/usr/bin/env bash
set -u
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
fail=0
check_cmd(){ command -v "$1" >/dev/null 2>&1 && echo "[OK] $1" || { echo "[KO] $1"; fail=1; }; }
check_cmd git
check_cmd docker
if command -v docker >/dev/null 2>&1; then
  docker info >/dev/null 2>&1 && echo "[OK] Docker daemon" || { echo "[KO] Docker daemon"; fail=1; }
  docker compose version >/dev/null 2>&1 && echo "[OK] Docker Compose" || { echo "[KO] Docker Compose"; fail=1; }
fi
[ -d "$ROOT/vendor/Covenant/Covenant" ] && echo "[OK] Covenant source" || echo "[INFO] Covenant source absent (run bootstrap)"
[ -d "$ROOT/data" ] && echo "[OK] Data directory" || { echo "[KO] Data directory"; fail=1; }
exit "$fail"
