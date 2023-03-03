Using Module ..\Classes\Nodes.psm1

Function Get-EnvironmentNodes{
    # Simple function to transform information from admin api to class
    $Return = @()
    try {
        # Get all existing environments
        $Environments = Get-AdminPowerAppEnvironment
        if ($Null -eq $Environments) {
            Write-Host "    Retrying." -ForegroundColor Yellow
            $Environments = Get-AdminPowerAppEnvironment
        }

        Write-Host $Environments


        # Iterate
        $Count = $Null
        if ( $Environments.length -ne 0 -and $Null -eq $Environments.count ) {
            $Count = 1
        } else {
            $Count = $Environments.count
        }
        $Counter = 0
        ForEach($Environment in $Environments) {
            $Counter++
            Write-Progress -Id 1 -Activity "Gathering Environments" `
                -Status "$($Environment.DisplayName)" `
                -PercentComplete ($Counter * 100 / $Count)
            
            $Node = [Environment]::new(
                $Environment.Id,
                "Environment",
                $Environment.DisplayName,
                $Environment.EnvironmentName,
                $Environment.IsDefault,
                $Environment.Location,
                $Environment.CreatedDateTime,
                $Environment.CreatedBy.Id,
                $Environment.CreatedBy.DisplayName,
                $Environment.CreatedBy.Type,
                $Environment.LastModifiedTime,
                $Environment.LastModifiedBy,
                $Environment.EnvironmentType
            )

            Write-Progress -Id 1 -Activity "Gathering environments." `
                -Completed

            $Return += $Node

        }

        return $Return
    } catch {
        throw $_
    }
}