# Login Triage (macOS • Bash + SQL)

A beginner-friendly, employer‑neutral project to practice **login-issue triage** with only Bash and SQL. No Python required. Perfect for a first GitHub repo on macOS.

## Why this helps your resume
- Shows real troubleshooting skills (health checks, log handling, simple reports)
- Uses **macOS built-ins** (Terminal + Bash), so setup is minimal
- Clear problem → approach → outcome format recruiters understand

## Project map
- `docs/runbook.md` — step-by-step triage guide (copy/paste ready)
- `scripts/check_service.sh` — quick reachability checks (macOS-friendly)
- `scripts/gather_logs.sh` — bundle and lightly redact logs without external deps
- `sql/login_failures_report.sql` — safe example queries for trend reporting
- `data/sample_auth.log` — tiny mock auth log to try scripts against

## macOS Quick Start
1. Open **Terminal**.
2. Change into this folder, then make scripts executable:
   ```bash
   cd login-triage-bash
   chmod +x scripts/*.sh
   ```
3. Run a health check (mock):
   ```bash
   ./scripts/check_service.sh
   ```
4. Bundle and sanitize logs (from `data/`):
   ```bash
   ./scripts/gather_logs.sh data output_bundle.zip
   ```
   The script will mask emails and simple tokens, then zip to `output_bundle.zip`.
5. Review the SQL examples in `sql/login_failures_report.sql` — these are **illustrative** and safe.

## Example resume bullets
- Built a **macOS-friendly login triage toolkit** (Bash + SQL) to standardize troubleshooting and escalation for auth failures.
- Automated **log bundling and light redaction** to streamline handoffs and protect sensitive info.
- Authored a clear **runbook** for reproducible, low-friction incident response.

## License
MIT
