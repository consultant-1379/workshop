CREATE
(
    parent "ManagedElement=1"
    identity "1"
    moType TransportNetwork
    exception none
    nrOfAttributes 2
    "TransportNetworkId" String "1"
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,TransportNetwork=1"
    identity "1"
    moType Synchronization
    exception none
    nrOfAttributes 9
    "SynchronizationId" String "1"
    "degradationIsFault" Integer 0
    "syncRefActivity" Array Integer 0
    "syncRefPriority" Array Integer 1
        0
    "syncRefStatus" Array Integer 0
    "syncReference" Array Ref 0
    "systemClockA" Integer 0
    "systemClockB" Integer 0
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,TransportNetwork=1"
    identity "1-1-1"
    moType AtmPort
    exception none
    nrOfAttributes 10
    "AtmPortId" String "1-1-1"
    "availabilityStatus" Integer 1
    "hecCorrectionMode" Boolean true
    "operationalState" Integer 0
    "pmReceivedAtmCells" Integer 0
    "pmSecondsWithUnexp" Integer 0
    "pmTransmittedAtmCells" Integer 0
    "userLabel" String "1-1-1"
    "uses" Ref "null"
    "valueOfLastCellWithUnexp" Struct
        nrOfElements 3
        "vpi" Integer 0
        "vci" Integer 0
        "pti" Integer 0

)

CREATE
(
    parent "ManagedElement=1,TransportNetwork=1"
    identity "1-1-2"
    moType AtmPort
    exception none
    nrOfAttributes 10
    "AtmPortId" String "1-1-2"
    "availabilityStatus" Integer 1
    "hecCorrectionMode" Boolean true
    "operationalState" Integer 0
    "pmReceivedAtmCells" Integer 0
    "pmSecondsWithUnexp" Integer 0
    "pmTransmittedAtmCells" Integer 0
    "userLabel" String "1-1-2"
    "uses" Ref "null"
    "valueOfLastCellWithUnexp" Struct
        nrOfElements 3
        "vpi" Integer 0
        "vci" Integer 0
        "pti" Integer 0

)

CREATE
(
    parent "ManagedElement=1,TransportNetwork=1"
    identity "1-1-3"
    moType AtmPort
    exception none
    nrOfAttributes 10
    "AtmPortId" String "1-1-3"
    "availabilityStatus" Integer 1
    "hecCorrectionMode" Boolean true
    "operationalState" Integer 0
    "pmReceivedAtmCells" Integer 0
    "pmSecondsWithUnexp" Integer 0
    "pmTransmittedAtmCells" Integer 0
    "userLabel" String "1-1-3"
    "uses" Ref "null"
    "valueOfLastCellWithUnexp" Struct
        nrOfElements 3
        "vpi" Integer 0
        "vci" Integer 0
        "pti" Integer 0

)

CREATE
(
    parent "ManagedElement=1,TransportNetwork=1"
    identity "1-1-4"
    moType AtmPort
    exception none
    nrOfAttributes 10
    "AtmPortId" String "1-1-4"
    "availabilityStatus" Integer 1
    "hecCorrectionMode" Boolean true
    "operationalState" Integer 0
    "pmReceivedAtmCells" Integer 0
    "pmSecondsWithUnexp" Integer 0
    "pmTransmittedAtmCells" Integer 0
    "userLabel" String "1-1-4"
    "uses" Ref "null"
    "valueOfLastCellWithUnexp" Struct
        nrOfElements 3
        "vpi" Integer 0
        "vci" Integer 0
        "pti" Integer 0

)

CREATE
(
    parent "ManagedElement=1,TransportNetwork=1"
    identity "1-1-5"
    moType AtmPort
    exception none
    nrOfAttributes 10
    "AtmPortId" String "1-1-5"
    "availabilityStatus" Integer 1
    "hecCorrectionMode" Boolean true
    "operationalState" Integer 0
    "pmReceivedAtmCells" Integer 0
    "pmSecondsWithUnexp" Integer 0
    "pmTransmittedAtmCells" Integer 0
    "userLabel" String "1-1-5"
    "uses" Ref "null"
    "valueOfLastCellWithUnexp" Struct
        nrOfElements 3
        "vpi" Integer 0
        "vci" Integer 0
        "pti" Integer 0

)

CREATE
(
    parent "ManagedElement=1,TransportNetwork=1"
    identity "1-1-6"
    moType AtmPort
    exception none
    nrOfAttributes 10
    "AtmPortId" String "1-1-6"
    "availabilityStatus" Integer 1
    "hecCorrectionMode" Boolean true
    "operationalState" Integer 0
    "pmReceivedAtmCells" Integer 0
    "pmSecondsWithUnexp" Integer 0
    "pmTransmittedAtmCells" Integer 0
    "userLabel" String "1-1-6"
    "uses" Ref "null"
    "valueOfLastCellWithUnexp" Struct
        nrOfElements 3
        "vpi" Integer 0
        "vci" Integer 0
        "pti" Integer 0

)

CREATE
(
    parent "ManagedElement=1,TransportNetwork=1"
    identity "1-1-7"
    moType AtmPort
    exception none
    nrOfAttributes 10
    "AtmPortId" String "1-1-7"
    "availabilityStatus" Integer 1
    "hecCorrectionMode" Boolean true
    "operationalState" Integer 0
    "pmReceivedAtmCells" Integer 0
    "pmSecondsWithUnexp" Integer 0
    "pmTransmittedAtmCells" Integer 0
    "userLabel" String "1-1-7"
    "uses" Ref "null"
    "valueOfLastCellWithUnexp" Struct
        nrOfElements 3
        "vpi" Integer 0
        "vci" Integer 0
        "pti" Integer 0

)

CREATE
(
    parent "ManagedElement=1,TransportNetwork=1"
    identity "1-1-8"
    moType AtmPort
    exception none
    nrOfAttributes 10
    "AtmPortId" String "1-1-8"
    "availabilityStatus" Integer 1
    "hecCorrectionMode" Boolean true
    "operationalState" Integer 0
    "pmReceivedAtmCells" Integer 0
    "pmSecondsWithUnexp" Integer 0
    "pmTransmittedAtmCells" Integer 0
    "userLabel" String "1-1-8"
    "uses" Ref "null"
    "valueOfLastCellWithUnexp" Struct
        nrOfElements 3
        "vpi" Integer 0
        "vci" Integer 0
        "pti" Integer 0

)

CREATE
(
    parent "ManagedElement=1,TransportNetwork=1"
    identity "1"
    moType Aal2Sp
    exception none
    nrOfAttributes 4
    "Aal2SpId" String "1"
    "a2ea" String "1"
    "pmUnsuccessfulConnsInternal" Integer 0
    "userLabel" String ""
)

SET
(
    mo "ManagedElement=1,TransportNetwork=1,AtmPort=1-1-8"
    exception none
    nrOfAttributes 1
    "uses" Ref "ManagedElement=1,Equipment=1,Subrack=1,Slot=2,PlugInUnit=1,ExchangeTerminal=1,E1PhysPathTerm=pp8"
)

SET
(
    mo "ManagedElement=1,TransportNetwork=1,AtmPort=1-1-7"
    exception none
    nrOfAttributes 1
    "uses" Ref "ManagedElement=1,Equipment=1,Subrack=1,Slot=2,PlugInUnit=1,ExchangeTerminal=1,E1PhysPathTerm=pp7"
)

SET
(
    mo "ManagedElement=1,TransportNetwork=1,AtmPort=1-1-6"
    exception none
    nrOfAttributes 1
    "uses" Ref "ManagedElement=1,Equipment=1,Subrack=1,Slot=2,PlugInUnit=1,ExchangeTerminal=1,E1PhysPathTerm=pp6"
)

SET
(
    mo "ManagedElement=1,TransportNetwork=1,AtmPort=1-1-5"
    exception none
    nrOfAttributes 1
    "uses" Ref "ManagedElement=1,Equipment=1,Subrack=1,Slot=2,PlugInUnit=1,ExchangeTerminal=1,E1PhysPathTerm=pp5"
)

SET
(
    mo "ManagedElement=1,TransportNetwork=1,AtmPort=1-1-4"
    exception none
    nrOfAttributes 1
    "uses" Ref "ManagedElement=1,Equipment=1,Subrack=1,Slot=2,PlugInUnit=1,ExchangeTerminal=1,E1PhysPathTerm=pp4"
)

SET
(
    mo "ManagedElement=1,TransportNetwork=1,AtmPort=1-1-3"
    exception none
    nrOfAttributes 1
    "uses" Ref "ManagedElement=1,Equipment=1,Subrack=1,Slot=2,PlugInUnit=1,ExchangeTerminal=1,E1PhysPathTerm=pp3"
)

SET
(
    mo "ManagedElement=1,TransportNetwork=1,AtmPort=1-1-2"
    exception none
    nrOfAttributes 1
    "uses" Ref "ManagedElement=1,Equipment=1,Subrack=1,Slot=2,PlugInUnit=1,ExchangeTerminal=1,E1PhysPathTerm=pp2"
)

SET
(
    mo "ManagedElement=1,TransportNetwork=1,AtmPort=1-1-1"
    exception none
    nrOfAttributes 1
    "uses" Ref "ManagedElement=1,Equipment=1,Subrack=1,Slot=2,PlugInUnit=1,ExchangeTerminal=1,E1PhysPathTerm=pp1"
)

