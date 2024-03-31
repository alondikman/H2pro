if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Start-Process PowerShell -Verb RunAs "-NoProfile -ExecutionPolicy Bypass -Command `"cd '$pwd'; & '$PSCommandPath';`"";
    exit;
}

# Get the username of the current user
$user = (Get-WMIObject -ClassName Win32_ComputerSystem).Username

# Extract the username from the domain name
$index = $user.IndexOf("\")
$name = $user.Substring($index+1)

# Determine if the computer is a laptop or desktop
$type = Get-CimInstance -ClassName Win32_ComputerSystem | select -ExpandProperty PCSystemType
if ($type -eq 2) {
    $type = "laptop"
} else {
    $type = "desktop"
}

# Create the new computer name
$newname = "$name-$type".ToUpper()

# Display a warning message with the new computer name
Write-Warning "Computer name will be changed to $newname"

# Prompt the user for confirmation to change the computer name
$confirmation = Read-Host "Change computer name? [y/n]"
while($confirmation -ne "y") {
    if ($confirmation -eq 'n') {exit}
    $confirmation = Read-Host "Change computer name? [y/n]"
}

# Change the computer name
Rename-Computer -NewName "$newname"

pause

