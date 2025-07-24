#name: MDAV Engine Update Status
#updated: 7/24/2025
#This script returns the most recent Defender for Antivirus engine update events (event ID 2002).

Get-WinEvent -FilterHashtable @{logname="Microsoft-Windows-Windows Defender/Operational"; id=2002} -MaxEvents 1000 | Select-Object TimeCreated, @{name="EngineVersion"; expression={ $_.Properties[2].value }}
