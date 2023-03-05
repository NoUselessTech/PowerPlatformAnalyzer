Class BaseNode {
    [String]$Id
    [String]$Type
    [String]$DisplayName

    BaseNode(){}
    BaseNode(
        [String]$Id,
        [String]$Type,
        [String]$DisplayName
    ) {
        $this.Id = $Id
        $this.Type = $Type
        $this.DisplayName = $DisplayName
    }
}

Class Environment : BaseNode {
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

Class AppNode : BaseNode {
    [String]$CreatedTime
    [String]$Owner
    [String]$LastModifiedTime
    [String]$Environment
    [String]$BypassConsent

    AppNode(){}

    AppNode(
        [String]$Id,
        [String]$Type,
        [String]$DisplayName,
        [String]$CreatedTime,
        [String]$Owner,
        [String]$LastModifiedTime,
        [String]$Environment,
        [String]$BypassConsent
    ) : base ($Id, $Type, $DisplayName) {
        $this.CreatedTime = $CreatedTime
        $this.Owner = $Owner
        $this.LastModifiedTime = $LastModifiedTime
        $this.Environment = $Environment
        $this.BypassConsent = $BypassConsent    
    }
}