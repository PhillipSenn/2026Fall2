$repo = 'C:\home\phillipsenn.com\wwwroot\2026Fall2'

& git -C $repo pull --ff-only origin main

if ($LASTEXITCODE -ne 0) {
    throw 'Deployment failed.'
}

Write-Host 'Deployment complete.'