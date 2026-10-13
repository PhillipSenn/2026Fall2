$ErrorActionPreference = 'Stop'

Set-Location 'C:\home\phillipsenn.com\wwwroot\2026Fall2'

git fetch origin main
if ($LASTEXITCODE -ne 0) {
    throw 'Fetch failed.'
}

Write-Host ''
Write-Host 'Files changed:'
git diff --name-status HEAD origin/main

git reset --hard origin/main
if ($LASTEXITCODE -ne 0) {
    throw 'Deployment failed.'
}

Write-Host ''
Write-Host 'Deployment successful.'