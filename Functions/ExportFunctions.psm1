Function Export-Data{
    Param(
        $Data, $Name
    )

    if ($Null -ne $Data) {
        $Data | Export-Csv -NoTypeInformation "./Output/$Name.csv"
        $Data | ConvertTo-Json -Compress > "./Output/$Name.json"
    }
}