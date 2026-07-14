# ========================================
# 60-Day Study Plan — Setup Verification
# Run from the repo root: pwsh -File .\verify-setup.ps1
# ========================================
$results = @()

function Test-Tool {
    param([string]$Name, [scriptblock]$Check)
    try {
        $out = (& $Check 2>&1 | Select-Object -First 1)
        if ($LASTEXITCODE -and $LASTEXITCODE -ne 0) { throw $out }
        $script:results += [pscustomobject]@{ Tool = $Name; Status = 'OK'; Detail = "$out" }
    } catch {
        $script:results += [pscustomobject]@{ Tool = $Name; Status = 'MISSING'; Detail = "$_" }
    }
}

# Core CLI tools
Test-Tool "Python"     { py --version }
Test-Tool "pip"        { py -m pip --version }
Test-Tool "Node.js"    { node --version }
Test-Tool "Git"        { git --version }
Test-Tool "Docker"     { docker --version }
Test-Tool "Terraform"  { terraform --version }
Test-Tool "AWS CLI"    { aws --version }
Test-Tool "GitHub CLI" { gh --version }
Test-Tool "Ollama"     { ollama --version }
Test-Tool "kubectl"    { kubectl version --client }
Test-Tool "Helm"       { helm version --short }
Test-Tool "Minikube"   { minikube version }
Test-Tool "Supabase"   { supabase --version }
Test-Tool "Poetry"     { poetry --version }

# Shared venv packages
$venvPy = ".\.venv\Scripts\python.exe"
if (Test-Path $venvPy) {
    foreach ($pkg in 'pydantic','fastapi','httpx','langchain','langgraph','chromadb','mcp') {
        Test-Tool "venv: $pkg" { & $venvPy -c "import $pkg; print(getattr($pkg,'__version__','ok'))" }
    }
} else {
    $results += [pscustomobject]@{ Tool = '.venv'; Status = 'MISSING'; Detail = 'Run setup.ps1 first' }
}

# PowerShell modules (setup.ps1 installs to LOCALAPPDATA; ensure it's on the path)
$localMods = "$env:LOCALAPPDATA\PowerShell\Modules"
if ((Test-Path $localMods) -and ($env:PSModulePath -notlike "*$localMods*")) { $env:PSModulePath += ";$localMods" }
Test-Tool "PSScriptAnalyzer" { (Get-Module -ListAvailable PSScriptAnalyzer | Select-Object -First 1).Version.ToString() }

$results | Format-Table -AutoSize
$missing = @($results | Where-Object Status -eq 'MISSING')
if ($missing.Count) {
    Write-Host "$($missing.Count) item(s) missing — see table above." -ForegroundColor Yellow
    exit 1
}
Write-Host "All checks passed." -ForegroundColor Green
