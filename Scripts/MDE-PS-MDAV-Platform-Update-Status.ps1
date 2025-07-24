#name: MDAV Platform Update Status
#updated: 7/24/2025
#description: This script returns the most recent Defender for Antivirus platform update events (event ID 2014).

Get-WinEvent -FilterHashtable @{logname="Microsoft-Windows-Windows Defender/Operational"; id=2014} -MaxEvents 2000 | Select-Object TimeCreated, @{name="PlatformVersion"; expression={ $_.Properties[1].value }}
