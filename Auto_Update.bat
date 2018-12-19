@echo off
cd C:\ProgramData\sysmon\
@powershell Start-BitsTransfer -Source https://raw.githubusercontent.com/famsedition/Sysmon-Auto-Install/master/sysmonconfig-ionstorm.xml -Destination C:\ProgramData\sysmon\sysmonconfig-export.xml
sysmon64 -c sysmonconfig-export.xml
exit
