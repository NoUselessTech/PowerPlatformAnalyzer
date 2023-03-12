Class BasicEdge {
    [String]$Relationship
    [String]$Source
    [String]$SourceType
    [String]$Target
    [String]$TargetType

    BasicEdge(){}
    BasicEdge(
        [String]$Relationship,
        [String]$Source,
        [String]$SourceType,
        [String]$Target ,
        [String]$TargetType
    ) {
        $this.Relationship = $Relationship
        $this.Source = $Source
        $this.SourceType = $SourceType
        $this.Target = $Target
        $this.TargetType = $TargetType
    }
}