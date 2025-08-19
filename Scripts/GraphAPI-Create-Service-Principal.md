
| App                               | AppId                                | Description                                                                                                                | Link                                                                                                                                                                       |
|-----------------------------------|--------------------------------------|----------------------------------------------------------------------------------------------------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| My Signins                        | 19db86c3-b2b9-44cc-b339-36da233a3be2 | Creates Enterprise Application which can be used in Conditional Access Policy (hint: guests cannot change their authentication methods) |             |
| Microsoft 365 Copilot             | fb8d773d-7ef8-4ec0-a117-179f88add510 |                                                                                                                            | https://learn.microsoft.com/en-us/entra/identity/conditional-access/policy-all-users-copilot-ai-security#create-targetable-service-principals-using-powershell             |
| Microsoft Copilot for Security    | bb5ffd56-39eb-458c-a53a-775ba21277da |                                                                                                                            | https://learn.microsoft.com/en-us/entra/identity/conditional-access/policy-all-users-copilot-ai-security#create-targetable-service-principals-using-powershell             |
| Microsoft Intune Enrollment       | d4ebce55-015a-49b5-a083-c84d1797ae8c |                                                                                                                            | https://learn.microsoft.com/en-us/intune/intune-service/enrollment/multi-factor-authentication#configure-intune-to-require-multifactor-authentication-at-device-enrollment |
| MicrosoftDefenderATP XPlat        | a0e84e36-b067-4d5c-ab4a-3db38e598ae2 | MicrosoftDefenderATP XPlat app is the application responsible for forwarding Defender risk signals to the Defender backend | https://learn.microsoft.com/en-us/defender-endpoint/mobile-resources-defender-endpoint#microsoft-defender-mobile-app-exclusion-from-conditional-access-ca-policies         |
| Microsoft Defender for Mobile TVM | e724aa31-0f56-4018-b8be-f8cb82ca1196 | Microsoft Defender for Mobile TVM (Threat and Vulnerability Management) is the service, which provides the vulnerability assessment for the installed apps on the iOS devices | https://learn.microsoft.com/en-us/defender-endpoint/mobile-resources-defender-endpoint#microsoft-defender-mobile-app-exclusion-from-conditional-access-ca-policies |

---

API POST request to create service principal. Use [Graph Explorer](https://developer.microsoft.com/en-us/graph/graph-explorer)

```
POST https://graph.microsoft.com/v1.0/servicePrincipals
{
  "appId": "X-Y-Z-A"
}
```
