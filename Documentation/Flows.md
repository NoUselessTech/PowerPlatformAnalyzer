# Flows

## Overview

There are three types of flows
- Cloud
  - For automation you want to run without interaction
- Desktop
  - For automating desktop actions
- Business
  - For automating business processes

## Data Structure
```
FlowName         : eeaacf63-98c4-4a6f-8f54-c9eab81b10ff
Enabled          : True
DisplayName      : Add an item to SharePoint and send an email
UserType         : Owner
CreatedTime      : 2023-03-05T04:12:11.5873371Z
CreatedBy        : @{tenantId=3a6daad1-6fd0-4543-8a89-4f7b01e7458d; objectId=fcd8f604-98a2-4e8e-885a-5747a0489cf1; userId=fcd8f604-98a2-4e8e-885a-5747a0489cf1; userType=ActiveDirectory}
LastModifiedTime : 2023-03-05T04:12:12.7051481Z
EnvironmentName  : Default-3a6daad1-6fd0-4543-8a89-4f7b01e7458d
Internal         : @{name=eeaacf63-98c4-4a6f-8f54-c9eab81b10ff; id=/providers/Microsoft.ProcessSimple/environments/Default-3a6daad1-6fd0-4543-8a89-4f7b01e7458d/flows/eeaacf63-98c4-4a6f-8f54-c9eab81b10ff;
                   type=Microsoft.ProcessSimple/environments/flows; properties=}
```

## Critical Properties
- FlowName
- Enaled
- DisplayName
- UserType
- CreatedTime
- CreatedBy
- LastModifiedTime
- EnvironmentName
- IsManaged
- State
- FlowFailureAlertSubscribed
- FlowSuspensionReasaon
- Triggers
- Actions

## List Flows
Command
`Get-AdminFlow`

## Remove Flows
Command
`Remove-AdminFlow -FlowName <FlowName>`