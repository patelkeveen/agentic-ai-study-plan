# 📌 Phase 1: Job-Ready Foundation (Days 1–10)

*Goal: Acquire essential programming, DevOps, database, automation, and basic AI orchestration skills to become instantly hirable for engineering roles.*

---

## Day 1: Production-Ready Python

**🎯 Objective:** Write enterprise-grade, asynchronous, type-safe Python code.
**📖 Learn:** 
- [RealPython — Async IO (1 hr)](https://realpython.com/async-io-python/)
- [Pydantic v2 Official Docs (1 hr)](https://docs.pydantic.dev/latest/)
- [Poetry Official Docs (30m)](https://python-poetry.org/docs/)
**🛠️ Practice:** Build an async Python script fetching data concurrently from three public REST APIs (e.g., PokéAPI, OpenWeatherMap). Parse results with Pydantic, implement rate-limiting backoffs, and write structured logs.
**📂 Where:** Local VS Code + `uv` or `poetry` environment.
**✅ Ship:** Commit `main.py`, `models.py`, and `pyproject.toml` to `labs/day-01-python/`.
**📝 Post:** "Why Pydantic v2 is the only way to write Python in 2026. Here's a multi-API fetcher I built today. #Python #DevOps"
**🔗 Connect to Security:** Python is the lingua franca of AI agents. If your Python code lacks type safety and validation (Pydantic), it is vulnerable to prompt injection payload execution. Secure AI starts with secure parsing.

---

## Day 2: Enterprise PowerShell & Git Workflows

**🎯 Objective:** Build secure, modular PowerShell scripts integrated with Git.
**📖 Learn:** 
- [PowerShell 101 (1 hr)](https://learn.microsoft.com/en-us/powershell/scripting/learn/ps101/00-introduction)
- [PSScriptAnalyzer (30m)](https://github.com/PowerShell/PSScriptAnalyzer)
- [Git Hooks (30m)](https://pre-commit.com/)
**🛠️ Practice:** Build a parameterized PowerShell script to audit local configurations. Hook it to Git pre-commits (`pre-commit`) to automatically run lints and formatters on commit.
**📂 Where:** Local VS Code + PowerShell 7.
**✅ Ship:** Commit `Audit-Config.ps1` and `.pre-commit-config.yaml` to `labs/day-02-powershell-git/`.
**📝 Post:** "Stop pushing bad code. I just hooked up PSScriptAnalyzer and Ruff to Git pre-commits. Never failing a CI pipeline again. #DevOps #PowerShell"
**🔗 Connect to Security:** Pre-commit hooks (like `gitleaks`) are your first line of defense against committing hardcoded secrets (OAuth tokens, API keys) which non-human identities rely on. 

---

## Day 3: Docker & Containerization Deep Dive

**🎯 Objective:** Package application logic securely in isolated containers.
**📖 Learn:** 
- [Docker Official Getting Started (1 hr)](https://docs.docker.com/get-started/)
- [Docker multi-stage docs (30m)](https://docs.docker.com/build/building/multi-stage/)
**🛠️ Practice:** Containerize your Day 1 Python FastAPI service. Exclude dev-dependencies from the production image and verify rootless execution.
**📂 Where:** Local Docker Desktop or [Play with Docker](https://labs.play-with-docker.com/).
**✅ Ship:** Commit `Dockerfile` and `docker-compose.yml` to `labs/day-03-docker/`.
**📝 Post:** "Multi-stage Docker builds: How I cut my Python container size by 70% and removed root access. #Docker #Security"
**🔗 Connect to Security:** Running containers as root is the fastest way to get your host compromised. Hardening containers (non-root, minimal distroless base images) is critical for isolating rogue AI agents.

---

## Day 4: Self-Hosting with Coolify & Reverse Proxies

**🎯 Objective:** Implement a self-hosted cloud platform using Coolify.
**📖 Learn:** 
- [Coolify Official Docs (1 hr)](https://coolify.io/docs)
- [Traefik quickstart (30m)](https://doc.traefik.io/traefik/getting-started/quick-start/)
**🛠️ Practice:** Set up Coolify on a VM or VPS. Deploy your FastAPI application via Coolify with automatic SSL termination.
**📂 Where:** Oracle Cloud Always Free VM (or Hetzner).
**✅ Ship:** Commit a screenshot of your Coolify dashboard and deployed app URL to `labs/day-04-coolify/README.md`.
**📝 Post:** "Goodbye Vercel, hello self-hosting. Deployed my own PaaS with Coolify on a free Oracle ARM VM today. #DevOps #SelfHosted"
**🔗 Connect to Security:** Self-hosting gives you complete control over your data residency and network boundary—essential when handling sensitive context for enterprise LLM operations.

---

## Day 5: Supabase Core: DB, Auth & Edge Functions

**🎯 Objective:** Build cloud backend APIs, storage, and database triggers.
**📖 Learn:** 
- [Fireship — Supabase in 100 Seconds (5m)](https://www.youtube.com/watch?v=7uKQBl9uZ00)
- [Supabase Docs (2 hrs)](https://supabase.com/docs)
**🛠️ Practice:** Set up Supabase CLI. Define database schemas for a booking platform, and deploy an Edge Function that transforms and inserts incoming web requests.
**📂 Where:** Free Supabase cloud project + local Supabase CLI.
**✅ Ship:** Commit `supabase/migrations/` and `supabase/functions/` to `labs/day-05-supabase/`.
**📝 Post:** "Postgres + Auth + APIs out of the box. Building a backend in Supabase today. #Supabase #Backend"
**🔗 Connect to Security:** Identity is the new perimeter. Supabase Auth handles the complex cryptography of JWT generation, which your NHIs (agents) will need to authenticate securely against your APIs.

---

## Day 6: Supabase Row Level Security (RLS) & JWT Auth

**🎯 Objective:** Secure databases at the engine level using token claims.
**📖 Learn:** 
- [Supabase RLS Guide (1 hr)](https://supabase.com/docs/guides/database/postgres/row-level-security)
**🛠️ Practice:** Configure RLS policies on your booking database to ensure users can only view, edit, or delete items where `user_id == auth.uid()`.
**📂 Where:** Supabase SQL Editor.
**✅ Ship:** Commit the `.sql` file containing your RLS policies to `labs/day-06-supabase-rls/`.
**📝 Post:** "Don't trust your API layer to enforce security. Moving authorization down to the database engine with Row Level Security (RLS) in Postgres. #PostgreSQL #Security"
**🔗 Connect to Security:** Application-level authorization fails when agents find shadow APIs. RLS ensures that even if an AI agent exploits an endpoint (BOLA/IDOR), the database engine rejects unauthorized queries based on the JWT claim.

---

## Day 7: n8n Workflow Automation Architecture

**🎯 Objective:** Connect disparate systems using n8n workflows.
**📖 Learn:** 
- [n8n Official Docs (1 hr)](https://docs.n8n.io/)
- [n8n YouTube Channel (1 hr)](https://www.youtube.com/@n8n-io)
**🛠️ Practice:** Create an n8n workflow triggered by an external POST webhook. Parse the JSON, query your Supabase database, and push custom Slack alerts.
**📂 Where:** Self-hosted n8n (via Docker on your VM).
**✅ Ship:** Export the workflow JSON and commit to `labs/day-07-n8n/`.
**📝 Post:** "Replacing Zapier with self-hosted n8n. Built a webhook-to-database-to-Slack pipeline for zero monthly cost. #Automation #n8n"
**🔗 Connect to Security:** n8n acts as an orchestrator. Securing n8n (using HTTPS, restricting webhook IPs, managing OAuth tokens securely) is identical to securing an agentic workflow platform.

---

## Day 8: Modern SaaS APIs (Cal.com, Documenso, NocoDB)

**🎯 Objective:** Integrate industry-standard business APIs.
**📖 Learn:** 
- [Cal.com Developer Docs (30m)](https://cal.com/docs/enterprise-features/api)
- [NocoDB Docs (30m)](https://docs.nocodb.com/)
**🛠️ Practice:** Set up an integration where a Cal.com booking webhook triggers Documenso API to send a document for digital signing, logging progress inside NocoDB.
**📂 Where:** API docs + n8n or Python.
**✅ Ship:** Commit integration script or workflow JSON to `labs/day-08-saas-apis/`.
**📝 Post:** "Connected Cal.com, Documenso, and NocoDB via API today. Open-source alternatives to Calendly, DocuSign, and Airtable are production-ready. #OpenSource #APIs"
**🔗 Connect to Security:** Managing OAuth grants and API keys for third-party SaaS is the definition of Non-Human Identity (NHI) governance. If your API key leaks, the attacker owns your workflow.

---

## Day 9: LangChain Foundation & LLM Tool Calling

**🎯 Objective:** Interface with Large Language Models and expose tools to them.
**📖 Learn:** 
- [LangChain Tool Calling Guide (1 hr)](https://python.langchain.com/docs/how_to/tool_calling/)
**🛠️ Practice:** Create a Python script using LangChain that binds a calculations tool (e.g., basic math) to an LLM, forcing the LLM to call the tool instead of hallucinating the answer.
**📂 Where:** Local Python + Google AI Studio (Gemini free tier) or Groq.
**✅ Ship:** Commit `agent.py` to `labs/day-09-langchain/`.
**📝 Post:** "LLMs are bad at math, but good at using calculators. Built my first agent with LangChain tool-calling today using the free Gemini API. #AI #LangChain"
**🔗 Connect to Security:** Tool calling is where AI becomes dangerous (Agentic Top 10). If you give an LLM a `delete_file` tool without human-in-the-loop or authorization checks, prompt injection turns into Remote Code Execution (RCE).

---

## Day 10: Phase 1 Capstone: Auto-Remediation Identity Script

**🎯 Objective:** Consolidate Phase 1 skills into a functional automation tool.
**📖 Learn:** Review Days 1-9.
**🛠️ Practice:** Build an automation that listens to simulated identity log additions via webhook, writes the telemetry to Supabase, triggers an n8n flow, and uses LangChain to generate an admin remediation script.
**📂 Where:** Local environment connecting to Supabase and n8n.
**✅ Ship:** Commit the entire project to `projects/phase-1-auto-remediation/`.
**📝 Post:** "10 days down. Built a full auto-remediation pipeline combining Python, Supabase, n8n, and LangChain. The foundation is set. On to Phase 2. #BuildInPublic #AI"
**🔗 Connect to Security:** This project simulates a real-world SOAR (Security Orchestration, Automation, and Response) pipeline. Automating incident response safely requires robust NHI identity boundaries between the trigger, the database, and the LLM.
