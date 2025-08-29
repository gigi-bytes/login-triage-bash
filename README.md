# 🔐 Login Triage (macOS • Bash + SQL)

Welcome! This repo is a simple toolkit I put together to practice and share how I troubleshoot **login-related issues** in a SaaS environment.  
It includes lightweight Bash scripts, a runbook, and example SQL queries — all designed to be easy to run on macOS without extra setup.

---

## ✨ What’s Inside
- `docs/runbook.md` – step-by-step guide for investigating login failures  
- `scripts/check_service.sh` – quick reachability checks (mock service & DB)  
- `scripts/gather_logs.sh` – bundles sample logs and lightly redacts emails/tokens  
- `sql/login_failures_report.sql` – safe example queries for failure trends  
- `data/sample_auth.log` – tiny mock log file for testing the scripts  

---

## 🚀 Quick Start (macOS)
1. Clone or download this repo.  
2. In Terminal, make scripts executable:  
   ```bash
   chmod +x scripts/*.sh
   ```
3. Run a service health check:  
   ```bash
   ./scripts/check_service.sh
   ```
4. Bundle and sanitize logs from `data/`:  
   ```bash
   ./scripts/gather_logs.sh data output_bundle.zip
   ```
5. Review the SQL queries for trend analysis ideas.  

---

## 🎯 Use Cases
- Practice log collection & sanitization  
- Explore example SQL for login/reporting analysis  
- Learn how a runbook can make triage steps repeatable  
- Show how lightweight Bash scripts can speed up support work  

---

## 🛠️ Tech Used
- **Bash** (macOS Terminal)  
- **SQL** (generic examples)  
- Markdown for docs  

---

## 🌱 Next Steps
I’ll keep expanding this toolkit with more examples — maybe additional health checks, or queries for different use-cases. Feedback and ideas are always welcome!
