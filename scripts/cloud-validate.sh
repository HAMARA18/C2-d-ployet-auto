#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
command -v terraform >/dev/null || { echo "[KO] Terraform est requis pour cette vérification."; exit 1; }
for d in "$ROOT"/terraform/aws "$ROOT"/terraform/azure "$ROOT"/terraform/gcp; do
  echo "[+] Validating $d"
  terraform -chdir="$d" fmt -check
  terraform -chdir="$d" init -backend=false -input=false >/dev/null
  terraform -chdir="$d" validate
  echo "[OK] $d"
done
