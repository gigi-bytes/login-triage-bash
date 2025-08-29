#!/usr/bin/env bash
set -euo pipefail
# check_service.sh - macOS-friendly mock reachability checks

host_auth="auth.example.com"
host_db="db.example.com"

echo "== Reachability checks =="
if command -v nc >/dev/null 2>&1; then
  echo "Auth (443):"; (nc -zw2 "$host_auth" 443 && echo "  OK") || echo "  FAIL"
  echo "DB   (5432):"; (nc -zw2 "$host_db" 5432 && echo "  OK") || echo "  FAIL"
else
  echo "netcat not found; falling back to ping"
  ping -c 1 "$host_auth" >/dev/null 2>&1 && echo "Auth: OK" || echo "Auth: FAIL"
  ping -c 1 "$host_db"   >/dev/null 2>&1 && echo "DB:   OK"  || echo "DB:   FAIL"
fi

echo "DNS lookup:"
if command -v dig >/dev/null 2>&1; then
  dig +short "$host_auth" || true
else
  dscacheutil -q host -a name "$host_auth" || true
fi
echo "Done."
