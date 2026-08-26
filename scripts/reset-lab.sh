#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
docker compose -f "$ROOT/docker/compose.yaml" down --remove-orphans || true
if [ "${1:-}" != "--yes" ]; then
  read -r -p "Supprimer les données locales du lab ? [y/N] " ans
  case "$ans" in y|Y|yes|YES) ;; *) echo "Annulé."; exit 0;; esac
fi
rm -rf "$ROOT/data"
mkdir -p "$ROOT/data"
echo "[OK] Données locales supprimées."
