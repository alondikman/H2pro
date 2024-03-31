if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Start-Process PowerShell -Verb RunAs "-NoProfile -ExecutionPolicy Bypass -Command `"cd '$pwd'; & '$PSCommandPath';`"";
    exit;
}
Set-ExecutionPolicy -ExecutionPolicy Bypass -Scope Process -Force
$loc = Get-Location
(Get-BitLockerVolume -MountPoint c).KeyProtector > $loc\keys\BitLocker_Recovery_Key.txt
$sn = Get-WmiObject win32_bios | Select -ExpandProperty "SerialNumber"
Rename-Item -Path "$loc\keys\BitLocker_Recovery_Key.txt" -NewName "$sn.txt"

pause
