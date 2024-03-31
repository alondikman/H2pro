Push-Location -Path .\ -StackName "Paths"
Set-Location -StackName "Paths"
$sn = Get-WmiObject win32_bios | Select -ExpandProperty "SerialNumber"

Set-ExecutionPolicy -ExecutionPolicy Bypass -Scope Process -Force
.\getprodactkey.VBS
Wait-Event -Timeout 10
$loc = Get-Location
cd $loc\keys
Rename-Item -Path "%1%WindowsKeyInfo.txt" -NewName "$sn.txt"

pause