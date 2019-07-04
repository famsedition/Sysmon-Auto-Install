@echo off
cd C:\ProgramData\sysmon\
@powershell Start-BitsTransfer -Source https://raw.githubusercontent.com/famsedition/Sysmon-Auto-Install/master/sysmon-config.xml -Destination C:\ProgramData\sysmon\sysmon-config.xml
sysmon64 -c sysmon-config.xml
exit
