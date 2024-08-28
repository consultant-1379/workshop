CREATE
(
   parent "ManagedElement=1,NodeBFunction=1,Iub=1
   identity "1"
   moType NodeSynchTp
   exception none
   nrOfAttributes 0
)

CREATE
(
   parent "ManagedElement=1"
   identity "1"
   moType SwitchFabric
   exception none
   nrOfAttributes 0
)
CREATE
(
   parent "ManagedElement=1,SwitchFabric=1
   identity "1"
   moType SwitchModule
   exception none
   nrOfAttributes 0
)
CREATE
(
   parent "ManagedElement=1,SwitchFabric=1
   identity "2"
   moType SwitchModule
   exception none
   nrOfAttributes 0
)


CREATE
(
    parent "ManagedElement=1,Equipment=1"
    identity "1"
    moType Subrack
    exception none
    nrOfAttributes 11
    "SubrackId" String "1"
    "administrativeProductData" Struct
        nrOfElements 5
        "productNumber" String ""
        "productRevision" String ""
        "productName" String ""
        "productInfo" String ""
        "productionDate" String ""

    "cabinetPosition" String ""
    "numberOfSlots" Integer 28
    "operationalProductData" Struct
        nrOfElements 5
        "productName" String ""
        "productNumber" String ""
        "productRevision" String ""
        "serialNumber" String ""
        "productionDate" String ""

    "productType" String "HW"
    "reservedBy" Array Ref 0
    "subrackPosition" String ""
    "subrackType" Integer 0
    "switchModule" Ref "null"
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1"
    identity "1"
    moType Slot
    exception none
    nrOfAttributes 8
    "SlotId" String "1"
    "productData" Struct
        nrOfElements 5
        "productName" String "dummy"
        "productNumber" String "dummy"
        "productRevision" String "dummy"
        "serialNumber" String "dummy"
        "productionDate" String "dummy"

    "reservedBy" Array Ref 0
    "slotNumber" Integer 1
    "slotState" Integer 0
    // "upgradeGroupId" Integer 0
    // "upgradeGroupTypeName" String ""
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1"
    identity "2"
    moType Slot
    exception none
    nrOfAttributes 8
    "SlotId" String "2"
    "productData" Struct
        nrOfElements 5
        "productName" String "dummy"
        "productNumber" String "dummy"
        "productRevision" String "dummy"
        "serialNumber" String "dummy"
        "productionDate" String "dummy"

    "reservedBy" Array Ref 0
    "slotNumber" Integer 2
    "slotState" Integer 0
    // "upgradeGroupId" Integer 0
    // "upgradeGroupTypeName" String ""
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1"
    identity "3"
    moType Slot
    exception none
    nrOfAttributes 8
    "SlotId" String "3"
    "productData" Struct
        nrOfElements 5
        "productName" String "dummy"
        "productNumber" String "dummy"
        "productRevision" String "dummy"
        "serialNumber" String "dummy"
        "productionDate" String "dummy"

    "reservedBy" Array Ref 0
    "slotNumber" Integer 3
    "slotState" Integer 0
    // "upgradeGroupId" Integer 0
    // "upgradeGroupTypeName" String ""
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1"
    identity "4"
    moType Slot
    exception none
    nrOfAttributes 8
    "SlotId" String "4"
    "productData" Struct
        nrOfElements 5
        "productName" String "dummy"
        "productNumber" String "dummy"
        "productRevision" String "dummy"
        "serialNumber" String "dummy"
        "productionDate" String "dummy"

    "reservedBy" Array Ref 0
    "slotNumber" Integer 4
    "slotState" Integer 0
    // "upgradeGroupId" Integer 0
    // "upgradeGroupTypeName" String ""
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1"
    identity "5"
    moType Slot
    exception none
    nrOfAttributes 8
    "SlotId" String "5"
    "productData" Struct
        nrOfElements 5
        "productName" String "dummy"
        "productNumber" String "dummy"
        "productRevision" String "dummy"
        "serialNumber" String "dummy"
        "productionDate" String "dummy"

    "reservedBy" Array Ref 0
    "slotNumber" Integer 5
    "slotState" Integer 0
    // "upgradeGroupId" Integer 0
    // "upgradeGroupTypeName" String ""
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1"
    identity "6"
    moType Slot
    exception none
    nrOfAttributes 8
    "SlotId" String "6"
    "productData" Struct
        nrOfElements 5
        "productName" String "dummy"
        "productNumber" String "dummy"
        "productRevision" String "dummy"
        "serialNumber" String "dummy"
        "productionDate" String "dummy"

    "reservedBy" Array Ref 0
    "slotNumber" Integer 6
    "slotState" Integer 0
    // "upgradeGroupId" Integer 0
    // "upgradeGroupTypeName" String ""
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1"
    identity "7"
    moType Slot
    exception none
    nrOfAttributes 8
    "SlotId" String "7"
    "productData" Struct
        nrOfElements 5
        "productName" String "dummy"
        "productNumber" String "dummy"
        "productRevision" String "dummy"
        "serialNumber" String "dummy"
        "productionDate" String "dummy"

    "reservedBy" Array Ref 0
    "slotNumber" Integer 7
    "slotState" Integer 0
    // "upgradeGroupId" Integer 0
    // "upgradeGroupTypeName" String ""
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1"
    identity "8"
    moType Slot
    exception none
    nrOfAttributes 8
    "SlotId" String "8"
    "productData" Struct
        nrOfElements 5
        "productName" String "dummy"
        "productNumber" String "dummy"
        "productRevision" String "dummy"
        "serialNumber" String "dummy"
        "productionDate" String "dummy"

    "reservedBy" Array Ref 0
    "slotNumber" Integer 8
    "slotState" Integer 0
    // "upgradeGroupId" Integer 0
    // "upgradeGroupTypeName" String ""
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1"
    identity "9"
    moType Slot
    exception none
    nrOfAttributes 8
    "SlotId" String "9"
    "productData" Struct
        nrOfElements 5
        "productName" String "dummy"
        "productNumber" String "dummy"
        "productRevision" String "dummy"
        "serialNumber" String "dummy"
        "productionDate" String "dummy"

    "reservedBy" Array Ref 0
    "slotNumber" Integer 9
    "slotState" Integer 0
    // "upgradeGroupId" Integer 0
    // "upgradeGroupTypeName" String ""
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1"
    identity "10"
    moType Slot
    exception none
    nrOfAttributes 8
    "SlotId" String "10"
    "productData" Struct
        nrOfElements 5
        "productName" String "dummy"
        "productNumber" String "dummy"
        "productRevision" String "dummy"
        "serialNumber" String "dummy"
        "productionDate" String "dummy"

    "reservedBy" Array Ref 0
    "slotNumber" Integer 10
    "slotState" Integer 0
    // "upgradeGroupId" Integer 0
    // "upgradeGroupTypeName" String ""
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1"
    identity "11"
    moType Slot
    exception none
    nrOfAttributes 8
    "SlotId" String "11"
    "productData" Struct
        nrOfElements 5
        "productName" String ""
        "productNumber" String ""
        "productRevision" String ""
        "serialNumber" String ""
        "productionDate" String ""

    "reservedBy" Array Ref 0
    "slotNumber" Integer 11
    "slotState" Integer 0
    // "upgradeGroupId" Integer 0
    // "upgradeGroupTypeName" String ""
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1"
    identity "12"
    moType Slot
    exception none
    nrOfAttributes 8
    "SlotId" String "12"
    "productData" Struct
        nrOfElements 5
        "productName" String ""
        "productNumber" String ""
        "productRevision" String ""
        "serialNumber" String ""
        "productionDate" String ""

    "reservedBy" Array Ref 0
    "slotNumber" Integer 12
    "slotState" Integer 0
    // "upgradeGroupId" Integer 0
    // "upgradeGroupTypeName" String ""
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1"
    identity "13"
    moType Slot
    exception none
    nrOfAttributes 8
    "SlotId" String "13"
    "productData" Struct
        nrOfElements 5
        "productName" String ""
        "productNumber" String ""
        "productRevision" String ""
        "serialNumber" String ""
        "productionDate" String ""

    "reservedBy" Array Ref 0
    "slotNumber" Integer 13
    "slotState" Integer 0
    // "upgradeGroupId" Integer 0
    // "upgradeGroupTypeName" String ""
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1"
    identity "14"
    moType Slot
    exception none
    nrOfAttributes 8
    "SlotId" String "14"
    "productData" Struct
        nrOfElements 5
        "productName" String ""
        "productNumber" String ""
        "productRevision" String ""
        "serialNumber" String ""
        "productionDate" String ""

    "reservedBy" Array Ref 0
    "slotNumber" Integer 14
    "slotState" Integer 0
    // "upgradeGroupId" Integer 0
    // "upgradeGroupTypeName" String ""
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1"
    identity "15"
    moType Slot
    exception none
    nrOfAttributes 8
    "SlotId" String "15"
    "productData" Struct
        nrOfElements 5
        "productName" String ""
        "productNumber" String ""
        "productRevision" String ""
        "serialNumber" String ""
        "productionDate" String ""

    "reservedBy" Array Ref 0
    "slotNumber" Integer 15
    "slotState" Integer 0
    // "upgradeGroupId" Integer 0
    // "upgradeGroupTypeName" String ""
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1"
    identity "16"
    moType Slot
    exception none
    nrOfAttributes 8
    "SlotId" String "16"
    "productData" Struct
        nrOfElements 5
        "productName" String ""
        "productNumber" String ""
        "productRevision" String ""
        "serialNumber" String ""
        "productionDate" String ""

    "reservedBy" Array Ref 0
    "slotNumber" Integer 16
    "slotState" Integer 0
    // "upgradeGroupId" Integer 0
    // "upgradeGroupTypeName" String ""
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1"
    identity "17"
    moType Slot
    exception none
    nrOfAttributes 8
    "SlotId" String "17"
    "productData" Struct
        nrOfElements 5
        "productName" String ""
        "productNumber" String ""
        "productRevision" String ""
        "serialNumber" String ""
        "productionDate" String ""

    "reservedBy" Array Ref 0
    "slotNumber" Integer 17
    "slotState" Integer 0
    // "upgradeGroupId" Integer 0
    // "upgradeGroupTypeName" String ""
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1"
    identity "18"
    moType Slot
    exception none
    nrOfAttributes 8
    "SlotId" String "18"
    "productData" Struct
        nrOfElements 5
        "productName" String ""
        "productNumber" String ""
        "productRevision" String ""
        "serialNumber" String ""
        "productionDate" String ""

    "reservedBy" Array Ref 0
    "slotNumber" Integer 18
    "slotState" Integer 0
    // "upgradeGroupId" Integer 0
    // "upgradeGroupTypeName" String ""
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1"
    identity "19"
    moType Slot
    exception none
    nrOfAttributes 8
    "SlotId" String "19"
    "productData" Struct
        nrOfElements 5
        "productName" String ""
        "productNumber" String ""
        "productRevision" String ""
        "serialNumber" String ""
        "productionDate" String ""

    "reservedBy" Array Ref 0
    "slotNumber" Integer 19
    "slotState" Integer 0
    // "upgradeGroupId" Integer 0
    // "upgradeGroupTypeName" String ""
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1"
    identity "20"
    moType Slot
    exception none
    nrOfAttributes 8
    "SlotId" String "20"
    "productData" Struct
        nrOfElements 5
        "productName" String ""
        "productNumber" String ""
        "productRevision" String ""
        "serialNumber" String ""
        "productionDate" String ""

    "reservedBy" Array Ref 0
    "slotNumber" Integer 20
    "slotState" Integer 0
    // "upgradeGroupId" Integer 0
    // "upgradeGroupTypeName" String ""
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1"
    identity "21"
    moType Slot
    exception none
    nrOfAttributes 8
    "SlotId" String "21"
    "productData" Struct
        nrOfElements 5
        "productName" String ""
        "productNumber" String ""
        "productRevision" String ""
        "serialNumber" String ""
        "productionDate" String ""

    "reservedBy" Array Ref 0
    "slotNumber" Integer 21
    "slotState" Integer 0
    // "upgradeGroupId" Integer 0
    // "upgradeGroupTypeName" String ""
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1"
    identity "22"
    moType Slot
    exception none
    nrOfAttributes 8
    "SlotId" String "22"
    "productData" Struct
        nrOfElements 5
        "productName" String ""
        "productNumber" String ""
        "productRevision" String ""
        "serialNumber" String ""
        "productionDate" String ""

    "reservedBy" Array Ref 0
    "slotNumber" Integer 22
    "slotState" Integer 0
    // "upgradeGroupId" Integer 0
    // "upgradeGroupTypeName" String ""
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1"
    identity "23"
    moType Slot
    exception none
    nrOfAttributes 8
    "SlotId" String "23"
    "productData" Struct
        nrOfElements 5
        "productName" String ""
        "productNumber" String ""
        "productRevision" String ""
        "serialNumber" String ""
        "productionDate" String ""

    "reservedBy" Array Ref 0
    "slotNumber" Integer 23
    "slotState" Integer 0
    // "upgradeGroupId" Integer 0
    // "upgradeGroupTypeName" String ""
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1"
    identity "24"
    moType Slot
    exception none
    nrOfAttributes 8
    "SlotId" String "24"
    "productData" Struct
        nrOfElements 5
        "productName" String ""
        "productNumber" String ""
        "productRevision" String ""
        "serialNumber" String ""
        "productionDate" String ""

    "reservedBy" Array Ref 0
    "slotNumber" Integer 24
    "slotState" Integer 0
    // "upgradeGroupId" Integer 0
    // "upgradeGroupTypeName" String ""
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1"
    identity "25"
    moType Slot
    exception none
    nrOfAttributes 8
    "SlotId" String "25"
    "productData" Struct
        nrOfElements 5
        "productName" String ""
        "productNumber" String ""
        "productRevision" String ""
        "serialNumber" String ""
        "productionDate" String ""

    "reservedBy" Array Ref 0
    "slotNumber" Integer 25
    "slotState" Integer 0
    // "upgradeGroupId" Integer 0
    // "upgradeGroupTypeName" String ""
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1"
    identity "26"
    moType Slot
    exception none
    nrOfAttributes 8
    "SlotId" String "26"
    "productData" Struct
        nrOfElements 5
        "productName" String ""
        "productNumber" String ""
        "productRevision" String ""
        "serialNumber" String ""
        "productionDate" String ""

    "reservedBy" Array Ref 0
    "slotNumber" Integer 26
    "slotState" Integer 0
    // "upgradeGroupId" Integer 0
    // "upgradeGroupTypeName" String ""
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1"
    identity "27"
    moType Slot
    exception none
    nrOfAttributes 8
    "SlotId" String "27"
    "productData" Struct
        nrOfElements 5
        "productName" String ""
        "productNumber" String ""
        "productRevision" String ""
        "serialNumber" String ""
        "productionDate" String ""

    "reservedBy" Array Ref 0
    "slotNumber" Integer 27
    "slotState" Integer 0
    // "upgradeGroupId" Integer 0
    // "upgradeGroupTypeName" String ""
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1"
    identity "28"
    moType Slot
    exception none
    nrOfAttributes 8
    "SlotId" String "28"
    "productData" Struct
        nrOfElements 5
        "productName" String ""
        "productNumber" String ""
        "productRevision" String ""
        "serialNumber" String ""
        "productionDate" String ""

    "reservedBy" Array Ref 0
    "slotNumber" Integer 28
    "slotState" Integer 0
    // "upgradeGroupId" Integer 0
    // "upgradeGroupTypeName" String ""
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=1"
    identity "1"
    moType PlugInUnit
    exception none
    nrOfAttributes 11
    "PlugInUnitId" String "1"
    "administrativeState" Integer 1
    "allowedSeqRestarts" Integer 3
    "availabilityStatus" Integer 0
    "operationalState" Integer 0
    "piuGroupNumber" Integer 0
    "piuType" Ref "null"
    "pmProcessorLoad" Integer 0
    "productType" String "HW"
    "reservedBy" Array Ref 0
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=28"
    identity "1"
    moType PlugInUnit
    exception none
    nrOfAttributes 11
    "PlugInUnitId" String "1"
    "administrativeState" Integer 0
    "allowedSeqRestarts" Integer 3
    "availabilityStatus" Integer 0
    "operationalState" Integer 0
    "piuGroupNumber" Integer 0
    "piuType" Ref "null"
    "pmProcessorLoad" Integer 0
    "productType" String "HW"
    "reservedBy" Array Ref 0
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=4"
    identity "1"
    moType PlugInUnit
    exception none
    nrOfAttributes 11
    "PlugInUnitId" String "1"
    "administrativeState" Integer 1
    "allowedSeqRestarts" Integer 3
    "availabilityStatus" Integer 0
    "operationalState" Integer 0
    "piuGroupNumber" Integer 0
    "piuType" Ref "null"
    "pmProcessorLoad" Integer 0
    "productType" String "HW"
    "reservedBy" Array Ref 0
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=5"
    identity "1"
    moType PlugInUnit
    exception none
    nrOfAttributes 11
    "PlugInUnitId" String "1"
    "administrativeState" Integer 0
    "allowedSeqRestarts" Integer 3
    "availabilityStatus" Integer 0
    "operationalState" Integer 0
    "piuGroupNumber" Integer 0
    "piuType" Ref "null"
    "pmProcessorLoad" Integer 0
    "productType" String "HW"
    "reservedBy" Array Ref 0
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=20"
    identity "1"
    moType PlugInUnit
    exception none
    nrOfAttributes 11
    "PlugInUnitId" String "1"
    "administrativeState" Integer 1
    "allowedSeqRestarts" Integer 3
    "availabilityStatus" Integer 0
    "operationalState" Integer 0
    "piuGroupNumber" Integer 0
    "piuType" Ref "null"
    "pmProcessorLoad" Integer 0
    "productType" String "HW"
    "reservedBy" Array Ref 0
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=8"
    identity "1"
    moType PlugInUnit
    exception none
    nrOfAttributes 11
    "PlugInUnitId" String "1"
    "administrativeState" Integer 1
    "allowedSeqRestarts" Integer 3
    "availabilityStatus" Integer 0
    "operationalState" Integer 0
    "piuGroupNumber" Integer 0
    "piuType" Ref "null"
    "pmProcessorLoad" Integer 0
    "productType" String "HW"
    "reservedBy" Array Ref 0
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=9"
    identity "1"
    moType PlugInUnit
    exception none
    nrOfAttributes 11
    "PlugInUnitId" String "1"
    "administrativeState" Integer 1
    "allowedSeqRestarts" Integer 3
    "availabilityStatus" Integer 0
    "operationalState" Integer 0
    "piuGroupNumber" Integer 0
    "piuType" Ref "null"
    "pmProcessorLoad" Integer 0
    "productType" String "HW"
    "reservedBy" Array Ref 0
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=10"
    identity "1"
    moType PlugInUnit
    exception none
    nrOfAttributes 11
    "PlugInUnitId" String "1"
    "administrativeState" Integer 1
    "allowedSeqRestarts" Integer 3
    "availabilityStatus" Integer 0
    "operationalState" Integer 0
    "piuGroupNumber" Integer 0
    "piuType" Ref "null"
    "pmProcessorLoad" Integer 0
    "productType" String "HW"
    "reservedBy" Array Ref 0
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=11"
    identity "1"
    moType PlugInUnit
    exception none
    nrOfAttributes 11
    "PlugInUnitId" String "1"
    "administrativeState" Integer 1
    "allowedSeqRestarts" Integer 3
    "availabilityStatus" Integer 0
    "operationalState" Integer 0
    "piuGroupNumber" Integer 0
    "piuType" Ref "null"
    "pmProcessorLoad" Integer 0
    "productType" String "HW"
    "reservedBy" Array Ref 0
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=12"
    identity "1"
    moType PlugInUnit
    exception none
    nrOfAttributes 11
    "PlugInUnitId" String "1"
    "administrativeState" Integer 1
    "allowedSeqRestarts" Integer 3
    "availabilityStatus" Integer 0
    "operationalState" Integer 0
    "piuGroupNumber" Integer 0
    "piuType" Ref "null"
    "pmProcessorLoad" Integer 0
    "productType" String "HW"
    "reservedBy" Array Ref 0
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=13"
    identity "1"
    moType PlugInUnit
    exception none
    nrOfAttributes 11
    "PlugInUnitId" String "1"
    "administrativeState" Integer 1
    "allowedSeqRestarts" Integer 3
    "availabilityStatus" Integer 0
    "operationalState" Integer 0
    "piuGroupNumber" Integer 0
    "piuType" Ref "null"
    "pmProcessorLoad" Integer 0
    "productType" String "HW"
    "reservedBy" Array Ref 0
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=14"
    identity "1"
    moType PlugInUnit
    exception none
    nrOfAttributes 11
    "PlugInUnitId" String "1"
    "administrativeState" Integer 1
    "allowedSeqRestarts" Integer 3
    "availabilityStatus" Integer 0
    "operationalState" Integer 0
    "piuGroupNumber" Integer 0
    "piuType" Ref "null"
    "pmProcessorLoad" Integer 0
    "productType" String "HW"
    "reservedBy" Array Ref 0
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=15"
    identity "1"
    moType PlugInUnit
    exception none
    nrOfAttributes 11
    "PlugInUnitId" String "1"
    "administrativeState" Integer 1
    "allowedSeqRestarts" Integer 3
    "availabilityStatus" Integer 0
    "operationalState" Integer 0
    "piuGroupNumber" Integer 0
    "piuType" Ref "null"
    "pmProcessorLoad" Integer 0
    "productType" String "HW"
    "reservedBy" Array Ref 0
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=16"
    identity "1"
    moType PlugInUnit
    exception none
    nrOfAttributes 11
    "PlugInUnitId" String "1"
    "administrativeState" Integer 1
    "allowedSeqRestarts" Integer 3
    "availabilityStatus" Integer 0
    "operationalState" Integer 0
    "piuGroupNumber" Integer 0
    "piuType" Ref "null"
    "pmProcessorLoad" Integer 0
    "productType" String "HW"
    "reservedBy" Array Ref 0
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=17"
    identity "1"
    moType PlugInUnit
    exception none
    nrOfAttributes 11
    "PlugInUnitId" String "1"
    "administrativeState" Integer 0
    "allowedSeqRestarts" Integer 3
    "availabilityStatus" Integer 0
    "operationalState" Integer 0
    "piuGroupNumber" Integer 0
    "piuType" Ref "null"
    "pmProcessorLoad" Integer 0
    "productType" String "HW"
    "reservedBy" Array Ref 0
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=18"
    identity "1"
    moType PlugInUnit
    exception none
    nrOfAttributes 11
    "PlugInUnitId" String "1"
    "administrativeState" Integer 0
    "allowedSeqRestarts" Integer 3
    "availabilityStatus" Integer 0
    "operationalState" Integer 0
    "piuGroupNumber" Integer 0
    "piuType" Ref "null"
    "pmProcessorLoad" Integer 0
    "productType" String "HW"
    "reservedBy" Array Ref 0
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=19"
    identity "1"
    moType PlugInUnit
    exception none
    nrOfAttributes 11
    "PlugInUnitId" String "1"
    "administrativeState" Integer 0
    "allowedSeqRestarts" Integer 3
    "availabilityStatus" Integer 0
    "operationalState" Integer 0
    "piuGroupNumber" Integer 0
    "piuType" Ref "null"
    "pmProcessorLoad" Integer 0
    "productType" String "HW"
    "reservedBy" Array Ref 0
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=26"
    identity "1"
    moType PlugInUnit
    exception none
    nrOfAttributes 11
    "PlugInUnitId" String "1"
    "administrativeState" Integer 1
    "allowedSeqRestarts" Integer 3
    "availabilityStatus" Integer 0
    "operationalState" Integer 0
    "piuGroupNumber" Integer 0
    "piuType" Ref "null"
    "pmProcessorLoad" Integer 0
    "productType" String "HW"
    "reservedBy" Array Ref 0
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=27"
    identity "1"
    moType PlugInUnit
    exception none
    nrOfAttributes 11
    "PlugInUnitId" String "1"
    "administrativeState" Integer 0
    "allowedSeqRestarts" Integer 3
    "availabilityStatus" Integer 0
    "operationalState" Integer 0
    "piuGroupNumber" Integer 0
    "piuType" Ref "null"
    "pmProcessorLoad" Integer 0
    "productType" String "HW"
    "reservedBy" Array Ref 0
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=1,PlugInUnit=1"
    identity "1"
    moType Program
    exception none
    nrOfAttributes 9
    "ProgramId" String "1"
    "heapSize" Integer 0
    "loadModule" Ref "null"
    "operationalState" Integer 0
    "poolSize" Integer 0
    "restartCounterLimit" Integer 3
    "restartTimer" Integer 60
    //"startState" Integer 1
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=1,PlugInUnit=1"
    identity "2"
    moType Program
    exception none
    nrOfAttributes 9
    "ProgramId" String "2"
    "heapSize" Integer 0
    "loadModule" Ref "null"
    "operationalState" Integer 0
    "poolSize" Integer 0
    "restartCounterLimit" Integer 3
    "restartTimer" Integer 60
    //"startState" Integer 1
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=1,PlugInUnit=1"
    identity "3"
    moType Program
    exception none
    nrOfAttributes 9
    "ProgramId" String "3"
    "heapSize" Integer 0
    "loadModule" Ref "null"
    "operationalState" Integer 0
    "poolSize" Integer 0
    "restartCounterLimit" Integer 3
    "restartTimer" Integer 60
    //"startState" Integer 1
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=1,PlugInUnit=1"
    identity "4"
    moType Program
    exception none
    nrOfAttributes 9
    "ProgramId" String "4"
    "heapSize" Integer 0
    "loadModule" Ref "null"
    "operationalState" Integer 0
    "poolSize" Integer 0
    "restartCounterLimit" Integer 3
    "restartTimer" Integer 60
    //"startState" Integer 1
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=1,PlugInUnit=1"
    identity "5"
    moType Program
    exception none
    nrOfAttributes 9
    "ProgramId" String "5"
    "heapSize" Integer 0
    "loadModule" Ref "null"
    "operationalState" Integer 0
    "poolSize" Integer 0
    "restartCounterLimit" Integer 3
    "restartTimer" Integer 60
    //"startState" Integer 1
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=1,PlugInUnit=1"
    identity "6"
    moType Program
    exception none
    nrOfAttributes 9
    "ProgramId" String "6"
    "heapSize" Integer 0
    "loadModule" Ref "null"
    "operationalState" Integer 0
    "poolSize" Integer 0
    "restartCounterLimit" Integer 3
    "restartTimer" Integer 60
    //"startState" Integer 1
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=1,PlugInUnit=1"
    identity "7"
    moType Program
    exception none
    nrOfAttributes 9
    "ProgramId" String "7"
    "heapSize" Integer 0
    "loadModule" Ref "null"
    "operationalState" Integer 0
    "poolSize" Integer 0
    "restartCounterLimit" Integer 3
    "restartTimer" Integer 60
    //"startState" Integer 1
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=1,PlugInUnit=1"
    identity "8"
    moType Program
    exception none
    nrOfAttributes 9
    "ProgramId" String "8"
    "heapSize" Integer 0
    "loadModule" Ref "null"
    "operationalState" Integer 0
    "poolSize" Integer 0
    "restartCounterLimit" Integer 3
    "restartTimer" Integer 60
    //"startState" Integer 1
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=4,PlugInUnit=1"
    identity "1"
    moType Program
    exception none
    nrOfAttributes 9
    "ProgramId" String "1"
    "heapSize" Integer 0
    "loadModule" Ref "null"
    "operationalState" Integer 0
    "poolSize" Integer 0
    "restartCounterLimit" Integer 3
    "restartTimer" Integer 60
    //"startState" Integer 1
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=4,PlugInUnit=1"
    identity "2"
    moType Program
    exception none
    nrOfAttributes 9
    "ProgramId" String "2"
    "heapSize" Integer 0
    "loadModule" Ref "null"
    "operationalState" Integer 0
    "poolSize" Integer 0
    "restartCounterLimit" Integer 3
    "restartTimer" Integer 60
    //"startState" Integer 1
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=4,PlugInUnit=1"
    identity "3"
    moType Program
    exception none
    nrOfAttributes 9
    "ProgramId" String "3"
    "heapSize" Integer 0
    "loadModule" Ref "null"
    "operationalState" Integer 0
    "poolSize" Integer 0
    "restartCounterLimit" Integer 3
    "restartTimer" Integer 60
    //"startState" Integer 1
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=4,PlugInUnit=1"
    identity "4"
    moType Program
    exception none
    nrOfAttributes 9
    "ProgramId" String "4"
    "heapSize" Integer 0
    "loadModule" Ref "null"
    "operationalState" Integer 0
    "poolSize" Integer 0
    "restartCounterLimit" Integer 3
    "restartTimer" Integer 60
    //"startState" Integer 1
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=4,PlugInUnit=1"
    identity "5"
    moType Program
    exception none
    nrOfAttributes 9
    "ProgramId" String "5"
    "heapSize" Integer 0
    "loadModule" Ref "null"
    "operationalState" Integer 0
    "poolSize" Integer 0
    "restartCounterLimit" Integer 3
    "restartTimer" Integer 60
    //"startState" Integer 1
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=4,PlugInUnit=1"
    identity "6"
    moType Program
    exception none
    nrOfAttributes 9
    "ProgramId" String "6"
    "heapSize" Integer 0
    "loadModule" Ref "null"
    "operationalState" Integer 0
    "poolSize" Integer 0
    "restartCounterLimit" Integer 3
    "restartTimer" Integer 60
    //"startState" Integer 1
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=20,PlugInUnit=1"
    identity "1"
    moType Program
    exception none
    nrOfAttributes 9
    "ProgramId" String "1"
    "heapSize" Integer 0
    "loadModule" Ref "null"
    "operationalState" Integer 0
    "poolSize" Integer 0
    "restartCounterLimit" Integer 3
    "restartTimer" Integer 60
    //"startState" Integer 1
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=20,PlugInUnit=1"
    identity "2"
    moType Program
    exception none
    nrOfAttributes 9
    "ProgramId" String "2"
    "heapSize" Integer 0
    "loadModule" Ref "null"
    "operationalState" Integer 0
    "poolSize" Integer 0
    "restartCounterLimit" Integer 3
    "restartTimer" Integer 60
    //"startState" Integer 1
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=20,PlugInUnit=1"
    identity "3"
    moType Program
    exception none
    nrOfAttributes 9
    "ProgramId" String "3"
    "heapSize" Integer 0
    "loadModule" Ref "null"
    "operationalState" Integer 0
    "poolSize" Integer 0
    "restartCounterLimit" Integer 3
    "restartTimer" Integer 60
    //"startState" Integer 1
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=20,PlugInUnit=1"
    identity "4"
    moType Program
    exception none
    nrOfAttributes 9
    "ProgramId" String "4"
    "heapSize" Integer 0
    "loadModule" Ref "null"
    "operationalState" Integer 0
    "poolSize" Integer 0
    "restartCounterLimit" Integer 3
    "restartTimer" Integer 60
    //"startState" Integer 1
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=20,PlugInUnit=1"
    identity "5"
    moType Program
    exception none
    nrOfAttributes 9
    "ProgramId" String "5"
    "heapSize" Integer 0
    "loadModule" Ref "null"
    "operationalState" Integer 0
    "poolSize" Integer 0
    "restartCounterLimit" Integer 3
    "restartTimer" Integer 60
    //"startState" Integer 1
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=20,PlugInUnit=1"
    identity "6"
    moType Program
    exception none
    nrOfAttributes 9
    "ProgramId" String "6"
    "heapSize" Integer 0
    "loadModule" Ref "null"
    "operationalState" Integer 0
    "poolSize" Integer 0
    "restartCounterLimit" Integer 3
    "restartTimer" Integer 60
    //"startState" Integer 1
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=20,PlugInUnit=1"
    identity "7"
    moType Program
    exception none
    nrOfAttributes 9
    "ProgramId" String "7"
    "heapSize" Integer 0
    "loadModule" Ref "null"
    "operationalState" Integer 0
    "poolSize" Integer 0
    "restartCounterLimit" Integer 3
    "restartTimer" Integer 60
    //"startState" Integer 1
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=20,PlugInUnit=1"
    identity "8"
    moType Program
    exception none
    nrOfAttributes 9
    "ProgramId" String "8"
    "heapSize" Integer 0
    "loadModule" Ref "null"
    "operationalState" Integer 0
    "poolSize" Integer 0
    "restartCounterLimit" Integer 3
    "restartTimer" Integer 60
    //"startState" Integer 1
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=20,PlugInUnit=1"
    identity "9"
    moType Program
    exception none
    nrOfAttributes 9
    "ProgramId" String "9"
    "heapSize" Integer 0
    "loadModule" Ref "null"
    "operationalState" Integer 0
    "poolSize" Integer 0
    "restartCounterLimit" Integer 3
    "restartTimer" Integer 60
    //"startState" Integer 1
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=20,PlugInUnit=1"
    identity "10"
    moType Program
    exception none
    nrOfAttributes 9
    "ProgramId" String "10"
    "heapSize" Integer 0
    "loadModule" Ref "null"
    "operationalState" Integer 0
    "poolSize" Integer 0
    "restartCounterLimit" Integer 3
    "restartTimer" Integer 60
    //"startState" Integer 1
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=20,PlugInUnit=1"
    identity "11"
    moType Program
    exception none
    nrOfAttributes 9
    "ProgramId" String "11"
    "heapSize" Integer 0
    "loadModule" Ref "null"
    "operationalState" Integer 0
    "poolSize" Integer 0
    "restartCounterLimit" Integer 3
    "restartTimer" Integer 60
    //"startState" Integer 1
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=20,PlugInUnit=1"
    identity "12"
    moType Program
    exception none
    nrOfAttributes 9
    "ProgramId" String "12"
    "heapSize" Integer 0
    "loadModule" Ref "null"
    "operationalState" Integer 0
    "poolSize" Integer 0
    "restartCounterLimit" Integer 3
    "restartTimer" Integer 60
    //"startState" Integer 1
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=20,PlugInUnit=1"
    identity "13"
    moType Program
    exception none
    nrOfAttributes 9
    "ProgramId" String "13"
    "heapSize" Integer 0
    "loadModule" Ref "null"
    "operationalState" Integer 0
    "poolSize" Integer 0
    "restartCounterLimit" Integer 3
    "restartTimer" Integer 60
    //"startState" Integer 1
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=20,PlugInUnit=1"
    identity "14"
    moType Program
    exception none
    nrOfAttributes 9
    "ProgramId" String "14"
    "heapSize" Integer 0
    "loadModule" Ref "null"
    "operationalState" Integer 0
    "poolSize" Integer 0
    "restartCounterLimit" Integer 3
    "restartTimer" Integer 60
    //"startState" Integer 1
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=20,PlugInUnit=1"
    identity "15"
    moType Program
    exception none
    nrOfAttributes 9
    "ProgramId" String "15"
    "heapSize" Integer 0
    "loadModule" Ref "null"
    "operationalState" Integer 0
    "poolSize" Integer 0
    "restartCounterLimit" Integer 3
    "restartTimer" Integer 60
    //"startState" Integer 1
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=20,PlugInUnit=1"
    identity "16"
    moType Program
    exception none
    nrOfAttributes 9
    "ProgramId" String "16"
    "heapSize" Integer 0
    "loadModule" Ref "null"
    "operationalState" Integer 0
    "poolSize" Integer 0
    "restartCounterLimit" Integer 3
    "restartTimer" Integer 60
    //"startState" Integer 1
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=20,PlugInUnit=1"
    identity "17"
    moType Program
    exception none
    nrOfAttributes 9
    "ProgramId" String "17"
    "heapSize" Integer 0
    "loadModule" Ref "null"
    "operationalState" Integer 0
    "poolSize" Integer 0
    "restartCounterLimit" Integer 3
    "restartTimer" Integer 60
    //"startState" Integer 1
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=20,PlugInUnit=1"
    identity "18"
    moType Program
    exception none
    nrOfAttributes 9
    "ProgramId" String "18"
    "heapSize" Integer 0
    "loadModule" Ref "null"
    "operationalState" Integer 0
    "poolSize" Integer 0
    "restartCounterLimit" Integer 3
    "restartTimer" Integer 60
    //"startState" Integer 1
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=20,PlugInUnit=1"
    identity "19"
    moType Program
    exception none
    nrOfAttributes 9
    "ProgramId" String "19"
    "heapSize" Integer 0
    "loadModule" Ref "null"
    "operationalState" Integer 0
    "poolSize" Integer 0
    "restartCounterLimit" Integer 3
    "restartTimer" Integer 60
    //"startState" Integer 1
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=20,PlugInUnit=1"
    identity "20"
    moType Program
    exception none
    nrOfAttributes 9
    "ProgramId" String "20"
    "heapSize" Integer 0
    "loadModule" Ref "null"
    "operationalState" Integer 0
    "poolSize" Integer 0
    "restartCounterLimit" Integer 3
    "restartTimer" Integer 60
    //"startState" Integer 1
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=20,PlugInUnit=1"
    identity "22"
    moType Program
    exception none
    nrOfAttributes 9
    "ProgramId" String "22"
    "heapSize" Integer 0
    "loadModule" Ref "null"
    "operationalState" Integer 0
    "poolSize" Integer 0
    "restartCounterLimit" Integer 3
    "restartTimer" Integer 60
    //"startState" Integer 1
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=20,PlugInUnit=1"
    identity "23"
    moType Program
    exception none
    nrOfAttributes 9
    "ProgramId" String "23"
    "heapSize" Integer 0
    "loadModule" Ref "null"
    "operationalState" Integer 0
    "poolSize" Integer 0
    "restartCounterLimit" Integer 3
    "restartTimer" Integer 60
    //"startState" Integer 1
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=20,PlugInUnit=1"
    identity "25"
    moType Program
    exception none
    nrOfAttributes 9
    "ProgramId" String "25"
    "heapSize" Integer 0
    "loadModule" Ref "null"
    "operationalState" Integer 0
    "poolSize" Integer 0
    "restartCounterLimit" Integer 3
    "restartTimer" Integer 60
    //"startState" Integer 1
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=20,PlugInUnit=1"
    identity "26"
    moType Program
    exception none
    nrOfAttributes 9
    "ProgramId" String "26"
    "heapSize" Integer 0
    "loadModule" Ref "null"
    "operationalState" Integer 0
    "poolSize" Integer 0
    "restartCounterLimit" Integer 3
    "restartTimer" Integer 60
    //"startState" Integer 1
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=20,PlugInUnit=1"
    identity "27"
    moType Program
    exception none
    nrOfAttributes 9
    "ProgramId" String "27"
    "heapSize" Integer 0
    "loadModule" Ref "null"
    "operationalState" Integer 0
    "poolSize" Integer 0
    "restartCounterLimit" Integer 3
    "restartTimer" Integer 60
    //"startState" Integer 1
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=20,PlugInUnit=1"
    identity "28"
    moType Program
    exception none
    nrOfAttributes 9
    "ProgramId" String "28"
    "heapSize" Integer 0
    "loadModule" Ref "null"
    "operationalState" Integer 0
    "poolSize" Integer 0
    "restartCounterLimit" Integer 3
    "restartTimer" Integer 60
    //"startState" Integer 1
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=20,PlugInUnit=1"
    identity "29"
    moType Program
    exception none
    nrOfAttributes 9
    "ProgramId" String "29"
    "heapSize" Integer 0
    "loadModule" Ref "null"
    "operationalState" Integer 0
    "poolSize" Integer 0
    "restartCounterLimit" Integer 3
    "restartTimer" Integer 60
    //"startState" Integer 1
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=20,PlugInUnit=1"
    identity "30"
    moType Program
    exception none
    nrOfAttributes 9
    "ProgramId" String "30"
    "heapSize" Integer 0
    "loadModule" Ref "null"
    "operationalState" Integer 0
    "poolSize" Integer 0
    "restartCounterLimit" Integer 3
    "restartTimer" Integer 60
    //"startState" Integer 1
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=20,PlugInUnit=1"
    identity "31"
    moType Program
    exception none
    nrOfAttributes 9
    "ProgramId" String "31"
    "heapSize" Integer 0
    "loadModule" Ref "null"
    "operationalState" Integer 0
    "poolSize" Integer 0
    "restartCounterLimit" Integer 3
    "restartTimer" Integer 60
    //"startState" Integer 1
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=20,PlugInUnit=1"
    identity "33"
    moType Program
    exception none
    nrOfAttributes 9
    "ProgramId" String "33"
    "heapSize" Integer 0
    "loadModule" Ref "null"
    "operationalState" Integer 0
    "poolSize" Integer 0
    "restartCounterLimit" Integer 3
    "restartTimer" Integer 60
    //"startState" Integer 1
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=20,PlugInUnit=1"
    identity "34"
    moType Program
    exception none
    nrOfAttributes 9
    "ProgramId" String "34"
    "heapSize" Integer 0
    "loadModule" Ref "null"
    "operationalState" Integer 0
    "poolSize" Integer 0
    "restartCounterLimit" Integer 3
    "restartTimer" Integer 60
    //"startState" Integer 1
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=20,PlugInUnit=1"
    identity "35"
    moType Program
    exception none
    nrOfAttributes 9
    "ProgramId" String "35"
    "heapSize" Integer 0
    "loadModule" Ref "null"
    "operationalState" Integer 0
    "poolSize" Integer 0
    "restartCounterLimit" Integer 3
    "restartTimer" Integer 60
    //"startState" Integer 1
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=20,PlugInUnit=1"
    identity "36"
    moType Program
    exception none
    nrOfAttributes 9
    "ProgramId" String "36"
    "heapSize" Integer 0
    "loadModule" Ref "null"
    "operationalState" Integer 0
    "poolSize" Integer 0
    "restartCounterLimit" Integer 3
    "restartTimer" Integer 60
    //"startState" Integer 1
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=20,PlugInUnit=1"
    identity "37"
    moType Program
    exception none
    nrOfAttributes 9
    "ProgramId" String "37"
    "heapSize" Integer 0
    "loadModule" Ref "null"
    "operationalState" Integer 0
    "poolSize" Integer 0
    "restartCounterLimit" Integer 3
    "restartTimer" Integer 60
    //"startState" Integer 1
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=20,PlugInUnit=1"
    identity "38"
    moType Program
    exception none
    nrOfAttributes 9
    "ProgramId" String "38"
    "heapSize" Integer 0
    "loadModule" Ref "null"
    "operationalState" Integer 0
    "poolSize" Integer 0
    "restartCounterLimit" Integer 3
    "restartTimer" Integer 60
    //"startState" Integer 1
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=2"
    identity "1"
    moType PlugInUnit
    exception none
    nrOfAttributes 11
    "PlugInUnitId" String "1"
    "administrativeState" Integer 1
    "allowedSeqRestarts" Integer 3
    "availabilityStatus" Integer 0
    "operationalState" Integer 0
    "piuGroupNumber" Integer 0
    "piuType" Ref "null"
    "pmProcessorLoad" Integer 0
    "productType" String "HW"
    "reservedBy" Array Ref 0
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=2,PlugInUnit=1"
    identity "1"
    moType Program
    exception none
    nrOfAttributes 9
    "ProgramId" String "1"
    "heapSize" Integer 0
    "loadModule" Ref "null"
    "operationalState" Integer 0
    "poolSize" Integer 0
    "restartCounterLimit" Integer 3
    "restartTimer" Integer 60
    //"startState" Integer 1
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=2,PlugInUnit=1"
    identity "2"
    moType Program
    exception none
    nrOfAttributes 9
    "ProgramId" String "2"
    "heapSize" Integer 0
    "loadModule" Ref "null"
    "operationalState" Integer 0
    "poolSize" Integer 0
    "restartCounterLimit" Integer 3
    "restartTimer" Integer 60
    //"startState" Integer 1
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=2,PlugInUnit=1"
    identity "3"
    moType Program
    exception none
    nrOfAttributes 9
    "ProgramId" String "3"
    "heapSize" Integer 0
    "loadModule" Ref "null"
    "operationalState" Integer 0
    "poolSize" Integer 0
    "restartCounterLimit" Integer 3
    "restartTimer" Integer 60
    //"startState" Integer 1
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=2,PlugInUnit=1"
    identity "4"
    moType Program
    exception none
    nrOfAttributes 9
    "ProgramId" String "4"
    "heapSize" Integer 0
    "loadModule" Ref "null"
    "operationalState" Integer 0
    "poolSize" Integer 0
    "restartCounterLimit" Integer 3
    "restartTimer" Integer 60
    //"startState" Integer 1
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=2,PlugInUnit=1"
    identity "5"
    moType Program
    exception none
    nrOfAttributes 9
    "ProgramId" String "5"
    "heapSize" Integer 0
    "loadModule" Ref "null"
    "operationalState" Integer 0
    "poolSize" Integer 0
    "restartCounterLimit" Integer 3
    "restartTimer" Integer 60
    //"startState" Integer 1
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=2,PlugInUnit=1"
    identity "6"
    moType Program
    exception none
    nrOfAttributes 9
    "ProgramId" String "6"
    "heapSize" Integer 0
    "loadModule" Ref "null"
    "operationalState" Integer 0
    "poolSize" Integer 0
    "restartCounterLimit" Integer 3
    "restartTimer" Integer 60
    //"startState" Integer 1
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=2,PlugInUnit=1"
    identity "7"
    moType Program
    exception none
    nrOfAttributes 9
    "ProgramId" String "7"
    "heapSize" Integer 0
    "loadModule" Ref "null"
    "operationalState" Integer 0
    "poolSize" Integer 0
    "restartCounterLimit" Integer 3
    "restartTimer" Integer 60
    //"startState" Integer 1
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=2,PlugInUnit=1"
    identity "8"
    moType Program
    exception none
    nrOfAttributes 9
    "ProgramId" String "8"
    "heapSize" Integer 0
    "loadModule" Ref "null"
    "operationalState" Integer 0
    "poolSize" Integer 0
    "restartCounterLimit" Integer 3
    "restartTimer" Integer 60
    //"startState" Integer 1
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=20,PlugInUnit=1"
    identity "32"
    moType Program
    exception none
    nrOfAttributes 9
    "ProgramId" String "32"
    "heapSize" Integer 0
    "loadModule" Ref "null"
    "operationalState" Integer 0
    "poolSize" Integer 0
    "restartCounterLimit" Integer 3
    "restartTimer" Integer 60
    //"startState" Integer 1
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=2,PlugInUnit=1"
    identity "1"
    moType ExchangeTerminal
    exception none
    nrOfAttributes 4
    "ExchangeTerminalId" String "1"
    "availabilityStatus" Integer 0
    "operationalState" Integer 0
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=2,PlugInUnit=1,ExchangeTerminal=1"
    identity "pp1"
    moType E1PhysPathTerm
    exception none
    nrOfAttributes 19
    "E1PhysPathTermId" String "pp1"
    "administrativeState" Integer 1
    "aisReporting" Boolean false
    "availabilityStatus" Integer 0
    "crc4Mode" Integer 2
    "degDegM" Integer 7
    "degDegThr" Integer 30
    "idlePattern" Integer 0
    "lineNo" Integer 1
    "loopback" Integer 0
    "operationalState" Integer 0
    "pmEs" Integer 0
    "pmSes" Integer 0
    "rdiReporting" Boolean false
    "reservedByImaLink" Ref "null"
    "reservedBySync" Ref "null"
    "reservedByTraffic" Ref "null"
    "shutDownTimeout" Integer 1800
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=2,PlugInUnit=1,ExchangeTerminal=1"
    identity "pp2"
    moType E1PhysPathTerm
    exception none
    nrOfAttributes 19
    "E1PhysPathTermId" String "pp2"
    "administrativeState" Integer 1
    "aisReporting" Boolean false
    "availabilityStatus" Integer 0
    "crc4Mode" Integer 2
    "degDegM" Integer 7
    "degDegThr" Integer 30
    "idlePattern" Integer 0
    "lineNo" Integer 1
    "loopback" Integer 0
    "operationalState" Integer 0
    "pmEs" Integer 0
    "pmSes" Integer 0
    "rdiReporting" Boolean false
    "reservedByImaLink" Ref "null"
    "reservedBySync" Ref "null"
    "reservedByTraffic" Ref "null"
    "shutDownTimeout" Integer 1800
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=2,PlugInUnit=1,ExchangeTerminal=1"
    identity "pp3"
    moType E1PhysPathTerm
    exception none
    nrOfAttributes 19
    "E1PhysPathTermId" String "pp3"
    "administrativeState" Integer 1
    "aisReporting" Boolean false
    "availabilityStatus" Integer 0
    "crc4Mode" Integer 2
    "degDegM" Integer 7
    "degDegThr" Integer 30
    "idlePattern" Integer 0
    "lineNo" Integer 1
    "loopback" Integer 0
    "operationalState" Integer 0
    "pmEs" Integer 0
    "pmSes" Integer 0
    "rdiReporting" Boolean false
    "reservedByImaLink" Ref "null"
    "reservedBySync" Ref "null"
    "reservedByTraffic" Ref "null"
    "shutDownTimeout" Integer 1800
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=2,PlugInUnit=1,ExchangeTerminal=1"
    identity "pp4"
    moType E1PhysPathTerm
    exception none
    nrOfAttributes 19
    "E1PhysPathTermId" String "pp4"
    "administrativeState" Integer 1
    "aisReporting" Boolean false
    "availabilityStatus" Integer 0
    "crc4Mode" Integer 2
    "degDegM" Integer 7
    "degDegThr" Integer 30
    "idlePattern" Integer 0
    "lineNo" Integer 1
    "loopback" Integer 0
    "operationalState" Integer 0
    "pmEs" Integer 0
    "pmSes" Integer 0
    "rdiReporting" Boolean false
    "reservedByImaLink" Ref "null"
    "reservedBySync" Ref "null"
    "reservedByTraffic" Ref "null"
    "shutDownTimeout" Integer 1800
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=2,PlugInUnit=1,ExchangeTerminal=1"
    identity "pp5"
    moType E1PhysPathTerm
    exception none
    nrOfAttributes 19
    "E1PhysPathTermId" String "pp5"
    "administrativeState" Integer 1
    "aisReporting" Boolean false
    "availabilityStatus" Integer 0
    "crc4Mode" Integer 2
    "degDegM" Integer 7
    "degDegThr" Integer 30
    "idlePattern" Integer 0
    "lineNo" Integer 1
    "loopback" Integer 0
    "operationalState" Integer 0
    "pmEs" Integer 0
    "pmSes" Integer 0
    "rdiReporting" Boolean false
    "reservedByImaLink" Ref "null"
    "reservedBySync" Ref "null"
    "reservedByTraffic" Ref "null"
    "shutDownTimeout" Integer 1800
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=2,PlugInUnit=1,ExchangeTerminal=1"
    identity "pp6"
    moType E1PhysPathTerm
    exception none
    nrOfAttributes 19
    "E1PhysPathTermId" String "pp6"
    "administrativeState" Integer 1
    "aisReporting" Boolean false
    "availabilityStatus" Integer 0
    "crc4Mode" Integer 2
    "degDegM" Integer 7
    "degDegThr" Integer 30
    "idlePattern" Integer 0
    "lineNo" Integer 1
    "loopback" Integer 0
    "operationalState" Integer 0
    "pmEs" Integer 0
    "pmSes" Integer 0
    "rdiReporting" Boolean false
    "reservedByImaLink" Ref "null"
    "reservedBySync" Ref "null"
    "reservedByTraffic" Ref "null"
    "shutDownTimeout" Integer 1800
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=2,PlugInUnit=1,ExchangeTerminal=1"
    identity "pp7"
    moType E1PhysPathTerm
    exception none
    nrOfAttributes 19
    "E1PhysPathTermId" String "pp7"
    "administrativeState" Integer 1
    "aisReporting" Boolean false
    "availabilityStatus" Integer 0
    "crc4Mode" Integer 2
    "degDegM" Integer 7
    "degDegThr" Integer 30
    "idlePattern" Integer 0
    "lineNo" Integer 1
    "loopback" Integer 0
    "operationalState" Integer 0
    "pmEs" Integer 0
    "pmSes" Integer 0
    "rdiReporting" Boolean false
    "reservedByImaLink" Ref "null"
    "reservedBySync" Ref "null"
    "reservedByTraffic" Ref "null"
    "shutDownTimeout" Integer 1800
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=2,PlugInUnit=1,ExchangeTerminal=1"
    identity "pp8"
    moType E1PhysPathTerm
    exception none
    nrOfAttributes 19
    "E1PhysPathTermId" String "pp8"
    "administrativeState" Integer 1
    "aisReporting" Boolean false
    "availabilityStatus" Integer 0
    "crc4Mode" Integer 2
    "degDegM" Integer 7
    "degDegThr" Integer 30
    "idlePattern" Integer 0
    "lineNo" Integer 1
    "loopback" Integer 0
    "operationalState" Integer 0
    "pmEs" Integer 0
    "pmSes" Integer 0
    "rdiReporting" Boolean false
    "reservedByImaLink" Ref "null"
    "reservedBySync" Ref "null"
    "reservedByTraffic" Ref "null"
    "shutDownTimeout" Integer 1800
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=4,PlugInUnit=1"
    identity "1"
    moType TimingUnit
    exception none
    nrOfAttributes 4
    "TimingUnitId" String "1"
    "availabilityStatus" Integer 0
    "operationalState" Integer 0
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=4,PlugInUnit=1,TimingUnit=1"
    identity "1"
    moType TuSyncRef
    exception none
    nrOfAttributes 6
    "TuSyncRefId" String "1"
    "administrativeState" Integer 1
    "availabilityStatus" Integer 0
    "operationalState" Integer 0
    "reservedBy" Ref "null"
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=4,PlugInUnit=1,TimingUnit=1"
    identity "1"
    moType Program
    exception none
    nrOfAttributes 9
    "ProgramId" String "1"
    "heapSize" Integer 0
    "loadModule" Ref "null"
    "operationalState" Integer 0
    "poolSize" Integer 0
    "restartCounterLimit" Integer 3
    "restartTimer" Integer 60
    //"startState" Integer 1
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=1,PlugInUnit=1"
    identity "1"
    moType SwitchCoreUnit
    exception none
    nrOfAttributes 9
    "SwitchCoreUnitId" String "1"
    "administrativeStateSili" Integer 0
    "availabilityStatusSil" Integer 0
    "availabilityStatusSync" Integer 0
    "operationalStateSil" Integer 0
    "operationalStateSync" Integer 0
    "reservedBy" Array Ref 0
    "silPorts" Array Integer 0
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=4,PlugInUnit=1"
    identity "24"
    moType Program
    exception none
    nrOfAttributes 9
    "ProgramId" String "24"
    "heapSize" Integer 0
    "loadModule" Ref "null"
    "operationalState" Integer 0
    "poolSize" Integer 0
    "restartCounterLimit" Integer 3
    "restartTimer" Integer 60
    //"startState" Integer 1
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=8,PlugInUnit=1"
    identity "1"
    moType Program
    exception none
    nrOfAttributes 9
    "ProgramId" String "1"
    "heapSize" Integer 0
    "loadModule" Ref "null"
    "operationalState" Integer 0
    "poolSize" Integer 0
    "restartCounterLimit" Integer 3
    "restartTimer" Integer 60
    //"startState" Integer 1
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=8,PlugInUnit=1"
    identity "2"
    moType Program
    exception none
    nrOfAttributes 9
    "ProgramId" String "2"
    "heapSize" Integer 0
    "loadModule" Ref "null"
    "operationalState" Integer 0
    "poolSize" Integer 0
    "restartCounterLimit" Integer 3
    "restartTimer" Integer 60
    //"startState" Integer 1
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=8,PlugInUnit=1"
    identity "3"
    moType Program
    exception none
    nrOfAttributes 9
    "ProgramId" String "3"
    "heapSize" Integer 0
    "loadModule" Ref "null"
    "operationalState" Integer 0
    "poolSize" Integer 0
    "restartCounterLimit" Integer 3
    "restartTimer" Integer 60
    //"startState" Integer 1
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=8,PlugInUnit=1"
    identity "4"
    moType Program
    exception none
    nrOfAttributes 9
    "ProgramId" String "4"
    "heapSize" Integer 0
    "loadModule" Ref "null"
    "operationalState" Integer 0
    "poolSize" Integer 0
    "restartCounterLimit" Integer 3
    "restartTimer" Integer 60
    //"startState" Integer 1
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=8,PlugInUnit=1"
    identity "5"
    moType Program
    exception none
    nrOfAttributes 9
    "ProgramId" String "5"
    "heapSize" Integer 0
    "loadModule" Ref "null"
    "operationalState" Integer 0
    "poolSize" Integer 0
    "restartCounterLimit" Integer 3
    "restartTimer" Integer 60
    //"startState" Integer 1
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=9,PlugInUnit=1"
    identity "1"
    moType Program
    exception none
    nrOfAttributes 9
    "ProgramId" String "1"
    "heapSize" Integer 0
    "loadModule" Ref "null"
    "operationalState" Integer 0
    "poolSize" Integer 0
    "restartCounterLimit" Integer 3
    "restartTimer" Integer 60
    //"startState" Integer 1
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=9,PlugInUnit=1"
    identity "2"
    moType Program
    exception none
    nrOfAttributes 9
    "ProgramId" String "2"
    "heapSize" Integer 0
    "loadModule" Ref "null"
    "operationalState" Integer 0
    "poolSize" Integer 0
    "restartCounterLimit" Integer 3
    "restartTimer" Integer 60
    //"startState" Integer 1
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=9,PlugInUnit=1"
    identity "3"
    moType Program
    exception none
    nrOfAttributes 9
    "ProgramId" String "3"
    "heapSize" Integer 0
    "loadModule" Ref "null"
    "operationalState" Integer 0
    "poolSize" Integer 0
    "restartCounterLimit" Integer 3
    "restartTimer" Integer 60
    //"startState" Integer 1
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=9,PlugInUnit=1"
    identity "4"
    moType Program
    exception none
    nrOfAttributes 9
    "ProgramId" String "4"
    "heapSize" Integer 0
    "loadModule" Ref "null"
    "operationalState" Integer 0
    "poolSize" Integer 0
    "restartCounterLimit" Integer 3
    "restartTimer" Integer 60
    //"startState" Integer 1
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=9,PlugInUnit=1"
    identity "5"
    moType Program
    exception none
    nrOfAttributes 9
    "ProgramId" String "5"
    "heapSize" Integer 0
    "loadModule" Ref "null"
    "operationalState" Integer 0
    "poolSize" Integer 0
    "restartCounterLimit" Integer 3
    "restartTimer" Integer 60
    //"startState" Integer 1
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=10,PlugInUnit=1"
    identity "1"
    moType Program
    exception none
    nrOfAttributes 9
    "ProgramId" String "1"
    "heapSize" Integer 0
    "loadModule" Ref "null"
    "operationalState" Integer 0
    "poolSize" Integer 0
    "restartCounterLimit" Integer 3
    "restartTimer" Integer 60
    //"startState" Integer 1
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=10,PlugInUnit=1"
    identity "2"
    moType Program
    exception none
    nrOfAttributes 9
    "ProgramId" String "2"
    "heapSize" Integer 0
    "loadModule" Ref "null"
    "operationalState" Integer 0
    "poolSize" Integer 0
    "restartCounterLimit" Integer 3
    "restartTimer" Integer 60
    //"startState" Integer 1
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=10,PlugInUnit=1"
    identity "3"
    moType Program
    exception none
    nrOfAttributes 9
    "ProgramId" String "3"
    "heapSize" Integer 0
    "loadModule" Ref "null"
    "operationalState" Integer 0
    "poolSize" Integer 0
    "restartCounterLimit" Integer 3
    "restartTimer" Integer 60
    //"startState" Integer 1
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=10,PlugInUnit=1"
    identity "4"
    moType Program
    exception none
    nrOfAttributes 9
    "ProgramId" String "4"
    "heapSize" Integer 0
    "loadModule" Ref "null"
    "operationalState" Integer 0
    "poolSize" Integer 0
    "restartCounterLimit" Integer 3
    "restartTimer" Integer 60
    //"startState" Integer 1
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=10,PlugInUnit=1"
    identity "5"
    moType Program
    exception none
    nrOfAttributes 9
    "ProgramId" String "5"
    "heapSize" Integer 0
    "loadModule" Ref "null"
    "operationalState" Integer 0
    "poolSize" Integer 0
    "restartCounterLimit" Integer 3
    "restartTimer" Integer 60
    //"startState" Integer 1
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=11,PlugInUnit=1"
    identity "1"
    moType Program
    exception none
    nrOfAttributes 9
    "ProgramId" String "1"
    "heapSize" Integer 0
    "loadModule" Ref "null"
    "operationalState" Integer 0
    "poolSize" Integer 0
    "restartCounterLimit" Integer 3
    "restartTimer" Integer 60
    //"startState" Integer 1
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=11,PlugInUnit=1"
    identity "2"
    moType Program
    exception none
    nrOfAttributes 9
    "ProgramId" String "2"
    "heapSize" Integer 0
    "loadModule" Ref "null"
    "operationalState" Integer 0
    "poolSize" Integer 0
    "restartCounterLimit" Integer 3
    "restartTimer" Integer 60
    //"startState" Integer 1
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=11,PlugInUnit=1"
    identity "3"
    moType Program
    exception none
    nrOfAttributes 9
    "ProgramId" String "3"
    "heapSize" Integer 0
    "loadModule" Ref "null"
    "operationalState" Integer 0
    "poolSize" Integer 0
    "restartCounterLimit" Integer 3
    "restartTimer" Integer 60
    //"startState" Integer 1
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=11,PlugInUnit=1"
    identity "4"
    moType Program
    exception none
    nrOfAttributes 9
    "ProgramId" String "4"
    "heapSize" Integer 0
    "loadModule" Ref "null"
    "operationalState" Integer 0
    "poolSize" Integer 0
    "restartCounterLimit" Integer 3
    "restartTimer" Integer 60
    //"startState" Integer 1
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=11,PlugInUnit=1"
    identity "5"
    moType Program
    exception none
    nrOfAttributes 9
    "ProgramId" String "5"
    "heapSize" Integer 0
    "loadModule" Ref "null"
    "operationalState" Integer 0
    "poolSize" Integer 0
    "restartCounterLimit" Integer 3
    "restartTimer" Integer 60
    //"startState" Integer 1
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=20,PlugInUnit=1"
    identity "50"
    moType Program
    exception none
    nrOfAttributes 9
    "ProgramId" String "50"
    "heapSize" Integer 0
    "loadModule" Ref "null"
    "operationalState" Integer 0
    "poolSize" Integer 0
    "restartCounterLimit" Integer 3
    "restartTimer" Integer 60
    //"startState" Integer 1
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=20,PlugInUnit=1"
    identity "151"
    moType Program
    exception none
    nrOfAttributes 9
    "ProgramId" String "151"
    "heapSize" Integer 0
    "loadModule" Ref "null"
    "operationalState" Integer 0
    "poolSize" Integer 0
    "restartCounterLimit" Integer 3
    "restartTimer" Integer 60
    //"startState" Integer 1
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=26,PlugInUnit=1"
    identity "1"
    moType Program
    exception none
    nrOfAttributes 9
    "ProgramId" String "1"
    "heapSize" Integer 0
    "loadModule" Ref "null"
    "operationalState" Integer 0
    "poolSize" Integer 0
    "restartCounterLimit" Integer 3
    "restartTimer" Integer 60
    //"startState" Integer 1
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=26,PlugInUnit=1"
    identity "2"
    moType Program
    exception none
    nrOfAttributes 9
    "ProgramId" String "2"
    "heapSize" Integer 0
    "loadModule" Ref "null"
    "operationalState" Integer 0
    "poolSize" Integer 0
    "restartCounterLimit" Integer 3
    "restartTimer" Integer 60
    //"startState" Integer 1
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=26,PlugInUnit=1"
    identity "6"
    moType Program
    exception none
    nrOfAttributes 9
    "ProgramId" String "6"
    "heapSize" Integer 0
    "loadModule" Ref "null"
    "operationalState" Integer 0
    "poolSize" Integer 0
    "restartCounterLimit" Integer 3
    "restartTimer" Integer 60
    //"startState" Integer 1
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=26,PlugInUnit=1"
    identity "7"
    moType Program
    exception none
    nrOfAttributes 9
    "ProgramId" String "7"
    "heapSize" Integer 0
    "loadModule" Ref "null"
    "operationalState" Integer 0
    "poolSize" Integer 0
    "restartCounterLimit" Integer 3
    "restartTimer" Integer 60
    //"startState" Integer 1
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=26,PlugInUnit=1"
    identity "1"
    moType TxDeviceGroup
    exception none
    nrOfAttributes 10
    "TxDeviceGroupId" String "1"
    //"alarmStatus" Integer 0
    "availabilityStatus" Integer 0
    "bbBusState" Integer 3
    "hwTestResult" Integer 3
    //"loadHs" Boolean false
    "operationalState" Integer 0
    //"tpcMode" Integer 0
    "usageState" Integer 0
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=26,PlugInUnit=1,TxDeviceGroup=1"
    identity "1"
    moType HsDbchDeviceSet
    exception none
    nrOfAttributes 6
    "HsDbchDeviceSetId" String "1"
    //"alarmStatus" Integer 0
    "availabilityStatus" Integer 0
    "operationalState" Integer 0
    "usageState" Integer 0
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=26,PlugInUnit=1,TxDeviceGroup=1"
    identity "1"
    moType DbchDeviceSet
    exception none
    nrOfAttributes 7
    "DbchDeviceSetId" String "1"
    //"alarmStatus" Integer 0
    "availabilityStatus" Integer 0
    "operationalState" Integer 0
    "reservedBy" Array Ref 0
    "usageState" Integer 0
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=26,PlugInUnit=1,TxDeviceGroup=1"
    identity "1"
    moType DbccDeviceSet
    exception none
    nrOfAttributes 6
    "DbccDeviceSetId" String "1"
    //"alarmStatus" Integer 0
    "availabilityStatus" Integer 0
    "operationalState" Integer 0
    "usageState" Integer 0
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=26,PlugInUnit=1,TxDeviceGroup=1,DbccDeviceSet=1"
    identity "1"
    moType DbccDevice
    exception none
    nrOfAttributes 7
    "DbccDeviceId" String "1"
    //"alarmStatus" Integer 0
    "availabilityStatus" Integer 0
    "operationalState" Integer 0
    "reservedBy" Array Ref 0
    "usageState" Integer 0
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=26,PlugInUnit=1,TxDeviceGroup=1,DbccDeviceSet=1"
    identity "2"
    moType DbccDevice
    exception none
    nrOfAttributes 7
    "DbccDeviceId" String "2"
    //"alarmStatus" Integer 0
    "availabilityStatus" Integer 0
    "operationalState" Integer 0
    "reservedBy" Array Ref 0
    "usageState" Integer 0
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=26,PlugInUnit=1,TxDeviceGroup=1,DbccDeviceSet=1"
    identity "3"
    moType DbccDevice
    exception none
    nrOfAttributes 7
    "DbccDeviceId" String "3"
    //"alarmStatus" Integer 0
    "availabilityStatus" Integer 0
    "operationalState" Integer 0
    "reservedBy" Array Ref 0
    "usageState" Integer 0
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=26,PlugInUnit=1,TxDeviceGroup=1,DbccDeviceSet=1"
    identity "4"
    moType DbccDevice
    exception none
    nrOfAttributes 7
    "DbccDeviceId" String "4"
    //"alarmStatus" Integer 0
    "availabilityStatus" Integer 0
    "operationalState" Integer 0
    "reservedBy" Array Ref 0
    "usageState" Integer 0
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=26,PlugInUnit=1,TxDeviceGroup=1,DbccDeviceSet=1"
    identity "5"
    moType DbccDevice
    exception none
    nrOfAttributes 7
    "DbccDeviceId" String "5"
    //"alarmStatus" Integer 0
    "availabilityStatus" Integer 0
    "operationalState" Integer 0
    "reservedBy" Array Ref 0
    "usageState" Integer 0
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=26,PlugInUnit=1,TxDeviceGroup=1,DbccDeviceSet=1"
    identity "6"
    moType DbccDevice
    exception none
    nrOfAttributes 7
    "DbccDeviceId" String "6"
    //"alarmStatus" Integer 0
    "availabilityStatus" Integer 0
    "operationalState" Integer 0
    "reservedBy" Array Ref 0
    "usageState" Integer 0
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=26,PlugInUnit=1,TxDeviceGroup=1,DbccDeviceSet=1"
    identity "7"
    moType DbccDevice
    exception none
    nrOfAttributes 7
    "DbccDeviceId" String "7"
    //"alarmStatus" Integer 0
    "availabilityStatus" Integer 0
    "operationalState" Integer 0
    "reservedBy" Array Ref 0
    "usageState" Integer 0
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=26,PlugInUnit=1,TxDeviceGroup=1,DbccDeviceSet=1"
    identity "8"
    moType DbccDevice
    exception none
    nrOfAttributes 7
    "DbccDeviceId" String "8"
    //"alarmStatus" Integer 0
    "availabilityStatus" Integer 0
    "operationalState" Integer 0
    "reservedBy" Array Ref 0
    "usageState" Integer 0
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=26,PlugInUnit=1,TxDeviceGroup=1,DbccDeviceSet=1"
    identity "9"
    moType DbccDevice
    exception none
    nrOfAttributes 7
    "DbccDeviceId" String "9"
    //"alarmStatus" Integer 0
    "availabilityStatus" Integer 0
    "operationalState" Integer 0
    "reservedBy" Array Ref 0
    "usageState" Integer 0
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=26,PlugInUnit=1,TxDeviceGroup=1,DbccDeviceSet=1"
    identity "10"
    moType DbccDevice
    exception none
    nrOfAttributes 7
    "DbccDeviceId" String "10"
    //"alarmStatus" Integer 0
    "availabilityStatus" Integer 0
    "operationalState" Integer 0
    "reservedBy" Array Ref 0
    "usageState" Integer 0
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=26,PlugInUnit=1,TxDeviceGroup=1,DbccDeviceSet=1"
    identity "11"
    moType DbccDevice
    exception none
    nrOfAttributes 7
    "DbccDeviceId" String "11"
    //"alarmStatus" Integer 0
    "availabilityStatus" Integer 0
    "operationalState" Integer 0
    "reservedBy" Array Ref 0
    "usageState" Integer 0
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=26,PlugInUnit=1,TxDeviceGroup=1,DbccDeviceSet=1"
    identity "12"
    moType DbccDevice
    exception none
    nrOfAttributes 7
    "DbccDeviceId" String "12"
    //"alarmStatus" Integer 0
    "availabilityStatus" Integer 0
    "operationalState" Integer 0
    "reservedBy" Array Ref 0
    "usageState" Integer 0
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=8,PlugInUnit=1"
    identity "1"
    moType RaxDeviceGroup
    exception none
    nrOfAttributes 7
    "RaxDeviceGroupId" String "1"
    //"alarmStatus" Integer 0
    "availabilityStatus" Integer 0
    "hwTestResult" Integer 3
    "operationalState" Integer 0
    "usageState" Integer 0
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=8,PlugInUnit=1,RaxDeviceGroup=1"
    identity "1"
    moType UbchDeviceSet
    exception none
    nrOfAttributes 7
    "UbchDeviceSetId" String "1"
    //"alarmStatus" Integer 0
    "availabilityStatus" Integer 0
    "operationalState" Integer 0
    "reservedBy" Array Ref 0
    "usageState" Integer 0
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=9,PlugInUnit=1"
    identity "1"
    moType RaxDeviceGroup
    exception none
    nrOfAttributes 7
    "RaxDeviceGroupId" String "1"
    //"alarmStatus" Integer 0
    "availabilityStatus" Integer 0
    "hwTestResult" Integer 3
    "operationalState" Integer 0
    "usageState" Integer 0
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=9,PlugInUnit=1,RaxDeviceGroup=1"
    identity "1"
    moType UbchDeviceSet
    exception none
    nrOfAttributes 7
    "UbchDeviceSetId" String "1"
    //"alarmStatus" Integer 0
    "availabilityStatus" Integer 0
    "operationalState" Integer 0
    "reservedBy" Array Ref 0
    "usageState" Integer 0
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=10,PlugInUnit=1"
    identity "1"
    moType RaxDeviceGroup
    exception none
    nrOfAttributes 7
    "RaxDeviceGroupId" String "1"
    //"alarmStatus" Integer 0
    "availabilityStatus" Integer 0
    "hwTestResult" Integer 3
    "operationalState" Integer 0
    "usageState" Integer 0
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=10,PlugInUnit=1,RaxDeviceGroup=1"
    identity "1"
    moType UbchDeviceSet
    exception none
    nrOfAttributes 7
    "UbchDeviceSetId" String "1"
    //"alarmStatus" Integer 0
    "availabilityStatus" Integer 0
    "operationalState" Integer 0
    "reservedBy" Array Ref 0
    "usageState" Integer 0
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=11,PlugInUnit=1"
    identity "1"
    moType RaxDeviceGroup
    exception none
    nrOfAttributes 7
    "RaxDeviceGroupId" String "1"
    //"alarmStatus" Integer 0
    "availabilityStatus" Integer 0
    "hwTestResult" Integer 3
    "operationalState" Integer 0
    "usageState" Integer 0
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=11,PlugInUnit=1,RaxDeviceGroup=1"
    identity "1"
    moType UbchDeviceSet
    exception none
    nrOfAttributes 7
    "UbchDeviceSetId" String "1"
    //"alarmStatus" Integer 0
    "availabilityStatus" Integer 0
    "operationalState" Integer 0
    "reservedBy" Array Ref 0
    "usageState" Integer 0
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=26,PlugInUnit=1,TxDeviceGroup=1"
    identity "1"
    moType DpProgram
    exception none
    nrOfAttributes 4
    "DpProgramId" String "1"
    "loadModule" Ref "null"
    //"startState" Integer 1
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=8,PlugInUnit=1,RaxDeviceGroup=1"
    identity "1"
    moType DpProgram
    exception none
    nrOfAttributes 4
    "DpProgramId" String "1"
    "loadModule" Ref "null"
    //"startState" Integer 1
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=9,PlugInUnit=1,RaxDeviceGroup=1"
    identity "1"
    moType DpProgram
    exception none
    nrOfAttributes 4
    "DpProgramId" String "1"
    "loadModule" Ref "null"
    //"startState" Integer 1
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=10,PlugInUnit=1,RaxDeviceGroup=1"
    identity "1"
    moType DpProgram
    exception none
    nrOfAttributes 4
    "DpProgramId" String "1"
    "loadModule" Ref "null"
    //"startState" Integer 1
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=11,PlugInUnit=1,RaxDeviceGroup=1"
    identity "1"
    moType DpProgram
    exception none
    nrOfAttributes 4
    "DpProgramId" String "1"
    "loadModule" Ref "null"
    //"startState" Integer 1
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=5,PlugInUnit=1"
    identity "1"
    moType TuDeviceGroup
    exception none
    nrOfAttributes 7
    "TuDeviceGroupId" String "1"
    //"alarmStatus" Integer 0
    "availabilityStatus" Integer 0
    "hwTestResult" Integer 3
    "operationalState" Integer 0
    "usageState" Integer 0
    //"userLabel" String ""
)





CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=2,PlugInUnit=1,ExchangeTerminal=1,E1PhysPathTerm=pp1"
    identity "1"
    moType Ds0Bundle
    exception none
    nrOfAttributes 7
    "Ds0BundleId" String "1"
    "availabilityStatus" Integer 0
    "listOfTimeSlots" Array Integer 0
    "operationalState" Integer 0
 //   "reservedBy" Array Ref 0
    "tdmMode" Boolean true
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=11,PlugInUnit=1"
    identity "1"
    moType TxDeviceGroup
    exception none
    nrOfAttributes 10
    "TxDeviceGroupId" String "1"
    //"alarmStatus" Integer 0
    "availabilityStatus" Integer 0
    "bbBusState" Integer 3
    "hwTestResult" Integer 3
    //"loadHs" Boolean false
    "operationalState" Integer 0
    //"tpcMode" Integer 0
    "usageState" Integer 0
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=11,PlugInUnit=1,TxDeviceGroup=1"
    identity "1"
    moType HsDbchDeviceSet
    exception none
    nrOfAttributes 6
    "HsDbchDeviceSetId" String "1"
    //"alarmStatus" Integer 0
    "availabilityStatus" Integer 0
    "operationalState" Integer 0
    "usageState" Integer 0
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=11,PlugInUnit=1,TxDeviceGroup=1"
    identity "1"
    moType DbchDeviceSet
    exception none
    nrOfAttributes 7
    "DbchDeviceSetId" String "1"
    //"alarmStatus" Integer 0
    "availabilityStatus" Integer 0
    "operationalState" Integer 0
    "reservedBy" Array Ref 0
    "usageState" Integer 0
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=11,PlugInUnit=1,TxDeviceGroup=1"
    identity "1"
    moType DbccDeviceSet
    exception none
    nrOfAttributes 6
    "DbccDeviceSetId" String "1"
    //"alarmStatus" Integer 0
    "availabilityStatus" Integer 0
    "operationalState" Integer 0
    "usageState" Integer 0
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=11,PlugInUnit=1,TxDeviceGroup=1,DbccDeviceSet=1"
    identity "1"
    moType DbccDevice
    exception none
    nrOfAttributes 7
    "DbccDeviceId" String "1"
    //"alarmStatus" Integer 0
    "availabilityStatus" Integer 0
    "operationalState" Integer 0
    "reservedBy" Array Ref 0
    "usageState" Integer 0
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=11,PlugInUnit=1,TxDeviceGroup=1,DbccDeviceSet=1"
    identity "2"
    moType DbccDevice
    exception none
    nrOfAttributes 7
    "DbccDeviceId" String "2"
    //"alarmStatus" Integer 0
    "availabilityStatus" Integer 0
    "operationalState" Integer 0
    "reservedBy" Array Ref 0
    "usageState" Integer 0
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=11,PlugInUnit=1,TxDeviceGroup=1,DbccDeviceSet=1"
    identity "3"
    moType DbccDevice
    exception none
    nrOfAttributes 7
    "DbccDeviceId" String "3"
    //"alarmStatus" Integer 0
    "availabilityStatus" Integer 0
    "operationalState" Integer 0
    "reservedBy" Array Ref 0
    "usageState" Integer 0
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=11,PlugInUnit=1,TxDeviceGroup=1,DbccDeviceSet=1"
    identity "4"
    moType DbccDevice
    exception none
    nrOfAttributes 7
    "DbccDeviceId" String "4"
    //"alarmStatus" Integer 0
    "availabilityStatus" Integer 0
    "operationalState" Integer 0
    "reservedBy" Array Ref 0
    "usageState" Integer 0
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=11,PlugInUnit=1,TxDeviceGroup=1,DbccDeviceSet=1"
    identity "5"
    moType DbccDevice
    exception none
    nrOfAttributes 7
    "DbccDeviceId" String "5"
    //"alarmStatus" Integer 0
    "availabilityStatus" Integer 0
    "operationalState" Integer 0
    "reservedBy" Array Ref 0
    "usageState" Integer 0
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=11,PlugInUnit=1,TxDeviceGroup=1,DbccDeviceSet=1"
    identity "6"
    moType DbccDevice
    exception none
    nrOfAttributes 7
    "DbccDeviceId" String "6"
    //"alarmStatus" Integer 0
    "availabilityStatus" Integer 0
    "operationalState" Integer 0
    "reservedBy" Array Ref 0
    "usageState" Integer 0
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=11,PlugInUnit=1,TxDeviceGroup=1,DbccDeviceSet=1"
    identity "7"
    moType DbccDevice
    exception none
    nrOfAttributes 7
    "DbccDeviceId" String "7"
    //"alarmStatus" Integer 0
    "availabilityStatus" Integer 0
    "operationalState" Integer 0
    "reservedBy" Array Ref 0
    "usageState" Integer 0
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=11,PlugInUnit=1,TxDeviceGroup=1,DbccDeviceSet=1"
    identity "8"
    moType DbccDevice
    exception none
    nrOfAttributes 7
    "DbccDeviceId" String "8"
    //"alarmStatus" Integer 0
    "availabilityStatus" Integer 0
    "operationalState" Integer 0
    "reservedBy" Array Ref 0
    "usageState" Integer 0
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=11,PlugInUnit=1,TxDeviceGroup=1,DbccDeviceSet=1"
    identity "9"
    moType DbccDevice
    exception none
    nrOfAttributes 7
    "DbccDeviceId" String "9"
    //"alarmStatus" Integer 0
    "availabilityStatus" Integer 0
    "operationalState" Integer 0
    "reservedBy" Array Ref 0
    "usageState" Integer 0
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=11,PlugInUnit=1,TxDeviceGroup=1,DbccDeviceSet=1"
    identity "10"
    moType DbccDevice
    exception none
    nrOfAttributes 7
    "DbccDeviceId" String "10"
    //"alarmStatus" Integer 0
    "availabilityStatus" Integer 0
    "operationalState" Integer 0
    "reservedBy" Array Ref 0
    "usageState" Integer 0
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=11,PlugInUnit=1,TxDeviceGroup=1,DbccDeviceSet=1"
    identity "11"
    moType DbccDevice
    exception none
    nrOfAttributes 7
    "DbccDeviceId" String "11"
    //"alarmStatus" Integer 0
    "availabilityStatus" Integer 0
    "operationalState" Integer 0
    "reservedBy" Array Ref 0
    "usageState" Integer 0
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=11,PlugInUnit=1,TxDeviceGroup=1,DbccDeviceSet=1"
    identity "12"
    moType DbccDevice
    exception none
    nrOfAttributes 7
    "DbccDeviceId" String "12"
    //"alarmStatus" Integer 0
    "availabilityStatus" Integer 0
    "operationalState" Integer 0
    "reservedBy" Array Ref 0
    "usageState" Integer 0
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=12,PlugInUnit=1"
    identity "1"
    moType TxDeviceGroup
    exception none
    nrOfAttributes 10
    "TxDeviceGroupId" String "1"
    //"alarmStatus" Integer 0
    "availabilityStatus" Integer 0
    "bbBusState" Integer 3
    "hwTestResult" Integer 3
    //"loadHs" Boolean false
    "operationalState" Integer 0
    //"tpcMode" Integer 0
    "usageState" Integer 0
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=12,PlugInUnit=1,TxDeviceGroup=1"
    identity "1"
    moType HsDbchDeviceSet
    exception none
    nrOfAttributes 6
    "HsDbchDeviceSetId" String "1"
    //"alarmStatus" Integer 0
    "availabilityStatus" Integer 0
    "operationalState" Integer 0
    "usageState" Integer 0
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=12,PlugInUnit=1,TxDeviceGroup=1"
    identity "1"
    moType DbchDeviceSet
    exception none
    nrOfAttributes 7
    "DbchDeviceSetId" String "1"
    //"alarmStatus" Integer 0
    "availabilityStatus" Integer 0
    "operationalState" Integer 0
    "reservedBy" Array Ref 0
    "usageState" Integer 0
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=12,PlugInUnit=1,TxDeviceGroup=1"
    identity "1"
    moType DbccDeviceSet
    exception none
    nrOfAttributes 6
    "DbccDeviceSetId" String "1"
    //"alarmStatus" Integer 0
    "availabilityStatus" Integer 0
    "operationalState" Integer 0
    "usageState" Integer 0
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=12,PlugInUnit=1,TxDeviceGroup=1,DbccDeviceSet=1"
    identity "1"
    moType DbccDevice
    exception none
    nrOfAttributes 7
    "DbccDeviceId" String "1"
    //"alarmStatus" Integer 0
    "availabilityStatus" Integer 0
    "operationalState" Integer 0
    "reservedBy" Array Ref 0
    "usageState" Integer 0
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=12,PlugInUnit=1,TxDeviceGroup=1,DbccDeviceSet=1"
    identity "2"
    moType DbccDevice
    exception none
    nrOfAttributes 7
    "DbccDeviceId" String "2"
    //"alarmStatus" Integer 0
    "availabilityStatus" Integer 0
    "operationalState" Integer 0
    "reservedBy" Array Ref 0
    "usageState" Integer 0
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=12,PlugInUnit=1,TxDeviceGroup=1,DbccDeviceSet=1"
    identity "3"
    moType DbccDevice
    exception none
    nrOfAttributes 7
    "DbccDeviceId" String "3"
    //"alarmStatus" Integer 0
    "availabilityStatus" Integer 0
    "operationalState" Integer 0
    "reservedBy" Array Ref 0
    "usageState" Integer 0
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=12,PlugInUnit=1,TxDeviceGroup=1,DbccDeviceSet=1"
    identity "4"
    moType DbccDevice
    exception none
    nrOfAttributes 7
    "DbccDeviceId" String "4"
    //"alarmStatus" Integer 0
    "availabilityStatus" Integer 0
    "operationalState" Integer 0
    "reservedBy" Array Ref 0
    "usageState" Integer 0
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=12,PlugInUnit=1,TxDeviceGroup=1,DbccDeviceSet=1"
    identity "5"
    moType DbccDevice
    exception none
    nrOfAttributes 7
    "DbccDeviceId" String "5"
    //"alarmStatus" Integer 0
    "availabilityStatus" Integer 0
    "operationalState" Integer 0
    "reservedBy" Array Ref 0
    "usageState" Integer 0
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=12,PlugInUnit=1,TxDeviceGroup=1,DbccDeviceSet=1"
    identity "6"
    moType DbccDevice
    exception none
    nrOfAttributes 7
    "DbccDeviceId" String "6"
    //"alarmStatus" Integer 0
    "availabilityStatus" Integer 0
    "operationalState" Integer 0
    "reservedBy" Array Ref 0
    "usageState" Integer 0
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=12,PlugInUnit=1,TxDeviceGroup=1,DbccDeviceSet=1"
    identity "7"
    moType DbccDevice
    exception none
    nrOfAttributes 7
    "DbccDeviceId" String "7"
    //"alarmStatus" Integer 0
    "availabilityStatus" Integer 0
    "operationalState" Integer 0
    "reservedBy" Array Ref 0
    "usageState" Integer 0
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=12,PlugInUnit=1,TxDeviceGroup=1,DbccDeviceSet=1"
    identity "8"
    moType DbccDevice
    exception none
    nrOfAttributes 7
    "DbccDeviceId" String "8"
    //"alarmStatus" Integer 0
    "availabilityStatus" Integer 0
    "operationalState" Integer 0
    "reservedBy" Array Ref 0
    "usageState" Integer 0
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=12,PlugInUnit=1,TxDeviceGroup=1,DbccDeviceSet=1"
    identity "9"
    moType DbccDevice
    exception none
    nrOfAttributes 7
    "DbccDeviceId" String "9"
    //"alarmStatus" Integer 0
    "availabilityStatus" Integer 0
    "operationalState" Integer 0
    "reservedBy" Array Ref 0
    "usageState" Integer 0
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=12,PlugInUnit=1,TxDeviceGroup=1,DbccDeviceSet=1"
    identity "10"
    moType DbccDevice
    exception none
    nrOfAttributes 7
    "DbccDeviceId" String "10"
    //"alarmStatus" Integer 0
    "availabilityStatus" Integer 0
    "operationalState" Integer 0
    "reservedBy" Array Ref 0
    "usageState" Integer 0
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=12,PlugInUnit=1,TxDeviceGroup=1,DbccDeviceSet=1"
    identity "11"
    moType DbccDevice
    exception none
    nrOfAttributes 7
    "DbccDeviceId" String "11"
    //"alarmStatus" Integer 0
    "availabilityStatus" Integer 0
    "operationalState" Integer 0
    "reservedBy" Array Ref 0
    "usageState" Integer 0
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=12,PlugInUnit=1,TxDeviceGroup=1,DbccDeviceSet=1"
    identity "12"
    moType DbccDevice
    exception none
    nrOfAttributes 7
    "DbccDeviceId" String "12"
    //"alarmStatus" Integer 0
    "availabilityStatus" Integer 0
    "operationalState" Integer 0
    "reservedBy" Array Ref 0
    "usageState" Integer 0
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=13,PlugInUnit=1"
    identity "1"
    moType TxDeviceGroup
    exception none
    nrOfAttributes 10
    "TxDeviceGroupId" String "1"
    //"alarmStatus" Integer 0
    "availabilityStatus" Integer 0
    "bbBusState" Integer 3
    "hwTestResult" Integer 3
    //"loadHs" Boolean false
    "operationalState" Integer 0
    //"tpcMode" Integer 0
    "usageState" Integer 0
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=13,PlugInUnit=1,TxDeviceGroup=1"
    identity "1"
    moType HsDbchDeviceSet
    exception none
    nrOfAttributes 6
    "HsDbchDeviceSetId" String "1"
    //"alarmStatus" Integer 0
    "availabilityStatus" Integer 0
    "operationalState" Integer 0
    "usageState" Integer 0
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=13,PlugInUnit=1,TxDeviceGroup=1"
    identity "1"
    moType DbchDeviceSet
    exception none
    nrOfAttributes 7
    "DbchDeviceSetId" String "1"
    //"alarmStatus" Integer 0
    "availabilityStatus" Integer 0
    "operationalState" Integer 0
    "reservedBy" Array Ref 0
    "usageState" Integer 0
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=13,PlugInUnit=1,TxDeviceGroup=1"
    identity "1"
    moType DbccDeviceSet
    exception none
    nrOfAttributes 6
    "DbccDeviceSetId" String "1"
    //"alarmStatus" Integer 0
    "availabilityStatus" Integer 0
    "operationalState" Integer 0
    "usageState" Integer 0
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=13,PlugInUnit=1,TxDeviceGroup=1,DbccDeviceSet=1"
    identity "1"
    moType DbccDevice
    exception none
    nrOfAttributes 7
    "DbccDeviceId" String "1"
    //"alarmStatus" Integer 0
    "availabilityStatus" Integer 0
    "operationalState" Integer 0
    "reservedBy" Array Ref 0
    "usageState" Integer 0
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=13,PlugInUnit=1,TxDeviceGroup=1,DbccDeviceSet=1"
    identity "2"
    moType DbccDevice
    exception none
    nrOfAttributes 7
    "DbccDeviceId" String "2"
    //"alarmStatus" Integer 0
    "availabilityStatus" Integer 0
    "operationalState" Integer 0
    "reservedBy" Array Ref 0
    "usageState" Integer 0
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=13,PlugInUnit=1,TxDeviceGroup=1,DbccDeviceSet=1"
    identity "3"
    moType DbccDevice
    exception none
    nrOfAttributes 7
    "DbccDeviceId" String "3"
    //"alarmStatus" Integer 0
    "availabilityStatus" Integer 0
    "operationalState" Integer 0
    "reservedBy" Array Ref 0
    "usageState" Integer 0
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=13,PlugInUnit=1,TxDeviceGroup=1,DbccDeviceSet=1"
    identity "4"
    moType DbccDevice
    exception none
    nrOfAttributes 7
    "DbccDeviceId" String "4"
    //"alarmStatus" Integer 0
    "availabilityStatus" Integer 0
    "operationalState" Integer 0
    "reservedBy" Array Ref 0
    "usageState" Integer 0
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=13,PlugInUnit=1,TxDeviceGroup=1,DbccDeviceSet=1"
    identity "5"
    moType DbccDevice
    exception none
    nrOfAttributes 7
    "DbccDeviceId" String "5"
    //"alarmStatus" Integer 0
    "availabilityStatus" Integer 0
    "operationalState" Integer 0
    "reservedBy" Array Ref 0
    "usageState" Integer 0
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=13,PlugInUnit=1,TxDeviceGroup=1,DbccDeviceSet=1"
    identity "6"
    moType DbccDevice
    exception none
    nrOfAttributes 7
    "DbccDeviceId" String "6"
    //"alarmStatus" Integer 0
    "availabilityStatus" Integer 0
    "operationalState" Integer 0
    "reservedBy" Array Ref 0
    "usageState" Integer 0
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=13,PlugInUnit=1,TxDeviceGroup=1,DbccDeviceSet=1"
    identity "7"
    moType DbccDevice
    exception none
    nrOfAttributes 7
    "DbccDeviceId" String "7"
    //"alarmStatus" Integer 0
    "availabilityStatus" Integer 0
    "operationalState" Integer 0
    "reservedBy" Array Ref 0
    "usageState" Integer 0
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=13,PlugInUnit=1,TxDeviceGroup=1,DbccDeviceSet=1"
    identity "8"
    moType DbccDevice
    exception none
    nrOfAttributes 7
    "DbccDeviceId" String "8"
    //"alarmStatus" Integer 0
    "availabilityStatus" Integer 0
    "operationalState" Integer 0
    "reservedBy" Array Ref 0
    "usageState" Integer 0
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=13,PlugInUnit=1,TxDeviceGroup=1,DbccDeviceSet=1"
    identity "9"
    moType DbccDevice
    exception none
    nrOfAttributes 7
    "DbccDeviceId" String "9"
    //"alarmStatus" Integer 0
    "availabilityStatus" Integer 0
    "operationalState" Integer 0
    "reservedBy" Array Ref 0
    "usageState" Integer 0
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=13,PlugInUnit=1,TxDeviceGroup=1,DbccDeviceSet=1"
    identity "10"
    moType DbccDevice
    exception none
    nrOfAttributes 7
    "DbccDeviceId" String "10"
    //"alarmStatus" Integer 0
    "availabilityStatus" Integer 0
    "operationalState" Integer 0
    "reservedBy" Array Ref 0
    "usageState" Integer 0
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=13,PlugInUnit=1,TxDeviceGroup=1,DbccDeviceSet=1"
    identity "11"
    moType DbccDevice
    exception none
    nrOfAttributes 7
    "DbccDeviceId" String "11"
    //"alarmStatus" Integer 0
    "availabilityStatus" Integer 0
    "operationalState" Integer 0
    "reservedBy" Array Ref 0
    "usageState" Integer 0
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=13,PlugInUnit=1,TxDeviceGroup=1,DbccDeviceSet=1"
    identity "12"
    moType DbccDevice
    exception none
    nrOfAttributes 7
    "DbccDeviceId" String "12"
    //"alarmStatus" Integer 0
    "availabilityStatus" Integer 0
    "operationalState" Integer 0
    "reservedBy" Array Ref 0
    "usageState" Integer 0
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=14,PlugInUnit=1"
    identity "1"
    moType TxDeviceGroup
    exception none
    nrOfAttributes 10
    "TxDeviceGroupId" String "1"
    //"alarmStatus" Integer 0
    "availabilityStatus" Integer 0
    "bbBusState" Integer 3
    "hwTestResult" Integer 3
    //"loadHs" Boolean false
    "operationalState" Integer 0
    //"tpcMode" Integer 0
    "usageState" Integer 0
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=14,PlugInUnit=1,TxDeviceGroup=1"
    identity "1"
    moType HsDbchDeviceSet
    exception none
    nrOfAttributes 6
    "HsDbchDeviceSetId" String "1"
    //"alarmStatus" Integer 0
    "availabilityStatus" Integer 0
    "operationalState" Integer 0
    "usageState" Integer 0
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=14,PlugInUnit=1,TxDeviceGroup=1"
    identity "1"
    moType DbchDeviceSet
    exception none
    nrOfAttributes 7
    "DbchDeviceSetId" String "1"
    //"alarmStatus" Integer 0
    "availabilityStatus" Integer 0
    "operationalState" Integer 0
    "reservedBy" Array Ref 0
    "usageState" Integer 0
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=14,PlugInUnit=1,TxDeviceGroup=1"
    identity "1"
    moType DbccDeviceSet
    exception none
    nrOfAttributes 6
    "DbccDeviceSetId" String "1"
    //"alarmStatus" Integer 0
    "availabilityStatus" Integer 0
    "operationalState" Integer 0
    "usageState" Integer 0
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=14,PlugInUnit=1,TxDeviceGroup=1,DbccDeviceSet=1"
    identity "1"
    moType DbccDevice
    exception none
    nrOfAttributes 7
    "DbccDeviceId" String "1"
    //"alarmStatus" Integer 0
    "availabilityStatus" Integer 0
    "operationalState" Integer 0
    "reservedBy" Array Ref 0
    "usageState" Integer 0
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=14,PlugInUnit=1,TxDeviceGroup=1,DbccDeviceSet=1"
    identity "2"
    moType DbccDevice
    exception none
    nrOfAttributes 7
    "DbccDeviceId" String "2"
    //"alarmStatus" Integer 0
    "availabilityStatus" Integer 0
    "operationalState" Integer 0
    "reservedBy" Array Ref 0
    "usageState" Integer 0
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=14,PlugInUnit=1,TxDeviceGroup=1,DbccDeviceSet=1"
    identity "3"
    moType DbccDevice
    exception none
    nrOfAttributes 7
    "DbccDeviceId" String "3"
    //"alarmStatus" Integer 0
    "availabilityStatus" Integer 0
    "operationalState" Integer 0
    "reservedBy" Array Ref 0
    "usageState" Integer 0
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=14,PlugInUnit=1,TxDeviceGroup=1,DbccDeviceSet=1"
    identity "4"
    moType DbccDevice
    exception none
    nrOfAttributes 7
    "DbccDeviceId" String "4"
    //"alarmStatus" Integer 0
    "availabilityStatus" Integer 0
    "operationalState" Integer 0
    "reservedBy" Array Ref 0
    "usageState" Integer 0
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=14,PlugInUnit=1,TxDeviceGroup=1,DbccDeviceSet=1"
    identity "5"
    moType DbccDevice
    exception none
    nrOfAttributes 7
    "DbccDeviceId" String "5"
    //"alarmStatus" Integer 0
    "availabilityStatus" Integer 0
    "operationalState" Integer 0
    "reservedBy" Array Ref 0
    "usageState" Integer 0
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=14,PlugInUnit=1,TxDeviceGroup=1,DbccDeviceSet=1"
    identity "6"
    moType DbccDevice
    exception none
    nrOfAttributes 7
    "DbccDeviceId" String "6"
    //"alarmStatus" Integer 0
    "availabilityStatus" Integer 0
    "operationalState" Integer 0
    "reservedBy" Array Ref 0
    "usageState" Integer 0
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=14,PlugInUnit=1,TxDeviceGroup=1,DbccDeviceSet=1"
    identity "7"
    moType DbccDevice
    exception none
    nrOfAttributes 7
    "DbccDeviceId" String "7"
    //"alarmStatus" Integer 0
    "availabilityStatus" Integer 0
    "operationalState" Integer 0
    "reservedBy" Array Ref 0
    "usageState" Integer 0
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=14,PlugInUnit=1,TxDeviceGroup=1,DbccDeviceSet=1"
    identity "8"
    moType DbccDevice
    exception none
    nrOfAttributes 7
    "DbccDeviceId" String "8"
    //"alarmStatus" Integer 0
    "availabilityStatus" Integer 0
    "operationalState" Integer 0
    "reservedBy" Array Ref 0
    "usageState" Integer 0
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=14,PlugInUnit=1,TxDeviceGroup=1,DbccDeviceSet=1"
    identity "9"
    moType DbccDevice
    exception none
    nrOfAttributes 7
    "DbccDeviceId" String "9"
    //"alarmStatus" Integer 0
    "availabilityStatus" Integer 0
    "operationalState" Integer 0
    "reservedBy" Array Ref 0
    "usageState" Integer 0
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=14,PlugInUnit=1,TxDeviceGroup=1,DbccDeviceSet=1"
    identity "10"
    moType DbccDevice
    exception none
    nrOfAttributes 7
    "DbccDeviceId" String "10"
    //"alarmStatus" Integer 0
    "availabilityStatus" Integer 0
    "operationalState" Integer 0
    "reservedBy" Array Ref 0
    "usageState" Integer 0
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=14,PlugInUnit=1,TxDeviceGroup=1,DbccDeviceSet=1"
    identity "11"
    moType DbccDevice
    exception none
    nrOfAttributes 7
    "DbccDeviceId" String "11"
    //"alarmStatus" Integer 0
    "availabilityStatus" Integer 0
    "operationalState" Integer 0
    "reservedBy" Array Ref 0
    "usageState" Integer 0
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=14,PlugInUnit=1,TxDeviceGroup=1,DbccDeviceSet=1"
    identity "12"
    moType DbccDevice
    exception none
    nrOfAttributes 7
    "DbccDeviceId" String "12"
    //"alarmStatus" Integer 0
    "availabilityStatus" Integer 0
    "operationalState" Integer 0
    "reservedBy" Array Ref 0
    "usageState" Integer 0
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=15,PlugInUnit=1"
    identity "1"
    moType TxDeviceGroup
    exception none
    nrOfAttributes 10
    "TxDeviceGroupId" String "1"
    //"alarmStatus" Integer 0
    "availabilityStatus" Integer 0
    "bbBusState" Integer 3
    "hwTestResult" Integer 3
    //"loadHs" Boolean false
    "operationalState" Integer 0
    //"tpcMode" Integer 0
    "usageState" Integer 0
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=15,PlugInUnit=1,TxDeviceGroup=1"
    identity "1"
    moType HsDbchDeviceSet
    exception none
    nrOfAttributes 6
    "HsDbchDeviceSetId" String "1"
    //"alarmStatus" Integer 0
    "availabilityStatus" Integer 0
    "operationalState" Integer 0
    "usageState" Integer 0
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=15,PlugInUnit=1,TxDeviceGroup=1"
    identity "1"
    moType DbchDeviceSet
    exception none
    nrOfAttributes 7
    "DbchDeviceSetId" String "1"
    //"alarmStatus" Integer 0
    "availabilityStatus" Integer 0
    "operationalState" Integer 0
    "reservedBy" Array Ref 0
    "usageState" Integer 0
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=15,PlugInUnit=1,TxDeviceGroup=1"
    identity "1"
    moType DbccDeviceSet
    exception none
    nrOfAttributes 6
    "DbccDeviceSetId" String "1"
    //"alarmStatus" Integer 0
    "availabilityStatus" Integer 0
    "operationalState" Integer 0
    "usageState" Integer 0
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=15,PlugInUnit=1,TxDeviceGroup=1,DbccDeviceSet=1"
    identity "1"
    moType DbccDevice
    exception none
    nrOfAttributes 7
    "DbccDeviceId" String "1"
    //"alarmStatus" Integer 0
    "availabilityStatus" Integer 0
    "operationalState" Integer 0
    "reservedBy" Array Ref 0
    "usageState" Integer 0
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=15,PlugInUnit=1,TxDeviceGroup=1,DbccDeviceSet=1"
    identity "2"
    moType DbccDevice
    exception none
    nrOfAttributes 7
    "DbccDeviceId" String "2"
    //"alarmStatus" Integer 0
    "availabilityStatus" Integer 0
    "operationalState" Integer 0
    "reservedBy" Array Ref 0
    "usageState" Integer 0
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=15,PlugInUnit=1,TxDeviceGroup=1,DbccDeviceSet=1"
    identity "3"
    moType DbccDevice
    exception none
    nrOfAttributes 7
    "DbccDeviceId" String "3"
    //"alarmStatus" Integer 0
    "availabilityStatus" Integer 0
    "operationalState" Integer 0
    "reservedBy" Array Ref 0
    "usageState" Integer 0
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=15,PlugInUnit=1,TxDeviceGroup=1,DbccDeviceSet=1"
    identity "4"
    moType DbccDevice
    exception none
    nrOfAttributes 7
    "DbccDeviceId" String "4"
    //"alarmStatus" Integer 0
    "availabilityStatus" Integer 0
    "operationalState" Integer 0
    "reservedBy" Array Ref 0
    "usageState" Integer 0
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=15,PlugInUnit=1,TxDeviceGroup=1,DbccDeviceSet=1"
    identity "5"
    moType DbccDevice
    exception none
    nrOfAttributes 7
    "DbccDeviceId" String "5"
    //"alarmStatus" Integer 0
    "availabilityStatus" Integer 0
    "operationalState" Integer 0
    "reservedBy" Array Ref 0
    "usageState" Integer 0
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=15,PlugInUnit=1,TxDeviceGroup=1,DbccDeviceSet=1"
    identity "6"
    moType DbccDevice
    exception none
    nrOfAttributes 7
    "DbccDeviceId" String "6"
    //"alarmStatus" Integer 0
    "availabilityStatus" Integer 0
    "operationalState" Integer 0
    "reservedBy" Array Ref 0
    "usageState" Integer 0
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=15,PlugInUnit=1,TxDeviceGroup=1,DbccDeviceSet=1"
    identity "7"
    moType DbccDevice
    exception none
    nrOfAttributes 7
    "DbccDeviceId" String "7"
    //"alarmStatus" Integer 0
    "availabilityStatus" Integer 0
    "operationalState" Integer 0
    "reservedBy" Array Ref 0
    "usageState" Integer 0
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=15,PlugInUnit=1,TxDeviceGroup=1,DbccDeviceSet=1"
    identity "8"
    moType DbccDevice
    exception none
    nrOfAttributes 7
    "DbccDeviceId" String "8"
    //"alarmStatus" Integer 0
    "availabilityStatus" Integer 0
    "operationalState" Integer 0
    "reservedBy" Array Ref 0
    "usageState" Integer 0
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=15,PlugInUnit=1,TxDeviceGroup=1,DbccDeviceSet=1"
    identity "9"
    moType DbccDevice
    exception none
    nrOfAttributes 7
    "DbccDeviceId" String "9"
    //"alarmStatus" Integer 0
    "availabilityStatus" Integer 0
    "operationalState" Integer 0
    "reservedBy" Array Ref 0
    "usageState" Integer 0
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=15,PlugInUnit=1,TxDeviceGroup=1,DbccDeviceSet=1"
    identity "10"
    moType DbccDevice
    exception none
    nrOfAttributes 7
    "DbccDeviceId" String "10"
    //"alarmStatus" Integer 0
    "availabilityStatus" Integer 0
    "operationalState" Integer 0
    "reservedBy" Array Ref 0
    "usageState" Integer 0
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=15,PlugInUnit=1,TxDeviceGroup=1,DbccDeviceSet=1"
    identity "11"
    moType DbccDevice
    exception none
    nrOfAttributes 7
    "DbccDeviceId" String "11"
    //"alarmStatus" Integer 0
    "availabilityStatus" Integer 0
    "operationalState" Integer 0
    "reservedBy" Array Ref 0
    "usageState" Integer 0
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=15,PlugInUnit=1,TxDeviceGroup=1,DbccDeviceSet=1"
    identity "12"
    moType DbccDevice
    exception none
    nrOfAttributes 7
    "DbccDeviceId" String "12"
    //"alarmStatus" Integer 0
    "availabilityStatus" Integer 0
    "operationalState" Integer 0
    "reservedBy" Array Ref 0
    "usageState" Integer 0
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=16,PlugInUnit=1"
    identity "1"
    moType TxDeviceGroup
    exception none
    nrOfAttributes 10
    "TxDeviceGroupId" String "1"
    //"alarmStatus" Integer 0
    "availabilityStatus" Integer 0
    "bbBusState" Integer 3
    "hwTestResult" Integer 3
    //"loadHs" Boolean false
    "operationalState" Integer 0
    //"tpcMode" Integer 0
    "usageState" Integer 0
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=16,PlugInUnit=1,TxDeviceGroup=1"
    identity "1"
    moType HsDbchDeviceSet
    exception none
    nrOfAttributes 6
    "HsDbchDeviceSetId" String "1"
    //"alarmStatus" Integer 0
    "availabilityStatus" Integer 0
    "operationalState" Integer 0
    "usageState" Integer 0
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=16,PlugInUnit=1,TxDeviceGroup=1"
    identity "1"
    moType DbchDeviceSet
    exception none
    nrOfAttributes 7
    "DbchDeviceSetId" String "1"
    //"alarmStatus" Integer 0
    "availabilityStatus" Integer 0
    "operationalState" Integer 0
    "reservedBy" Array Ref 0
    "usageState" Integer 0
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=16,PlugInUnit=1,TxDeviceGroup=1"
    identity "1"
    moType DbccDeviceSet
    exception none
    nrOfAttributes 6
    "DbccDeviceSetId" String "1"
    //"alarmStatus" Integer 0
    "availabilityStatus" Integer 0
    "operationalState" Integer 0
    "usageState" Integer 0
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=16,PlugInUnit=1,TxDeviceGroup=1,DbccDeviceSet=1"
    identity "1"
    moType DbccDevice
    exception none
    nrOfAttributes 7
    "DbccDeviceId" String "1"
    //"alarmStatus" Integer 0
    "availabilityStatus" Integer 0
    "operationalState" Integer 0
    "reservedBy" Array Ref 0
    "usageState" Integer 0
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=16,PlugInUnit=1,TxDeviceGroup=1,DbccDeviceSet=1"
    identity "2"
    moType DbccDevice
    exception none
    nrOfAttributes 7
    "DbccDeviceId" String "2"
    //"alarmStatus" Integer 0
    "availabilityStatus" Integer 0
    "operationalState" Integer 0
    "reservedBy" Array Ref 0
    "usageState" Integer 0
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=16,PlugInUnit=1,TxDeviceGroup=1,DbccDeviceSet=1"
    identity "3"
    moType DbccDevice
    exception none
    nrOfAttributes 7
    "DbccDeviceId" String "3"
    //"alarmStatus" Integer 0
    "availabilityStatus" Integer 0
    "operationalState" Integer 0
    "reservedBy" Array Ref 0
    "usageState" Integer 0
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=16,PlugInUnit=1,TxDeviceGroup=1,DbccDeviceSet=1"
    identity "4"
    moType DbccDevice
    exception none
    nrOfAttributes 7
    "DbccDeviceId" String "4"
    //"alarmStatus" Integer 0
    "availabilityStatus" Integer 0
    "operationalState" Integer 0
    "reservedBy" Array Ref 0
    "usageState" Integer 0
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=16,PlugInUnit=1,TxDeviceGroup=1,DbccDeviceSet=1"
    identity "5"
    moType DbccDevice
    exception none
    nrOfAttributes 7
    "DbccDeviceId" String "5"
    //"alarmStatus" Integer 0
    "availabilityStatus" Integer 0
    "operationalState" Integer 0
    "reservedBy" Array Ref 0
    "usageState" Integer 0
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=16,PlugInUnit=1,TxDeviceGroup=1,DbccDeviceSet=1"
    identity "6"
    moType DbccDevice
    exception none
    nrOfAttributes 7
    "DbccDeviceId" String "6"
    //"alarmStatus" Integer 0
    "availabilityStatus" Integer 0
    "operationalState" Integer 0
    "reservedBy" Array Ref 0
    "usageState" Integer 0
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=16,PlugInUnit=1,TxDeviceGroup=1,DbccDeviceSet=1"
    identity "7"
    moType DbccDevice
    exception none
    nrOfAttributes 7
    "DbccDeviceId" String "7"
    //"alarmStatus" Integer 0
    "availabilityStatus" Integer 0
    "operationalState" Integer 0
    "reservedBy" Array Ref 0
    "usageState" Integer 0
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=16,PlugInUnit=1,TxDeviceGroup=1,DbccDeviceSet=1"
    identity "8"
    moType DbccDevice
    exception none
    nrOfAttributes 7
    "DbccDeviceId" String "8"
    //"alarmStatus" Integer 0
    "availabilityStatus" Integer 0
    "operationalState" Integer 0
    "reservedBy" Array Ref 0
    "usageState" Integer 0
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=16,PlugInUnit=1,TxDeviceGroup=1,DbccDeviceSet=1"
    identity "9"
    moType DbccDevice
    exception none
    nrOfAttributes 7
    "DbccDeviceId" String "9"
    //"alarmStatus" Integer 0
    "availabilityStatus" Integer 0
    "operationalState" Integer 0
    "reservedBy" Array Ref 0
    "usageState" Integer 0
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=16,PlugInUnit=1,TxDeviceGroup=1,DbccDeviceSet=1"
    identity "10"
    moType DbccDevice
    exception none
    nrOfAttributes 7
    "DbccDeviceId" String "10"
    //"alarmStatus" Integer 0
    "availabilityStatus" Integer 0
    "operationalState" Integer 0
    "reservedBy" Array Ref 0
    "usageState" Integer 0
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=16,PlugInUnit=1,TxDeviceGroup=1,DbccDeviceSet=1"
    identity "11"
    moType DbccDevice
    exception none
    nrOfAttributes 7
    "DbccDeviceId" String "11"
    //"alarmStatus" Integer 0
    "availabilityStatus" Integer 0
    "operationalState" Integer 0
    "reservedBy" Array Ref 0
    "usageState" Integer 0
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=16,PlugInUnit=1,TxDeviceGroup=1,DbccDeviceSet=1"
    identity "12"
    moType DbccDevice
    exception none
    nrOfAttributes 7
    "DbccDeviceId" String "12"
    //"alarmStatus" Integer 0
    "availabilityStatus" Integer 0
    "operationalState" Integer 0
    "reservedBy" Array Ref 0
    "usageState" Integer 0
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=17,PlugInUnit=1"
    identity "1"
    moType TxDeviceGroup
    exception none
    nrOfAttributes 10
    "TxDeviceGroupId" String "1"
    //"alarmStatus" Integer 0
    "availabilityStatus" Integer 0
    "bbBusState" Integer 3
    "hwTestResult" Integer 3
    //"loadHs" Boolean false
    "operationalState" Integer 0
    //"tpcMode" Integer 0
    "usageState" Integer 0
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=17,PlugInUnit=1,TxDeviceGroup=1"
    identity "1"
    moType HsDbchDeviceSet
    exception none
    nrOfAttributes 6
    "HsDbchDeviceSetId" String "1"
    //"alarmStatus" Integer 0
    "availabilityStatus" Integer 0
    "operationalState" Integer 0
    "usageState" Integer 0
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=17,PlugInUnit=1,TxDeviceGroup=1"
    identity "1"
    moType DbchDeviceSet
    exception none
    nrOfAttributes 7
    "DbchDeviceSetId" String "1"
    //"alarmStatus" Integer 0
    "availabilityStatus" Integer 0
    "operationalState" Integer 0
    "reservedBy" Array Ref 0
    "usageState" Integer 0
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=17,PlugInUnit=1,TxDeviceGroup=1"
    identity "1"
    moType DbccDeviceSet
    exception none
    nrOfAttributes 6
    "DbccDeviceSetId" String "1"
    //"alarmStatus" Integer 0
    "availabilityStatus" Integer 0
    "operationalState" Integer 0
    "usageState" Integer 0
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=17,PlugInUnit=1,TxDeviceGroup=1,DbccDeviceSet=1"
    identity "1"
    moType DbccDevice
    exception none
    nrOfAttributes 7
    "DbccDeviceId" String "1"
    //"alarmStatus" Integer 0
    "availabilityStatus" Integer 0
    "operationalState" Integer 0
    "reservedBy" Array Ref 0
    "usageState" Integer 0
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=17,PlugInUnit=1,TxDeviceGroup=1,DbccDeviceSet=1"
    identity "2"
    moType DbccDevice
    exception none
    nrOfAttributes 7
    "DbccDeviceId" String "2"
    //"alarmStatus" Integer 0
    "availabilityStatus" Integer 0
    "operationalState" Integer 0
    "reservedBy" Array Ref 0
    "usageState" Integer 0
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=17,PlugInUnit=1,TxDeviceGroup=1,DbccDeviceSet=1"
    identity "3"
    moType DbccDevice
    exception none
    nrOfAttributes 7
    "DbccDeviceId" String "3"
    //"alarmStatus" Integer 0
    "availabilityStatus" Integer 0
    "operationalState" Integer 0
    "reservedBy" Array Ref 0
    "usageState" Integer 0
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=17,PlugInUnit=1,TxDeviceGroup=1,DbccDeviceSet=1"
    identity "4"
    moType DbccDevice
    exception none
    nrOfAttributes 7
    "DbccDeviceId" String "4"
    //"alarmStatus" Integer 0
    "availabilityStatus" Integer 0
    "operationalState" Integer 0
    "reservedBy" Array Ref 0
    "usageState" Integer 0
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=17,PlugInUnit=1,TxDeviceGroup=1,DbccDeviceSet=1"
    identity "5"
    moType DbccDevice
    exception none
    nrOfAttributes 7
    "DbccDeviceId" String "5"
    //"alarmStatus" Integer 0
    "availabilityStatus" Integer 0
    "operationalState" Integer 0
    "reservedBy" Array Ref 0
    "usageState" Integer 0
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=17,PlugInUnit=1,TxDeviceGroup=1,DbccDeviceSet=1"
    identity "6"
    moType DbccDevice
    exception none
    nrOfAttributes 7
    "DbccDeviceId" String "6"
    //"alarmStatus" Integer 0
    "availabilityStatus" Integer 0
    "operationalState" Integer 0
    "reservedBy" Array Ref 0
    "usageState" Integer 0
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=17,PlugInUnit=1,TxDeviceGroup=1,DbccDeviceSet=1"
    identity "7"
    moType DbccDevice
    exception none
    nrOfAttributes 7
    "DbccDeviceId" String "7"
    //"alarmStatus" Integer 0
    "availabilityStatus" Integer 0
    "operationalState" Integer 0
    "reservedBy" Array Ref 0
    "usageState" Integer 0
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=17,PlugInUnit=1,TxDeviceGroup=1,DbccDeviceSet=1"
    identity "8"
    moType DbccDevice
    exception none
    nrOfAttributes 7
    "DbccDeviceId" String "8"
    //"alarmStatus" Integer 0
    "availabilityStatus" Integer 0
    "operationalState" Integer 0
    "reservedBy" Array Ref 0
    "usageState" Integer 0
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=17,PlugInUnit=1,TxDeviceGroup=1,DbccDeviceSet=1"
    identity "9"
    moType DbccDevice
    exception none
    nrOfAttributes 7
    "DbccDeviceId" String "9"
    //"alarmStatus" Integer 0
    "availabilityStatus" Integer 0
    "operationalState" Integer 0
    "reservedBy" Array Ref 0
    "usageState" Integer 0
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=17,PlugInUnit=1,TxDeviceGroup=1,DbccDeviceSet=1"
    identity "10"
    moType DbccDevice
    exception none
    nrOfAttributes 7
    "DbccDeviceId" String "10"
    //"alarmStatus" Integer 0
    "availabilityStatus" Integer 0
    "operationalState" Integer 0
    "reservedBy" Array Ref 0
    "usageState" Integer 0
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=17,PlugInUnit=1,TxDeviceGroup=1,DbccDeviceSet=1"
    identity "11"
    moType DbccDevice
    exception none
    nrOfAttributes 7
    "DbccDeviceId" String "11"
    //"alarmStatus" Integer 0
    "availabilityStatus" Integer 0
    "operationalState" Integer 0
    "reservedBy" Array Ref 0
    "usageState" Integer 0
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=17,PlugInUnit=1,TxDeviceGroup=1,DbccDeviceSet=1"
    identity "12"
    moType DbccDevice
    exception none
    nrOfAttributes 7
    "DbccDeviceId" String "12"
    //"alarmStatus" Integer 0
    "availabilityStatus" Integer 0
    "operationalState" Integer 0
    "reservedBy" Array Ref 0
    "usageState" Integer 0
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=18,PlugInUnit=1"
    identity "1"
    moType TxDeviceGroup
    exception none
    nrOfAttributes 10
    "TxDeviceGroupId" String "1"
    //"alarmStatus" Integer 0
    "availabilityStatus" Integer 0
    "bbBusState" Integer 3
    "hwTestResult" Integer 3
    //"loadHs" Boolean false
    "operationalState" Integer 0
    //"tpcMode" Integer 0
    "usageState" Integer 0
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=18,PlugInUnit=1,TxDeviceGroup=1"
    identity "1"
    moType HsDbchDeviceSet
    exception none
    nrOfAttributes 6
    "HsDbchDeviceSetId" String "1"
    //"alarmStatus" Integer 0
    "availabilityStatus" Integer 0
    "operationalState" Integer 0
    "usageState" Integer 0
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=18,PlugInUnit=1,TxDeviceGroup=1"
    identity "1"
    moType DbchDeviceSet
    exception none
    nrOfAttributes 7
    "DbchDeviceSetId" String "1"
    //"alarmStatus" Integer 0
    "availabilityStatus" Integer 0
    "operationalState" Integer 0
    "reservedBy" Array Ref 0
    "usageState" Integer 0
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=18,PlugInUnit=1,TxDeviceGroup=1"
    identity "1"
    moType DbccDeviceSet
    exception none
    nrOfAttributes 6
    "DbccDeviceSetId" String "1"
    //"alarmStatus" Integer 0
    "availabilityStatus" Integer 0
    "operationalState" Integer 0
    "usageState" Integer 0
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=18,PlugInUnit=1,TxDeviceGroup=1,DbccDeviceSet=1"
    identity "1"
    moType DbccDevice
    exception none
    nrOfAttributes 7
    "DbccDeviceId" String "1"
    //"alarmStatus" Integer 0
    "availabilityStatus" Integer 0
    "operationalState" Integer 0
    "reservedBy" Array Ref 0
    "usageState" Integer 0
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=18,PlugInUnit=1,TxDeviceGroup=1,DbccDeviceSet=1"
    identity "2"
    moType DbccDevice
    exception none
    nrOfAttributes 7
    "DbccDeviceId" String "2"
    //"alarmStatus" Integer 0
    "availabilityStatus" Integer 0
    "operationalState" Integer 0
    "reservedBy" Array Ref 0
    "usageState" Integer 0
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=18,PlugInUnit=1,TxDeviceGroup=1,DbccDeviceSet=1"
    identity "3"
    moType DbccDevice
    exception none
    nrOfAttributes 7
    "DbccDeviceId" String "3"
    //"alarmStatus" Integer 0
    "availabilityStatus" Integer 0
    "operationalState" Integer 0
    "reservedBy" Array Ref 0
    "usageState" Integer 0
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=18,PlugInUnit=1,TxDeviceGroup=1,DbccDeviceSet=1"
    identity "4"
    moType DbccDevice
    exception none
    nrOfAttributes 7
    "DbccDeviceId" String "4"
    //"alarmStatus" Integer 0
    "availabilityStatus" Integer 0
    "operationalState" Integer 0
    "reservedBy" Array Ref 0
    "usageState" Integer 0
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=18,PlugInUnit=1,TxDeviceGroup=1,DbccDeviceSet=1"
    identity "5"
    moType DbccDevice
    exception none
    nrOfAttributes 7
    "DbccDeviceId" String "5"
    //"alarmStatus" Integer 0
    "availabilityStatus" Integer 0
    "operationalState" Integer 0
    "reservedBy" Array Ref 0
    "usageState" Integer 0
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=18,PlugInUnit=1,TxDeviceGroup=1,DbccDeviceSet=1"
    identity "6"
    moType DbccDevice
    exception none
    nrOfAttributes 7
    "DbccDeviceId" String "6"
    //"alarmStatus" Integer 0
    "availabilityStatus" Integer 0
    "operationalState" Integer 0
    "reservedBy" Array Ref 0
    "usageState" Integer 0
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=18,PlugInUnit=1,TxDeviceGroup=1,DbccDeviceSet=1"
    identity "7"
    moType DbccDevice
    exception none
    nrOfAttributes 7
    "DbccDeviceId" String "7"
    //"alarmStatus" Integer 0
    "availabilityStatus" Integer 0
    "operationalState" Integer 0
    "reservedBy" Array Ref 0
    "usageState" Integer 0
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=18,PlugInUnit=1,TxDeviceGroup=1,DbccDeviceSet=1"
    identity "8"
    moType DbccDevice
    exception none
    nrOfAttributes 7
    "DbccDeviceId" String "8"
    //"alarmStatus" Integer 0
    "availabilityStatus" Integer 0
    "operationalState" Integer 0
    "reservedBy" Array Ref 0
    "usageState" Integer 0
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=18,PlugInUnit=1,TxDeviceGroup=1,DbccDeviceSet=1"
    identity "9"
    moType DbccDevice
    exception none
    nrOfAttributes 7
    "DbccDeviceId" String "9"
    //"alarmStatus" Integer 0
    "availabilityStatus" Integer 0
    "operationalState" Integer 0
    "reservedBy" Array Ref 0
    "usageState" Integer 0
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=18,PlugInUnit=1,TxDeviceGroup=1,DbccDeviceSet=1"
    identity "10"
    moType DbccDevice
    exception none
    nrOfAttributes 7
    "DbccDeviceId" String "10"
    //"alarmStatus" Integer 0
    "availabilityStatus" Integer 0
    "operationalState" Integer 0
    "reservedBy" Array Ref 0
    "usageState" Integer 0
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=18,PlugInUnit=1,TxDeviceGroup=1,DbccDeviceSet=1"
    identity "11"
    moType DbccDevice
    exception none
    nrOfAttributes 7
    "DbccDeviceId" String "11"
    //"alarmStatus" Integer 0
    "availabilityStatus" Integer 0
    "operationalState" Integer 0
    "reservedBy" Array Ref 0
    "usageState" Integer 0
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=18,PlugInUnit=1,TxDeviceGroup=1,DbccDeviceSet=1"
    identity "12"
    moType DbccDevice
    exception none
    nrOfAttributes 7
    "DbccDeviceId" String "12"
    //"alarmStatus" Integer 0
    "availabilityStatus" Integer 0
    "operationalState" Integer 0
    "reservedBy" Array Ref 0
    "usageState" Integer 0
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=19,PlugInUnit=1"
    identity "1"
    moType TxDeviceGroup
    exception none
    nrOfAttributes 10
    "TxDeviceGroupId" String "1"
    //"alarmStatus" Integer 0
    "availabilityStatus" Integer 0
    "bbBusState" Integer 3
    "hwTestResult" Integer 3
    //"loadHs" Boolean false
    "operationalState" Integer 0
    //"tpcMode" Integer 0
    "usageState" Integer 0
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=19,PlugInUnit=1,TxDeviceGroup=1"
    identity "1"
    moType HsDbchDeviceSet
    exception none
    nrOfAttributes 6
    "HsDbchDeviceSetId" String "1"
    //"alarmStatus" Integer 0
    "availabilityStatus" Integer 0
    "operationalState" Integer 0
    "usageState" Integer 0
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=19,PlugInUnit=1,TxDeviceGroup=1"
    identity "1"
    moType DbchDeviceSet
    exception none
    nrOfAttributes 7
    "DbchDeviceSetId" String "1"
    //"alarmStatus" Integer 0
    "availabilityStatus" Integer 0
    "operationalState" Integer 0
    "reservedBy" Array Ref 0
    "usageState" Integer 0
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=19,PlugInUnit=1,TxDeviceGroup=1"
    identity "1"
    moType DbccDeviceSet
    exception none
    nrOfAttributes 6
    "DbccDeviceSetId" String "1"
    //"alarmStatus" Integer 0
    "availabilityStatus" Integer 0
    "operationalState" Integer 0
    "usageState" Integer 0
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=19,PlugInUnit=1,TxDeviceGroup=1,DbccDeviceSet=1"
    identity "1"
    moType DbccDevice
    exception none
    nrOfAttributes 7
    "DbccDeviceId" String "1"
    //"alarmStatus" Integer 0
    "availabilityStatus" Integer 0
    "operationalState" Integer 0
    "reservedBy" Array Ref 0
    "usageState" Integer 0
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=19,PlugInUnit=1,TxDeviceGroup=1,DbccDeviceSet=1"
    identity "2"
    moType DbccDevice
    exception none
    nrOfAttributes 7
    "DbccDeviceId" String "2"
    //"alarmStatus" Integer 0
    "availabilityStatus" Integer 0
    "operationalState" Integer 0
    "reservedBy" Array Ref 0
    "usageState" Integer 0
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=19,PlugInUnit=1,TxDeviceGroup=1,DbccDeviceSet=1"
    identity "3"
    moType DbccDevice
    exception none
    nrOfAttributes 7
    "DbccDeviceId" String "3"
    //"alarmStatus" Integer 0
    "availabilityStatus" Integer 0
    "operationalState" Integer 0
    "reservedBy" Array Ref 0
    "usageState" Integer 0
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=19,PlugInUnit=1,TxDeviceGroup=1,DbccDeviceSet=1"
    identity "4"
    moType DbccDevice
    exception none
    nrOfAttributes 7
    "DbccDeviceId" String "4"
    //"alarmStatus" Integer 0
    "availabilityStatus" Integer 0
    "operationalState" Integer 0
    "reservedBy" Array Ref 0
    "usageState" Integer 0
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=19,PlugInUnit=1,TxDeviceGroup=1,DbccDeviceSet=1"
    identity "5"
    moType DbccDevice
    exception none
    nrOfAttributes 7
    "DbccDeviceId" String "5"
    //"alarmStatus" Integer 0
    "availabilityStatus" Integer 0
    "operationalState" Integer 0
    "reservedBy" Array Ref 0
    "usageState" Integer 0
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=19,PlugInUnit=1,TxDeviceGroup=1,DbccDeviceSet=1"
    identity "6"
    moType DbccDevice
    exception none
    nrOfAttributes 7
    "DbccDeviceId" String "6"
    //"alarmStatus" Integer 0
    "availabilityStatus" Integer 0
    "operationalState" Integer 0
    "reservedBy" Array Ref 0
    "usageState" Integer 0
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=19,PlugInUnit=1,TxDeviceGroup=1,DbccDeviceSet=1"
    identity "7"
    moType DbccDevice
    exception none
    nrOfAttributes 7
    "DbccDeviceId" String "7"
    //"alarmStatus" Integer 0
    "availabilityStatus" Integer 0
    "operationalState" Integer 0
    "reservedBy" Array Ref 0
    "usageState" Integer 0
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=19,PlugInUnit=1,TxDeviceGroup=1,DbccDeviceSet=1"
    identity "8"
    moType DbccDevice
    exception none
    nrOfAttributes 7
    "DbccDeviceId" String "8"
    //"alarmStatus" Integer 0
    "availabilityStatus" Integer 0
    "operationalState" Integer 0
    "reservedBy" Array Ref 0
    "usageState" Integer 0
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=19,PlugInUnit=1,TxDeviceGroup=1,DbccDeviceSet=1"
    identity "9"
    moType DbccDevice
    exception none
    nrOfAttributes 7
    "DbccDeviceId" String "9"
    //"alarmStatus" Integer 0
    "availabilityStatus" Integer 0
    "operationalState" Integer 0
    "reservedBy" Array Ref 0
    "usageState" Integer 0
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=19,PlugInUnit=1,TxDeviceGroup=1,DbccDeviceSet=1"
    identity "10"
    moType DbccDevice
    exception none
    nrOfAttributes 7
    "DbccDeviceId" String "10"
    //"alarmStatus" Integer 0
    "availabilityStatus" Integer 0
    "operationalState" Integer 0
    "reservedBy" Array Ref 0
    "usageState" Integer 0
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=19,PlugInUnit=1,TxDeviceGroup=1,DbccDeviceSet=1"
    identity "11"
    moType DbccDevice
    exception none
    nrOfAttributes 7
    "DbccDeviceId" String "11"
    //"alarmStatus" Integer 0
    "availabilityStatus" Integer 0
    "operationalState" Integer 0
    "reservedBy" Array Ref 0
    "usageState" Integer 0
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=19,PlugInUnit=1,TxDeviceGroup=1,DbccDeviceSet=1"
    identity "12"
    moType DbccDevice
    exception none
    nrOfAttributes 7
    "DbccDeviceId" String "12"
    //"alarmStatus" Integer 0
    "availabilityStatus" Integer 0
    "operationalState" Integer 0
    "reservedBy" Array Ref 0
    "usageState" Integer 0
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=20,PlugInUnit=1"
    identity "1"
    moType TxDeviceGroup
    exception none
    nrOfAttributes 10
    "TxDeviceGroupId" String "1"
    //"alarmStatus" Integer 0
    "availabilityStatus" Integer 0
    "bbBusState" Integer 3
    "hwTestResult" Integer 3
    //"loadHs" Boolean false
    "operationalState" Integer 0
    //"tpcMode" Integer 0
    "usageState" Integer 0
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=20,PlugInUnit=1,TxDeviceGroup=1"
    identity "1"
    moType HsDbchDeviceSet
    exception none
    nrOfAttributes 6
    "HsDbchDeviceSetId" String "1"
    //"alarmStatus" Integer 0
    "availabilityStatus" Integer 0
    "operationalState" Integer 0
    "usageState" Integer 0
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=20,PlugInUnit=1,TxDeviceGroup=1"
    identity "1"
    moType DbchDeviceSet
    exception none
    nrOfAttributes 7
    "DbchDeviceSetId" String "1"
    //"alarmStatus" Integer 0
    "availabilityStatus" Integer 0
    "operationalState" Integer 0
    "reservedBy" Array Ref 0
    "usageState" Integer 0
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=20,PlugInUnit=1,TxDeviceGroup=1"
    identity "1"
    moType DbccDeviceSet
    exception none
    nrOfAttributes 6
    "DbccDeviceSetId" String "1"
    //"alarmStatus" Integer 0
    "availabilityStatus" Integer 0
    "operationalState" Integer 0
    "usageState" Integer 0
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=20,PlugInUnit=1,TxDeviceGroup=1,DbccDeviceSet=1"
    identity "1"
    moType DbccDevice
    exception none
    nrOfAttributes 7
    "DbccDeviceId" String "1"
    //"alarmStatus" Integer 0
    "availabilityStatus" Integer 0
    "operationalState" Integer 0
    "reservedBy" Array Ref 0
    "usageState" Integer 0
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=20,PlugInUnit=1,TxDeviceGroup=1,DbccDeviceSet=1"
    identity "2"
    moType DbccDevice
    exception none
    nrOfAttributes 7
    "DbccDeviceId" String "2"
    //"alarmStatus" Integer 0
    "availabilityStatus" Integer 0
    "operationalState" Integer 0
    "reservedBy" Array Ref 0
    "usageState" Integer 0
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=20,PlugInUnit=1,TxDeviceGroup=1,DbccDeviceSet=1"
    identity "3"
    moType DbccDevice
    exception none
    nrOfAttributes 7
    "DbccDeviceId" String "3"
    //"alarmStatus" Integer 0
    "availabilityStatus" Integer 0
    "operationalState" Integer 0
    "reservedBy" Array Ref 0
    "usageState" Integer 0
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=20,PlugInUnit=1,TxDeviceGroup=1,DbccDeviceSet=1"
    identity "4"
    moType DbccDevice
    exception none
    nrOfAttributes 7
    "DbccDeviceId" String "4"
    //"alarmStatus" Integer 0
    "availabilityStatus" Integer 0
    "operationalState" Integer 0
    "reservedBy" Array Ref 0
    "usageState" Integer 0
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=20,PlugInUnit=1,TxDeviceGroup=1,DbccDeviceSet=1"
    identity "5"
    moType DbccDevice
    exception none
    nrOfAttributes 7
    "DbccDeviceId" String "5"
    //"alarmStatus" Integer 0
    "availabilityStatus" Integer 0
    "operationalState" Integer 0
    "reservedBy" Array Ref 0
    "usageState" Integer 0
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=20,PlugInUnit=1,TxDeviceGroup=1,DbccDeviceSet=1"
    identity "6"
    moType DbccDevice
    exception none
    nrOfAttributes 7
    "DbccDeviceId" String "6"
    //"alarmStatus" Integer 0
    "availabilityStatus" Integer 0
    "operationalState" Integer 0
    "reservedBy" Array Ref 0
    "usageState" Integer 0
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=20,PlugInUnit=1,TxDeviceGroup=1,DbccDeviceSet=1"
    identity "7"
    moType DbccDevice
    exception none
    nrOfAttributes 7
    "DbccDeviceId" String "7"
    //"alarmStatus" Integer 0
    "availabilityStatus" Integer 0
    "operationalState" Integer 0
    "reservedBy" Array Ref 0
    "usageState" Integer 0
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=20,PlugInUnit=1,TxDeviceGroup=1,DbccDeviceSet=1"
    identity "8"
    moType DbccDevice
    exception none
    nrOfAttributes 7
    "DbccDeviceId" String "8"
    //"alarmStatus" Integer 0
    "availabilityStatus" Integer 0
    "operationalState" Integer 0
    "reservedBy" Array Ref 0
    "usageState" Integer 0
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=20,PlugInUnit=1,TxDeviceGroup=1,DbccDeviceSet=1"
    identity "9"
    moType DbccDevice
    exception none
    nrOfAttributes 7
    "DbccDeviceId" String "9"
    //"alarmStatus" Integer 0
    "availabilityStatus" Integer 0
    "operationalState" Integer 0
    "reservedBy" Array Ref 0
    "usageState" Integer 0
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=20,PlugInUnit=1,TxDeviceGroup=1,DbccDeviceSet=1"
    identity "10"
    moType DbccDevice
    exception none
    nrOfAttributes 7
    "DbccDeviceId" String "10"
    //"alarmStatus" Integer 0
    "availabilityStatus" Integer 0
    "operationalState" Integer 0
    "reservedBy" Array Ref 0
    "usageState" Integer 0
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=20,PlugInUnit=1,TxDeviceGroup=1,DbccDeviceSet=1"
    identity "11"
    moType DbccDevice
    exception none
    nrOfAttributes 7
    "DbccDeviceId" String "11"
    //"alarmStatus" Integer 0
    "availabilityStatus" Integer 0
    "operationalState" Integer 0
    "reservedBy" Array Ref 0
    "usageState" Integer 0
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=20,PlugInUnit=1,TxDeviceGroup=1,DbccDeviceSet=1"
    identity "12"
    moType DbccDevice
    exception none
    nrOfAttributes 7
    "DbccDeviceId" String "12"
    //"alarmStatus" Integer 0
    "availabilityStatus" Integer 0
    "operationalState" Integer 0
    "reservedBy" Array Ref 0
    "usageState" Integer 0
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1"
    identity "1"
    moType AuxPlugInUnit
    exception none
    nrOfAttributes 20
    "AuxPlugInUnitId" String "1"
    "administrativeState" Integer 1
    //"alarmStatus" Integer 0
    "auType" Integer 1
    "availabilityStatus" Integer 0
    "greenLed" Integer 1
    "operationalState" Integer 0
    "piuType" Ref "null"
    "plugInUnitRef1" Ref "null"
    "plugInUnitRef2" Ref "null"
    "productName" String ""
    "productNumber" String ""
    "productRevision" String ""
    "productType" String "HW"
    "productionDate" String ""
    "redLed" Integer 1
    "reservedBy" Array Ref 0
    "serialNumber" String ""
    //"userLabel" String ""
    "yellowLed" Integer 1
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,AuxPlugInUnit=1"
    identity "1"
    moType RetuDeviceGroup
    exception none
    nrOfAttributes 7
    "RetuDeviceGroupId" String "1"
    //"alarmStatus" Integer 0
    "availabilityStatus" Integer 0
    "hwTestResult" Integer 3
    "operationalState" Integer 0
    "usageState" Integer 0
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,AuxPlugInUnit=1,RetuDeviceGroup=1"
    identity "1"
    moType RetDeviceSet
    exception none
    nrOfAttributes 8
    "RetDeviceSetId" String "1"
    //"alarmStatus" Integer 0
    "availabilityStatus" Integer 0
    "operationalState" Integer 0
    "productNumber" String ""
    "retType" Integer 0
    "revState" String ""
    //"userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,AuxPlugInUnit=1,RetuDeviceGroup=1,RetDeviceSet=1"
    identity "1"
    moType RetDevice
    exception none
    nrOfAttributes 10
    "RetDeviceId" String "1"
    //"alarmStatus" Integer 0
    "availabilityStatus" Integer 0
    "electricalAntennaTilt" Integer 0
    "maxTilt" Integer -1
    "minTilt" Integer -1
    "operationalState" Integer 0
    "reservedBy" Array Ref 0
    "usageState" Integer 0
    //"userLabel" String ""
)

SET
(
    mo "ManagedElement=1,Equipment=1,Subrack=1,Slot=4,PlugInUnit=1,TuDeviceGroup=1,TimDeviceSet=1,TimDevice=1"
    exception none
    nrOfAttributes 1
    "reservedBy" Array Ref 1
        "ManagedElement=1,NodeBFunction=1,Iub=1,NodeSynchTp=1"
)

SET
(
    mo "ManagedElement=1,Equipment=1,Subrack=1,Slot=11,PlugInUnit=1,RaxDeviceGroup=1,DpProgram=1"
    exception none
    nrOfAttributes 1
    "loadModule" Ref "ManagedElement=1,SwManagement=1,LoadModule=raxDp"
)

SET
(
    mo "ManagedElement=1,Equipment=1,Subrack=1,Slot=10,PlugInUnit=1,RaxDeviceGroup=1,DpProgram=1"
    exception none
    nrOfAttributes 1
    "loadModule" Ref "ManagedElement=1,SwManagement=1,LoadModule=raxDp"
)

SET
(
    mo "ManagedElement=1,Equipment=1,Subrack=1,Slot=9,PlugInUnit=1,RaxDeviceGroup=1,DpProgram=1"
    exception none
    nrOfAttributes 1
    "loadModule" Ref "ManagedElement=1,SwManagement=1,LoadModule=raxDp"
)

SET
(
    mo "ManagedElement=1,Equipment=1,Subrack=1,Slot=8,PlugInUnit=1,RaxDeviceGroup=1,DpProgram=1"
    exception none
    nrOfAttributes 1
    "loadModule" Ref "ManagedElement=1,SwManagement=1,LoadModule=raxDp"
)

SET
(
    mo "ManagedElement=1,Equipment=1,Subrack=1,Slot=26,PlugInUnit=1,TxDeviceGroup=1,DpProgram=1"
    exception none
    nrOfAttributes 1
    "loadModule" Ref "ManagedElement=1,SwManagement=1,LoadModule=txDp"
)

SET
(
    mo "ManagedElement=1,Equipment=1,Subrack=1,Slot=26,PlugInUnit=1,Program=7"
    exception none
    nrOfAttributes 1
    "loadModule" Ref "ManagedElement=1,SwManagement=1,LoadModule=DbmFpgaLoader"
)

SET
(
    mo "ManagedElement=1,Equipment=1,Subrack=1,Slot=26,PlugInUnit=1,Program=6"
    exception none
    nrOfAttributes 1
    "loadModule" Ref "ManagedElement=1,SwManagement=1,LoadModule=tx"
)

SET
(
    mo "ManagedElement=1,Equipment=1,Subrack=1,Slot=26,PlugInUnit=1,Program=2"
    exception none
    nrOfAttributes 1
    "loadModule" Ref "ManagedElement=1,SwManagement=1,LoadModule=NssSyciBp"
)

SET
(
    mo "ManagedElement=1,Equipment=1,Subrack=1,Slot=26,PlugInUnit=1,Program=1"
    exception none
    nrOfAttributes 1
    "loadModule" Ref "ManagedElement=1,SwManagement=1,LoadModule=DbmBasic"
)

SET
(
    mo "ManagedElement=1,Equipment=1,Subrack=1,Slot=20,PlugInUnit=1,Program=151"
    exception none
    nrOfAttributes 1
    "loadModule" Ref "ManagedElement=1,SwManagement=1,LoadModule=MeasApplMp"
)

SET
(
    mo "ManagedElement=1,Equipment=1,Subrack=1,Slot=20,PlugInUnit=1,Program=50"
    exception none
    nrOfAttributes 1
    "loadModule" Ref "ManagedElement=1,SwManagement=1,LoadModule=rbsMp"
)

SET
(
    mo "ManagedElement=1,Equipment=1,Subrack=1,Slot=11,PlugInUnit=1,Program=5"
    exception none
    nrOfAttributes 1
    "loadModule" Ref "ManagedElement=1,SwManagement=1,LoadModule=DbmFpgaLoader"
)

SET
(
    mo "ManagedElement=1,Equipment=1,Subrack=1,Slot=11,PlugInUnit=1,Program=4"
    exception none
    nrOfAttributes 1
    "loadModule" Ref "ManagedElement=1,SwManagement=1,LoadModule=ubp"
)

SET
(
    mo "ManagedElement=1,Equipment=1,Subrack=1,Slot=11,PlugInUnit=1,Program=3"
    exception none
    nrOfAttributes 1
    "loadModule" Ref "ManagedElement=1,SwManagement=1,LoadModule=DispaceTim"
)

SET
(
    mo "ManagedElement=1,Equipment=1,Subrack=1,Slot=11,PlugInUnit=1,Program=2"
    exception none
    nrOfAttributes 1
    "loadModule" Ref "ManagedElement=1,SwManagement=1,LoadModule=NssSyciBp"
)

SET
(
    mo "ManagedElement=1,Equipment=1,Subrack=1,Slot=11,PlugInUnit=1,Program=1"
    exception none
    nrOfAttributes 1
    "loadModule" Ref "ManagedElement=1,SwManagement=1,LoadModule=DbmBasic"
)

SET
(
    mo "ManagedElement=1,Equipment=1,Subrack=1,Slot=10,PlugInUnit=1,Program=5"
    exception none
    nrOfAttributes 1
    "loadModule" Ref "ManagedElement=1,SwManagement=1,LoadModule=DbmFpgaLoader"
)

SET
(
    mo "ManagedElement=1,Equipment=1,Subrack=1,Slot=10,PlugInUnit=1,Program=4"
    exception none
    nrOfAttributes 1
    "loadModule" Ref "ManagedElement=1,SwManagement=1,LoadModule=ubp"
)

SET
(
    mo "ManagedElement=1,Equipment=1,Subrack=1,Slot=10,PlugInUnit=1,Program=3"
    exception none
    nrOfAttributes 1
    "loadModule" Ref "ManagedElement=1,SwManagement=1,LoadModule=DispaceTim"
)

SET
(
    mo "ManagedElement=1,Equipment=1,Subrack=1,Slot=10,PlugInUnit=1,Program=2"
    exception none
    nrOfAttributes 1
    "loadModule" Ref "ManagedElement=1,SwManagement=1,LoadModule=NssSyciBp"
)

SET
(
    mo "ManagedElement=1,Equipment=1,Subrack=1,Slot=10,PlugInUnit=1,Program=1"
    exception none
    nrOfAttributes 1
    "loadModule" Ref "ManagedElement=1,SwManagement=1,LoadModule=DbmBasic"
)

SET
(
    mo "ManagedElement=1,Equipment=1,Subrack=1,Slot=9,PlugInUnit=1,Program=5"
    exception none
    nrOfAttributes 1
    "loadModule" Ref "ManagedElement=1,SwManagement=1,LoadModule=DbmFpgaLoader"
)

SET
(
    mo "ManagedElement=1,Equipment=1,Subrack=1,Slot=9,PlugInUnit=1,Program=4"
    exception none
    nrOfAttributes 1
    "loadModule" Ref "ManagedElement=1,SwManagement=1,LoadModule=ubp"
)

SET
(
    mo "ManagedElement=1,Equipment=1,Subrack=1,Slot=9,PlugInUnit=1,Program=3"
    exception none
    nrOfAttributes 1
    "loadModule" Ref "ManagedElement=1,SwManagement=1,LoadModule=DispaceTim"
)

SET
(
    mo "ManagedElement=1,Equipment=1,Subrack=1,Slot=9,PlugInUnit=1,Program=2"
    exception none
    nrOfAttributes 1
    "loadModule" Ref "ManagedElement=1,SwManagement=1,LoadModule=NssSyciBp"
)

SET
(
    mo "ManagedElement=1,Equipment=1,Subrack=1,Slot=9,PlugInUnit=1,Program=1"
    exception none
    nrOfAttributes 1
    "loadModule" Ref "ManagedElement=1,SwManagement=1,LoadModule=DbmBasic"
)

SET
(
    mo "ManagedElement=1,Equipment=1,Subrack=1,Slot=8,PlugInUnit=1,Program=5"
    exception none
    nrOfAttributes 1
    "loadModule" Ref "ManagedElement=1,SwManagement=1,LoadModule=DbmFpgaLoader"
)

SET
(
    mo "ManagedElement=1,Equipment=1,Subrack=1,Slot=8,PlugInUnit=1,Program=4"
    exception none
    nrOfAttributes 1
    "loadModule" Ref "ManagedElement=1,SwManagement=1,LoadModule=ubp"
)

SET
(
    mo "ManagedElement=1,Equipment=1,Subrack=1,Slot=8,PlugInUnit=1,Program=3"
    exception none
    nrOfAttributes 1
    "loadModule" Ref "ManagedElement=1,SwManagement=1,LoadModule=DispaceTim"
)

SET
(
    mo "ManagedElement=1,Equipment=1,Subrack=1,Slot=8,PlugInUnit=1,Program=2"
    exception none
    nrOfAttributes 1
    "loadModule" Ref "ManagedElement=1,SwManagement=1,LoadModule=NssSyciBp"
)

SET
(
    mo "ManagedElement=1,Equipment=1,Subrack=1,Slot=8,PlugInUnit=1,Program=1"
    exception none
    nrOfAttributes 1
    "loadModule" Ref "ManagedElement=1,SwManagement=1,LoadModule=DbmBasic"
)

SET
(
    mo "ManagedElement=1,Equipment=1,Subrack=1,Slot=4,PlugInUnit=1,Program=24"
    exception none
    nrOfAttributes 1
    "loadModule" Ref "ManagedElement=1,SwManagement=1,LoadModule=tuRnRbs"
)

SET
(
    mo "ManagedElement=1,Equipment=1,Subrack=1,Slot=4,PlugInUnit=1,TimingUnit=1,Program=1"
    exception none
    nrOfAttributes 1
    "loadModule" Ref "ManagedElement=1,SwManagement=1,LoadModule=TuFpga"
)

SET
(
    mo "ManagedElement=1,Equipment=1,Subrack=1,Slot=2,PlugInUnit=1,ExchangeTerminal=1,E1PhysPathTerm=pp8"
    exception none
    nrOfAttributes 1
    "reservedByTraffic" Ref "ManagedElement=1,TransportNetwork=1,AtmPort=1-1-8"
)

SET
(
    mo "ManagedElement=1,Equipment=1,Subrack=1,Slot=2,PlugInUnit=1,ExchangeTerminal=1,E1PhysPathTerm=pp7"
    exception none
    nrOfAttributes 1
    "reservedByTraffic" Ref "ManagedElement=1,TransportNetwork=1,AtmPort=1-1-7"
)

SET
(
    mo "ManagedElement=1,Equipment=1,Subrack=1,Slot=2,PlugInUnit=1,ExchangeTerminal=1,E1PhysPathTerm=pp6"
    exception none
    nrOfAttributes 1
    "reservedByTraffic" Ref "ManagedElement=1,TransportNetwork=1,AtmPort=1-1-6"
)

SET
(
    mo "ManagedElement=1,Equipment=1,Subrack=1,Slot=2,PlugInUnit=1,ExchangeTerminal=1,E1PhysPathTerm=pp5"
    exception none
    nrOfAttributes 1
    "reservedByTraffic" Ref "ManagedElement=1,TransportNetwork=1,AtmPort=1-1-5"
)

SET
(
    mo "ManagedElement=1,Equipment=1,Subrack=1,Slot=2,PlugInUnit=1,ExchangeTerminal=1,E1PhysPathTerm=pp4"
    exception none
    nrOfAttributes 1
    "reservedByTraffic" Ref "ManagedElement=1,TransportNetwork=1,AtmPort=1-1-4"
)

SET
(
    mo "ManagedElement=1,Equipment=1,Subrack=1,Slot=2,PlugInUnit=1,ExchangeTerminal=1,E1PhysPathTerm=pp3"
    exception none
    nrOfAttributes 1
    "reservedByTraffic" Ref "ManagedElement=1,TransportNetwork=1,AtmPort=1-1-3"
)

SET
(
    mo "ManagedElement=1,Equipment=1,Subrack=1,Slot=2,PlugInUnit=1,ExchangeTerminal=1,E1PhysPathTerm=pp2"
    exception none
    nrOfAttributes 1
    "reservedByTraffic" Ref "ManagedElement=1,TransportNetwork=1,AtmPort=1-1-2"
)

SET
(
    mo "ManagedElement=1,Equipment=1,Subrack=1,Slot=2,PlugInUnit=1,ExchangeTerminal=1,E1PhysPathTerm=pp1"
    exception none
    nrOfAttributes 1
    "reservedByTraffic" Ref "ManagedElement=1,TransportNetwork=1,AtmPort=1-1-1"
)

SET
(
    mo "ManagedElement=1,Equipment=1,Subrack=1,Slot=20,PlugInUnit=1,Program=32"
    exception none
    nrOfAttributes 1
    "loadModule" Ref "ManagedElement=1,SwManagement=1,LoadModule=PhyE1Mp"
)

SET
(
    mo "ManagedElement=1,Equipment=1,Subrack=1,Slot=2,PlugInUnit=1,Program=8"
    exception none
    nrOfAttributes 1
    "loadModule" Ref "ManagedElement=1,SwManagement=1,LoadModule=DbmFpgaLoader"
)

SET
(
    mo "ManagedElement=1,Equipment=1,Subrack=1,Slot=2,PlugInUnit=1,Program=7"
    exception none
    nrOfAttributes 1
    "loadModule" Ref "ManagedElement=1,SwManagement=1,LoadModule=Aal2Bp"
)

SET
(
    mo "ManagedElement=1,Equipment=1,Subrack=1,Slot=2,PlugInUnit=1,Program=6"
    exception none
    nrOfAttributes 1
    "loadModule" Ref "ManagedElement=1,SwManagement=1,LoadModule=AtmBp"
)

SET
(
    mo "ManagedElement=1,Equipment=1,Subrack=1,Slot=2,PlugInUnit=1,Program=5"
    exception none
    nrOfAttributes 1
    "loadModule" Ref "ManagedElement=1,SwManagement=1,LoadModule=EqpM1Bp"
)

SET
(
    mo "ManagedElement=1,Equipment=1,Subrack=1,Slot=2,PlugInUnit=1,Program=4"
    exception none
    nrOfAttributes 1
    "loadModule" Ref "ManagedElement=1,SwManagement=1,LoadModule=PhyE1Bp"
)

SET
(
    mo "ManagedElement=1,Equipment=1,Subrack=1,Slot=2,PlugInUnit=1,Program=3"
    exception none
    nrOfAttributes 1
    "loadModule" Ref "ManagedElement=1,SwManagement=1,LoadModule=CpyLoader"
)

SET
(
    mo "ManagedElement=1,Equipment=1,Subrack=1,Slot=2,PlugInUnit=1,Program=2"
    exception none
    nrOfAttributes 1
    "loadModule" Ref "ManagedElement=1,SwManagement=1,LoadModule=NssSyciBp"
)

SET
(
    mo "ManagedElement=1,Equipment=1,Subrack=1,Slot=2,PlugInUnit=1,Program=1"
    exception none
    nrOfAttributes 1
    "loadModule" Ref "ManagedElement=1,SwManagement=1,LoadModule=DbmBasic"
)

//SET
//(
//    mo "ManagedElement=1,Equipment=1,Subrack=1,Slot=2,PlugInUnit=1"
//    exception none
 //   nrOfAttributes 1
 //   "piuType" Ref "ManagedElement=1,SwManagement=1,PiuType=ExchangeTerminal_R6"
//)

SET
(
    mo "ManagedElement=1,Equipment=1,Subrack=1,Slot=20,PlugInUnit=1,Program=38"
    exception none
    nrOfAttributes 1
    "loadModule" Ref "ManagedElement=1,SwManagement=1,LoadModule=Aal2Ap11"
)

SET
(
    mo "ManagedElement=1,Equipment=1,Subrack=1,Slot=20,PlugInUnit=1,Program=37"
    exception none
    nrOfAttributes 1
    "loadModule" Ref "ManagedElement=1,SwManagement=1,LoadModule=Aal2CpsRc11"
)

SET
(
    mo "ManagedElement=1,Equipment=1,Subrack=1,Slot=20,PlugInUnit=1,Program=36"
    exception none
    nrOfAttributes 1
    "loadModule" Ref "ManagedElement=1,SwManagement=1,LoadModule=Aal2DisNcc11"
)

SET
(
    mo "ManagedElement=1,Equipment=1,Subrack=1,Slot=20,PlugInUnit=1,Program=35"
    exception none
    nrOfAttributes 1
    "loadModule" Ref "ManagedElement=1,SwManagement=1,LoadModule=Aal2Rh"
)

SET
(
    mo "ManagedElement=1,Equipment=1,Subrack=1,Slot=20,PlugInUnit=1,Program=34"
    exception none
    nrOfAttributes 1
    "loadModule" Ref "ManagedElement=1,SwManagement=1,LoadModule=UsaalTerm"
)

SET
(
    mo "ManagedElement=1,Equipment=1,Subrack=1,Slot=20,PlugInUnit=1,Program=33"
    exception none
    nrOfAttributes 1
    "loadModule" Ref "ManagedElement=1,SwManagement=1,LoadModule=UsaalAdm"
)

SET
(
    mo "ManagedElement=1,Equipment=1,Subrack=1,Slot=20,PlugInUnit=1,Program=31"
    exception none
    nrOfAttributes 1
    "loadModule" Ref "ManagedElement=1,SwManagement=1,LoadModule=Aal2NccAdm11"
)

SET
(
    mo "ManagedElement=1,Equipment=1,Subrack=1,Slot=20,PlugInUnit=1,Program=30"
    exception none
    nrOfAttributes 1
    "loadModule" Ref "ManagedElement=1,SwManagement=1,LoadModule=Aal2Adm"
)

SET
(
    mo "ManagedElement=1,Equipment=1,Subrack=1,Slot=20,PlugInUnit=1,Program=29"
    exception none
    nrOfAttributes 1
    "loadModule" Ref "ManagedElement=1,SwManagement=1,LoadModule=Aal2Mp"
)

SET
(
    mo "ManagedElement=1,Equipment=1,Subrack=1,Slot=20,PlugInUnit=1,Program=28"
    exception none
    nrOfAttributes 1
    "loadModule" Ref "ManagedElement=1,SwManagement=1,LoadModule=AtmMp"
)

SET
(
    mo "ManagedElement=1,Equipment=1,Subrack=1,Slot=20,PlugInUnit=1,Program=27"
    exception none
    nrOfAttributes 1
    "loadModule" Ref "ManagedElement=1,SwManagement=1,LoadModule=EquipMp"
)

SET
(
    mo "ManagedElement=1,Equipment=1,Subrack=1,Slot=20,PlugInUnit=1,Program=26"
    exception none
    nrOfAttributes 1
    "loadModule" Ref "ManagedElement=1,SwManagement=1,LoadModule=Aal5TermMp"
)

SET
(
    mo "ManagedElement=1,Equipment=1,Subrack=1,Slot=20,PlugInUnit=1,Program=25"
    exception none
    nrOfAttributes 1
    "loadModule" Ref "ManagedElement=1,SwManagement=1,LoadModule=Aal5StaticAdm"
)

SET
(
    mo "ManagedElement=1,Equipment=1,Subrack=1,Slot=20,PlugInUnit=1,Program=23"
    exception none
    nrOfAttributes 1
    "loadModule" Ref "ManagedElement=1,SwManagement=1,LoadModule=Aal0TermMp"
)

SET
(
    mo "ManagedElement=1,Equipment=1,Subrack=1,Slot=20,PlugInUnit=1,Program=22"
    exception none
    nrOfAttributes 1
    "loadModule" Ref "ManagedElement=1,SwManagement=1,LoadModule=Aal0StaticAdm"
)

SET
(
    mo "ManagedElement=1,Equipment=1,Subrack=1,Slot=20,PlugInUnit=1,Program=20"
    exception none
    nrOfAttributes 1
    "loadModule" Ref "ManagedElement=1,SwManagement=1,LoadModule=AalCc"
)

SET
(
    mo "ManagedElement=1,Equipment=1,Subrack=1,Slot=20,PlugInUnit=1,Program=19"
    exception none
    nrOfAttributes 1
    "loadModule" Ref "ManagedElement=1,SwManagement=1,LoadModule=Aal05Ncc"
)

SET
(
    mo "ManagedElement=1,Equipment=1,Subrack=1,Slot=20,PlugInUnit=1,Program=18"
    exception none
    nrOfAttributes 1
    "loadModule" Ref "ManagedElement=1,SwManagement=1,LoadModule=Pms"
)

SET
(
    mo "ManagedElement=1,Equipment=1,Subrack=1,Slot=20,PlugInUnit=1,Program=17"
    exception none
    nrOfAttributes 1
    "loadModule" Ref "ManagedElement=1,SwManagement=1,LoadModule=Jvm"
)

SET
(
    mo "ManagedElement=1,Equipment=1,Subrack=1,Slot=20,PlugInUnit=1,Program=16"
    exception none
    nrOfAttributes 1
    "loadModule" Ref "ManagedElement=1,SwManagement=1,LoadModule=Http"
)

SET
(
    mo "ManagedElement=1,Equipment=1,Subrack=1,Slot=20,PlugInUnit=1,Program=15"
    exception none
    nrOfAttributes 1
    "loadModule" Ref "ManagedElement=1,SwManagement=1,LoadModule=IpUtil"
)

SET
(
    mo "ManagedElement=1,Equipment=1,Subrack=1,Slot=20,PlugInUnit=1,Program=14"
    exception none
    nrOfAttributes 1
    "loadModule" Ref "ManagedElement=1,SwManagement=1,LoadModule=NssMp"
)

SET
(
    mo "ManagedElement=1,Equipment=1,Subrack=1,Slot=20,PlugInUnit=1,Program=13"
    exception none
    nrOfAttributes 1
    "loadModule" Ref "ManagedElement=1,SwManagement=1,LoadModule=Ospf"
)

SET
(
    mo "ManagedElement=1,Equipment=1,Subrack=1,Slot=20,PlugInUnit=1,Program=12"
    exception none
    nrOfAttributes 1
    "loadModule" Ref "ManagedElement=1,SwManagement=1,LoadModule=Inet"
)

SET
(
    mo "ManagedElement=1,Equipment=1,Subrack=1,Slot=20,PlugInUnit=1,Program=11"
    exception none
    nrOfAttributes 1
    "loadModule" Ref "ManagedElement=1,SwManagement=1,LoadModule=SpasRes"
)

SET
(
    mo "ManagedElement=1,Equipment=1,Subrack=1,Slot=20,PlugInUnit=1,Program=10"
    exception none
    nrOfAttributes 1
    "loadModule" Ref "ManagedElement=1,SwManagement=1,LoadModule=SwInst"
)

SET
(
    mo "ManagedElement=1,Equipment=1,Subrack=1,Slot=20,PlugInUnit=1,Program=9"
    exception none
    nrOfAttributes 1
    "loadModule" Ref "ManagedElement=1,SwManagement=1,LoadModule=EqmRes"
)

SET
(
    mo "ManagedElement=1,Equipment=1,Subrack=1,Slot=20,PlugInUnit=1,Program=8"
    exception none
    nrOfAttributes 1
    "loadModule" Ref "ManagedElement=1,SwManagement=1,LoadModule=Database"
)

SET
(
    mo "ManagedElement=1,Equipment=1,Subrack=1,Slot=20,PlugInUnit=1,Program=7"
    exception none
    nrOfAttributes 1
    "loadModule" Ref "ManagedElement=1,SwManagement=1,LoadModule=LoaderServer"
)

SET
(
    mo "ManagedElement=1,Equipment=1,Subrack=1,Slot=20,PlugInUnit=1,Program=6"
    exception none
    nrOfAttributes 1
    "loadModule" Ref "ManagedElement=1,SwManagement=1,LoadModule=NssSyciMp"
)

SET
(
    mo "ManagedElement=1,Equipment=1,Subrack=1,Slot=20,PlugInUnit=1,Program=5"
    exception none
    nrOfAttributes 1
    "loadModule" Ref "ManagedElement=1,SwManagement=1,LoadModule=SpasConn"
)

SET
(
    mo "ManagedElement=1,Equipment=1,Subrack=1,Slot=20,PlugInUnit=1,Program=4"
    exception none
    nrOfAttributes 1
    "loadModule" Ref "ManagedElement=1,SwManagement=1,LoadModule=Ethernet"
)

SET
(
    mo "ManagedElement=1,Equipment=1,Subrack=1,Slot=20,PlugInUnit=1,Program=3"
    exception none
    nrOfAttributes 1
    "loadModule" Ref "ManagedElement=1,SwManagement=1,LoadModule=Sock"
)

SET
(
    mo "ManagedElement=1,Equipment=1,Subrack=1,Slot=20,PlugInUnit=1,Program=2"
    exception none
    nrOfAttributes 1
    "loadModule" Ref "ManagedElement=1,SwManagement=1,LoadModule=SysMan"
)

SET
(
    mo "ManagedElement=1,Equipment=1,Subrack=1,Slot=20,PlugInUnit=1,Program=1"
    exception none
    nrOfAttributes 1
    "loadModule" Ref "ManagedElement=1,SwManagement=1,LoadModule=GpbBasic"
)

SET
(
    mo "ManagedElement=1,Equipment=1,Subrack=1,Slot=4,PlugInUnit=1,Program=6"
    exception none
    nrOfAttributes 1
    "loadModule" Ref "ManagedElement=1,SwManagement=1,LoadModule=DbmFpgaLoader"
)

SET
(
    mo "ManagedElement=1,Equipment=1,Subrack=1,Slot=4,PlugInUnit=1,Program=5"
    exception none
    nrOfAttributes 1
    "loadModule" Ref "ManagedElement=1,SwManagement=1,LoadModule=Aal0TuBp"
)

SET
(
    mo "ManagedElement=1,Equipment=1,Subrack=1,Slot=4,PlugInUnit=1,Program=4"
    exception none
    nrOfAttributes 1
    "loadModule" Ref "ManagedElement=1,SwManagement=1,LoadModule=Aal5TermBp"
)

SET
(
    mo "ManagedElement=1,Equipment=1,Subrack=1,Slot=4,PlugInUnit=1,Program=3"
    exception none
    nrOfAttributes 1
    "loadModule" Ref "ManagedElement=1,SwManagement=1,LoadModule=NssTuRBSBp"
)

SET
(
    mo "ManagedElement=1,Equipment=1,Subrack=1,Slot=4,PlugInUnit=1,Program=2"
    exception none
    nrOfAttributes 1
    "loadModule" Ref "ManagedElement=1,SwManagement=1,LoadModule=NssSyciBp"
)

SET
(
    mo "ManagedElement=1,Equipment=1,Subrack=1,Slot=4,PlugInUnit=1,Program=1"
    exception none
    nrOfAttributes 1
    "loadModule" Ref "ManagedElement=1,SwManagement=1,LoadModule=DbmBasic"
)

SET
(
    mo "ManagedElement=1,Equipment=1,Subrack=1,Slot=1,PlugInUnit=1,Program=8"
    exception none
    nrOfAttributes 1
    "loadModule" Ref "ManagedElement=1,SwManagement=1,LoadModule=DbmFpgaLoader"
)

SET
(
    mo "ManagedElement=1,Equipment=1,Subrack=1,Slot=1,PlugInUnit=1,Program=7"
    exception none
    nrOfAttributes 1
    "loadModule" Ref "ManagedElement=1,SwManagement=1,LoadModule=Atf"
)

SET
(
    mo "ManagedElement=1,Equipment=1,Subrack=1,Slot=1,PlugInUnit=1,Program=6"
    exception none
    nrOfAttributes 1
    "loadModule" Ref "ManagedElement=1,SwManagement=1,LoadModule=NssScb"
)

SET
(
    mo "ManagedElement=1,Equipment=1,Subrack=1,Slot=1,PlugInUnit=1,Program=5"
    exception none
    nrOfAttributes 1
    "loadModule" Ref "ManagedElement=1,SwManagement=1,LoadModule=SpasSm"
)

SET
(
    mo "ManagedElement=1,Equipment=1,Subrack=1,Slot=1,PlugInUnit=1,Program=4"
    exception none
    nrOfAttributes 1
    "loadModule" Ref "ManagedElement=1,SwManagement=1,LoadModule=SpasLink"
)

SET
(
    mo "ManagedElement=1,Equipment=1,Subrack=1,Slot=1,PlugInUnit=1,Program=3"
    exception none
    nrOfAttributes 1
    "loadModule" Ref "ManagedElement=1,SwManagement=1,LoadModule=48vpwrsup"
)

SET
(
    mo "ManagedElement=1,Equipment=1,Subrack=1,Slot=1,PlugInUnit=1,Program=2"
    exception none
    nrOfAttributes 1
    "loadModule" Ref "ManagedElement=1,SwManagement=1,LoadModule=NssSyciBp"
)

SET
(
    mo "ManagedElement=1,Equipment=1,Subrack=1,Slot=1,PlugInUnit=1,Program=1"
    exception none
    nrOfAttributes 1
    "loadModule" Ref "ManagedElement=1,SwManagement=1,LoadModule=DbmBasic"
)

SET
(
    mo "ManagedElement=1,Equipment=1,Subrack=1,Slot=27,PlugInUnit=1"
    exception none
    nrOfAttributes 1
    "piuType" Ref "ManagedElement=1,SwManagement=1,PiuType=TX_R1"
)

SET
(
    mo "ManagedElement=1,Equipment=1,Subrack=1,Slot=26,PlugInUnit=1"
    exception none
    nrOfAttributes 1
    "piuType" Ref "ManagedElement=1,SwManagement=1,PiuType=TX_R1"
)

SET
(
    mo "ManagedElement=1,Equipment=1,Subrack=1,Slot=19,PlugInUnit=1"
    exception none
    nrOfAttributes 1
    "piuType" Ref "ManagedElement=1,SwManagement=1,PiuType=RAX_R1"
)

SET
(
    mo "ManagedElement=1,Equipment=1,Subrack=1,Slot=18,PlugInUnit=1"
    exception none
    nrOfAttributes 1
    "piuType" Ref "ManagedElement=1,SwManagement=1,PiuType=RAX_R1"
)

SET
(
    mo "ManagedElement=1,Equipment=1,Subrack=1,Slot=17,PlugInUnit=1"
    exception none
    nrOfAttributes 1
    "piuType" Ref "ManagedElement=1,SwManagement=1,PiuType=RAX_R1"
)

SET
(
    mo "ManagedElement=1,Equipment=1,Subrack=1,Slot=16,PlugInUnit=1"
    exception none
    nrOfAttributes 1
    "piuType" Ref "ManagedElement=1,SwManagement=1,PiuType=RAX_R1"
)

SET
(
    mo "ManagedElement=1,Equipment=1,Subrack=1,Slot=15,PlugInUnit=1"
    exception none
    nrOfAttributes 1
    "piuType" Ref "ManagedElement=1,SwManagement=1,PiuType=RAX_R1"
)

SET
(
    mo "ManagedElement=1,Equipment=1,Subrack=1,Slot=14,PlugInUnit=1"
    exception none
    nrOfAttributes 1
    "piuType" Ref "ManagedElement=1,SwManagement=1,PiuType=RAX_R1"
)

SET
(
    mo "ManagedElement=1,Equipment=1,Subrack=1,Slot=13,PlugInUnit=1"
    exception none
    nrOfAttributes 1
    "piuType" Ref "ManagedElement=1,SwManagement=1,PiuType=RAX_R1"
)

SET
(
    mo "ManagedElement=1,Equipment=1,Subrack=1,Slot=12,PlugInUnit=1"
    exception none
    nrOfAttributes 1
    "piuType" Ref "ManagedElement=1,SwManagement=1,PiuType=RAX_R1"
)

SET
(
    mo "ManagedElement=1,Equipment=1,Subrack=1,Slot=11,PlugInUnit=1"
    exception none
    nrOfAttributes 1
    "piuType" Ref "ManagedElement=1,SwManagement=1,PiuType=RAX_R1"
)

SET
(
    mo "ManagedElement=1,Equipment=1,Subrack=1,Slot=10,PlugInUnit=1"
    exception none
    nrOfAttributes 1
    "piuType" Ref "ManagedElement=1,SwManagement=1,PiuType=RAX_R1"
)

SET
(
    mo "ManagedElement=1,Equipment=1,Subrack=1,Slot=9,PlugInUnit=1"
    exception none
    nrOfAttributes 1
    "piuType" Ref "ManagedElement=1,SwManagement=1,PiuType=RAX_R1"
)

SET
(
    mo "ManagedElement=1,Equipment=1,Subrack=1,Slot=8,PlugInUnit=1"
    exception none
    nrOfAttributes 1
    "piuType" Ref "ManagedElement=1,SwManagement=1,PiuType=RAX_R1"
)

SET
(
    mo "ManagedElement=1,Equipment=1,Subrack=1,Slot=20,PlugInUnit=1"
    exception none
    nrOfAttributes 1
    "piuType" Ref "ManagedElement=1,SwManagement=1,PiuType=GPB_FD_R4"
)

SET
(
    mo "ManagedElement=1,Equipment=1,Subrack=1,Slot=5,PlugInUnit=1"
    exception none
    nrOfAttributes 1
    "piuType" Ref "ManagedElement=1,SwManagement=1,PiuType=TU_R4"
)

SET
(
    mo "ManagedElement=1,Equipment=1,Subrack=1,Slot=4,PlugInUnit=1"
    exception none
    nrOfAttributes 1
    "piuType" Ref "ManagedElement=1,SwManagement=1,PiuType=TU_R4"
)

SET
(
    mo "ManagedElement=1,Equipment=1,Subrack=1,Slot=28,PlugInUnit=1"
    exception none
    nrOfAttributes 1
    "piuType" Ref "ManagedElement=1,SwManagement=1,PiuType=SCB_R6"
)

SET
(
    mo "ManagedElement=1,Equipment=1,Subrack=1,Slot=1,PlugInUnit=1"
    exception none
    nrOfAttributes 1
    "piuType" Ref "ManagedElement=1,SwManagement=1,PiuType=SCB_R6"
)

SET
(
    mo "ManagedElement=1,Equipment=1,Subrack=1"
    exception none
    nrOfAttributes 1
    "switchModule" Ref "ManagedElement=1,SwitchFabric=1,SwitchModule=1"
)

