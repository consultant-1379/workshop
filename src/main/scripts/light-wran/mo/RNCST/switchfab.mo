CREATE
(
    parent "ManagedElement=1"
    identity "1"
    moType SwitchFabric
    exception none
    nrOfAttributes 2
    "SwitchFabricId" String "1"
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,SwitchFabric=1"
    identity "1"
    moType SwitchModule
    exception none
    nrOfAttributes 15
    "SwitchModuleId" String "1"
    "activeSwitchPlane" Integer 1
    "administrativeState" Integer 1
    "administrativeStateSwitchPlaneA" Integer 1
    "administrativeStateSwitchPlaneB" Integer 1
    "availabilityStatus" Integer 2080
    "availabilityStatusSwitchPlaneA" Integer 2080
    "availabilityStatusSwitchPlaneB" Integer 2080
    "operationalState" Integer 0
    "operationalStateSwitchPlaneA" Integer 0
    "operationalStateSwitchPlaneB" Integer 0
    "reservedBy" Array Ref 0
    "secondSmnEvaluation" Integer 0
    "switchModuleNumber" Integer 0
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,SwitchFabric=1"
    identity "2"
    moType SwitchModule
    exception none
    nrOfAttributes 15
    "SwitchModuleId" String "2"
    "activeSwitchPlane" Integer 1
    "administrativeState" Integer 1
    "administrativeStateSwitchPlaneA" Integer 1
    "administrativeStateSwitchPlaneB" Integer 1
    "availabilityStatus" Integer 2080
    "availabilityStatusSwitchPlaneA" Integer 2080
    "availabilityStatusSwitchPlaneB" Integer 2080
    "operationalState" Integer 0
    "operationalStateSwitchPlaneA" Integer 0
    "operationalStateSwitchPlaneB" Integer 0
    "reservedBy" Array Ref 0
    "secondSmnEvaluation" Integer 0
    "switchModuleNumber" Integer 1
    "userLabel" String ""
)

SET
(
    mo "ManagedElement=1,SwitchFabric=1,SwitchModule=1"
    exception none
    nrOfAttributes 1
    "reservedBy" Array Ref 1
        "ManagedElement=1,Equipment=1,Subrack=MS"
)

