#=============================================================================================================================
#
# Script Name:     GraphAPI-Assign-Permissions-Managed-Identity.ps1
# Description:     Assign Graph API application permissions to a managed identity (e.g. for Azure Runbooks, Logic Apps, ...)
# Arguments:       none
# Prerequisites:   Microsoft.Graph PowerShell module
# Version:	       1.0 (created 12/19/2024)
#
#=============================================================================================================================

Import-Module Microsoft.Graph
Connect-MgGraph -Scopes "Application.Read.All, AppRoleAssignment.ReadWrite.All"

#$MIGuid = "ADD YOUR MANAGED ID OBJECT ID"
$MI = Get-MgServicePrincipal -Filter "Id eq '$MIGuid'"
$GraphAppId = "00000003-0000-0000-c000-000000000000"

$permissions = @(
      "User.Read.All",
      "UserAuthenticationMethod.Read.All"
    )

$GraphServicePrincipal = Get-MgServicePrincipal -Filter "appId eq '$GraphAppId'"

foreach ($permission in $Permissions) {
  $AppRole = $GraphServicePrincipal.AppRoles | Where-Object {$_.Value -eq $permission -and $_.AllowedMemberTypes -contains "Application"}
  $params = @{
       principalId = $MI.Id
       resourceId = $GraphServicePrincipal.Id
       appRoleId = $AppRole.Id
  }
  New-MgServicePrincipalAppRoleAssignment -ServicePrincipalId $MI.Id -BodyParameter $params
}
