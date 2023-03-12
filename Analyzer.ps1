Using Module .\Classes\Nodes.psm1
Using Module .\Classes\Edges.psm1
Import-Module .\Functions\ExportFunctions.psm1
Import-Module .\Functions\NodeFunctions.psm1
Import-Module .\Functions\EdgeFunctions.psm1
Import-Module .\Functions\Setup.psm1
# PowerApps/PowerAutomate analysis tool
# Author: Connor Peoples

# Variables

# Logic
try {
    Clear-Host

    Write-Host "`r`n Starting PowerPlatform Analyzer." -ForegroundColor White

    ## Setup
    Write-Host " Checking dependencies." -ForegroundColor White
    try {
        Write-Host "   Checking for Microsoft.PowerApps.Administration.PowerShell" -ForegroundColor Yellow
        Install-Dependencies
    } catch {
        throw "`r`n Could not install dependencies.`r`n $_"
    }

    Write-Host "   Installed." -ForegroundColor Yellow

    ## Sign in 
    Write-Host " Connecting to the PowerApps Admin PowerShell." -ForegroundColor White
    Add-PowerAppsAccount

    ## Gathering Nodes
    Write-host "`r`n Gathering nodes." -ForegroundColor White

    ## Get Environments
    try {
        Write-Host "   Collecting environments." -ForegroundColor Yellow
        $Environments = Get-EnvironmentNodes
        if ( $Environments.count -gt 0) {
            Export-Data -Data $Environments -Name "Environments"
        }

    } catch {
        throw " Unable to gather envirnoments.`r`n $_"
    }

    ## Get Connectors
    try {
        Write-Host "   Collecting connectors." -ForegroundColor Yellow
        $Connectors = Get-ConnectorNodes
        if ( $Connectors.count -gt 0) {
            Export-Data -Data $Connectors -Name "Connectors"
        }

    } catch {
        throw " Unable to gather connectors.`r`n $_"
    }

    ## Get Apps
    try {
        Write-Host "   Collecting Apps." -ForegroundColor Yellow
        $Apps = Get-AppNodes
        if ( $Apps.count -gt 0) {
            Export-Data -Data $Apps -Name "Apps"
        }

    } catch {
        throw " Unable to gather apps.`r`n $_"
    }

    ## Get Flows
    try {
        Write-Host "   Collecting Flows." -ForegroundColor Yellow
        $Flows = Get-FlowNodes
        if ( $Flows.count -gt 0) {
            Export-Data -Data $Flows -Name "Flows"
        }

    } catch {
        throw " Unable to gather flows.`r`n $_"
    }

    ## Get Connections
    <#
    try {
        Write-Host "   Collecting Connections." -ForegroundColor Yellow
        $Connections = Get-ConnectionNodes
        if ( $Connections.count -gt 0) {
            Export-Data -Data $Connections -Name "Connections"
        }

    } catch {
        throw " Unable to gather connections.`r`n $_"
    }
    #>

    ## Mapping Time
    Write-host "`r`n Gathering edges." -ForegroundColor White

    ## Map Environments
    try {
    Write-Host "   Mapping Environments." -ForegroundColor Yellow
    $EnvironmentEdges = Get-EnvironmentEdges -Environments $Environments -Apps $Apps -Flows $Flows
    if ( $EnvironmentEdges.count -gt 0) {
        Export-Data -Data $EnvironmentEdges -Name "EnvironmentEdges"
    }

    } catch {
        throw " Unable to gather connections.`r`n $_"
    }

    ## Exporting Data
    Write-host "`r`n Exporting Data." -ForegroundColor White

    ## Node Exports
    Export-CypherNode -Type "Node" -Data $Environments
    Export-CypherNode -Type "Node" -Data $Apps -Method "Append"
    Export-CypherNode -Type "Node" -Data $Flows -Method "Append"
    Export-CypherNode -Type "Node" -Data $Connectors -Method "Append"

    ## Edge Exports
    Export-CypherEdge -Type "Edge" -Data $EnvironmentEdges -Method "Append"

} catch {
    Write-Host "`r`n Error encountered." -ForegroundColor Red
    Write-Host $_ -ForegroundColor Red
}

Write-Host "`r`n Cleaning Up" -ForegroundColor White
Remove-Module -Name Nodes
Remove-Module -Name Edges
Remove-Module -Name NodeFunctions
Remove-Module -Name EdgeFunctions
Remove-Module -Name Setup
Remove-Module -Name ExportFunctions
Remove-PowerAppsAccount

Write-Host "`r` Exiting." -ForegroundColor White

