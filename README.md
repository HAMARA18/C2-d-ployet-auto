# C2 Lab Deployer — Covenant Lab Automation

Projet de laboratoire pour automatiser l'installation et le cycle de vie d'un environnement Covenant autorisé.

## 1. Test local (recommandé)

Prérequis : Git + Docker Desktop (Mac/Windows) ou Docker Engine + Compose v2 (Linux).

```bash
./scripts/c2lab bootstrap
./scripts/c2lab doctor
./scripts/c2lab up
```

Puis ouvre :

`https://127.0.0.1:7443`

Le premier démarrage de Covenant demande une inscription initiale via l'interface. Le certificat HTTPS peut être auto-signé.

Commandes :

```bash
./scripts/c2lab status
./scripts/c2lab logs
./scripts/c2lab down
./scripts/c2lab reset
```

`reset` supprime les données locales du laboratoire. Le dossier `vendor/Covenant` est conservé.

## 2. Tests sans démarrer Covenant

```bash
./scripts/c2lab test
```

Cela vérifie la syntaxe des scripts et la configuration Compose. Si Terraform est installé, les trois configurations cloud sont également validées.

## 3. Multi-cloud

Les répertoires `terraform/aws`, `terraform/azure` et `terraform/gcp` sont des squelettes d'Infrastructure as Code destinés à être durcis avant tout déploiement réel. Ils n'exposent pas volontairement l'interface Covenant à Internet.

Avant un vrai déploiement cloud : ajouter réseau de sortie contrôlé (NAT), accès d'administration privé (VPN/bastion), journalisation, secrets manager et règles firewall minimales.

Validation :

```bash
./scripts/c2lab cloud-validate
```

## Sécurité

Utiliser uniquement dans un environnement dont vous avez l'autorisation. Ne pas exposer le port 7443 publiquement. Ce projet automatise l'infrastructure et le cycle de vie du lab, pas le déploiement d'agents/payloads sur des systèmes tiers.

## Référence Covenant

Covenant est un framework C2 .NET avec support Docker et une interface web. La documentation officielle indique notamment le clone récursif et l'exécution Docker sur le port 7443.
