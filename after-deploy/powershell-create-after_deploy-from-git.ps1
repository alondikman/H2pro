if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Start-Process PowerShell -Verb RunAs "-NoProfile -ExecutionPolicy Bypass -Command `"cd '$pwd'; & '$PSCommandPath';`"";
    exit;
}

# Define the folder path
$folderPath = "C:\after-deploy"
$tempFolderPath = "C:\temp-deploy"

# Check if the folder exists
if(Test-Path -Path $folderPath)
{
    Write-Host "Folder $folderPath already exists. Exiting script."
    exit
}

# Create the folder
New-Item -ItemType Directory -Path $folderPath

# Check if the temp folder exists, if not, create it
if(-not (Test-Path -Path $tempFolderPath))
{
    New-Item -ItemType Directory -Path $tempFolderPath
}

# Define the URL of the GitHub repository
$url = "https://github.com/alondikman/H2pro/tree/da8c0957781c58abd196e8e13bffef70f69f1cd2/after-deploy"

# Download the repository content into the temp folder
Invoke-WebRequest -Uri $url -OutFile "$tempFolderPath\repo.zip"

# Unzip the downloaded file in the temp folder
Expand-Archive -Path "$tempFolderPath\repo.zip" -DestinationPath $tempFolderPath -Force

# Move the contents of the subfolder to the main folder
Get-ChildItem -Path "$tempFolderPath\H2pro-da8c0957781c58abd196e8e13bffef70f69f1cd2\after-deploy" -Recurse | Move-Item -Destination $folderPath

# Delete the temp folder
Remove-Item -Path $tempFolderPath -Recurse -Force

# Check if files are downloaded to the new folder
if((Get-ChildItem -Path $folderPath | Measure-Object).Count -gt 0)
{
    Write-Host "Files have been successfully downloaded to $folderPath."
}
else
{
    Write-Host "No files were downloaded to $folderPath."
}

pause
