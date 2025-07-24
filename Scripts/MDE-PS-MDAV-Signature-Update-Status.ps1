#name: MDAV Signature Update Status
#updated: 7/24/2025
#description:
#This script returns the most recent Defender for Antivirus signature update events (event ID 2000), either full or delta updates.
#It might be helpful for troubleshooting issues related to signature update cycle/process.

$LastMDAVSigs = Get-WinEvent -FilterHashtable @{logname="Microsoft-Windows-Windows Defender/Operational"; id=2000} -MaxEvents 25 | Select-Object TimeCreated,
    @{name="CurrentSignatureVersion"; expression={ $_.Properties[2].value }},
    @{name="PreviousSignatureVersion"; expression={ $_.Properties[3].value }},
    @{name="UpdateType"; expression={ $_.Properties[13].value }}
$LastMDAVSigs | Sort-Object -Property CurrentSignatureVersion -Unique | Sort-Object -Property TimeCreated
