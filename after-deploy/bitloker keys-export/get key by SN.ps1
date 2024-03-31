$sn = Get-WmiObject win32_bios | Select -ExpandProperty "SerialNumber"
$loc = Get-Location
cd $loc\keys
Get-Content .\$sn.txt

pause