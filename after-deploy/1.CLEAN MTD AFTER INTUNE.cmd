@echo off
:: // ***************************************************************************
:: //
:: //
:: // File:      SetupComplete.cmd
:: //
:: // Version:   1.0
:: //
:: // Purpose:   Cleanup after MDT Autopilot deployment
:: //
:: // ***************************************************************************

:: Workaround for incorrectly-registered TS environment
reg delete HKCR\Microsoft.SMS.TSEnvironment /f > nul 2>&1
rmdir /Q /S c:\MININT 
rmdir /Q /S c:\_SMSTaskSequence
del /Q c:\LTIBootstrap.vbs
reg delete HKLM:\SOFTWARE\Microsoft\CCM -Recurse -Force -EA SilentlyContinue /f > nul 2>&1
reg delete HKLM:\SOFTWARE\Microsoft\CCMSetup -Recurse -Force -EA SilentlyContinue /f > nul 2>&1
reg delete HKLM:\SOFTWARE\Microsoft\SMS -Recurse -Force -EA SilentlyContinue /f > nul 2>&1
rmdir /Q /S C:\Windows\CCM
rmdir /Q /S C:\Windows\CCMCache
rmdir /Q /S C:\Windows\CCMSetup
del /Q C:\Windows\SMSCFG.ini
del /Q C:\Windows\sms*.mif

pause
