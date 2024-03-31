setlocal
SET high_performance=Power Scheme GUID: 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c  (High performance)
Powercfg -getactivescheme > tmp.txt
SET /p active= < tmp.txt
IF "%active%" == "%high_performance%" (
Powercfg -s 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c
) ELSE (
Powercfg -s 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c
)
DEL tmp.txt

rem screen timeout
powercfg /change monitor-timeout-ac 15
powercfg /change monitor-timeout-dc 15

rem HD timeout
powercfg -change -disk-timeout-ac 0
powercfg -change -disk-timeout-dc 60

rem lid options (AC Do nothing)
powercfg -setacvalueindex SCHEME_CURRENT 4f971e89-eebd-4455-a8de-9e59040e7347 5ca83367-6e45-459f-a27b-476b1d01c936 0

rem sleep after
powercfg -change -standby-timeout-dc 45
powercfg -change -standby-timeout-ac 0

endlocal