tzutil /s "Israel Standard Time"
powershell.exe "Set-WinSystemLocale en-il"
powershell.exe "Set-Culture en-il"
powershell.exe "Set-WinHomeLocation -GeoId 117"
powershell.exe "Set-WinUserLanguageList en-il, he-il -Force -Confirm:$false"

pause
