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
    "reservedBy" Ref "null"
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
    "upgradeGroupId" Integer 0
    "upgradeGroupTypeName" String ""
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=2"
    identity "2"
    moType Slot
    exception none
    nrOfAttributes 8
    "SlotId" String "2"
    "productData" Struct
        nrOfElements 5
        "productName" String ""
        "productNumber" String ""
        "productRevision" String ""
        "serialNumber" String ""
        "productionDate" String ""

    "reservedBy" Array Ref 0
    "slotNumber" Integer 2
    "slotState" Integer 0
    "upgradeGroupId" Integer 0
    "upgradeGroupTypeName" String ""
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=2"
    identity "3"
    moType Slot
    exception none
    nrOfAttributes 8
    "SlotId" String "3"
    "productData" Struct
        nrOfElements 5
        "productName" String ""
        "productNumber" String ""
        "productRevision" String ""
        "serialNumber" String ""
        "productionDate" String ""

    "reservedBy" Array Ref 0
    "slotNumber" Integer 3
    "slotState" Integer 0
    "upgradeGroupId" Integer 0
    "upgradeGroupTypeName" String ""
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=2"
    identity "4"
    moType Slot
    exception none
    nrOfAttributes 8
    "SlotId" String "4"
    "productData" Struct
        nrOfElements 5
        "productName" String ""
        "productNumber" String ""
        "productRevision" String ""
        "serialNumber" String ""
        "productionDate" String ""

    "reservedBy" Array Ref 0
    "slotNumber" Integer 4
    "slotState" Integer 0
    "upgradeGroupId" Integer 0
    "upgradeGroupTypeName" String ""
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=2"
    identity "5"
    moType Slot
    exception none
    nrOfAttributes 8
    "SlotId" String "5"
    "productData" Struct
        nrOfElements 5
        "productName" String ""
        "productNumber" String ""
        "productRevision" String ""
        "serialNumber" String ""
        "productionDate" String ""

    "reservedBy" Array Ref 0
    "slotNumber" Integer 5
    "slotState" Integer 0
    "upgradeGroupId" Integer 0
    "upgradeGroupTypeName" String ""
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=2"
    identity "6"
    moType Slot
    exception none
    nrOfAttributes 8
    "SlotId" String "6"
    "productData" Struct
        nrOfElements 5
        "productName" String ""
        "productNumber" String ""
        "productRevision" String ""
        "serialNumber" String ""
        "productionDate" String ""

    "reservedBy" Array Ref 0
    "slotNumber" Integer 6
    "slotState" Integer 0
    "upgradeGroupId" Integer 0
    "upgradeGroupTypeName" String ""
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=2"
    identity "7"
    moType Slot
    exception none
    nrOfAttributes 8
    "SlotId" String "7"
    "productData" Struct
        nrOfElements 5
        "productName" String ""
        "productNumber" String ""
        "productRevision" String ""
        "serialNumber" String ""
        "productionDate" String ""

    "reservedBy" Array Ref 0
    "slotNumber" Integer 7
    "slotState" Integer 0
    "upgradeGroupId" Integer 0
    "upgradeGroupTypeName" String ""
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=2"
    identity "8"
    moType Slot
    exception none
    nrOfAttributes 8
    "SlotId" String "8"
    "productData" Struct
        nrOfElements 5
        "productName" String ""
        "productNumber" String ""
        "productRevision" String ""
        "serialNumber" String ""
        "productionDate" String ""

    "reservedBy" Array Ref 0
    "slotNumber" Integer 8
    "slotState" Integer 0
    "upgradeGroupId" Integer 0
    "upgradeGroupTypeName" String ""
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=2"
    identity "9"
    moType Slot
    exception none
    nrOfAttributes 8
    "SlotId" String "9"
    "productData" Struct
        nrOfElements 5
        "productName" String ""
        "productNumber" String ""
        "productRevision" String ""
        "serialNumber" String ""
        "productionDate" String ""

    "reservedBy" Array Ref 0
    "slotNumber" Integer 9
    "slotState" Integer 0
    "upgradeGroupId" Integer 0
    "upgradeGroupTypeName" String ""
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=2"
    identity "10"
    moType Slot
    exception none
    nrOfAttributes 8
    "SlotId" String "10"
    "productData" Struct
        nrOfElements 5
        "productName" String ""
        "productNumber" String ""
        "productRevision" String ""
        "serialNumber" String ""
        "productionDate" String ""

    "reservedBy" Array Ref 0
    "slotNumber" Integer 10
    "slotState" Integer 0
    "upgradeGroupId" Integer 0
    "upgradeGroupTypeName" String ""
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=2"
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
    "upgradeGroupId" Integer 0
    "upgradeGroupTypeName" String ""
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=2"
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
    "upgradeGroupId" Integer 0
    "upgradeGroupTypeName" String ""
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=2"
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
    "upgradeGroupId" Integer 0
    "upgradeGroupTypeName" String ""
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=2"
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
    "upgradeGroupId" Integer 0
    "upgradeGroupTypeName" String ""
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=2"
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
    "upgradeGroupId" Integer 0
    "upgradeGroupTypeName" String ""
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=2"
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
    "upgradeGroupId" Integer 0
    "upgradeGroupTypeName" String ""
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
    parent "ManagedElement=1,Equipment=1,Subrack=2,Slot=16"
    identity "1"
    moType PlugInUnit
    exception none
    nrOfAttributes 13
    "PlugInUnitId" String "1"
    "administrativeState" Integer 0
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
    parent "ManagedElement=1,Equipment=1,Subrack=2,Slot=2"
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
    parent "ManagedElement=1,Equipment=1,Subrack=2,Slot=3"
    identity "1"
    moType PlugInUnit
    exception none
    nrOfAttributes 13
    "PlugInUnitId" String "1"
    "administrativeState" Integer 0
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
    parent "ManagedElement=1,Equipment=1,Subrack=2,Slot=4"
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
    parent "ManagedElement=1,Equipment=1,Subrack=2,Slot=5"
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
    parent "ManagedElement=1,Equipment=1,Subrack=2,Slot=7"
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
    parent "ManagedElement=1,Equipment=1,Subrack=2,Slot=8"
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
    parent "ManagedElement=1,Equipment=1,Subrack=2,Slot=10"
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
    parent "ManagedElement=1,Equipment=1,Subrack=2,Slot=11"
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
    parent "ManagedElement=1,Equipment=1,Subrack=2,Slot=6"
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
    parent "ManagedElement=1,Equipment=1,Subrack=2,Slot=9"
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
    parent "ManagedElement=1,Equipment=1,Subrack=2,Slot=12"
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
    "startState" Integer 1
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=2,Slot=1,PlugInUnit=1"
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
    "startState" Integer 1
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=2,Slot=1,PlugInUnit=1"
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
    "startState" Integer 1
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=2,Slot=1,PlugInUnit=1"
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
    "startState" Integer 1
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=2,Slot=1,PlugInUnit=1"
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
    "startState" Integer 1
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=2,Slot=1,PlugInUnit=1"
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
    "startState" Integer 1
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=2,Slot=1,PlugInUnit=1"
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
    "startState" Integer 1
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

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=2,Slot=2,PlugInUnit=1"
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
    "startState" Integer 1
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=2,Slot=2,PlugInUnit=1"
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
    "startState" Integer 1
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=2,Slot=2,PlugInUnit=1"
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
    "startState" Integer 1
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=2,Slot=2,PlugInUnit=1"
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
    "startState" Integer 1
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=2,Slot=4,PlugInUnit=1"
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
    "startState" Integer 1
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=2,Slot=4,PlugInUnit=1"
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
    "startState" Integer 1
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=2,Slot=4,PlugInUnit=1"
    identity "6"
    moType Program
    exception none
    nrOfAttributes 9
    "ProgramId" String "6"
    "heapSize" Integer 0
    "loadModule" Ref "null"
    "operationalState" Integer 0
    "poolSize" Integer 1500000
    "restartCounterLimit" Integer 3
    "restartTimer" Integer 60
    "startState" Integer 1
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=2,Slot=4,PlugInUnit=1"
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
    "startState" Integer 1
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=2,Slot=7,PlugInUnit=1"
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
    "startState" Integer 1
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=2,Slot=7,PlugInUnit=1"
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
    "startState" Integer 1
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=2,Slot=7,PlugInUnit=1"
    identity "6"
    moType Program
    exception none
    nrOfAttributes 9
    "ProgramId" String "6"
    "heapSize" Integer 0
    "loadModule" Ref "null"
    "operationalState" Integer 0
    "poolSize" Integer 1500000
    "restartCounterLimit" Integer 3
    "restartTimer" Integer 60
    "startState" Integer 1
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=2,Slot=7,PlugInUnit=1"
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
    "startState" Integer 1
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=2,Slot=10,PlugInUnit=1"
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
    "startState" Integer 1
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=2,Slot=10,PlugInUnit=1"
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
    "startState" Integer 1
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=2,Slot=10,PlugInUnit=1"
    identity "6"
    moType Program
    exception none
    nrOfAttributes 9
    "ProgramId" String "6"
    "heapSize" Integer 0
    "loadModule" Ref "null"
    "operationalState" Integer 0
    "poolSize" Integer 1500000
    "restartCounterLimit" Integer 3
    "restartTimer" Integer 60
    "startState" Integer 1
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=2,Slot=10,PlugInUnit=1"
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
    "startState" Integer 1
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=2,Slot=6,PlugInUnit=1"
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
    "startState" Integer 1
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=2,Slot=6,PlugInUnit=1"
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
    "startState" Integer 1
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=2,Slot=6,PlugInUnit=1"
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
    "startState" Integer 1
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=2,Slot=6,PlugInUnit=1"
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
    "startState" Integer 1
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=2,Slot=9,PlugInUnit=1"
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
    "startState" Integer 1
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=2,Slot=9,PlugInUnit=1"
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
    "startState" Integer 1
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=2,Slot=9,PlugInUnit=1"
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
    "startState" Integer 1
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=2,Slot=9,PlugInUnit=1"
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
    "startState" Integer 1
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=2,Slot=12,PlugInUnit=1"
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
    "startState" Integer 1
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=2,Slot=12,PlugInUnit=1"
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
    "startState" Integer 1
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=2,Slot=12,PlugInUnit=1"
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
    "startState" Integer 1
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=2,Slot=12,PlugInUnit=1"
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
    "startState" Integer 1
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=2,Slot=6,PlugInUnit=1"
    identity "1"
    moType AiuDeviceGroup
    exception none
    nrOfAttributes 5
    "AiuDeviceGroupId" String "1"
    "availabilityStatus" Integer 0
    "hwTestResult" Integer 0
    "operationalState" Integer 0
    "usageState" Integer 0
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=2,Slot=6,PlugInUnit=1,AiuDeviceGroup=1"
    identity "1"
    moType AiDeviceSet
    exception none
    nrOfAttributes 4
    "AiDeviceSetId" String "1"
    "availabilityStatus" Integer 0
    "operationalState" Integer 0
    "usageState" Integer 0
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=2,Slot=6,PlugInUnit=1,AiuDeviceGroup=1,AiDeviceSet=1"
    identity "1"
    moType AiDevice
    exception none
    nrOfAttributes 6
    "AiDeviceId" String "1"
    "administrativeState" Integer 1
    "availabilityStatus" Integer 0
    "operationalState" Integer 0
    "reservedBy" Array Ref 0
    "usageState" Integer 0
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=2,Slot=6,PlugInUnit=1,AiuDeviceGroup=1,AiDeviceSet=1"
    identity "2"
    moType AiDevice
    exception none
    nrOfAttributes 6
    "AiDeviceId" String "2"
    "administrativeState" Integer 1
    "availabilityStatus" Integer 0
    "operationalState" Integer 0
    "reservedBy" Array Ref 0
    "usageState" Integer 0
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=2,Slot=9,PlugInUnit=1"
    identity "1"
    moType AiuDeviceGroup
    exception none
    nrOfAttributes 5
    "AiuDeviceGroupId" String "1"
    "availabilityStatus" Integer 0
    "hwTestResult" Integer 0
    "operationalState" Integer 0
    "usageState" Integer 0
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=2,Slot=9,PlugInUnit=1,AiuDeviceGroup=1"
    identity "1"
    moType AiDeviceSet
    exception none
    nrOfAttributes 4
    "AiDeviceSetId" String "1"
    "availabilityStatus" Integer 0
    "operationalState" Integer 0
    "usageState" Integer 0
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=2,Slot=9,PlugInUnit=1,AiuDeviceGroup=1,AiDeviceSet=1"
    identity "1"
    moType AiDevice
    exception none
    nrOfAttributes 6
    "AiDeviceId" String "1"
    "administrativeState" Integer 1
    "availabilityStatus" Integer 0
    "operationalState" Integer 0
    "reservedBy" Array Ref 0
    "usageState" Integer 0
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=2,Slot=9,PlugInUnit=1,AiuDeviceGroup=1,AiDeviceSet=1"
    identity "2"
    moType AiDevice
    exception none
    nrOfAttributes 6
    "AiDeviceId" String "2"
    "administrativeState" Integer 1
    "availabilityStatus" Integer 0
    "operationalState" Integer 0
    "reservedBy" Array Ref 0
    "usageState" Integer 0
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=2,Slot=12,PlugInUnit=1"
    identity "1"
    moType AiuDeviceGroup
    exception none
    nrOfAttributes 5
    "AiuDeviceGroupId" String "1"
    "availabilityStatus" Integer 0
    "hwTestResult" Integer 0
    "operationalState" Integer 0
    "usageState" Integer 0
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=2,Slot=12,PlugInUnit=1,AiuDeviceGroup=1"
    identity "1"
    moType AiDeviceSet
    exception none
    nrOfAttributes 4
    "AiDeviceSetId" String "1"
    "availabilityStatus" Integer 0
    "operationalState" Integer 0
    "usageState" Integer 0
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=2,Slot=12,PlugInUnit=1,AiuDeviceGroup=1,AiDeviceSet=1"
    identity "1"
    moType AiDevice
    exception none
    nrOfAttributes 6
    "AiDeviceId" String "1"
    "administrativeState" Integer 1
    "availabilityStatus" Integer 0
    "operationalState" Integer 0
    "reservedBy" Array Ref 0
    "usageState" Integer 0
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=2,Slot=12,PlugInUnit=1,AiuDeviceGroup=1,AiDeviceSet=1"
    identity "2"
    moType AiDevice
    exception none
    nrOfAttributes 6
    "AiDeviceId" String "2"
    "administrativeState" Integer 1
    "availabilityStatus" Integer 0
    "operationalState" Integer 0
    "reservedBy" Array Ref 0
    "usageState" Integer 0
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=2,Slot=4,PlugInUnit=1"
    identity "1"
    moType TrxDeviceGroup
    exception none
    nrOfAttributes 5
    "TrxDeviceGroupId" String "1"
    "availabilityStatus" Integer 0
    "hwTestResult" Integer 0
    "operationalState" Integer 0
    "usageState" Integer 0
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=2,Slot=4,PlugInUnit=1,TrxDeviceGroup=1"
    identity "1"
    moType TrDeviceSet
    exception none
    nrOfAttributes 4
    "TrDeviceSetId" String "1"
    "availabilityStatus" Integer 0
    "operationalState" Integer 0
    "usageState" Integer 0
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=2,Slot=4,PlugInUnit=1,TrxDeviceGroup=1,TrDeviceSet=1"
    identity "1"
    moType TrDevice
    exception none
    nrOfAttributes 5
    "TrDeviceId" String "1"
    "availabilityStatus" Integer 0
    "operationalState" Integer 0
    "reservedBy" Array Ref 0
    "usageState" Integer 0
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=2,Slot=4,PlugInUnit=1,TrxDeviceGroup=1,TrDeviceSet=1"
    identity "2"
    moType TrDevice
    exception none
    nrOfAttributes 5
    "TrDeviceId" String "2"
    "availabilityStatus" Integer 0
    "operationalState" Integer 0
    "reservedBy" Array Ref 0
    "usageState" Integer 0
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=2,Slot=4,PlugInUnit=1,TrxDeviceGroup=1,TrDeviceSet=1"
    identity "3"
    moType TrDevice
    exception none
    nrOfAttributes 5
    "TrDeviceId" String "3"
    "availabilityStatus" Integer 0
    "operationalState" Integer 0
    "reservedBy" Array Ref 0
    "usageState" Integer 0
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=2,Slot=4,PlugInUnit=1,TrxDeviceGroup=1,TrDeviceSet=1"
    identity "4"
    moType TrDevice
    exception none
    nrOfAttributes 5
    "TrDeviceId" String "4"
    "availabilityStatus" Integer 0
    "operationalState" Integer 0
    "reservedBy" Array Ref 0
    "usageState" Integer 0
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=2,Slot=7,PlugInUnit=1"
    identity "1"
    moType TrxDeviceGroup
    exception none
    nrOfAttributes 5
    "TrxDeviceGroupId" String "1"
    "availabilityStatus" Integer 0
    "hwTestResult" Integer 0
    "operationalState" Integer 0
    "usageState" Integer 0
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=2,Slot=7,PlugInUnit=1,TrxDeviceGroup=1"
    identity "1"
    moType TrDeviceSet
    exception none
    nrOfAttributes 4
    "TrDeviceSetId" String "1"
    "availabilityStatus" Integer 0
    "operationalState" Integer 0
    "usageState" Integer 0
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=2,Slot=7,PlugInUnit=1,TrxDeviceGroup=1,TrDeviceSet=1"
    identity "1"
    moType TrDevice
    exception none
    nrOfAttributes 5
    "TrDeviceId" String "1"
    "availabilityStatus" Integer 0
    "operationalState" Integer 0
    "reservedBy" Array Ref 0
    "usageState" Integer 0
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=2,Slot=7,PlugInUnit=1,TrxDeviceGroup=1,TrDeviceSet=1"
    identity "2"
    moType TrDevice
    exception none
    nrOfAttributes 5
    "TrDeviceId" String "2"
    "availabilityStatus" Integer 0
    "operationalState" Integer 0
    "reservedBy" Array Ref 0
    "usageState" Integer 0
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=2,Slot=7,PlugInUnit=1,TrxDeviceGroup=1,TrDeviceSet=1"
    identity "3"
    moType TrDevice
    exception none
    nrOfAttributes 5
    "TrDeviceId" String "3"
    "availabilityStatus" Integer 0
    "operationalState" Integer 0
    "reservedBy" Array Ref 0
    "usageState" Integer 0
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=2,Slot=7,PlugInUnit=1,TrxDeviceGroup=1,TrDeviceSet=1"
    identity "4"
    moType TrDevice
    exception none
    nrOfAttributes 5
    "TrDeviceId" String "4"
    "availabilityStatus" Integer 0
    "operationalState" Integer 0
    "reservedBy" Array Ref 0
    "usageState" Integer 0
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=2,Slot=10,PlugInUnit=1"
    identity "1"
    moType TrxDeviceGroup
    exception none
    nrOfAttributes 5
    "TrxDeviceGroupId" String "1"
    "availabilityStatus" Integer 0
    "hwTestResult" Integer 0
    "operationalState" Integer 0
    "usageState" Integer 0
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=2,Slot=10,PlugInUnit=1,TrxDeviceGroup=1"
    identity "1"
    moType TrDeviceSet
    exception none
    nrOfAttributes 4
    "TrDeviceSetId" String "1"
    "availabilityStatus" Integer 0
    "operationalState" Integer 0
    "usageState" Integer 0
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=2,Slot=10,PlugInUnit=1,TrxDeviceGroup=1,TrDeviceSet=1"
    identity "1"
    moType TrDevice
    exception none
    nrOfAttributes 5
    "TrDeviceId" String "1"
    "availabilityStatus" Integer 0
    "operationalState" Integer 0
    "reservedBy" Array Ref 0
    "usageState" Integer 0
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=2,Slot=10,PlugInUnit=1,TrxDeviceGroup=1,TrDeviceSet=1"
    identity "2"
    moType TrDevice
    exception none
    nrOfAttributes 5
    "TrDeviceId" String "2"
    "availabilityStatus" Integer 0
    "operationalState" Integer 0
    "reservedBy" Array Ref 0
    "usageState" Integer 0
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=2,Slot=10,PlugInUnit=1,TrxDeviceGroup=1,TrDeviceSet=1"
    identity "3"
    moType TrDevice
    exception none
    nrOfAttributes 5
    "TrDeviceId" String "3"
    "availabilityStatus" Integer 0
    "operationalState" Integer 0
    "reservedBy" Array Ref 0
    "usageState" Integer 0
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=2,Slot=10,PlugInUnit=1,TrxDeviceGroup=1,TrDeviceSet=1"
    identity "4"
    moType TrDevice
    exception none
    nrOfAttributes 5
    "TrDeviceId" String "4"
    "availabilityStatus" Integer 0
    "operationalState" Integer 0
    "reservedBy" Array Ref 0
    "usageState" Integer 0
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=2,Slot=6,PlugInUnit=1,AiuDeviceGroup=1"
    identity "1"
    moType DpProgram
    exception none
    nrOfAttributes 2
    "DpProgramId" String "1"
    "loadModule" Ref "null"
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=2,Slot=9,PlugInUnit=1,AiuDeviceGroup=1"
    identity "1"
    moType DpProgram
    exception none
    nrOfAttributes 2
    "DpProgramId" String "1"
    "loadModule" Ref "null"
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=2,Slot=12,PlugInUnit=1,AiuDeviceGroup=1"
    identity "1"
    moType DpProgram
    exception none
    nrOfAttributes 2
    "DpProgramId" String "1"
    "loadModule" Ref "null"
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=2,Slot=4,PlugInUnit=1,TrxDeviceGroup=1"
    identity "1"
    moType DpProgram
    exception none
    nrOfAttributes 2
    "DpProgramId" String "1"
    "loadModule" Ref "null"
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=2,Slot=7,PlugInUnit=1,TrxDeviceGroup=1"
    identity "1"
    moType DpProgram
    exception none
    nrOfAttributes 2
    "DpProgramId" String "1"
    "loadModule" Ref "null"
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=2,Slot=10,PlugInUnit=1,TrxDeviceGroup=1"
    identity "1"
    moType DpProgram
    exception none
    nrOfAttributes 2
    "DpProgramId" String "1"
    "loadModule" Ref "null"
)

SET
(
    mo "ManagedElement=1,Equipment=1,Subrack=2,Slot=10,PlugInUnit=1,TrxDeviceGroup=1,DpProgram=1"
    exception none
    nrOfAttributes 1
    "loadModule" Ref "ManagedElement=1,SwManagement=1,LoadModule=trxDp"
)

SET
(
    mo "ManagedElement=1,Equipment=1,Subrack=2,Slot=7,PlugInUnit=1,TrxDeviceGroup=1,DpProgram=1"
    exception none
    nrOfAttributes 1
    "loadModule" Ref "ManagedElement=1,SwManagement=1,LoadModule=trxDp"
)

SET
(
    mo "ManagedElement=1,Equipment=1,Subrack=2,Slot=4,PlugInUnit=1,TrxDeviceGroup=1,DpProgram=1"
    exception none
    nrOfAttributes 1
    "loadModule" Ref "ManagedElement=1,SwManagement=1,LoadModule=trxDp"
)

SET
(
    mo "ManagedElement=1,Equipment=1,Subrack=2,Slot=12,PlugInUnit=1,AiuDeviceGroup=1,DpProgram=1"
    exception none
    nrOfAttributes 1
    "loadModule" Ref "ManagedElement=1,SwManagement=1,LoadModule=aiuDp"
)

SET
(
    mo "ManagedElement=1,Equipment=1,Subrack=2,Slot=9,PlugInUnit=1,AiuDeviceGroup=1,DpProgram=1"
    exception none
    nrOfAttributes 1
    "loadModule" Ref "ManagedElement=1,SwManagement=1,LoadModule=aiuDp"
)

SET
(
    mo "ManagedElement=1,Equipment=1,Subrack=2,Slot=6,PlugInUnit=1,AiuDeviceGroup=1,DpProgram=1"
    exception none
    nrOfAttributes 1
    "loadModule" Ref "ManagedElement=1,SwManagement=1,LoadModule=aiuDp"
)

SET
(
    mo "ManagedElement=1,Equipment=1,Subrack=2,Slot=12,PlugInUnit=1,Program=7"
    exception none
    nrOfAttributes 1
    "loadModule" Ref "ManagedElement=1,SwManagement=1,LoadModule=DbmFpgaLoader"
)

SET
(
    mo "ManagedElement=1,Equipment=1,Subrack=2,Slot=12,PlugInUnit=1,Program=6"
    exception none
    nrOfAttributes 1
    "loadModule" Ref "ManagedElement=1,SwManagement=1,LoadModule=aiu"
)

SET
(
    mo "ManagedElement=1,Equipment=1,Subrack=2,Slot=12,PlugInUnit=1,Program=2"
    exception none
    nrOfAttributes 1
    "loadModule" Ref "ManagedElement=1,SwManagement=1,LoadModule=NssSyciBp"
)

SET
(
    mo "ManagedElement=1,Equipment=1,Subrack=2,Slot=12,PlugInUnit=1,Program=1"
    exception none
    nrOfAttributes 1
    "loadModule" Ref "ManagedElement=1,SwManagement=1,LoadModule=DbmBasic"
)

SET
(
    mo "ManagedElement=1,Equipment=1,Subrack=2,Slot=9,PlugInUnit=1,Program=7"
    exception none
    nrOfAttributes 1
    "loadModule" Ref "ManagedElement=1,SwManagement=1,LoadModule=DbmFpgaLoader"
)

SET
(
    mo "ManagedElement=1,Equipment=1,Subrack=2,Slot=9,PlugInUnit=1,Program=6"
    exception none
    nrOfAttributes 1
    "loadModule" Ref "ManagedElement=1,SwManagement=1,LoadModule=aiu"
)

SET
(
    mo "ManagedElement=1,Equipment=1,Subrack=2,Slot=9,PlugInUnit=1,Program=2"
    exception none
    nrOfAttributes 1
    "loadModule" Ref "ManagedElement=1,SwManagement=1,LoadModule=NssSyciBp"
)

SET
(
    mo "ManagedElement=1,Equipment=1,Subrack=2,Slot=9,PlugInUnit=1,Program=1"
    exception none
    nrOfAttributes 1
    "loadModule" Ref "ManagedElement=1,SwManagement=1,LoadModule=DbmBasic"
)

SET
(
    mo "ManagedElement=1,Equipment=1,Subrack=2,Slot=6,PlugInUnit=1,Program=7"
    exception none
    nrOfAttributes 1
    "loadModule" Ref "ManagedElement=1,SwManagement=1,LoadModule=DbmFpgaLoader"
)

SET
(
    mo "ManagedElement=1,Equipment=1,Subrack=2,Slot=6,PlugInUnit=1,Program=6"
    exception none
    nrOfAttributes 1
    "loadModule" Ref "ManagedElement=1,SwManagement=1,LoadModule=aiu"
)

SET
(
    mo "ManagedElement=1,Equipment=1,Subrack=2,Slot=6,PlugInUnit=1,Program=2"
    exception none
    nrOfAttributes 1
    "loadModule" Ref "ManagedElement=1,SwManagement=1,LoadModule=NssSyciBp"
)

SET
(
    mo "ManagedElement=1,Equipment=1,Subrack=2,Slot=6,PlugInUnit=1,Program=1"
    exception none
    nrOfAttributes 1
    "loadModule" Ref "ManagedElement=1,SwManagement=1,LoadModule=DbmBasic"
)

SET
(
    mo "ManagedElement=1,Equipment=1,Subrack=2,Slot=10,PlugInUnit=1,Program=7"
    exception none
    nrOfAttributes 1
    "loadModule" Ref "ManagedElement=1,SwManagement=1,LoadModule=DbmFpgaLoader"
)

SET
(
    mo "ManagedElement=1,Equipment=1,Subrack=2,Slot=10,PlugInUnit=1,Program=6"
    exception none
    nrOfAttributes 1
    "loadModule" Ref "ManagedElement=1,SwManagement=1,LoadModule=trx"
)

SET
(
    mo "ManagedElement=1,Equipment=1,Subrack=2,Slot=10,PlugInUnit=1,Program=2"
    exception none
    nrOfAttributes 1
    "loadModule" Ref "ManagedElement=1,SwManagement=1,LoadModule=NssSyciBp"
)

SET
(
    mo "ManagedElement=1,Equipment=1,Subrack=2,Slot=10,PlugInUnit=1,Program=1"
    exception none
    nrOfAttributes 1
    "loadModule" Ref "ManagedElement=1,SwManagement=1,LoadModule=DbmBasic"
)

SET
(
    mo "ManagedElement=1,Equipment=1,Subrack=2,Slot=7,PlugInUnit=1,Program=7"
    exception none
    nrOfAttributes 1
    "loadModule" Ref "ManagedElement=1,SwManagement=1,LoadModule=DbmFpgaLoader"
)

SET
(
    mo "ManagedElement=1,Equipment=1,Subrack=2,Slot=7,PlugInUnit=1,Program=6"
    exception none
    nrOfAttributes 1
    "loadModule" Ref "ManagedElement=1,SwManagement=1,LoadModule=trx"
)

SET
(
    mo "ManagedElement=1,Equipment=1,Subrack=2,Slot=7,PlugInUnit=1,Program=2"
    exception none
    nrOfAttributes 1
    "loadModule" Ref "ManagedElement=1,SwManagement=1,LoadModule=NssSyciBp"
)

SET
(
    mo "ManagedElement=1,Equipment=1,Subrack=2,Slot=7,PlugInUnit=1,Program=1"
    exception none
    nrOfAttributes 1
    "loadModule" Ref "ManagedElement=1,SwManagement=1,LoadModule=DbmBasic"
)

SET
(
    mo "ManagedElement=1,Equipment=1,Subrack=2,Slot=4,PlugInUnit=1,Program=7"
    exception none
    nrOfAttributes 1
    "loadModule" Ref "ManagedElement=1,SwManagement=1,LoadModule=DbmFpgaLoader"
)

SET
(
    mo "ManagedElement=1,Equipment=1,Subrack=2,Slot=4,PlugInUnit=1,Program=6"
    exception none
    nrOfAttributes 1
    "loadModule" Ref "ManagedElement=1,SwManagement=1,LoadModule=trx"
)

SET
(
    mo "ManagedElement=1,Equipment=1,Subrack=2,Slot=4,PlugInUnit=1,Program=2"
    exception none
    nrOfAttributes 1
    "loadModule" Ref "ManagedElement=1,SwManagement=1,LoadModule=NssSyciBp"
)

SET
(
    mo "ManagedElement=1,Equipment=1,Subrack=2,Slot=4,PlugInUnit=1,Program=1"
    exception none
    nrOfAttributes 1
    "loadModule" Ref "ManagedElement=1,SwManagement=1,LoadModule=DbmBasic"
)

SET
(
    mo "ManagedElement=1,Equipment=1,Subrack=2,Slot=2,PlugInUnit=1,Program=7"
    exception none
    nrOfAttributes 1
    "loadModule" Ref "ManagedElement=1,SwManagement=1,LoadModule=DbmFpgaLoader"
)

SET
(
    mo "ManagedElement=1,Equipment=1,Subrack=2,Slot=2,PlugInUnit=1,Program=6"
    exception none
    nrOfAttributes 1
    "loadModule" Ref "ManagedElement=1,SwManagement=1,LoadModule=rfif"
)

SET
(
    mo "ManagedElement=1,Equipment=1,Subrack=2,Slot=2,PlugInUnit=1,Program=2"
    exception none
    nrOfAttributes 1
    "loadModule" Ref "ManagedElement=1,SwManagement=1,LoadModule=NssSyciBp"
)

SET
(
    mo "ManagedElement=1,Equipment=1,Subrack=2,Slot=2,PlugInUnit=1,Program=1"
    exception none
    nrOfAttributes 1
    "loadModule" Ref "ManagedElement=1,SwManagement=1,LoadModule=DbmBasic"
)

SET
(
    mo "ManagedElement=1,Equipment=1,Subrack=2,Slot=1,PlugInUnit=1,Program=7"
    exception none
    nrOfAttributes 1
    "loadModule" Ref "ManagedElement=1,SwManagement=1,LoadModule=DbmFpgaLoader"
)

SET
(
    mo "ManagedElement=1,Equipment=1,Subrack=2,Slot=1,PlugInUnit=1,Program=6"
    exception none
    nrOfAttributes 1
    "loadModule" Ref "ManagedElement=1,SwManagement=1,LoadModule=NssScb"
)

SET
(
    mo "ManagedElement=1,Equipment=1,Subrack=2,Slot=1,PlugInUnit=1,Program=5"
    exception none
    nrOfAttributes 1
    "loadModule" Ref "ManagedElement=1,SwManagement=1,LoadModule=SpasSm"
)

SET
(
    mo "ManagedElement=1,Equipment=1,Subrack=2,Slot=1,PlugInUnit=1,Program=4"
    exception none
    nrOfAttributes 1
    "loadModule" Ref "ManagedElement=1,SwManagement=1,LoadModule=SpasLink"
)

SET
(
    mo "ManagedElement=1,Equipment=1,Subrack=2,Slot=1,PlugInUnit=1,Program=3"
    exception none
    nrOfAttributes 1
    "loadModule" Ref "ManagedElement=1,SwManagement=1,LoadModule=48vpwrsup"
)

SET
(
    mo "ManagedElement=1,Equipment=1,Subrack=2,Slot=1,PlugInUnit=1,Program=2"
    exception none
    nrOfAttributes 1
    "loadModule" Ref "ManagedElement=1,SwManagement=1,LoadModule=NssSyciBp"
)

SET
(
    mo "ManagedElement=1,Equipment=1,Subrack=2,Slot=1,PlugInUnit=1,Program=1"
    exception none
    nrOfAttributes 1
    "loadModule" Ref "ManagedElement=1,SwManagement=1,LoadModule=DbmBasic"
)

SET
(
    mo "ManagedElement=1,Equipment=1,Subrack=2,Slot=12,PlugInUnit=1"
    exception none
    nrOfAttributes 1
    "piuType" Ref "ManagedElement=1,SwManagement=1,PiuType=AIU_R5"
)

SET
(
    mo "ManagedElement=1,Equipment=1,Subrack=2,Slot=9,PlugInUnit=1"
    exception none
    nrOfAttributes 1
    "piuType" Ref "ManagedElement=1,SwManagement=1,PiuType=AIU_R5"
)

SET
(
    mo "ManagedElement=1,Equipment=1,Subrack=2,Slot=6,PlugInUnit=1"
    exception none
    nrOfAttributes 1
    "piuType" Ref "ManagedElement=1,SwManagement=1,PiuType=AIU_R5"
)

SET
(
    mo "ManagedElement=1,Equipment=1,Subrack=2,Slot=11,PlugInUnit=1"
    exception none
    nrOfAttributes 1
    "piuType" Ref "ManagedElement=1,SwManagement=1,PiuType=TRX_R2"
)

SET
(
    mo "ManagedElement=1,Equipment=1,Subrack=2,Slot=10,PlugInUnit=1"
    exception none
    nrOfAttributes 1
    "piuType" Ref "ManagedElement=1,SwManagement=1,PiuType=TRX_R2"
)

SET
(
    mo "ManagedElement=1,Equipment=1,Subrack=2,Slot=8,PlugInUnit=1"
    exception none
    nrOfAttributes 1
    "piuType" Ref "ManagedElement=1,SwManagement=1,PiuType=TRX_R2"
)

SET
(
    mo "ManagedElement=1,Equipment=1,Subrack=2,Slot=7,PlugInUnit=1"
    exception none
    nrOfAttributes 1
    "piuType" Ref "ManagedElement=1,SwManagement=1,PiuType=TRX_R2"
)

SET
(
    mo "ManagedElement=1,Equipment=1,Subrack=2,Slot=5,PlugInUnit=1"
    exception none
    nrOfAttributes 1
    "piuType" Ref "ManagedElement=1,SwManagement=1,PiuType=TRX_R2"
)

SET
(
    mo "ManagedElement=1,Equipment=1,Subrack=2,Slot=4,PlugInUnit=1"
    exception none
    nrOfAttributes 1
    "piuType" Ref "ManagedElement=1,SwManagement=1,PiuType=TRX_R2"
)

SET
(
    mo "ManagedElement=1,Equipment=1,Subrack=2,Slot=3,PlugInUnit=1"
    exception none
    nrOfAttributes 1
    "piuType" Ref "ManagedElement=1,SwManagement=1,PiuType=RFIF_R3"
)

SET
(
    mo "ManagedElement=1,Equipment=1,Subrack=2,Slot=2,PlugInUnit=1"
    exception none
    nrOfAttributes 1
    "piuType" Ref "ManagedElement=1,SwManagement=1,PiuType=RFIF_R3"
)

SET
(
    mo "ManagedElement=1,Equipment=1,Subrack=2,Slot=16,PlugInUnit=1"
    exception none
    nrOfAttributes 1
    "piuType" Ref "ManagedElement=1,SwManagement=1,PiuType=SCB_R6"
)

SET
(
    mo "ManagedElement=1,Equipment=1,Subrack=2,Slot=1,PlugInUnit=1"
    exception none
    nrOfAttributes 1
    "piuType" Ref "ManagedElement=1,SwManagement=1,PiuType=SCB_R6"
)

SET
(
    mo "ManagedElement=1,Equipment=1,Subrack=2"
    exception none
    nrOfAttributes 1
    "switchModule" Ref "ManagedElement=1,SwitchFabric=1,SwitchModule=2"
)

