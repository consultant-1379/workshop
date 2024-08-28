CREATE
(
    parent "ManagedElement=1,Equipment=1"
    identity "2"
    moType Subrack
    exception none
    nrOfAttributes 11
    "SubrackId" String "2"
    "administrativeProductData" Struct
        nrOfElements 5
        "productNumber" String ""
        "productRevision" String ""
        "productName" String ""
        "productInfo" String ""
        "productionDate" String ""

    "cabinetPosition" String ""
    "numberOfSlots" Integer 16
    "operationalProductData" Struct
        nrOfElements 5
        "productName" String ""
        "productNumber" String ""
        "productRevision" String ""
        "serialNumber" String ""
        "productionDate" String ""

    "productType" String ""
    "reservedBy" Array Ref 0
    "subrackPosition" String ""
    "subrackType" Integer 1
    "switchModule" Ref "null"
    "userLabel" String ""
)
CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=2"
    identity "1"
    moType Slot
    exception none
    nrOfAttributes 8
    "SlotId" String "1"
    "productData" Struct
        nrOfElements 5
        "productName" String ""
        "productNumber" String ""
        "productRevision" String ""
        "serialNumber" String ""
        "productionDate" String ""

    "reservedBy" Array Ref 0
    "slotNumber" Integer 1
    "slotState" Integer 0
    // "upgradeGroupId" Integer 0
    // "upgradeGroupTypeName" String ""
    "userLabel" String ""
)
CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=2,Slot=1"
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
    parent "ManagedElement=1,Equipment=1,Subrack=2,Slot=1,PlugInUnit=1"
    identity "3"
    moType SwitchCoreUnit
    exception none
    nrOfAttributes 9
    "SwitchCoreUnitId" String "3"
    "administrativeStateSili" Integer 1
    "availabilityStatusSil" Integer 1
    "availabilityStatusSync" Integer 1
    "operationalStateSil" Integer 0
    "operationalStateSync" Integer 0
    "reservedBy" Array Ref 0
    "silPorts" Array Integer 0
    "userLabel" String ""
)

