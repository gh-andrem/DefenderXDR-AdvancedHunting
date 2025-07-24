#name: MDAV Platform Update Status
#updated: 7/24/2025
#description:
#This script returns unique results when the SENSE service started (event ID 1). This most likely happened after a reboot or when the version updated.
#Please be aware: There is a discrepancy between the MsSense.exe version and the Sense version in the result of event ID 1. The Sense version in event ID 1 shows the OS Build version after the Sense major version.
#For example: OS Build is 17763.7558, therefore the Sense version in event ID 1 is 10.8797.17763.7558. The version of the (locally running) MsSense.exe is 10.8797.25857.1000.
#This query can be used to roughly check if the MsSense versions are up-to-date. Compare version with https://learn.microsoft.com/en-us/defender-endpoint/windows-whatsnew.

$LastSenseUpdateEvents = Get-WinEvent -FilterHashtable @{logname="Microsoft-Windows-SENSE/Operational"; id=1} -MaxEvents 1000 | Select-Object TimeCreated, @{name="EngineVersion"; expression={ $_.Properties[0].value }} | Sort-Object -Property TimeCreated
$previousVersion = $null
$LastSenseUpdate = @()
foreach ($event in $LastSenseUpdateEvents) {
    $currentVersion = $event.EngineVersion
    if ($currentVersion -ne $previousVersion) {
        $LastSenseUpdate += [PSCustomObject]@{
            TimeCreated   = $event.TimeCreated
            EngineVersion = $currentVersion
        }
        $previousVersion = $currentVersion
    }
}
$LastSenseUpdate
