Set-ExecutionPolicy -ExecutionPolicy Bypass -Scope Process -Force

$firstname = Read-Host -Prompt 'Enter first name:'
$lastname = Read-Host -Prompt 'Enter last name:'

# Combine first and last name into full name
$fullname = "$firstname $lastname"

# Determine if the computer is a laptop or desktop
$type = Get-CimInstance -ClassName Win32_ComputerSystem | select -ExpandProperty PCSystemType
if ($type -eq 2) {
    $pcType = "laptop"
} else {
    $pcType = "desktop"
}

# Replace spaces with empty string
$name = $fullname.Replace(" ", "")

# Create the new computer name
$newname = "$name-$pcType".ToUpper()

# Display a warning message with the new computer name
Write-Warning "Computer name will be changed to $newname"

pause

