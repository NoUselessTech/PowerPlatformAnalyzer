Function Install-Dependencies {
    # installs the dependencies.
    try {
        If ((Get-Module -ListAvailable -Name "Microsoft.PowerApps.Administration.PowerShell").Count -eq 0) {
            Install-Module -Name Microsoft.PowerApps.Administration.PowerShell
        }
    } catch {
        throw $_
    }
}