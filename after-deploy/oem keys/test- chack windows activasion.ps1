$WinVerAct = (cscript /Nologo "C:\Windows\System32\slmgr.vbs" /xpr) -join ''

if ($WinVerAct -cnotin "The machine is permanently activated")
	{
		 Write-Warning "Alredy activated."
	}
	else
	{
Write-Warning "Not Activated."
$key = (Get-WmiObject -query ‘select * from SoftwareLicensingService’).OA3xOriginalProductKey
Write-Host $key
}

pause
