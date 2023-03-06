Using Module ..\Classes\Nodes.psm1

Function Get-FlowNodes {
    # Simple function to transform flow objects to single level class
    $Return = @()

    try {
        # Get all the Flows
        $Flows = Get-AdminFlow
        if ( $Null -eq $Flows) {
            Write-Host "   Retrying." -ForegroundColor Yellow
            $Flows = Get-AdminFlow
        }

        # Setup Counters
        $Counter = 0
        $Count = $Flows.Count
        
        if( $Null -eq $Flows.Count -and $Flows.length -ne 0) {
            $Count = 1
        }

        $Flows
        
        # Iterate
        ForEach($Flow in $Flows) {
            $Counter++
            Write-Progress `
                -Id 1 `
                -Activity "Gathering Flows." `
                -Status $Flow.DisplayName `
                -PercentComplete ((100 * $Counter)/$Count)

            $Node = [FlowNode]::new()
            
            $Node.Id = $Flow.FlowName
            $Node.Type = "Flow"
            $Node.DisplayName = $Flow.DisplayName
            $Node.Enabled = $Flow.Enabled
            $Node.UserType = $Flow.UserType
            $Node.CreatedTime = $Flow.CreatedTime
            $Node.CreatedBy = $Flow.CreatedBy
            $Node.LastModifiedTime = $Flow.LastModifiedTime
            $Node.EnvironmentName = $Flow.EnvironmentName
            $Node.IsManaged = $Flow.Internal.Properties.isManaged
            $Node.State = $Flow.Internal.Properties.state
            $Node.FlowFailureAlertSubscribed = $Flow.Internal.Properties.flowFailureAlertSubscribed
            $Node.FlowSuspensionReason = $Flow.Internal.Properties.flowSuspensionReason
            $Node.Triggers = ($Flow.Internal.Properties.definition.triggers | ConvertTo-Json -Compress -Depth 100)
            $Node.Actions = ($Flow.Internal.Properties.definition.actions | ConvertTo-Json -Compress -Depth 100)
            

            $Return += $Node
        }

        return $Return
    } catch {
        throw $_
    }
}

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
            $Counter++
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