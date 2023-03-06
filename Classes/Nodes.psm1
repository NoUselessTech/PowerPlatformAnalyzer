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

Class FlowNode : BaseNode {
    [Bool]$Enabled
    [String]$UserType
    [String]$CreatedTime
    [String]$CreatedBy
    [String]$LastModifiedTime
    [String]$EnvironmentName
    [Bool]$IsManaged
    [String]$State
    [Bool]$FlowFailureAlertSubscribed
    [String]$FlowSuspensionReason
    [String]$Triggers
    [String]$Actions

    FlowNode(){}
    FlowNode(
        [String]$Id,
        [String]$Type,
        [String]$DisplayName,
        [Bool]$Enabled,
        [String]$UserType,
        [String]$CreatedTime,
        [String]$CreatedBy,
        [String]$LastModifiedTime,
        [String]$EnvironmentName,
        [Bool]$IsManaged,
        [String]$State,
        [Bool]$FlowFailureAlertSubscribed,
        [String]$FlowSuspensionReason,
        [String]$Triggers,
        [String]$Actions
    ) : base ($Id, $Type, $DisplayName) {
        $this.Enabled = $Enabled
        $this.UserType = $UserType
        $this.CreatedTime = $CreatedTime
        $this.CreatedBy = $CreatedBy
        $this.LastModifiedTime = $LastModifiedTime
        $this.EnvironmentName = $EnvironmentName
        $this.IsManaged = $IsManaged
        $this.State = $State
        $this.FlowFailureAlertSubscribed = $FlowFailureAlertSubscribed
        $this.FlowSuspensionReason = $FlowSuspensionReason
        $this.Triggers = $Triggers
        $this.Actions = $Actions
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