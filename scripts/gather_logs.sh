#!/usr/bin/env bash
set -euo pipefail
# gather_logs.sh - macOS-friendly log bundler with light redaction (no GNU sed required)
# Usage: ./gather_logs.sh <log_dir> <output_zip>

if [[ $# -lt 2 ]]; then
  echo "Usage: $0 <log_dir> <output_zip>"
  exit 1
fi

LOG_DIR="$1"
OUT_ZIP="$2"

WORKDIR="$(mktemp -d)"
SANITIZED="$WORKDIR/sanitized"
mkdir -p "$SANITIZED"

# Copy logs (excluding archives)
rsync -a --exclude '*.zip' --exclude '*.gz' "$LOG_DIR"/ "$SANITIZED"/ || true

# Light redaction (emails, simple bearer tokens) using Perl (installed on macOS)
# Email pattern
while IFS= read -r -d '' file; do
  perl -i -pe 's/[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}/[redacted_email]/g' "$file" || true
  perl -i -pe 's/[Bb]earer\s+[A-Za-z0-9\._-]+/[redacted_token]/g' "$file" || true
done < <(find "$SANITIZED" -type f -print0)

# Zip result
(
  cd "$WORKDIR"
  zip -r "$OUT_ZIP" "sanitized" >/dev/null
  mv "$OUT_ZIP" "$OLDPWD/$OUT_ZIP"
)
echo "Created: $(pwd)/$OUT_ZIP"
