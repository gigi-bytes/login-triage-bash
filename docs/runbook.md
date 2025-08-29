# Runbook: Login Failures (macOS + Bash)

## Goal
Quickly determine why users can't sign in and provide a clean handoff if escalation is needed.

## Triage Steps
1. **Scope** — who is impacted, when it started, and what changed.
2. **Reproduce** — test with a non-privileged account if allowed.
3. **Health checks** — run `./scripts/check_service.sh` (reachability, DNS, latency).
4. **Collect artifacts** — run `./scripts/gather_logs.sh data output_bundle.zip` to zip example logs with light redaction.
5. **Classify** — bad credentials, lockout, timeout, provider error, rate limit.
6. **Mitigate** — reversible step first (unlock, retry window, rollback flag).
7. **Communicate** — summarize impact, evidence (sanitized), steps tried, and ask.

## Handoff Template
- **Summary**: what failed, who is impacted, since when
- **Evidence**: 3–5 log lines (sanitized), timestamps, request IDs
- **Suspected area**: client | network | auth service | DB | provider
- **Actions taken**: attempts + outcomes
- **Request**: what you need from the next team

## Aftercare
Add notes to prevent repeats and propose automation opportunities.
