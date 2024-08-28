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

    "productType" String ""
    "reservedBy" Array Ref 0
    "subrackPosition" String ""
    "subrackType" Integer 0
    "switchModule" Ref "null"
    "userLabel" String ""
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
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=2"
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
    "startState" Integer 1
    "userLabel" String ""
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
    "startState" Integer 1
    "userLabel" String ""
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
    "startState" Integer 1
    "userLabel" String ""
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
    "startState" Integer 1
    "userLabel" String ""
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
    "startState" Integer 1
    "userLabel" String ""
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
    "startState" Integer 1
    "userLabel" String ""
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
    "startState" Integer 1
    "userLabel" String ""
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
    "startState" Integer 1
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=2,PlugInUnit=1"
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
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=2,PlugInUnit=1,ExchangeTerminal=1"
    identity "pp1"
    moType E1PhysPathTerm
    exception none
    nrOfAttributes 21
    "E1PhysPathTermId" String "pp1"
    "administrativeState" Integer 1
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
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=2,PlugInUnit=1,ExchangeTerminal=1"
    identity "pp2"
    moType E1PhysPathTerm
    exception none
    nrOfAttributes 21
    "E1PhysPathTermId" String "pp2"
    "administrativeState" Integer 1
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
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=2,PlugInUnit=1,ExchangeTerminal=1"
    identity "pp3"
    moType E1PhysPathTerm
    exception none
    nrOfAttributes 21
    "E1PhysPathTermId" String "pp3"
    "administrativeState" Integer 1
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
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=2,PlugInUnit=1,ExchangeTerminal=1"
    identity "pp4"
    moType E1PhysPathTerm
    exception none
    nrOfAttributes 21
    "E1PhysPathTermId" String "pp4"
    "administrativeState" Integer 1
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
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=2,PlugInUnit=1,ExchangeTerminal=1"
    identity "pp5"
    moType E1PhysPathTerm
    exception none
    nrOfAttributes 21
    "E1PhysPathTermId" String "pp5"
    "administrativeState" Integer 1
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
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=2,PlugInUnit=1,ExchangeTerminal=1"
    identity "pp6"
    moType E1PhysPathTerm
    exception none
    nrOfAttributes 21
    "E1PhysPathTermId" String "pp6"
    "administrativeState" Integer 1
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
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=2,PlugInUnit=1,ExchangeTerminal=1"
    identity "pp7"
    moType E1PhysPathTerm
    exception none
    nrOfAttributes 21
    "E1PhysPathTermId" String "pp7"
    "administrativeState" Integer 1
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
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=2,PlugInUnit=1,ExchangeTerminal=1"
    identity "pp8"
    moType E1PhysPathTerm
    exception none
    nrOfAttributes 21
    "E1PhysPathTermId" String "pp8"
    "administrativeState" Integer 1
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
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=2,PlugInUnit=1,ExchangeTerminal=1,E1PhysPathTerm=pp1"
    identity "1"
    moType Ds0Bundle
    exception none
    nrOfAttributes 7
    "Ds0BundleId" String "1"
    "availabilityStatus" Integer 1
    "listOfTimeSlots" Array Integer 0
    "operationalState" Integer 0
    "reservedBy" Ref "null"
    "tdmMode" Boolean true
    "userLabel" String ""
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

SET
(
    mo "ManagedElement=1,Equipment=1,Subrack=1,Slot=2,PlugInUnit=1"
    exception none
    nrOfAttributes 1
    "piuType" Ref "ManagedElement=1,SwManagement=1,PiuType=ETM1_R6"
)

