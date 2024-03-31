if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Start-Process PowerShell -Verb RunAs "-NoProfile -ExecutionPolicy Bypass -Command `"cd '$pwd'; & '$PSCommandPath';`"";
    exit;
}

$user = (Get-WMIObject -ClassName Win32_ComputerSystem).Username
 Write-Warning "$user will be adedd to local admin on this computer."

$confirmation = Read-Host "Add $user as local admin? [y/n]"
while($confirmation -ne "y")
{
    if ($confirmation -eq 'n') {exit}
    $confirmation = Read-Host "Add $user as local admin? [y/n]"
}

Add-LocalGroupMember -Group "Administrators" -Member "$user"

pause