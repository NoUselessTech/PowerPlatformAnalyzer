# Apps

## Critical Properties
- AppName
- DisplayName
- CreatedTime
- Owner
- LastModifiedTime
- Environment
- BypassConsent
- 

## Data Structure
```
AppName                  : dab6b7c2-683f-4579-ae5d-2d207a858181
DisplayName              : Leave Request_0422
CreatedTime              : 2023-03-03T05:11:23.6226162Z
Owner                    : @{id=fcd8f604-98a2-4e8e-885a-5747a0489cf1; displayName=Connor Peoples; email=connor@peoplesdynamics.com; type=User;
                           tenantId=3a6daad1-6fd0-4543-8a89-4f7b01e7458d; userPrincipalName=connor@peoplesdynamics.com}
LastModifiedTime         : 2023-03-03T05:11:24.1067313Z
EnvironmentName          : default-3a6daad1-6fd0-4543-8a89-4f7b01e7458d
UnpublishedAppDefinition :
IsFeaturedApp            : False
IsHeroApp                : False
BypassConsent            : False
Internal                 : @{name=dab6b7c2-683f-4579-ae5d-2d207a858181; id=/providers/Microsoft.PowerApps/scopes/admin/environments/default-3a6daad1-6fd0-4543-8a89-4f 
                           7b01e7458d/apps/dab6b7c2-683f-4579-ae5d-2d207a858181; type=Microsoft.PowerApps/scopes/admin/apps; tags=; properties=;
                           appLocation=unitedstates; appType=ClassicCanvasApp}
```

## List Environment
Command
`Get-AdminPowerApp`

## Remove Environment
Command
`Remove-AdminPowerApp -AppName <AppName>`

## Create environment
_Not available through admin powershell_