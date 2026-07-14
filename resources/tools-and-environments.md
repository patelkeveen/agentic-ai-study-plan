# 🧰 Tools, Environments & Free Accounts — Complete Setup Guide

> Everything you need installed and configured before Day 1. Estimated setup time: 2–3 hours.

---

## ✅ Already Installed on Your Machine

Based on your current environment, you already have:

| Tool | Version | Status |
|:-----|:--------|:-------|
| Python | 3.14.6 (via `py`) | ✅ Ready |
| Node.js | 24.12.0 | ✅ Ready |
| npm | 11.13.0 | ✅ Ready |
| Git | 2.54.0 | ✅ Ready |
| Docker Desktop | 29.5.3 | ✅ Ready |
| Terraform | 1.15.7 | ✅ Ready |
| AWS CLI | 2.35.11 | ✅ Ready |
| GitHub CLI (gh) | 2.95.0 | ✅ Ready |
| Ollama | 0.30.11 | ✅ Ready |
| kubectl | 1.34.1 | ✅ Ready |
| Helm | 4.2.2 | ✅ Ready |
| VS Code | 1.126.0 | ✅ Ready |
| PowerShell 7 | 7.x (pwsh) | ✅ Ready |
| curl | 8.20.0 | ✅ Ready |

---

## 🔴 Need to Install

### 1. pip (Python package manager)

Python is installed but `pip` isn't on PATH. Fix:
```powershell
py -m ensurepip --upgrade
py -m pip install --upgrade pip
# Verify:
py -m pip --version
```

### 2. Poetry (Python dependency management) — Day 1
```powershell
# Install via pipx (recommended)
py -m pip install pipx
py -m pipx ensurepath
pipx install poetry
# Restart terminal, then verify:
poetry --version
```

### 3. uv (Fast Python package manager — optional but recommended)
```powershell
# Install uv
powershell -ExecutionPolicy ByPass -c "irm https://astral.sh/uv/install.ps1 | iex"
# Restart terminal, then verify:
uv --version
```

### 4. Supabase CLI — Day 5
```powershell
# Install via npm
npm install -g supabase
# Verify:
supabase --version
```

### 5. Minikube (Local Kubernetes) — Day 31
```powershell
# Install via winget
winget install Kubernetes.minikube
# Verify:
minikube version
```

### 6. n8n (Workflow Automation) — Day 7

Option A — Run via Docker (recommended):
```powershell
docker run -d --name n8n -p 5678:5678 -v n8n_data:/home/node/.n8n n8nio/n8n
# Access at http://localhost:5678
```

Option B — Install globally:
```powershell
npm install -g n8n
n8n start
```

### 7. ChromaDB — Day 25
```powershell
py -m pip install chromadb
# Verify:
py -c "import chromadb; print(chromadb.__version__)"
```

### 8. LangChain + LangGraph — Day 9 / Day 18
```powershell
py -m pip install langchain langchain-core langchain-community langgraph
py -m pip install langchain-google-genai   # For Gemini
py -m pip install langchain-groq           # For Groq
# Verify:
py -c "import langchain; print(langchain.__version__)"
```

### 9. Pydantic v2 — Day 1
```powershell
py -m pip install pydantic
py -c "import pydantic; print(pydantic.__version__)"
```

### 10. FastAPI + Uvicorn — Day 1
```powershell
py -m pip install fastapi uvicorn[standard]
```

### 11. httpx (Async HTTP client) — Day 1
```powershell
py -m pip install httpx
```

### 12. mypy (Type checker) — Day 1
```powershell
py -m pip install mypy
```

### 13. PSScriptAnalyzer (PowerShell linter) — Day 2
```powershell
Install-Module -Name PSScriptAnalyzer -Force -Scope CurrentUser
```

### 14. pre-commit (Git hooks) — Day 2
```powershell
py -m pip install pre-commit
```

### 15. Locust (Load testing) — Day 47
```powershell
py -m pip install locust
```

### 16. Ragas (LLM evaluation) — Day 42
```powershell
py -m pip install ragas
```

### 17. NeMo Guardrails — Day 39
```powershell
py -m pip install nemoguardrails
```

### 18. Logfire (Pydantic observability) — Day 46
```powershell
py -m pip install logfire
```

### 19. CrewAI — Day 28
```powershell
py -m pip install crewai crewai-tools
```

### 20. MCP Python SDK — Day 27
```powershell
py -m pip install mcp
```

---

## 📦 One-Shot Install Script

Run this to install **everything** you'll need across all 60 days:

```powershell
# ========================================
# 60-Day Study Plan — Full Setup Script
# Run in PowerShell 7 (pwsh)
# ========================================

Write-Host "=== Step 1: Fix pip ===" -ForegroundColor Cyan
py -m ensurepip --upgrade
py -m pip install --upgrade pip

Write-Host "=== Step 2: Install Python tools ===" -ForegroundColor Cyan
py -m pip install pipx
py -m pipx ensurepath
pipx install poetry

Write-Host "=== Step 3: Install Python packages ===" -ForegroundColor Cyan
py -m pip install `
    pydantic `
    fastapi `
    "uvicorn[standard]" `
    httpx `
    mypy `
    pre-commit `
    langchain `
    langchain-core `
    langchain-community `
    langgraph `
    langchain-google-genai `
    langchain-groq `
    chromadb `
    crewai `
    crewai-tools `
    mcp `
    nemoguardrails `
    ragas `
    locust `
    logfire `
    pytest `
    ruff `
    black

Write-Host "=== Step 4: Install Node.js tools ===" -ForegroundColor Cyan
npm install -g supabase n8n

Write-Host "=== Step 5: Install PowerShell modules ===" -ForegroundColor Cyan
Install-Module -Name PSScriptAnalyzer -Force -Scope CurrentUser

Write-Host "=== Step 6: Install Minikube ===" -ForegroundColor Cyan
winget install Kubernetes.minikube --accept-package-agreements --accept-source-agreements

Write-Host "=== Step 7: Pull Ollama models ===" -ForegroundColor Cyan
ollama pull llama3.2
ollama pull nomic-embed-text

Write-Host "=== DONE ===" -ForegroundColor Green
Write-Host "Restart your terminal, then run 'verify-setup.ps1' to check everything." -ForegroundColor Yellow
```

Save this as `setup.ps1` in the repo root and run it.

---

## 🌐 Free Accounts to Create

Create these accounts **before Day 1**. All are free, no credit card required (except AWS — but stays within free tier).

### Priority 1 — Needed by Day 1

| Service | URL | What For | Free Tier |
|:--------|:----|:---------|:----------|
| **Google AI Studio** | https://aistudio.google.com/ | Gemini API key for LLM calls | Free — generous rate limits |
| **Groq** | https://console.groq.com/ | Fast free LLM inference (Llama/Mixtral) | Free — rate limited |
| **GitHub** | https://github.com | You already have this | Free |

### Priority 2 — Needed by Day 5

| Service | URL | What For | Free Tier |
|:--------|:----|:---------|:----------|
| **Supabase** | https://supabase.com/ | Database, Auth, Edge Functions | 2 free projects |
| **Oracle Cloud** | https://cloud.oracle.com/ | Free VPS for self-hosting (Coolify, n8n) | Always Free — 4 ARM cores, 24GB RAM |

### Priority 3 — Needed by Day 11

| Service | URL | What For | Free Tier |
|:--------|:----|:---------|:----------|
| **AWS** | https://aws.amazon.com/ | Terraform, EKS, GuardDuty, Bedrock | 12-month free tier (needs credit card) |
| **M365 Dev Program** | https://developer.microsoft.com/en-us/microsoft-365/dev-program | Sandbox tenant for PIM, CA policies, Graph API | Free E5 sandbox — 25 users, 90 days |

### Priority 4 — Needed by Day 31+

| Service | URL | What For | Free Tier |
|:--------|:----|:---------|:----------|
| **Langfuse** | https://cloud.langfuse.com/ | LLM observability | 50K observations/month free |
| **Killercoda** | https://killercoda.com/ | Browser-based Kubernetes labs | Free |
| **Splunk** | https://www.splunk.com/en_us/download/splunk-enterprise.html | SIEM practice | Free license — 500MB/day |
| **Microsoft Sentinel Demo** | https://aka.ms/lademo | KQL practice with real data | Free demo workspace |

---

## 🖥️ VS Code Extensions to Install

```powershell
# Run in terminal to batch-install all extensions
code --install-extension ms-python.python
code --install-extension ms-python.vscode-pylance
code --install-extension charliermarsh.ruff
code --install-extension ms-python.mypy-type-checker
code --install-extension ms-vscode.powershell
code --install-extension ms-azuretools.vscode-docker
code --install-extension hashicorp.terraform
code --install-extension amazonwebservices.aws-toolkit-vscode
code --install-extension ms-kubernetes-tools.vscode-kubernetes-tools
code --install-extension ms-vscode-remote.remote-containers
code --install-extension github.copilot
code --install-extension esbenp.prettier-vscode
code --install-extension bradlc.vscode-tailwindcss
code --install-extension saoudrizwan.claude-dev
```

---

## 🐳 Docker Images to Pre-Pull

Pull these early so you're not waiting on downloads during study sessions:

```powershell
# Core images you'll use repeatedly
docker pull python:3.14-slim
docker pull node:24-alpine
docker pull postgres:17-alpine
docker pull n8nio/n8n:latest
docker pull nocodb/nocodb:latest
docker pull supabase/postgres:latest
docker pull nginx:alpine
```

---

## 🧠 Ollama Models to Download

```powershell
# Main coding/reasoning model
ollama pull llama3.2

# Embedding model for vector search
ollama pull nomic-embed-text

# Safety/guardrails model (Day 41)
ollama pull llama-guard3

# Small fast model for testing
ollama pull phi4-mini
```

---

## ✅ Verification Checklist

Run each command to verify your setup is complete:

```powershell
Write-Host "=== Verifying Setup ===" -ForegroundColor Cyan

# Core
py --version                          # Should show 3.14.x
py -m pip --version                   # Should show pip
node --version                        # Should show v24.x
git --version                         # Should show 2.54.x
docker --version                      # Should show 29.x
terraform --version                   # Should show 1.15.x
aws --version                         # Should show 2.35.x
gh --version                          # Should show 2.95.x
ollama --version                      # Should show 0.30.x
kubectl version --client              # Should show 1.34.x
helm version --short                  # Should show 4.2.x

# Python packages
py -c "import pydantic; print(f'Pydantic: {pydantic.__version__}')"
py -c "import fastapi; print(f'FastAPI: {fastapi.__version__}')"
py -c "import langchain; print(f'LangChain: {langchain.__version__}')"
py -c "import langgraph; print(f'LangGraph: {langgraph.__version__}')"
py -c "import chromadb; print(f'ChromaDB: {chromadb.__version__}')"

# Node tools
supabase --version
n8n --version  # Only if installed globally

# PowerShell
Get-Module -ListAvailable PSScriptAnalyzer | Select-Object Version

# Minikube
minikube version

Write-Host "=== All checks complete ===" -ForegroundColor Green
```

---

## 📁 Project Python Environment

For each lab, use this pattern to keep dependencies isolated:

```powershell
# Create a virtual environment for the day's lab
cd labs/day-01-python
py -m venv .venv
.\.venv\Scripts\Activate.ps1

# Install dependencies
py -m pip install -r requirements.txt

# Deactivate when done
deactivate
```

Or with Poetry:
```powershell
cd labs/day-01-python
poetry init
poetry add pydantic fastapi uvicorn httpx
poetry install
```
