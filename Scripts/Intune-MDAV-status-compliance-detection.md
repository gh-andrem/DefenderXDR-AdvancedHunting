# Intune MDAV Status - Compliance Policy Detection

- Version 1.0 (created 1/12/2026)
- Description: Returns MDAV status (active, passive, EDR blocked, unknown) to be used in a compliance policy as custom script. Use the below json to mark device as non-compliant if MDAV is not active.
- This is useful if a new device is being deployed that already has a 3rd-party antivirus/EDR solution installed. When the device is enrolled into Intune and onboarded to MDE, MDAV will go into passive/EDR-blocked mode. Once the device is non-compliant (thanks to this script and JSON) it can be blocked via Entra ID conditional
access policies.
- Change the `MoreInfoUrl` and `Description` keys in the JSON below to reflect your URL and email respectively. The end user will see this message in the Company Portal on a device that is manage by Intune.

## Custom Script
```powershell
$MDAVinfo = Get-MpComputerStatus | Select-Object -ExpandProperty AMRunningMode
$hash = @{mdavMode = $MDAVinfo}
return $hash | ConvertTo-Json -Compress
```

## JSON
```json
{
"Rules":[
    {
       "SettingName":"mdavMode",
       "Operator":"IsEquals",
       "DataType":"String",
       "Operand":"Normal",
       "MoreInfoUrl":"https://TICKET-SYSTEM.COM",
       "RemediationStrings":[
          {
             "Language":"en_US",
             "Title":"Your device is not compliant.",
             "Description":"MDAV is {ActualValue}. Please contact IT support at EMAIL@DOMAIN.COM for assistance."
          }
       ]
    }
 ]
}
```
