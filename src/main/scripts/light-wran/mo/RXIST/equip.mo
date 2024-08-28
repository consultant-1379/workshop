CREATE
(
    parent "ManagedElement=1"
    identity "1"
    moType Equipment
    exception none
    nrOfAttributes 2
    "EquipmentId" String "1"
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1"
    identity "1"
    moType Jvm
    exception none
    nrOfAttributes 14
    "JvmId" String "1"
    "admClasspath" Array Ref 0
    "admMain" String ""
    "admOptions" Array String 0
    "classpath" String ""
    "freeMemory" Integer 0
    "main" String ""
    "mopplets" Array String 0
    "options" String ""
    "properties" Array String 0
    "reliableProgramUniter" Ref "null"
    "reservedBySwAllocation" Array Ref 0
    "totalMemory" Integer 0
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1"
    identity "MS"
    moType Subrack
    exception none
    nrOfAttributes 11
    "SubrackId" String "MS"
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

    "productType" String ""
    "reservedBy" Array Ref 0
    "subrackPosition" String ""
    "subrackType" Integer 0
    "switchModule" Ref "null"
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=MS"
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
    //"upgradeGroupTypeName" String ""
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=MS"
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
    // "upgradeGroupId" Integer 0
    //"upgradeGroupTypeName" String ""
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=MS"
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
    // "upgradeGroupId" Integer 0
    //"upgradeGroupTypeName" String ""
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=MS"
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
    // "upgradeGroupId" Integer 0
    //"upgradeGroupTypeName" String ""
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=MS"
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
    // "upgradeGroupId" Integer 0
    //"upgradeGroupTypeName" String ""
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=MS"
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
    // "upgradeGroupId" Integer 0
    //"upgradeGroupTypeName" String ""
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=MS"
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
    // "upgradeGroupId" Integer 0
    //"upgradeGroupTypeName" String ""
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=MS"
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
    // "upgradeGroupId" Integer 0
    //"upgradeGroupTypeName" String ""
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=MS"
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
    // "upgradeGroupId" Integer 0
    //"upgradeGroupTypeName" String ""
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=MS"
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
    // "upgradeGroupId" Integer 0
    //"upgradeGroupTypeName" String ""
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=MS"
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
    //"upgradeGroupTypeName" String ""
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=MS"
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
    //"upgradeGroupTypeName" String ""
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=MS"
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
    //"upgradeGroupTypeName" String ""
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=MS"
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
    //"upgradeGroupTypeName" String ""
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=MS"
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
    //"upgradeGroupTypeName" String ""
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=MS"
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
    //"upgradeGroupTypeName" String ""
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=MS"
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
    //"upgradeGroupTypeName" String ""
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=MS"
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
    //"upgradeGroupTypeName" String ""
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=MS"
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
    //"upgradeGroupTypeName" String ""
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=MS"
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
    //"upgradeGroupTypeName" String ""
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=MS"
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
    //"upgradeGroupTypeName" String ""
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=MS"
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
    //"upgradeGroupTypeName" String ""
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=MS"
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
    //"upgradeGroupTypeName" String ""
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=MS"
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
    //"upgradeGroupTypeName" String ""
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=MS"
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
    //"upgradeGroupTypeName" String ""
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=MS"
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
    //"upgradeGroupTypeName" String ""
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=MS"
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
    //"upgradeGroupTypeName" String ""
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=MS"
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
    //"upgradeGroupTypeName" String ""
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=MS,Slot=28"
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
    parent "ManagedElement=1,Equipment=1,Subrack=MS,Slot=28,PlugInUnit=1"
    identity "1"
    moType ExchangeTerminal
    exception none
    nrOfAttributes 5
    "ExchangeTerminalId" String "1"
    "availabilityStatus" Integer 1
    "description" Struct
        nrOfElements 5
        "aal2LayerDescription" String ""
        "atmLayerDescription" String ""
        "etType" String ""
        "physicalLayerDescription" String ""
        "tdmSupport" String ""

    "operationalState" Integer 0
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=MS,Slot=28,PlugInUnit=1,ExchangeTerminal=1"
    identity "1"
    moType E1PhysPathTerm
    exception none
    nrOfAttributes 21
    "E1PhysPathTermId" String "1"
    "administrativeState" Integer 0
    "aisReporting" Boolean false
    "availabilityStatus" Integer 1
    "crc4Mode" Integer 2
    "currentPmRegister" Array String 0
    "degDegM" Integer 7
    "degDegThr" Integer 30
    "idlePattern" Integer 0
    "lineNo" Integer 1
    "loopback" Integer 0
    "operationalState" Integer 0
    "pmEs" Integer 0
    "pmSes" Integer 0
    "pmUas" Integer 0
    "rdiReporting" Boolean false
    "reservedByImaLink" Ref "null"
    "reservedBySync" Ref "null"
    "reservedByTraffic" Ref "null"
    "shutDownTimeout" Integer 1800
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=MS,Slot=28,PlugInUnit=1,ExchangeTerminal=1"
    identity "2"
    moType E1PhysPathTerm
    exception none
    nrOfAttributes 21
    "E1PhysPathTermId" String "2"
    "administrativeState" Integer 0
    "aisReporting" Boolean false
    "availabilityStatus" Integer 1
    "crc4Mode" Integer 2
    "currentPmRegister" Array String 0
    "degDegM" Integer 7
    "degDegThr" Integer 30
    "idlePattern" Integer 0
    "lineNo" Integer 1
    "loopback" Integer 0
    "operationalState" Integer 0
    "pmEs" Integer 0
    "pmSes" Integer 0
    "pmUas" Integer 0
    "rdiReporting" Boolean false
    "reservedByImaLink" Ref "null"
    "reservedBySync" Ref "null"
    "reservedByTraffic" Ref "null"
    "shutDownTimeout" Integer 1800
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=MS,Slot=28,PlugInUnit=1,ExchangeTerminal=1"
    identity "3"
    moType E1PhysPathTerm
    exception none
    nrOfAttributes 21
    "E1PhysPathTermId" String "3"
    "administrativeState" Integer 0
    "aisReporting" Boolean false
    "availabilityStatus" Integer 1
    "crc4Mode" Integer 2
    "currentPmRegister" Array String 0
    "degDegM" Integer 7
    "degDegThr" Integer 30
    "idlePattern" Integer 0
    "lineNo" Integer 1
    "loopback" Integer 0
    "operationalState" Integer 0
    "pmEs" Integer 0
    "pmSes" Integer 0
    "pmUas" Integer 0
    "rdiReporting" Boolean false
    "reservedByImaLink" Ref "null"
    "reservedBySync" Ref "null"
    "reservedByTraffic" Ref "null"
    "shutDownTimeout" Integer 1800
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=MS,Slot=28,PlugInUnit=1,ExchangeTerminal=1"
    identity "4"
    moType E1PhysPathTerm
    exception none
    nrOfAttributes 21
    "E1PhysPathTermId" String "4"
    "administrativeState" Integer 0
    "aisReporting" Boolean false
    "availabilityStatus" Integer 1
    "crc4Mode" Integer 2
    "currentPmRegister" Array String 0
    "degDegM" Integer 7
    "degDegThr" Integer 30
    "idlePattern" Integer 0
    "lineNo" Integer 1
    "loopback" Integer 0
    "operationalState" Integer 0
    "pmEs" Integer 0
    "pmSes" Integer 0
    "pmUas" Integer 0
    "rdiReporting" Boolean false
    "reservedByImaLink" Ref "null"
    "reservedBySync" Ref "null"
    "reservedByTraffic" Ref "null"
    "shutDownTimeout" Integer 1800
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=MS,Slot=28,PlugInUnit=1,ExchangeTerminal=1"
    identity "5"
    moType E1PhysPathTerm
    exception none
    nrOfAttributes 21
    "E1PhysPathTermId" String "5"
    "administrativeState" Integer 0
    "aisReporting" Boolean false
    "availabilityStatus" Integer 1
    "crc4Mode" Integer 2
    "currentPmRegister" Array String 0
    "degDegM" Integer 7
    "degDegThr" Integer 30
    "idlePattern" Integer 0
    "lineNo" Integer 1
    "loopback" Integer 0
    "operationalState" Integer 0
    "pmEs" Integer 0
    "pmSes" Integer 0
    "pmUas" Integer 0
    "rdiReporting" Boolean false
    "reservedByImaLink" Ref "null"
    "reservedBySync" Ref "null"
    "reservedByTraffic" Ref "null"
    "shutDownTimeout" Integer 1800
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=MS,Slot=28,PlugInUnit=1,ExchangeTerminal=1"
    identity "6"
    moType E1PhysPathTerm
    exception none
    nrOfAttributes 21
    "E1PhysPathTermId" String "6"
    "administrativeState" Integer 0
    "aisReporting" Boolean false
    "availabilityStatus" Integer 1
    "crc4Mode" Integer 2
    "currentPmRegister" Array String 0
    "degDegM" Integer 7
    "degDegThr" Integer 30
    "idlePattern" Integer 0
    "lineNo" Integer 1
    "loopback" Integer 0
    "operationalState" Integer 0
    "pmEs" Integer 0
    "pmSes" Integer 0
    "pmUas" Integer 0
    "rdiReporting" Boolean false
    "reservedByImaLink" Ref "null"
    "reservedBySync" Ref "null"
    "reservedByTraffic" Ref "null"
    "shutDownTimeout" Integer 1800
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=MS,Slot=28,PlugInUnit=1,ExchangeTerminal=1"
    identity "7"
    moType E1PhysPathTerm
    exception none
    nrOfAttributes 21
    "E1PhysPathTermId" String "7"
    "administrativeState" Integer 0
    "aisReporting" Boolean false
    "availabilityStatus" Integer 1
    "crc4Mode" Integer 2
    "currentPmRegister" Array String 0
    "degDegM" Integer 7
    "degDegThr" Integer 30
    "idlePattern" Integer 0
    "lineNo" Integer 1
    "loopback" Integer 0
    "operationalState" Integer 0
    "pmEs" Integer 0
    "pmSes" Integer 0
    "pmUas" Integer 0
    "rdiReporting" Boolean false
    "reservedByImaLink" Ref "null"
    "reservedBySync" Ref "null"
    "reservedByTraffic" Ref "null"
    "shutDownTimeout" Integer 1800
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=MS,Slot=28,PlugInUnit=1,ExchangeTerminal=1"
    identity "8"
    moType E1PhysPathTerm
    exception none
    nrOfAttributes 21
    "E1PhysPathTermId" String "8"
    "administrativeState" Integer 0
    "aisReporting" Boolean false
    "availabilityStatus" Integer 1
    "crc4Mode" Integer 2
    "currentPmRegister" Array String 0
    "degDegM" Integer 7
    "degDegThr" Integer 30
    "idlePattern" Integer 0
    "lineNo" Integer 1
    "loopback" Integer 0
    "operationalState" Integer 0
    "pmEs" Integer 0
    "pmSes" Integer 0
    "pmUas" Integer 0
    "rdiReporting" Boolean false
    "reservedByImaLink" Ref "null"
    "reservedBySync" Ref "null"
    "reservedByTraffic" Ref "null"
    "shutDownTimeout" Integer 1800
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=MS,Slot=14"
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
    parent "ManagedElement=1,Equipment=1,Subrack=MS,Slot=15"
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

SET
(
    mo "ManagedElement=1,Equipment=1,Jvm=1"
    exception none
    nrOfAttributes 1
    "admClasspath" Array Ref 1
        "ManagedElement=1,SwManagement=1,LoadModule=asms"
)

