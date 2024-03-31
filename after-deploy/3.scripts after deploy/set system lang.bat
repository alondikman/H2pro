tzutil /s "Israel Standard Time"
powershell.exe "Set-WinSystemLocale he-il"
powershell.exe "Set-Culture en-us"
powershell.exe "Set-WinHomeLocation -GeoId 117"
powershell.exe "Set-WinUserLanguageList en-us, he-il -Force -Confirm:$false"

pause