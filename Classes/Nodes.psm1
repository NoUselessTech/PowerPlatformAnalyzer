Class BaseClass {
    [String]$Id
    [String]$Type
    [String]$DisplayName

    BaseClass(){}
    BaseClass(
        [String]$Id,
        [String]$Type,
        [String]$DisplayName
    ) {
        $this.Id = $Id
        $this.Type = $Type
        $this.DisplayName = $DisplayName
    }
}

Class Environment:BaseClass {
    [String]$EnvironmentName
    [Bool]$IsDefault
    [String]$Location
    [String]$CreatedDateTime
    [String]$CreatedById
    [String]$CreatedByDisplayName
    [String]$CreatedByType
    [String]$LastModifiedTime
    [String]$LastModifiedBy
    [String]$EnvironmentType

    Environment(){}
    Environment(       
        [String]$Id,
        [String]$Type,
        [String]$DisplayName,
        [String]$EnvironmentName,
        [Bool]$IsDefault,
        [String]$Location,
        [String]$CreatedDateTime,
        [String]$CreatedById,
        [String]$CreatedByDisplayName,
        [String]$CreatedByType,
        [String]$LastModifiedTime,
        [String]$LastModifiedBy,
        [String]$EnvironmentType
    ) : base ($Id, $Type, $DisplayName) {
        $this.EnvironmentName = $EnvironmentName
        $this.IsDefault = $IsDefault
        $this.Location = $Location
        $this.CreatedDateTime = $CreatedDateTime
        $this.CreatedById = $CreatedById
        $this.CreatedByDisplayName = $CreatedByDisplayName
        $this.CreatedByType = $CreatedByType
        $this.LastModifiedTime = $LastModifiedTime
        $this.LastModifiedBy = $LastModifiedBy
        $this.EnvironmentType = $EnvironmentType
        }
}