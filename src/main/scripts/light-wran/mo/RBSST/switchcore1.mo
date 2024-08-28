CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=1"
    identity "1"
    moType PlugInUnit
    exception none
    nrOfAttributes 13
    "PlugInUnitId" String "1"
    "administrativeState" Integer 1
    "allowedSeqRestarts" Integer 3
    "availabilityStatus" Integer 1
    "hwTestResult" String ""
    "hwTestStatus" Integer 0
    "operationalState" Integer 0
    "piuGroupNumber" Integer 0
    "piuType" Ref "null"
    "pmProcessorLoad" Integer 0
    "productType" String "HW"
    "reservedBy" Array Ref 0
    "userLabel" String ""
)
CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=1,PlugInUnit=1"
    identity "1"
    moType SwitchCoreUnit
    exception none
    nrOfAttributes 9
    "SwitchCoreUnitId" String "1"
    "administrativeStateSili" Integer 1
    "availabilityStatusSil" Integer 1
    "availabilityStatusSync" Integer 1
    "operationalStateSil" Integer 0
    "operationalStateSync" Integer 0
    "reservedBy" Array Ref 0
    "silPorts" Array Integer 0
    "userLabel" String ""
)

