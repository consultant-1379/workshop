CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=4"
    identity "1"
    moType PlugInUnit
    exception none
    nrOfAttributes 1
    "PlugInUnitId" String "1"
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=4,PlugInUnit=1"
    identity "1"
    moType TuDeviceGroup
    exception none
    nrOfAttributes 5
    "TuDeviceGroupId" String "1"
    "availabilityStatus" Integer 0
    "hwTestResult" Integer 0
    "operationalState" Integer 0
    "usageState" Integer 0
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=4,PlugInUnit=1,TuDeviceGroup=1"
    identity "1"
    moType TimDeviceSet
    exception none
    nrOfAttributes 4
    "TimDeviceSetId" String "1"
    "availabilityStatus" Integer 0
    "operationalState" Integer 0
    "usageState" Integer 0
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=4,PlugInUnit=1,TuDeviceGroup=1,TimDeviceSet=1"
    identity "1"
    moType TimDevice
    exception none
    nrOfAttributes 7
    "TimDeviceId" String "1"
    "availabilityStatus" Integer 0
    "isStable" Integer 0
    "isSynchronized" Integer 0
    "operationalState" Integer 0
    "reservedBy" Array Ref 0
    "usageState" Integer 0
)

//CREATE
//(
//    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=4,PlugInUnit=1,TuDeviceGroup=1,TimDeviceSet=1"
//    identity "2"
//    moType TimDevice
//    exception none
//    nrOfAttributes 7
//    "TimDeviceId" String "2"
//    "availabilityStatus" Integer 0
//    "isStable" Integer 0
//    "isSynchronized" Integer 0
//    "operationalState" Integer 0
//    "reservedBy" Array Ref 0
//    "usageState" Integer 0
//)

