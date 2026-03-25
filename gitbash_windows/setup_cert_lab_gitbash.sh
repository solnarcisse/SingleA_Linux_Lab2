#!/usr/bin/env bash
set -e

BASE_DIR="${1:-$HOME/cert_lab_gitbash}"
LAB_ROOT="$BASE_DIR/mock_server"

echo "Creating mock certificate lab at: $LAB_ROOT"
mkdir -p "$LAB_ROOT"

cat > "$BASE_DIR/new_client_key.txt" <<'EOF'
-----BEGIN MOCK CLIENT KEY-----
env=prod
owner=updated-service
serial=NEW-9910-Z9
key_material=ZXCV5678BNMQ1234QWER9012TYUI3456
fingerprint=NEWA1B2C3D4E5
-----END MOCK CLIENT KEY-----
EOF

mkdir -p "$LAB_ROOT"/finance-payments/payment-api/certs
mkdir -p "$LAB_ROOT"/hr-portal/employee-web/certs
mkdir -p "$LAB_ROOT"/sales-crm/crm-sync/certs
mkdir -p "$LAB_ROOT"/engineering-build/ci-runner/certs
mkdir -p "$LAB_ROOT"/marketing-site/cms-publisher/certs
mkdir -p "$LAB_ROOT"/operations-monitoring/ops-agent/certs
mkdir -p "$LAB_ROOT"/security-auth/sso-gateway/certs
mkdir -p "$LAB_ROOT"/support-ticketing/ticket-worker/certs
mkdir -p "$LAB_ROOT"/analytics-reporting/etl-engine/certs
mkdir -p "$LAB_ROOT"/legal-docs/document-store/certs

mkdir -p "$LAB_ROOT"/engineering-build/ci-runner/logs "$LAB_ROOT"/engineering-build/ci-runner/config "$LAB_ROOT"/engineering-build/ci-runner/tmp
mkdir -p "$LAB_ROOT"/security-auth/sso-gateway/logs "$LAB_ROOT"/security-auth/sso-gateway/bin "$LAB_ROOT"/security-auth/sso-gateway/backups
mkdir -p "$LAB_ROOT"/operations-monitoring/ops-agent/logs "$LAB_ROOT"/operations-monitoring/ops-agent/cache "$LAB_ROOT"/operations-monitoring/ops-agent/scripts

echo "pipeline=nightly" > "$LAB_ROOT"/engineering-build/ci-runner/config/build.conf
echo "build_runner_status=healthy" > "$LAB_ROOT"/engineering-build/ci-runner/logs/runner.log
echo "temp-artifact-001" > "$LAB_ROOT"/engineering-build/ci-runner/tmp/artifact.tmp

echo "token_rotation=enabled" > "$LAB_ROOT"/security-auth/sso-gateway/bin/auth.env
echo "sso gateway healthy" > "$LAB_ROOT"/security-auth/sso-gateway/logs/auth.log
echo "backup created 2026-03-25" > "$LAB_ROOT"/security-auth/sso-gateway/backups/notes.txt

echo "scrape_interval=30" > "$LAB_ROOT"/operations-monitoring/ops-agent/scripts/agent.conf
echo "cache warmed" > "$LAB_ROOT"/operations-monitoring/ops-agent/cache/state.txt
echo "ops agent running" > "$LAB_ROOT"/operations-monitoring/ops-agent/logs/ops.log

echo "finance settings" > "$LAB_ROOT"/finance-payments/payment-api/app.conf
echo "hr employee data placeholder" > "$LAB_ROOT"/hr-portal/employee-web/users.csv
echo "sales sync started" > "$LAB_ROOT"/sales-crm/crm-sync/sync.log
echo "marketing draft page" > "$LAB_ROOT"/marketing-site/cms-publisher/index.html
echo "support queue count=12" > "$LAB_ROOT"/support-ticketing/ticket-worker/queue.txt
echo "etl last_run=success" > "$LAB_ROOT"/analytics-reporting/etl-engine/etl.status
echo "legal archive online" > "$LAB_ROOT"/legal-docs/document-store/archive.info

for d in \
"$LAB_ROOT"/finance-payments/payment-api/certs \
"$LAB_ROOT"/hr-portal/employee-web/certs \
"$LAB_ROOT"/sales-crm/crm-sync/certs \
"$LAB_ROOT"/engineering-build/ci-runner/certs \
"$LAB_ROOT"/marketing-site/cms-publisher/certs \
"$LAB_ROOT"/operations-monitoring/ops-agent/certs \
"$LAB_ROOT"/security-auth/sso-gateway/certs \
"$LAB_ROOT"/support-ticketing/ticket-worker/certs \
"$LAB_ROOT"/analytics-reporting/etl-engine/certs \
"$LAB_ROOT"/legal-docs/document-store/certs
do
  cat > "$d/client_key.txt" <<'EOF'
-----BEGIN MOCK CLIENT KEY-----
env=prod
owner=legacy-service
serial=OLD-7782-A1
key_material=ABCD1234EFGH5678IJKL9012MNOP3456
fingerprint=LEGACYKEY000
-----END MOCK CLIENT KEY-----
EOF
done

echo
echo "Environment created."
echo "Lab root: $LAB_ROOT"
echo "Replacement key file: $BASE_DIR/new_client_key.txt"
echo
echo
echo "Git Bash note:"
echo "  Your path may look like /c/Users/YourName/cert_lab_gitbash"
