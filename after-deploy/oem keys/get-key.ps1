$sn = Get-WmiObject win32_bios | Select -ExpandProperty "SerialNumber"
Push-Location -Path .\ -StackName "Paths"
Set-Location -StackName "Paths"
cd .\keys
Get-Content .\$sn.txt

pause