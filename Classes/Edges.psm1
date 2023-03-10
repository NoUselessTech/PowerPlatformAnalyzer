Class BasicEdge {
    [String]$Relationship
    [String]$Source
    [String]$Target

    BasicEdge(){}
    BasicEdge(
        [String]$Relationship,
        [String]$Source,
        [String]$Target 
    ) {
        $this.Relationship = $Relationship
        $this.Source = $Source
        $this.Target = $Target
    }
}