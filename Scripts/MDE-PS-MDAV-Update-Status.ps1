#name: MDAV Update Status
#description:
#This PS script returns the most recent 15 Defender update events (event ID 2000) on any Windows device to detect issues with the signature update cycle/process.

$LastMDAVUpdates = Get-WinEvent -FilterHashtable @{logname="Microsoft-Windows-Windows Defender/Operational"; id=2000} -MaxEvents 15 | Select-Object TimeCreated, @{name="CurrentSignatureVersion"; expression={ $_.Properties[2].value }}, @{name="PreviousSignatureVersion"; expression={ $_.Properties[3].value }}, @{name="UpdateType"; expression={ $_.Properties[13].value }}
$LastMDAVUpdates | Sort-Object -Property CurrentSignatureVersion -Unique | Sort-Object -Property TimeCreated
