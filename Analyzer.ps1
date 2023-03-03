Using Module .\Classes\Nodes.psm1
Import-Module .\Functions\ExportFunctions.psm1
Import-Module .\Functions\NodeFunctions.psm1
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

} catch {
    Write-Host "`r`n Error encountered." -ForegroundColor Red
    Write-Host $_ -ForegroundColor Red
}

Write-Host "`r`n Cleaning Up" -ForegroundColor White
Remove-Module -Name Nodes
Remove-Module -Name NodeFunctions
Remove-Module -Name Setup
Remove-PowerAppsAccount

Write-Host "`r` Exiting." -ForegroundColor White

