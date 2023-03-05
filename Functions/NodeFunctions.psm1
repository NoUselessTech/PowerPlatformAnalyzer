Using Module ..\Classes\Nodes.psm1

Function Get-AppNodes {
    # Simple function to transform power apps to ps class
    $Return = @()
    try {
        # Get all existing apps
        $Apps = Get-AdminPowerApp
        if ( $Null -eq $Apps) {
            Write-Host "    Retrying." -ForegroundColor Yellow
            $Apps = Get-AdminPowerApp
        }

        # Iterate through for conversion
        $Counter = 0
        $Count = $Null
        if ( $Apps.Length -ne 0 -and $Null -eq $Apps.Count) {
            $Count = 1
        } else {
            $Count = $Apps.Count
        }
        ForEach($App in $Apps) {
            Write-Progress -Id 1 -Activity "Gathering Apps" `
                -Status "$($App.DisplayName)"`
                -PercentComplete ($Counter * 100 / $Count)

            $Node = [AppNode]::new()
            
            $Node.Id = $App.AppName
            $Node.Type = "App"
            $Node.DisplayName = $App.DisplayName
            $Node.CreatedTime = $App.CreatedTime
            $Node.Owner = $App.Owner
            $Node.LastModifiedTime = $App.LastModifiedTime
            $Node.Environment = $App.EnvironmentName
            $Node.BypassConsent = $App.BypassConsent
            
            $Return += $Node
        }

        Write-Progress -Id 1 -Activity "Gathering Apps" -Completed

        return $Return

    } catch {
        throw $_
    }
}

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