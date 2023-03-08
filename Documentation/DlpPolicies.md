# DLP Policies

## Overview
DLP Policies allow organizations to limit the flow of information through the PowerAutomate suite of functionality.

## Data Structure
```
PolicyName           : dbaa3095-751c-46ae-89fb-a0963eceb59a
Type                 : Microsoft.BusinessAppPlatform/scopes/apiPolicies
DisplayName          : TestPolicy
CreatedTime          : 2023-03-07T02:02:02.3418739Z
CreatedBy            : @{id=fcd8f604-98a2-4e8e-885a-5747a0489cf1; displayName=Connor Peoples; 
                       email=connor@peoplesdynamics.com; type=User; 
                       tenantId=3a6daad1-6fd0-4543-8a89-4f7b01e7458d; 
                       userPrincipalName=connor@peoplesdynamics.com}
LastModifiedTime     : 2023-03-07T02:02:02.3418739Z
LastModifiedBy       : @{id=fcd8f604-98a2-4e8e-885a-5747a0489cf1; displayName=Connor Peoples; 
                       email=connor@peoplesdynamics.com; type=User; 
                       tenantId=3a6daad1-6fd0-4543-8a89-4f7b01e7458d; 
                       userPrincipalName=connor@peoplesdynamics.com}
Constraints          : 
BusinessDataGroup    : {}
NonBusinessDataGroup : {@{id=/providers/Microsoft.PowerApps/apis/shared_office365; name=Office 
                       365 Outlook; type=Microsoft.PowerApps/apis}, 
                       @{id=/providers/Microsoft.PowerApps/apis/shared_office365users; 
                       name=Office 365 Users; type=Microsoft.PowerApps/apis}, 
                       @{id=/providers/Microsoft.PowerApps/apis/shared_sharepointonline; 
                       name=SharePoint; type=Microsoft.PowerApps/apis}, 
                       @{id=/providers/Microsoft.PowerApps/apis/shared_onedriveforbusiness; 
                       name=OneDrive for Business; type=Microsoft.PowerApps/apis}...}
BlockedGroup         : {}
FilterType           : 
Environments         : 
```

## List Policies
Command
`Get-AdminDlpPolicy`

## Delete Policy
Command
`Remove-AdminDlpPolicy -PolicyName <PolicyName>`