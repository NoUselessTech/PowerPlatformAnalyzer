Using Module ..\Classes\Nodes.psm1

Function Get-EnvironmentNodes{
    # Simple function to transform information from admin api to class
    $Return = @()
    try {
        # Get all existing environments
        $Environments = Get-AdminPowerAppEnvironment

        # Iterate
        $Counter = 0
        ForEach($Environment in $Environments) {
            $Counter++
            Write-Progress -Id 1 -Activity "Gathering Environments" `
                -Status "$($Environment.DisplayName)" `
                -PercentComplete ($Counter * 100 / $Environments.Count)
            
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

            return += $Node

        }

        return $Return
    } catch {
        throw $_
    }
}