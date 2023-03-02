# Environments
Environment in PowerPlatform are ways to group apps, data, and flows together and restrict their access through security groups. Effectively, these are the "resource groups" of powerplatform.

# Default
By default, no environments are in use within the organization.

# List Environments
Get-AdminPowerAppEnvironment
```
{
	"EnvironmentName": "Default-3a6daad1-6fd0-4543-8a89-4f7b01e7458d",
	"DisplayName": "Peoples Dynamics LLC (default)",
	"Description": null,
	"IsDefault": true,
	"Location": "unitedstates",
	"CreatedTime": "2023-03-02T22:51:11.4884778Z",
	"CreatedBy": {
		"id": "SYSTEM",
		"displayName": "SYSTEM",
		"type": "NotSpecified"
	},
	"LastModifiedTime": null,
	"LastModifiedBy": null,
	"CreationType": "DefaultTenant",
	"EnvironmentType": "Default",
	"CommonDataServiceDatabaseProvisioningState": "Succeeded",
	"CommonDataServiceDatabaseType": "None",
	"Internal": {
		"id": "/providers/Microsoft.BusinessAppPlatform/scopes/admin/environments/Default-3a6daad1-6fd0-4543-8a89-4f7b01e7458d",
		"type": "Microsoft.BusinessAppPlatform/scopes/environments",
		"location": "unitedstates",
		"name": "Default-3a6daad1-6fd0-4543-8a89-4f7b01e7458d",
		"properties": {
			"tenantId": "3a6daad1-6fd0-4543-8a89-4f7b01e7458d",
			"azureRegionHint": "westus",
			"displayName": "Peoples Dynamics LLC (default)",
			"createdTime": "2023-03-02T22:51:11.4884778Z",
			"createdBy": "@{id=SYSTEM; displayName=SYSTEM; type=NotSpecified}",
			"provisioningState": "Succeeded",
			"creationType": "DefaultTenant",
			"environmentSku": "Default",
			"environmentType": "Production",
			"isDefault": true,
			"permissions": "@{CreatePowerApp=; ReadEnvironment=; GenerateResourceStorage=; CreateGateway=; CreateFlow=; CreateCustomApi=; AdminReadEnvironment=; UpdateEnvironment=; DeleteEnvironment=; SetDLPPolicy=; SetPowerAppAsFeatured=; SetPowerAppAsHero=; SetPowerAppConnectionDirectConsentBypass=; ListAnyPowerApp=; ListAnyFlow=; DeleteAnyPowerApp=; DeleteAnyFlow=; AddEnvironmentRoleAssignment=; ReadEnvironmentRoleInformation=; RemoveEnvironmentRoleAssignment=; ModifyDatabaseRoleAssignments=; ModifyDatabaseRoleDefinitions=; CreateDatabase=; ListDatabaseEntities=; CreateDatabaseEntities=; UpdateDatabaseEntities=; DeleteDatabaseEntities=; ExportEnvironmentPackage=; ImportEnvironmentPackage=; ManageAnyPowerApp=; ManageAnyConnection=; ManageCDSMigration=; ManageTalentEnvironmentSettings=; ManageDatabaseUsers=; ManageAnyCustomApi=; CreateFunction=; ListAnyFunction=; DeleteAnyFunction=; ReadConsumption=; AllocateCapacity=; CopyFrom=; CopyTo=; RestoreTo=; RestoreFrom=; ManageProtectionKeys=; Reset=; Promote=; Enable=; Disable=; CreateSharePointCustomFormCanvasApp=}",
			"runtimeEndpoints": "@{microsoft.BusinessAppPlatform=https://unitedstates.api.bap.microsoft.com; microsoft.CommonDataModel=https://unitedstates.api.cds.microsoft.com; microsoft.PowerApps=https://unitedstates.api.powerapps.com; microsoft.PowerAppsAdvisor=https://unitedstates.api.advisor.powerapps.com; microsoft.PowerVirtualAgents=https://powervamg.us-il101.gateway.prod.island.powerapps.com; microsoft.ApiManagement=https://management.usa.azure-apihub.net; microsoft.Flow=https://us.api.flow.microsoft.com}",
			"trialScenarioType": "None",
			"retentionPeriod": "P7D",
			"states": "@{management=; runtime=}",
			"updateCadence": "@{id=Frequent}",
			"retentionDetails": "@{retentionPeriod=P7D; backupsAvailableFromDateTime=2023-03-02T22:51:11.4996202Z}",
			"protectionStatus": "@{keyManagedBy=Microsoft}",
			"cluster": "@{category=Prod; number=101; uriSuffix=us-il101.gateway.prod.island; geoShortName=US; environment=Prod}",
			"connectedGroups": "",
			"lifecycleOperationsEnforcement": "@{allowedOperations=System.Object[]; disallowedOperations=System.Object[]}",
			"governanceConfiguration": "@{protectionLevel=Basic}"
		}
	},
	"InternalCds": null
}
```

# Create Environment
New-AdminPowerAppEnvironment -DisplayName "TestEnv" -ProvisionDatabase:$True -Description "TestEnv" -LocationName "unitedstates" -EnvironmentSku Sandbox 

# Remove Environment
Remove-AdminPowerAppEnvironment -EnvironmentName <EnvironmentName> 

