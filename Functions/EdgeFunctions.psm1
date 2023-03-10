Using Module ..\Classes\Edges.psm1

Function Get-EnvironmentEdges {
    Param(
        $Environments,
        $Apps,
        $Flows
    )

    try {
        $Return = @()

        ForEach($Environment in $Environments) {
            $EnvApps = $Apps | ? { $_.EnvironmentName -eq $Environment.Id}
            $EnvFlows = $Flows | ? { $_.EnvironmentName -eq $Environment.Id}

            ForEach($App in $EnvApps) {
                $Edge = [BasicEdge]::new(
                    "Contains",
                    $Environment.Id,
                    $App.Id
                )
                $Return += $Edge
            }

            ForEach($Flow in $EnvFlows) {
                $Edge = [BasicEdge]::new(
                    "Contains",
                    $Environment.Id,
                    $Flow.Id
                )

                $Return += $Edge
            }
        }
        
        return $Return

    } catch {
        throw $_
    }
}