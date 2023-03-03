Using Module .\Classes\Nodes.psm1
Import-Module .\Functions\NodeFunctions.psm1
Import-Module .\Functions\Setup.psm1

# PowerApps/PowerAutomate analysis tool
# Author: Connor Peoples

# Variables

# Logic
try {
    Clear-Host

    Write-Host "`r`n Starting PowerPlatform Analyzer." -ForegroundColor White

    Write-Host " Checking dependencies." -ForegroundColor White
    try {
        Write-Host "   Checking for Microsoft.PowerApps.Administration.PowerShell" -ForegroundColor Yellow
        Install-Dependencies
    } catch {
        throw "`r`n Could not install dependencies.`r`n $_"
    }

    Write-Host "   Installed." -ForegroundColor Yellow

} catch {
    Write-Host "`r`n Error encountered." -ForegroundColor Red
    Write-Host $_ -ForegroundColor Red
}

Write-Host "`r`n Cleaning Up" -ForegroundColor White
Remove-Module -Name Nodes
Remove-Module -Name NodeFunctions
Remove-Module -Name Setup

Write-Host "`r`  Exiting." -ForegroundColor White

