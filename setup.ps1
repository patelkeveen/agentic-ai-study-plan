# ========================================
# 60-Day Study Plan — Environment Setup
# Run in PowerShell 7 (pwsh) from the repo root:
#   pwsh -File .\setup.ps1
# Safe to re-run; each step is independent.
# ========================================
$ErrorActionPreference = 'Continue'
$failures = @()

function Invoke-Step {
    param([string]$Name, [scriptblock]$Action)
    Write-Host "`n=== $Name ===" -ForegroundColor Cyan
    try {
        & $Action
        if ($LASTEXITCODE -and $LASTEXITCODE -ne 0) { throw "exit code $LASTEXITCODE" }
        Write-Host "OK: $Name" -ForegroundColor Green
    } catch {
        Write-Host "FAILED: $Name — $_" -ForegroundColor Red
        $script:failures += $Name
    }
}

Invoke-Step "Step 1: pip" {
    py -m ensurepip --upgrade
    py -m pip install --upgrade pip
}

Invoke-Step "Step 2: pipx + Poetry + uv" {
    py -m pip install --user pipx
    py -m pipx ensurepath
    py -m pipx install poetry
    py -m pipx install uv
}

Invoke-Step "Step 3: shared .venv with core Python stack" {
    if (-not (Test-Path ".\.venv")) { py -m venv .venv }
    & .\.venv\Scripts\python.exe -m pip install --upgrade pip
    & .\.venv\Scripts\python.exe -m pip install `
        pydantic fastapi "uvicorn[standard]" httpx `
        mypy pre-commit pytest ruff black `
        langchain langchain-core langchain-community langgraph `
        langchain-google-genai langchain-groq `
        chromadb mcp
    # NOTE: crewai, nemoguardrails, ragas, locust, logfire are installed
    # per-lab (Days 28, 37, 40, 43, 44) in their own venvs — they pin
    # conflicting LangChain/Pydantic versions.
}

Invoke-Step "Step 4: Node tools (supabase, n8n)" {
    npm install -g supabase n8n
}

Invoke-Step "Step 5: PSScriptAnalyzer" {
    Install-Module -Name PSScriptAnalyzer -Force -Scope CurrentUser -ErrorAction Stop
}

Invoke-Step "Step 6: Minikube" {
    winget install Kubernetes.minikube --accept-package-agreements --accept-source-agreements
}

Invoke-Step "Step 7: Ollama models" {
    ollama pull llama3.2
    ollama pull nomic-embed-text
}

Write-Host "`n=== SETUP COMPLETE ===" -ForegroundColor Green
if ($failures.Count) {
    Write-Host "Steps that need attention: $($failures -join ', ')" -ForegroundColor Yellow
}
Write-Host "Restart your terminal, then run: pwsh -File .\verify-setup.ps1" -ForegroundColor Yellow
