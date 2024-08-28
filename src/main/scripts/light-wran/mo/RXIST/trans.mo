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
    identity "1"
    moType Aal2Sp
    exception none
    nrOfAttributes 4
    "Aal2SpId" String "1"
    "a2ea" String ""
    "pmUnsuccessfulConnsInternal" Integer 0
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,TransportNetwork=1"
    identity "MS-24-1"
    moType AtmPort
    exception none
    nrOfAttributes 10
    "AtmPortId" String "MS-24-1"
    "availabilityStatus" Integer 1
    "hecCorrectionMode" Boolean true
    "operationalState" Integer 0
    "pmReceivedAtmCells" Integer 0
    "pmSecondsWithUnexp" Integer 0
    "pmTransmittedAtmCells" Integer 0
    "userLabel" String ""
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
    identity "MS-24-2"
    moType AtmPort
    exception none
    nrOfAttributes 10
    "AtmPortId" String "MS-24-2"
    "availabilityStatus" Integer 1
    "hecCorrectionMode" Boolean true
    "operationalState" Integer 0
    "pmReceivedAtmCells" Integer 0
    "pmSecondsWithUnexp" Integer 0
    "pmTransmittedAtmCells" Integer 0
    "userLabel" String ""
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
    identity "MS-24-3"
    moType AtmPort
    exception none
    nrOfAttributes 10
    "AtmPortId" String "MS-24-3"
    "availabilityStatus" Integer 1
    "hecCorrectionMode" Boolean true
    "operationalState" Integer 0
    "pmReceivedAtmCells" Integer 0
    "pmSecondsWithUnexp" Integer 0
    "pmTransmittedAtmCells" Integer 0
    "userLabel" String ""
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
    identity "MS-24-4"
    moType AtmPort
    exception none
    nrOfAttributes 10
    "AtmPortId" String "MS-24-4"
    "availabilityStatus" Integer 1
    "hecCorrectionMode" Boolean true
    "operationalState" Integer 0
    "pmReceivedAtmCells" Integer 0
    "pmSecondsWithUnexp" Integer 0
    "pmTransmittedAtmCells" Integer 0
    "userLabel" String ""
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
    identity "MS-24-5"
    moType AtmPort
    exception none
    nrOfAttributes 10
    "AtmPortId" String "MS-24-5"
    "availabilityStatus" Integer 1
    "hecCorrectionMode" Boolean true
    "operationalState" Integer 0
    "pmReceivedAtmCells" Integer 0
    "pmSecondsWithUnexp" Integer 0
    "pmTransmittedAtmCells" Integer 0
    "userLabel" String ""
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
    identity "MS-24-6"
    moType AtmPort
    exception none
    nrOfAttributes 10
    "AtmPortId" String "MS-24-6"
    "availabilityStatus" Integer 1
    "hecCorrectionMode" Boolean true
    "operationalState" Integer 0
    "pmReceivedAtmCells" Integer 0
    "pmSecondsWithUnexp" Integer 0
    "pmTransmittedAtmCells" Integer 0
    "userLabel" String ""
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
    identity "MS-24-7"
    moType AtmPort
    exception none
    nrOfAttributes 10
    "AtmPortId" String "MS-24-7"
    "availabilityStatus" Integer 1
    "hecCorrectionMode" Boolean true
    "operationalState" Integer 0
    "pmReceivedAtmCells" Integer 0
    "pmSecondsWithUnexp" Integer 0
    "pmTransmittedAtmCells" Integer 0
    "userLabel" String ""
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
    identity "MS-24-8"
    moType AtmPort
    exception none
    nrOfAttributes 10
    "AtmPortId" String "MS-24-8"
    "availabilityStatus" Integer 1
    "hecCorrectionMode" Boolean true
    "operationalState" Integer 0
    "pmReceivedAtmCells" Integer 0
    "pmSecondsWithUnexp" Integer 0
    "pmTransmittedAtmCells" Integer 0
    "userLabel" String ""
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
    identity "MS-25-1"
    moType AtmPort
    exception none
    nrOfAttributes 10
    "AtmPortId" String "MS-25-1"
    "availabilityStatus" Integer 1
    "hecCorrectionMode" Boolean true
    "operationalState" Integer 0
    "pmReceivedAtmCells" Integer 0
    "pmSecondsWithUnexp" Integer 0
    "pmTransmittedAtmCells" Integer 0
    "userLabel" String ""
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
    identity "MS-25-2"
    moType AtmPort
    exception none
    nrOfAttributes 10
    "AtmPortId" String "MS-25-2"
    "availabilityStatus" Integer 1
    "hecCorrectionMode" Boolean true
    "operationalState" Integer 0
    "pmReceivedAtmCells" Integer 0
    "pmSecondsWithUnexp" Integer 0
    "pmTransmittedAtmCells" Integer 0
    "userLabel" String ""
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
    identity "MS-25-3"
    moType AtmPort
    exception none
    nrOfAttributes 10
    "AtmPortId" String "MS-25-3"
    "availabilityStatus" Integer 1
    "hecCorrectionMode" Boolean true
    "operationalState" Integer 0
    "pmReceivedAtmCells" Integer 0
    "pmSecondsWithUnexp" Integer 0
    "pmTransmittedAtmCells" Integer 0
    "userLabel" String ""
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
    identity "MS-25-4"
    moType AtmPort
    exception none
    nrOfAttributes 10
    "AtmPortId" String "MS-25-4"
    "availabilityStatus" Integer 1
    "hecCorrectionMode" Boolean true
    "operationalState" Integer 0
    "pmReceivedAtmCells" Integer 0
    "pmSecondsWithUnexp" Integer 0
    "pmTransmittedAtmCells" Integer 0
    "userLabel" String ""
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
    identity "MS-25-5"
    moType AtmPort
    exception none
    nrOfAttributes 10
    "AtmPortId" String "MS-25-5"
    "availabilityStatus" Integer 1
    "hecCorrectionMode" Boolean true
    "operationalState" Integer 0
    "pmReceivedAtmCells" Integer 0
    "pmSecondsWithUnexp" Integer 0
    "pmTransmittedAtmCells" Integer 0
    "userLabel" String ""
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
    identity "MS-25-6"
    moType AtmPort
    exception none
    nrOfAttributes 10
    "AtmPortId" String "MS-25-6"
    "availabilityStatus" Integer 1
    "hecCorrectionMode" Boolean true
    "operationalState" Integer 0
    "pmReceivedAtmCells" Integer 0
    "pmSecondsWithUnexp" Integer 0
    "pmTransmittedAtmCells" Integer 0
    "userLabel" String ""
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
    identity "MS-25-7"
    moType AtmPort
    exception none
    nrOfAttributes 10
    "AtmPortId" String "MS-25-7"
    "availabilityStatus" Integer 1
    "hecCorrectionMode" Boolean true
    "operationalState" Integer 0
    "pmReceivedAtmCells" Integer 0
    "pmSecondsWithUnexp" Integer 0
    "pmTransmittedAtmCells" Integer 0
    "userLabel" String ""
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
    identity "MS-25-8"
    moType AtmPort
    exception none
    nrOfAttributes 10
    "AtmPortId" String "MS-25-8"
    "availabilityStatus" Integer 1
    "hecCorrectionMode" Boolean true
    "operationalState" Integer 0
    "pmReceivedAtmCells" Integer 0
    "pmSecondsWithUnexp" Integer 0
    "pmTransmittedAtmCells" Integer 0
    "userLabel" String ""
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
    identity "MS-26-1"
    moType AtmPort
    exception none
    nrOfAttributes 10
    "AtmPortId" String "MS-26-1"
    "availabilityStatus" Integer 1
    "hecCorrectionMode" Boolean true
    "operationalState" Integer 0
    "pmReceivedAtmCells" Integer 0
    "pmSecondsWithUnexp" Integer 0
    "pmTransmittedAtmCells" Integer 0
    "userLabel" String ""
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
    identity "MS-26-2"
    moType AtmPort
    exception none
    nrOfAttributes 10
    "AtmPortId" String "MS-26-2"
    "availabilityStatus" Integer 1
    "hecCorrectionMode" Boolean true
    "operationalState" Integer 0
    "pmReceivedAtmCells" Integer 0
    "pmSecondsWithUnexp" Integer 0
    "pmTransmittedAtmCells" Integer 0
    "userLabel" String ""
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
    identity "MS-26-3"
    moType AtmPort
    exception none
    nrOfAttributes 10
    "AtmPortId" String "MS-26-3"
    "availabilityStatus" Integer 1
    "hecCorrectionMode" Boolean true
    "operationalState" Integer 0
    "pmReceivedAtmCells" Integer 0
    "pmSecondsWithUnexp" Integer 0
    "pmTransmittedAtmCells" Integer 0
    "userLabel" String ""
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
    identity "MS-26-4"
    moType AtmPort
    exception none
    nrOfAttributes 10
    "AtmPortId" String "MS-26-4"
    "availabilityStatus" Integer 1
    "hecCorrectionMode" Boolean true
    "operationalState" Integer 0
    "pmReceivedAtmCells" Integer 0
    "pmSecondsWithUnexp" Integer 0
    "pmTransmittedAtmCells" Integer 0
    "userLabel" String ""
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
    identity "MS-26-5"
    moType AtmPort
    exception none
    nrOfAttributes 10
    "AtmPortId" String "MS-26-5"
    "availabilityStatus" Integer 1
    "hecCorrectionMode" Boolean true
    "operationalState" Integer 0
    "pmReceivedAtmCells" Integer 0
    "pmSecondsWithUnexp" Integer 0
    "pmTransmittedAtmCells" Integer 0
    "userLabel" String ""
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
    identity "MS-26-6"
    moType AtmPort
    exception none
    nrOfAttributes 10
    "AtmPortId" String "MS-26-6"
    "availabilityStatus" Integer 1
    "hecCorrectionMode" Boolean true
    "operationalState" Integer 0
    "pmReceivedAtmCells" Integer 0
    "pmSecondsWithUnexp" Integer 0
    "pmTransmittedAtmCells" Integer 0
    "userLabel" String ""
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
    identity "MS-26-7"
    moType AtmPort
    exception none
    nrOfAttributes 10
    "AtmPortId" String "MS-26-7"
    "availabilityStatus" Integer 1
    "hecCorrectionMode" Boolean true
    "operationalState" Integer 0
    "pmReceivedAtmCells" Integer 0
    "pmSecondsWithUnexp" Integer 0
    "pmTransmittedAtmCells" Integer 0
    "userLabel" String ""
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
    identity "MS-26-8"
    moType AtmPort
    exception none
    nrOfAttributes 10
    "AtmPortId" String "MS-26-8"
    "availabilityStatus" Integer 1
    "hecCorrectionMode" Boolean true
    "operationalState" Integer 0
    "pmReceivedAtmCells" Integer 0
    "pmSecondsWithUnexp" Integer 0
    "pmTransmittedAtmCells" Integer 0
    "userLabel" String ""
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
    identity "MS-27-1"
    moType AtmPort
    exception none
    nrOfAttributes 10
    "AtmPortId" String "MS-27-1"
    "availabilityStatus" Integer 1
    "hecCorrectionMode" Boolean true
    "operationalState" Integer 0
    "pmReceivedAtmCells" Integer 0
    "pmSecondsWithUnexp" Integer 0
    "pmTransmittedAtmCells" Integer 0
    "userLabel" String ""
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
    identity "MS-27-2"
    moType AtmPort
    exception none
    nrOfAttributes 10
    "AtmPortId" String "MS-27-2"
    "availabilityStatus" Integer 1
    "hecCorrectionMode" Boolean true
    "operationalState" Integer 0
    "pmReceivedAtmCells" Integer 0
    "pmSecondsWithUnexp" Integer 0
    "pmTransmittedAtmCells" Integer 0
    "userLabel" String ""
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
    identity "MS-27-3"
    moType AtmPort
    exception none
    nrOfAttributes 10
    "AtmPortId" String "MS-27-3"
    "availabilityStatus" Integer 1
    "hecCorrectionMode" Boolean true
    "operationalState" Integer 0
    "pmReceivedAtmCells" Integer 0
    "pmSecondsWithUnexp" Integer 0
    "pmTransmittedAtmCells" Integer 0
    "userLabel" String ""
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
    identity "MS-27-4"
    moType AtmPort
    exception none
    nrOfAttributes 10
    "AtmPortId" String "MS-27-4"
    "availabilityStatus" Integer 1
    "hecCorrectionMode" Boolean true
    "operationalState" Integer 0
    "pmReceivedAtmCells" Integer 0
    "pmSecondsWithUnexp" Integer 0
    "pmTransmittedAtmCells" Integer 0
    "userLabel" String ""
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
    identity "MS-27-5"
    moType AtmPort
    exception none
    nrOfAttributes 10
    "AtmPortId" String "MS-27-5"
    "availabilityStatus" Integer 1
    "hecCorrectionMode" Boolean true
    "operationalState" Integer 0
    "pmReceivedAtmCells" Integer 0
    "pmSecondsWithUnexp" Integer 0
    "pmTransmittedAtmCells" Integer 0
    "userLabel" String ""
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
    identity "MS-27-6"
    moType AtmPort
    exception none
    nrOfAttributes 10
    "AtmPortId" String "MS-27-6"
    "availabilityStatus" Integer 1
    "hecCorrectionMode" Boolean true
    "operationalState" Integer 0
    "pmReceivedAtmCells" Integer 0
    "pmSecondsWithUnexp" Integer 0
    "pmTransmittedAtmCells" Integer 0
    "userLabel" String ""
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
    identity "MS-27-7"
    moType AtmPort
    exception none
    nrOfAttributes 10
    "AtmPortId" String "MS-27-7"
    "availabilityStatus" Integer 1
    "hecCorrectionMode" Boolean true
    "operationalState" Integer 0
    "pmReceivedAtmCells" Integer 0
    "pmSecondsWithUnexp" Integer 0
    "pmTransmittedAtmCells" Integer 0
    "userLabel" String ""
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
    identity "MS-27-8"
    moType AtmPort
    exception none
    nrOfAttributes 10
    "AtmPortId" String "MS-27-8"
    "availabilityStatus" Integer 1
    "hecCorrectionMode" Boolean true
    "operationalState" Integer 0
    "pmReceivedAtmCells" Integer 0
    "pmSecondsWithUnexp" Integer 0
    "pmTransmittedAtmCells" Integer 0
    "userLabel" String ""
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
    identity "MS-28-1"
    moType AtmPort
    exception none
    nrOfAttributes 10
    "AtmPortId" String "MS-28-1"
    "availabilityStatus" Integer 1
    "hecCorrectionMode" Boolean true
    "operationalState" Integer 0
    "pmReceivedAtmCells" Integer 0
    "pmSecondsWithUnexp" Integer 0
    "pmTransmittedAtmCells" Integer 0
    "userLabel" String ""
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
    identity "MS-28-2"
    moType AtmPort
    exception none
    nrOfAttributes 10
    "AtmPortId" String "MS-28-2"
    "availabilityStatus" Integer 1
    "hecCorrectionMode" Boolean true
    "operationalState" Integer 0
    "pmReceivedAtmCells" Integer 0
    "pmSecondsWithUnexp" Integer 0
    "pmTransmittedAtmCells" Integer 0
    "userLabel" String ""
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
    identity "MS-28-3"
    moType AtmPort
    exception none
    nrOfAttributes 10
    "AtmPortId" String "MS-28-3"
    "availabilityStatus" Integer 1
    "hecCorrectionMode" Boolean true
    "operationalState" Integer 0
    "pmReceivedAtmCells" Integer 0
    "pmSecondsWithUnexp" Integer 0
    "pmTransmittedAtmCells" Integer 0
    "userLabel" String ""
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
    identity "MS-28-4"
    moType AtmPort
    exception none
    nrOfAttributes 10
    "AtmPortId" String "MS-28-4"
    "availabilityStatus" Integer 1
    "hecCorrectionMode" Boolean true
    "operationalState" Integer 0
    "pmReceivedAtmCells" Integer 0
    "pmSecondsWithUnexp" Integer 0
    "pmTransmittedAtmCells" Integer 0
    "userLabel" String ""
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
    identity "MS-28-5"
    moType AtmPort
    exception none
    nrOfAttributes 10
    "AtmPortId" String "MS-28-5"
    "availabilityStatus" Integer 1
    "hecCorrectionMode" Boolean true
    "operationalState" Integer 0
    "pmReceivedAtmCells" Integer 0
    "pmSecondsWithUnexp" Integer 0
    "pmTransmittedAtmCells" Integer 0
    "userLabel" String ""
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
    identity "MS-28-6"
    moType AtmPort
    exception none
    nrOfAttributes 10
    "AtmPortId" String "MS-28-6"
    "availabilityStatus" Integer 1
    "hecCorrectionMode" Boolean true
    "operationalState" Integer 0
    "pmReceivedAtmCells" Integer 0
    "pmSecondsWithUnexp" Integer 0
    "pmTransmittedAtmCells" Integer 0
    "userLabel" String ""
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
    identity "MS-28-7"
    moType AtmPort
    exception none
    nrOfAttributes 10
    "AtmPortId" String "MS-28-7"
    "availabilityStatus" Integer 1
    "hecCorrectionMode" Boolean true
    "operationalState" Integer 0
    "pmReceivedAtmCells" Integer 0
    "pmSecondsWithUnexp" Integer 0
    "pmTransmittedAtmCells" Integer 0
    "userLabel" String ""
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
    identity "MS-28-8"
    moType AtmPort
    exception none
    nrOfAttributes 10
    "AtmPortId" String "MS-28-8"
    "availabilityStatus" Integer 1
    "hecCorrectionMode" Boolean true
    "operationalState" Integer 0
    "pmReceivedAtmCells" Integer 0
    "pmSecondsWithUnexp" Integer 0
    "pmTransmittedAtmCells" Integer 0
    "userLabel" String ""
    "uses" Ref "null"
    "valueOfLastCellWithUnexp" Struct
        nrOfElements 3
        "vpi" Integer 0
        "vci" Integer 0
        "pti" Integer 0

)

