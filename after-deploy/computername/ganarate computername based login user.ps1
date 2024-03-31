Set-ExecutionPolicy -ExecutionPolicy Bypass -Scope Process -Force
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
Write-Warning "Computer name will be Need to be $newname"

pause

