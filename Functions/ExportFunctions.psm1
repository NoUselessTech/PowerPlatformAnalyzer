Function Export-Data{
    Param(
        $Data, $Name
    )

    if ($Null -ne $Data) {
        $Data | Export-Csv -NoTypeInformation "./Output/$Name.csv"
        $Data | ConvertTo-Json -Compress > "./Output/$Name.json"
    }
}

Function Export-CypherNode{
    Param(
        $Data,
        $Method
    )

    if ($Null -ne $Data) {
        $OutString = "CREATE "

        ForEach($Datum in $Data) {
            $CypherType = $Datum.Type
            $Props = $Datum | ConvertTo-Json -Compress
            $Props = $Props -replace '"(\w*)":','$1:'

            $OutString += "(:$CypherType $Props), "
        }
        $OutString = $OutString.substring(0, $Outstring.length -2)
        $OutString += ";"

        Switch($Method){
            "Append" { $OutString >> "Output\Graph.cypher" }
            default { $OutString > "Output\Graph.cypher" }
        }
    }
}

Function Export-CypherEdge{
    Param(
        $Data,
        $Method
    )

    if ($Null -ne $Data) {
        ForEach($Datum in $Data) {
            $OutString = "MATCH (A {Id:'$($Datum.Source)'}),(B {Id:'$($Datum.Target)'}) "
            $OutString += " CREATE (A)-[:$($Datum.Relationship)]->(B);"

            Switch($Method){
                "Append" { $OutString >> "Output\Graph.cypher" }
                default { $OutString > "Output\Graph.cypher" }
            }
        }
    }
}