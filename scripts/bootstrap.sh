#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
REPO="$ROOT/vendor/Covenant"

command -v git >/dev/null || { echo "[KO] Git est requis."; exit 1; }
command -v docker >/dev/null || { echo "[KO] Docker est requis. Sur Mac/Windows, démarrez Docker Desktop."; exit 1; }
docker info >/dev/null 2>&1 || { echo "[KO] Le daemon Docker n'est pas accessible."; exit 1; }
docker compose version >/dev/null 2>&1 || { echo "[KO] Docker Compose v2 est requis."; exit 1; }

mkdir -p "$ROOT/vendor" "$ROOT/data"
if [ ! -d "$REPO/.git" ]; then
  echo "[+] Clone récursif de Covenant..."
  git clone --recurse-submodules https://github.com/cobbr/Covenant "$REPO"
else
  echo "[+] Covenant existe déjà; synchronisation des sous-modules..."
  git -C "$REPO" submodule update --init --recursive
fi

docker compose -f "$ROOT/docker/compose.yaml" config >/dev/null
echo "[OK] Bootstrap terminé."
