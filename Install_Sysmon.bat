@echo off
mkdir C:\ProgramData\sysmon
pushd "C:\ProgramData\sysmon\"
echo [+] Downloading Sysmon...
@powershell Import-Module BitsTransfer
@powershell Start-BitsTransfer -Source https://live.sysinternals.com/Sysmon64.exe -Destination C:\ProgramData\sysmon\sysmon64.exe
echo [+] Downloading Sysmon files...
@powershell Start-BitsTransfer -Source https://raw.githubusercontent.com/famsedition/Sysmon-Auto-Install/master/sysmon-config.xml -Destination C:\ProgramData\sysmon\sysmon-config.xml
@powershell Start-BitsTransfer -Source https://raw.githubusercontent.com/famsedition/Sysmon-Auto-Install/master/Auto_Update.bat -Destination C:\ProgramData\sysmon\Auto_Update.bat
@powershell Start-BitsTransfer -Source https://raw.githubusercontent.com/famsedition/Sysmon-Auto-Install/master/Uninstall.bat -Destination C:\ProgramData\sysmon\Uninstall.bat
sysmon64.exe -accepteula -i sysmon-config.xml
echo [+] Sysmon Successfully Installed!
echo [+] Creating Auto Update Task set to Hourly..
SchTasks /Create /RU SYSTEM /RL HIGHEST /SC HOURLY /TN Update_Sysmon_Rules /TR C:\ProgramData\sysmon\Auto_Update.bat /F