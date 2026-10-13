$ErrorActionPreference = 'Stop'

Set-Location 'C:\home\phillipsenn.com\wwwroot\2026Fall2'

git fetch origin main
if ($LASTEXITCODE -ne 0) {
    throw 'Fetch failed.'
}

Write-Host ''
Write-Host 'Files to be deployed:'
git diff --name-status HEAD origin/main
if ($LASTEXITCODE -ne 0) {
    throw 'Diff failed.'
}

Write-Host ''
Read-Host 'Press Enter to deploy, or Ctrl+C to cancel'

git reset --hard origin/main
if ($LASTEXITCODE -ne 0) {
    throw 'Deployment failed.'
}

Write-Host ''
Write-Host 'Deployment successful.'