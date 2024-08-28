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
    "activeSwitchPlane" Integer 0
    "administrativeState" Integer 1
    "administrativeStateSwitchPlaneA" Integer 1
    "administrativeStateSwitchPlaneB" Integer 1
    "availabilityStatus" Integer 1
    "availabilityStatusSwitchPlaneA" Integer 1
    "availabilityStatusSwitchPlaneB" Integer 1
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
    "activeSwitchPlane" Integer 0
    "administrativeState" Integer 1
    "administrativeStateSwitchPlaneA" Integer 1
    "administrativeStateSwitchPlaneB" Integer 1
    "availabilityStatus" Integer 1
    "availabilityStatusSwitchPlaneA" Integer 1
    "availabilityStatusSwitchPlaneB" Integer 1
    "operationalState" Integer 0
    "operationalStateSwitchPlaneA" Integer 0
    "operationalStateSwitchPlaneB" Integer 0
    "reservedBy" Array Ref 0
    "secondSmnEvaluation" Integer 0
    "switchModuleNumber" Integer 1
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,SwitchFabric=1"
    identity "1"
    moType InternalLinkGroup
    exception none
    nrOfAttributes 7
    "InternalLinkGroupId" String "1"
    "administrativeState" Integer 1
    "availabilityStatus" Integer 1
    "operationalState" Integer 0
    "switchModuleNumber1" Ref "null"
    "switchModuleNumber2" Ref "null"
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,SwitchFabric=1,InternalLinkGroup=1"
    identity "1"
    moType SwitchInternalLink
    exception none
    nrOfAttributes 11
    "SwitchInternalLinkId" String "1"
    "administrativeState" Integer 1
    "availabilityStatusSync" Integer 1
    "availabilityStatusTraffic" Integer 1
    "operationalStateSync" Integer 0
    "operationalStateTraffic" Integer 0
    "plugInUnit1" Ref "null"
    "plugInUnit2" Ref "null"
    "siliport1" Integer 0
    "siliport2" Integer 0
    "userLabel" String ""
)

//SET
//(
//    mo "ManagedElement=1,SwitchFabric=1,InternalLinkGroup=1,SwitchInternalLink=1"
//    exception none
//    nrOfAttributes 2
//    "plugInUnit2" Ref "ManagedElement=1,Equipment=1,Subrack=2,Slot=1,PlugInUnit=1,SwitchCoreUnit=3"
//    "plugInUnit1" Ref "ManagedElement=1,Equipment=1,Subrack=1,Slot=1,PlugInUnit=1,SwitchCoreUnit=1"
//)

SET
(
    mo "ManagedElement=1,SwitchFabric=1,InternalLinkGroup=1"
    exception none
    nrOfAttributes 2
    "switchModuleNumber2" Ref "ManagedElement=1,SwitchFabric=1,SwitchModule=2"
    "switchModuleNumber1" Ref "ManagedElement=1,SwitchFabric=1,SwitchModule=1"
)

//SET
//(
//    mo "ManagedElement=1,SwitchFabric=1,SwitchModule=2"
//    exception none
//    nrOfAttributes 1
//    "reservedBy" Array Ref 1
//        "ManagedElement=1,Equipment=1,Subrack=2"
//)

//SET
//(
//    mo "ManagedElement=1,SwitchFabric=1,SwitchModule=1"
//    exception none
//    nrOfAttributes 1
//    "reservedBy" Array Ref 1
//        "ManagedElement=1,Equipment=1,Subrack=1"
//)

