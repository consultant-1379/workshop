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
    //"pmReceivedAtmCells" Integer 0
    //"pmSecondsWithUnexp" Integer 0
    //"pmTransmittedAtmCells" Integer 0
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
    //"pmReceivedAtmCells" Integer 0
    //"pmSecondsWithUnexp" Integer 0
    //"pmTransmittedAtmCells" Integer 0
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
    //"pmReceivedAtmCells" Integer 0
    //"pmSecondsWithUnexp" Integer 0
    //"pmTransmittedAtmCells" Integer 0
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
    //"pmReceivedAtmCells" Integer 0
    //"pmSecondsWithUnexp" Integer 0
    //"pmTransmittedAtmCells" Integer 0
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
    //"pmReceivedAtmCells" Integer 0
    //"pmSecondsWithUnexp" Integer 0
    //"pmTransmittedAtmCells" Integer 0
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
    //"pmReceivedAtmCells" Integer 0
    //"pmSecondsWithUnexp" Integer 0
    //"pmTransmittedAtmCells" Integer 0
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
    //"pmReceivedAtmCells" Integer 0
    //"pmSecondsWithUnexp" Integer 0
    //"pmTransmittedAtmCells" Integer 0
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
    //"pmReceivedAtmCells" Integer 0
    //"pmSecondsWithUnexp" Integer 0
    //"pmTransmittedAtmCells" Integer 0
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
    //"pmUnsuccessfulConnsInternal" Integer 0
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,TransportNetwork=1"
    identity "C1P4528"
    moType AtmTrafficDescriptor
    exception none
    nrOfAttributes 11
    "AtmTrafficDescriptorId" String "C1P4528"
    "egressAtmMcr" Integer 0
    "egressAtmPcr" Integer 4528
    "egressAtmQos" Integer 1
    "ingressAtmMcr" Integer 0
    "ingressAtmPcr" Integer 4528
    "ingressAtmQos" Integer 1
    "packetDiscard" Boolean false
    "reservedBy" Array Ref 0
    "serviceCategory" Integer 1
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,TransportNetwork=1"
    identity "C1P5"
    moType AtmTrafficDescriptor
    exception none
    nrOfAttributes 11
    "AtmTrafficDescriptorId" String "C1P5"
    "egressAtmMcr" Integer 0
    "egressAtmPcr" Integer 5
    "egressAtmQos" Integer 1
    "ingressAtmMcr" Integer 0
    "ingressAtmPcr" Integer 5
    "ingressAtmQos" Integer 1
    "packetDiscard" Boolean false
    "reservedBy" Array Ref 0
    "serviceCategory" Integer 1
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,TransportNetwork=1"
    identity "C2P4000"
    moType AtmTrafficDescriptor
    exception none
    nrOfAttributes 11
    "AtmTrafficDescriptorId" String "C2P4000"
    "egressAtmMcr" Integer 0
    "egressAtmPcr" Integer 4000
    "egressAtmQos" Integer 1
    "ingressAtmMcr" Integer 0
    "ingressAtmPcr" Integer 4000
    "ingressAtmQos" Integer 1
    "packetDiscard" Boolean false
    "reservedBy" Array Ref 0
    "serviceCategory" Integer 1
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,TransportNetwork=1"
    identity "U3P1000M80"
    moType AtmTrafficDescriptor
    exception none
    nrOfAttributes 11
    "AtmTrafficDescriptorId" String "U3P1000M80"
    "egressAtmMcr" Integer 0
    "egressAtmPcr" Integer 1000
    "egressAtmQos" Integer 1
    "ingressAtmMcr" Integer 0
    "ingressAtmPcr" Integer 1000
    "ingressAtmQos" Integer 1
    "packetDiscard" Boolean false
    "reservedBy" Array Ref 0
    "serviceCategory" Integer 1
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,TransportNetwork=1,AtmPort=1-1-1"
    identity "Vp1"
    moType VplTp
    exception none
    nrOfAttributes 8
    "VplTpId" String "Vp1"
    "atmTrafficDescriptor" Ref "null"
    "availabilityStatus" Integer 1
    "externalVpi" Integer 1
    "operationalState" Integer 0
    //"pmReceivedAtmCells" Integer 0
    //"pmTransmittedAtmCells" Integer 0
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,TransportNetwork=1,AtmPort=1-1-1,VplTp=Vp1"
    identity "1"
    moType VpcTp
    exception none
    nrOfAttributes 16
    "VpcTpId" String "1"
    "alarmReport" Integer 2
    "availabilityStatus" Integer 1
    "continuityCheck" Boolean false
    "counterMode" Integer 0
    "nomPmBlkSize" Integer 1024
    "operationalState" Integer 0
    //"pmBwErrBlocks" Integer 0
    //"pmBwLostCells" Integer 0
    //"pmBwMissinsCells" Integer 0
    //"pmFwErrBlocks" Integer 0
    //"pmFwLostCells" Integer 0
    //"pmFwMissinsCells" Integer 0
    //"pmLostBrCells" Integer 0
    //"pmLostFpmCells" Integer 0
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,TransportNetwork=1,AtmPort=1-1-1,VplTp=Vp1,VpcTp=1"
    identity "vc34"
    moType VclTp
    exception none
    nrOfAttributes 9
    "VclTpId" String "vc34"
    "atmTrafficDescriptorId" Ref "null"
    "availabilityStatus" Integer 1
    "externalVci" Integer 34
    "operationalState" Integer 0
    //"pmReceivedAtmCells" Integer 0
    //"pmTransmittedAtmCells" Integer 0
    "reservedBy" Ref "null"
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,TransportNetwork=1,AtmPort=1-1-1,VplTp=Vp1,VpcTp=1"
    identity "vc35"
    moType VclTp
    exception none
    nrOfAttributes 9
    "VclTpId" String "vc35"
    "atmTrafficDescriptorId" Ref "null"
    "availabilityStatus" Integer 1
    "externalVci" Integer 35
    "operationalState" Integer 0
    //"pmReceivedAtmCells" Integer 0
    //"pmTransmittedAtmCells" Integer 0
    "reservedBy" Ref "null"
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,TransportNetwork=1,AtmPort=1-1-1,VplTp=Vp1,VpcTp=1"
    identity "vc36"
    moType VclTp
    exception none
    nrOfAttributes 9
    "VclTpId" String "vc36"
    "atmTrafficDescriptorId" Ref "null"
    "availabilityStatus" Integer 1
    "externalVci" Integer 36
    "operationalState" Integer 0
    //"pmReceivedAtmCells" Integer 0
    //"pmTransmittedAtmCells" Integer 0
    "reservedBy" Ref "null"
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,TransportNetwork=1,AtmPort=1-1-1,VplTp=Vp1,VpcTp=1"
    identity "vc37"
    moType VclTp
    exception none
    nrOfAttributes 9
    "VclTpId" String "vc37"
    "atmTrafficDescriptorId" Ref "null"
    "availabilityStatus" Integer 1
    "externalVci" Integer 37
    "operationalState" Integer 0
    //"pmReceivedAtmCells" Integer 0
    //"pmTransmittedAtmCells" Integer 0
    "reservedBy" Ref "null"
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,TransportNetwork=1,AtmPort=1-1-1,VplTp=Vp1,VpcTp=1"
    identity "vc38"
    moType VclTp
    exception none
    nrOfAttributes 9
    "VclTpId" String "vc38"
    "atmTrafficDescriptorId" Ref "null"
    "availabilityStatus" Integer 1
    "externalVci" Integer 38
    "operationalState" Integer 0
    //"pmReceivedAtmCells" Integer 0
    //"pmTransmittedAtmCells" Integer 0
    "reservedBy" Ref "null"
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,TransportNetwork=1,AtmPort=1-1-1,VplTp=Vp1,VpcTp=1"
    identity "vc39"
    moType VclTp
    exception none
    nrOfAttributes 9
    "VclTpId" String "vc39"
    "atmTrafficDescriptorId" Ref "null"
    "availabilityStatus" Integer 1
    "externalVci" Integer 39
    "operationalState" Integer 0
    //"pmReceivedAtmCells" Integer 0
    //"pmTransmittedAtmCells" Integer 0
    "reservedBy" Ref "null"
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,TransportNetwork=1,AtmPort=1-1-1,VplTp=Vp1,VpcTp=1"
    identity "vc43"
    moType VclTp
    exception none
    nrOfAttributes 9
    "VclTpId" String "vc43"
    "atmTrafficDescriptorId" Ref "null"
    "availabilityStatus" Integer 1
    "externalVci" Integer 43
    "operationalState" Integer 0
    //"pmReceivedAtmCells" Integer 0
    //"pmTransmittedAtmCells" Integer 0
    "reservedBy" Ref "null"
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,TransportNetwork=1,AtmPort=1-1-1,VplTp=Vp1,VpcTp=1"
    identity "vc44"
    moType VclTp
    exception none
    nrOfAttributes 9
    "VclTpId" String "vc44"
    "atmTrafficDescriptorId" Ref "null"
    "availabilityStatus" Integer 1
    "externalVci" Integer 44
    "operationalState" Integer 0
    //"pmReceivedAtmCells" Integer 0
    //"pmTransmittedAtmCells" Integer 0
    "reservedBy" Ref "null"
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,TransportNetwork=1,AtmPort=1-1-1,VplTp=Vp1,VpcTp=1"
    identity "vc45"
    moType VclTp
    exception none
    nrOfAttributes 9
    "VclTpId" String "vc45"
    "atmTrafficDescriptorId" Ref "null"
    "availabilityStatus" Integer 1
    "externalVci" Integer 45
    "operationalState" Integer 0
    //"pmReceivedAtmCells" Integer 0
    //"pmTransmittedAtmCells" Integer 0
    "reservedBy" Ref "null"
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,TransportNetwork=1"
    identity "bda"
    moType Aal5TpVccTp
    exception none
    nrOfAttributes 22
    "Aal5TpVccTpId" String "bda"
    "alarmReport" Integer 2
    "continuityCheck" Boolean false
    "counterActivation" Boolean false
    "counterMode" Integer 6
    "currentPmRegister" Array String 0
    "fromUserMaxSduSize" Integer 1
    "nomPmBlkSize" Integer 1024
    "operationalState" Integer 0
    //"pmBwErrBlocks" Integer 0
    //"pmBwLostCells" Integer 0
    //"pmBwMissinsCells" Integer 0
    //"pmFwErrBlocks" Integer 0
    //"pmFwLostCells" Integer 0
    //"pmFwMissinsCells" Integer 0
    //"pmLostBrCells" Integer 0
    //"pmLostFpmCells" Integer 0
    "processorId" Ref "null"
    "reservedBy" Ref "null"
    "toUserMaxSduSize" Integer 1
    "userLabel" String ""
    "vclTpId" Ref "null"
)

CREATE
(
    parent "ManagedElement=1,TransportNetwork=1"
    identity "bca"
    moType Aal5TpVccTp
    exception none
    nrOfAttributes 22
    "Aal5TpVccTpId" String "bca"
    "alarmReport" Integer 2
    "continuityCheck" Boolean false
    "counterActivation" Boolean false
    "counterMode" Integer 6
    "currentPmRegister" Array String 0
    "fromUserMaxSduSize" Integer 1
    "nomPmBlkSize" Integer 1024
    "operationalState" Integer 0
    //"pmBwErrBlocks" Integer 0
    //"pmBwLostCells" Integer 0
    //"pmBwMissinsCells" Integer 0
    //"pmFwErrBlocks" Integer 0
    //"pmFwLostCells" Integer 0
    //"pmFwMissinsCells" Integer 0
    //"pmLostBrCells" Integer 0
    //"pmLostFpmCells" Integer 0
    "processorId" Ref "null"
    "reservedBy" Ref "null"
    "toUserMaxSduSize" Integer 1
    "userLabel" String ""
    "vclTpId" Ref "null"
)

CREATE
(
    parent "ManagedElement=1,TransportNetwork=1"
    identity "bdb"
    moType Aal5TpVccTp
    exception none
    nrOfAttributes 22
    "Aal5TpVccTpId" String "bdb"
    "alarmReport" Integer 2
    "continuityCheck" Boolean false
    "counterActivation" Boolean false
    "counterMode" Integer 6
    "currentPmRegister" Array String 0
    "fromUserMaxSduSize" Integer 1
    "nomPmBlkSize" Integer 1024
    "operationalState" Integer 0
    //"pmBwErrBlocks" Integer 0
    //"pmBwLostCells" Integer 0
    //"pmBwMissinsCells" Integer 0
    //"pmFwErrBlocks" Integer 0
    //"pmFwLostCells" Integer 0
    //"pmFwMissinsCells" Integer 0
    //"pmLostBrCells" Integer 0
    //"pmLostFpmCells" Integer 0
    "processorId" Ref "null"
    "reservedBy" Ref "null"
    "toUserMaxSduSize" Integer 1
    "userLabel" String ""
    "vclTpId" Ref "null"
)

CREATE
(
    parent "ManagedElement=1,TransportNetwork=1"
    identity "bcb"
    moType Aal5TpVccTp
    exception none
    nrOfAttributes 22
    "Aal5TpVccTpId" String "bcb"
    "alarmReport" Integer 2
    "continuityCheck" Boolean false
    "counterActivation" Boolean false
    "counterMode" Integer 6
    "currentPmRegister" Array String 0
    "fromUserMaxSduSize" Integer 1
    "nomPmBlkSize" Integer 1024
    "operationalState" Integer 0
    //"pmBwErrBlocks" Integer 0
    //"pmBwLostCells" Integer 0
    //"pmBwMissinsCells" Integer 0
    //"pmFwErrBlocks" Integer 0
    //"pmFwLostCells" Integer 0
    //"pmFwMissinsCells" Integer 0
    //"pmLostBrCells" Integer 0
    //"pmLostFpmCells" Integer 0
    "processorId" Ref "null"
    "reservedBy" Ref "null"
    "toUserMaxSduSize" Integer 1
    "userLabel" String ""
    "vclTpId" Ref "null"
)

CREATE
(
    parent "ManagedElement=1,TransportNetwork=1"
    identity "bqa"
    moType Aal5TpVccTp
    exception none
    nrOfAttributes 22
    "Aal5TpVccTpId" String "bqa"
    "alarmReport" Integer 2
    "continuityCheck" Boolean false
    "counterActivation" Boolean false
    "counterMode" Integer 6
    "currentPmRegister" Array String 0
    "fromUserMaxSduSize" Integer 1
    "nomPmBlkSize" Integer 1024
    "operationalState" Integer 0
    //"pmBwErrBlocks" Integer 0
    //"pmBwLostCells" Integer 0
    //"pmBwMissinsCells" Integer 0
    //"pmFwErrBlocks" Integer 0
    //"pmFwLostCells" Integer 0
    //"pmFwMissinsCells" Integer 0
    //"pmLostBrCells" Integer 0
    //"pmLostFpmCells" Integer 0
    "processorId" Ref "null"
    "reservedBy" Ref "null"
    "toUserMaxSduSize" Integer 1
    "userLabel" String ""
    "vclTpId" Ref "null"
)

CREATE
(
    parent "ManagedElement=1,TransportNetwork=1"
    identity "bqb"
    moType Aal5TpVccTp
    exception none
    nrOfAttributes 22
    "Aal5TpVccTpId" String "bqb"
    "alarmReport" Integer 2
    "continuityCheck" Boolean false
    "counterActivation" Boolean false
    "counterMode" Integer 6
    "currentPmRegister" Array String 0
    "fromUserMaxSduSize" Integer 1
    "nomPmBlkSize" Integer 1024
    "operationalState" Integer 0
    //"pmBwErrBlocks" Integer 0
    //"pmBwLostCells" Integer 0
    //"pmBwMissinsCells" Integer 0
    //"pmFwErrBlocks" Integer 0
    //"pmFwLostCells" Integer 0
    //"pmFwMissinsCells" Integer 0
    //"pmLostBrCells" Integer 0
    //"pmLostFpmCells" Integer 0
    "processorId" Ref "null"
    "reservedBy" Ref "null"
    "toUserMaxSduSize" Integer 1
    "userLabel" String ""
    "vclTpId" Ref "null"
)

CREATE
(
    parent "ManagedElement=1,TransportNetwork=1"
    identity "1"
    moType UniSaalProfile
    exception none
    nrOfAttributes 4
    "UniSaalProfileId" String "1"
    "profileData" Struct
        nrOfElements 11
        "maxPD" Integer 25
        "maxStat" Integer 67
        "initialCredit" Integer 250
        "timerKeepAlive" Integer 2000
        "timerNoResponse" Integer 7000
        "timerIdle" Integer 15000
        "timerCC" Integer 1000
        "timerPoll" Integer 750
        "maxCC" Integer 4
        "congestionOnSet" Integer 70
        "congestionAbatement" Integer 60

    "reservedBy" Array Ref 0
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,TransportNetwork=1"
    identity "2"
    moType UniSaalProfile
    exception none
    nrOfAttributes 4
    "UniSaalProfileId" String "2"
    "profileData" Struct
        nrOfElements 11
        "maxPD" Integer 25
        "maxStat" Integer 67
        "initialCredit" Integer 250
        "timerKeepAlive" Integer 2000
        "timerNoResponse" Integer 7000
        "timerIdle" Integer 15000
        "timerCC" Integer 1000
        "timerPoll" Integer 750
        "maxCC" Integer 4
        "congestionOnSet" Integer 70
        "congestionAbatement" Integer 60

    "reservedBy" Array Ref 0
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,TransportNetwork=1"
    identity "3"
    moType UniSaalProfile
    exception none
    nrOfAttributes 4
    "UniSaalProfileId" String "3"
    "profileData" Struct
        nrOfElements 11
        "maxPD" Integer 25
        "maxStat" Integer 67
        "initialCredit" Integer 250
        "timerKeepAlive" Integer 2000
        "timerNoResponse" Integer 7000
        "timerIdle" Integer 15000
        "timerCC" Integer 1000
        "timerPoll" Integer 750
        "maxCC" Integer 4
        "congestionOnSet" Integer 70
        "congestionAbatement" Integer 60

    "reservedBy" Array Ref 0
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,TransportNetwork=1"
    identity "bda"
    moType UniSaalTp
    exception none
    nrOfAttributes 18
    "UniSaalTpId" String "bda"
    "aal5TpVccTpId" Ref "null"
    "maxSduSize" Integer 128
    "operationalState" Integer 0
    //"pmLinkInServiceTime" Integer 0
    //"pmNoOfAllSLFailures" Integer 0
    //"pmNoOfLocalCongestions" Integer 0
    //"pmNoOfNoResponses" Integer 0
    //"pmNoOfOtherErrors" Integer 0
    //"pmNoOfProtocolErrors" Integer 0
    //"pmNoOfReceivedSDUs" Integer 0
    //"pmNoOfRemoteCongestions" Integer 0
    //"pmNoOfSentSDUs" Integer 0
    //"pmNoOfSequenceDataLosses" Integer 0
    //"pmNoOfUnsuccReTransmissions" Integer 0
    "reservedBy" Ref "null"
    "uniSaalProfileId" Ref "null"
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,TransportNetwork=1"
    identity "bca"
    moType UniSaalTp
    exception none
    nrOfAttributes 18
    "UniSaalTpId" String "bca"
    "aal5TpVccTpId" Ref "null"
    "maxSduSize" Integer 128
    "operationalState" Integer 0
    //"pmLinkInServiceTime" Integer 0
    //"pmNoOfAllSLFailures" Integer 0
    //"pmNoOfLocalCongestions" Integer 0
    //"pmNoOfNoResponses" Integer 0
    //"pmNoOfOtherErrors" Integer 0
    //"pmNoOfProtocolErrors" Integer 0
    //"pmNoOfReceivedSDUs" Integer 0
    //"pmNoOfRemoteCongestions" Integer 0
    //"pmNoOfSentSDUs" Integer 0
    //"pmNoOfSequenceDataLosses" Integer 0
    //"pmNoOfUnsuccReTransmissions" Integer 0
    "reservedBy" Ref "null"
    "uniSaalProfileId" Ref "null"
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,TransportNetwork=1"
    identity "bdb"
    moType UniSaalTp
    exception none
    nrOfAttributes 18
    "UniSaalTpId" String "bdb"
    "aal5TpVccTpId" Ref "null"
    "maxSduSize" Integer 128
    "operationalState" Integer 0
    //"pmLinkInServiceTime" Integer 0
    //"pmNoOfAllSLFailures" Integer 0
    //"pmNoOfLocalCongestions" Integer 0
    //"pmNoOfNoResponses" Integer 0
    //"pmNoOfOtherErrors" Integer 0
    //"pmNoOfProtocolErrors" Integer 0
    //"pmNoOfReceivedSDUs" Integer 0
    //"pmNoOfRemoteCongestions" Integer 0
    //"pmNoOfSentSDUs" Integer 0
    //"pmNoOfSequenceDataLosses" Integer 0
    //"pmNoOfUnsuccReTransmissions" Integer 0
    "reservedBy" Ref "null"
    "uniSaalProfileId" Ref "null"
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,TransportNetwork=1"
    identity "bcb"
    moType UniSaalTp
    exception none
    nrOfAttributes 18
    "UniSaalTpId" String "bcb"
    "aal5TpVccTpId" Ref "null"
    "maxSduSize" Integer 128
    "operationalState" Integer 0
    //"pmLinkInServiceTime" Integer 0
    //"pmNoOfAllSLFailures" Integer 0
    //"pmNoOfLocalCongestions" Integer 0
    //"pmNoOfNoResponses" Integer 0
    //"pmNoOfOtherErrors" Integer 0
    //"pmNoOfProtocolErrors" Integer 0
    //"pmNoOfReceivedSDUs" Integer 0
    //"pmNoOfRemoteCongestions" Integer 0
    //"pmNoOfSentSDUs" Integer 0
    //"pmNoOfSequenceDataLosses" Integer 0
    //"pmNoOfUnsuccReTransmissions" Integer 0
    "reservedBy" Ref "null"
    "uniSaalProfileId" Ref "null"
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,TransportNetwork=1"
    identity "bqa"
    moType UniSaalTp
    exception none
    nrOfAttributes 18
    "UniSaalTpId" String "bqa"
    "aal5TpVccTpId" Ref "null"
    "maxSduSize" Integer 128
    "operationalState" Integer 0
    //"pmLinkInServiceTime" Integer 0
    //"pmNoOfAllSLFailures" Integer 0
    //"pmNoOfLocalCongestions" Integer 0
    //"pmNoOfNoResponses" Integer 0
    //"pmNoOfOtherErrors" Integer 0
    //"pmNoOfProtocolErrors" Integer 0
    //"pmNoOfReceivedSDUs" Integer 0
    //"pmNoOfRemoteCongestions" Integer 0
    //"pmNoOfSentSDUs" Integer 0
    //"pmNoOfSequenceDataLosses" Integer 0
    //"pmNoOfUnsuccReTransmissions" Integer 0
    "reservedBy" Ref "null"
    "uniSaalProfileId" Ref "null"
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,TransportNetwork=1"
    identity "bqb"
    moType UniSaalTp
    exception none
    nrOfAttributes 18
    "UniSaalTpId" String "bqb"
    "aal5TpVccTpId" Ref "null"
    "maxSduSize" Integer 128
    "operationalState" Integer 0
    //"pmLinkInServiceTime" Integer 0
    //"pmNoOfAllSLFailures" Integer 0
    //"pmNoOfLocalCongestions" Integer 0
    //"pmNoOfNoResponses" Integer 0
    //"pmNoOfOtherErrors" Integer 0
    //"pmNoOfProtocolErrors" Integer 0
    //"pmNoOfReceivedSDUs" Integer 0
    //"pmNoOfRemoteCongestions" Integer 0
    //"pmNoOfSentSDUs" Integer 0
    //"pmNoOfSequenceDataLosses" Integer 0
    //"pmNoOfUnsuccReTransmissions" Integer 0
    "reservedBy" Ref "null"
    "uniSaalProfileId" Ref "null"
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,TransportNetwork=1"
    identity "bsa"
    moType Aal0TpVccTp
    exception none
    nrOfAttributes 20
    "Aal0TpVccTpId" String "bsa"
    "alarmReport" Integer 2
    "continuityCheck" Boolean false
    "counterActivation" Boolean false
    "counterMode" Integer 6
    "currentPmRegister" Array String 0
    "nomPmBlkSize" Integer 1024
    "operationalState" Integer 0
    //"pmBwErrBlocks" Integer 0
    //"pmBwLostCells" Integer 0
    //"pmBwMissinsCells" Integer 0
    //"pmFwErrBlocks" Integer 0
    //"pmFwLostCells" Integer 0
    //"pmFwMissinsCells" Integer 0
    //"pmLostBrCells" Integer 0
    //"pmLostFpmCells" Integer 0
    "processorId" Ref "null"
    "reservedBy" Ref "null"
    "userLabel" String ""
    "vclTpId" Ref "null"
)

CREATE
(
    parent "ManagedElement=1,TransportNetwork=1"
    identity "bsb"
    moType Aal0TpVccTp
    exception none
    nrOfAttributes 20
    "Aal0TpVccTpId" String "bsb"
    "alarmReport" Integer 2
    "continuityCheck" Boolean false
    "counterActivation" Boolean false
    "counterMode" Integer 6
    "currentPmRegister" Array String 0
    "nomPmBlkSize" Integer 1024
    "operationalState" Integer 0
    //"pmBwErrBlocks" Integer 0
    //"pmBwLostCells" Integer 0
    //"pmBwMissinsCells" Integer 0
    //"pmFwErrBlocks" Integer 0
    //"pmFwLostCells" Integer 0
    //"pmFwMissinsCells" Integer 0
    //"pmLostBrCells" Integer 0
    //"pmLostFpmCells" Integer 0
    "processorId" Ref "null"
    "reservedBy" Ref "null"
    "userLabel" String ""
    "vclTpId" Ref "null"
)

CREATE
(
    parent "ManagedElement=1,TransportNetwork=1"
    identity "1"
    moType Aal2QosProfile
    exception none
    nrOfAttributes 7
    "Aal2QosProfileId" String "1"
    "profileClassA" Struct
        nrOfElements 3
        "boundOnProbOfDelay" Integer 500000
        "boundOnProbOfLoss" Integer 500000
        "boundOnNodeDelay" Integer 5000

    "profileClassB" Struct
        nrOfElements 3
        "boundOnProbOfDelay" Integer 500000
        "boundOnProbOfLoss" Integer 500000
        "boundOnNodeDelay" Integer 15000

    "profileClassC" Struct
        nrOfElements 3
        "boundOnProbOfDelay" Integer 1000000000
        "boundOnProbOfLoss" Integer 1000000000
        "boundOnNodeDelay" Integer 25000

    "profileClassD" Struct
        nrOfElements 3
        "boundOnProbOfDelay" Integer 1000000000
        "boundOnProbOfLoss" Integer 1000000000
        "boundOnNodeDelay" Integer 50000

    "reservedBy" Array Ref 0
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,TransportNetwork=1"
    identity "1"
    moType Aal2QosCodePointProfile
    exception none
    nrOfAttributes 7
    "Aal2QosCodePointProfileId" String "1"
    "qualityOfServiceCodePointA" Integer 0
    "qualityOfServiceCodePointB" Integer 0
    "qualityOfServiceCodePointC" Integer 0
    "qualityOfServiceCodePointD" Integer 0
    "reservedBy" Array Ref 0
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,TransportNetwork=1"
    identity "ba1"
    moType Aal2PathVccTp
    exception none
    nrOfAttributes 30
    "Aal2PathVccTpId" String "ba1"
    "aal2PathId" Integer 1
    "aal2PathOwner" Boolean true
    "aal2QoSAvailableProfiles" Integer 15
    "aal2QoSProfileId" Ref "null"
    "administrativeState" Integer 1
    "alarmReport" Integer 2
    "availabilityStatus" Integer 1
    "continuityCheck" Boolean false
    "counterActivation" Boolean false
    "counterMode" Integer 6
    "currentPmRegister" Array String 0
    "nomPmBlocksize" Integer 1024
    "operationalState" Integer 0
    //"pmBwErrBlocks" Integer 0
    //"pmBwLostCells" Integer 0
    //"pmBwMissinsCells" Integer 0
    //"pmDiscardedEgressCpsPackets" Integer 0
    //"pmEgressCpsPackets" Integer 0
    //"pmFwErrBlocks" Integer 0
    //"pmFwLostCells" Integer 0
    //"pmFwMissinsCells" Integer 0
    //"pmIngressCpsPackets" Integer 0
    //"pmLostBrCells" Integer 0
    //"pmLostFpmCells" Integer 0
    "remoteBlockingState" Integer 0
    "reservedBy" Ref "null"
    "timerCu" Integer 10
    "userLabel" String ""
    "vclTpId" Ref "null"
)

CREATE
(
    parent "ManagedElement=1,TransportNetwork=1,Aal2Sp=1"
    identity "1"
    moType Aal2Ap
    exception none
    nrOfAttributes 44
    "Aal2ApId" String "1"
    "aal2QoSCodePointProfileId" Ref "null"
    "availabilityStatus" Integer 1
    "currentPmRegister" Array String 0
    "nrOfConfiguredAal2Paths" Integer 0
    "nrOfUnavailableAal2Paths" Integer 0
    "operationalState" Integer 0
    //"pmExisOrigConns" Integer 0
    //"pmExisTermConns" Integer 0
    //"pmExisTransConns" Integer 0
    //"pmNrOfRemotelyBlockedAal2Path" Integer 0
    //"pmSuccInConnsRemoteQosClassA" Integer 0
    //"pmSuccInConnsRemoteQosClassB" Integer 0
    //"pmSuccInConnsRemoteQosClassC" Integer 0
    //"pmSuccInConnsRemoteQosClassD" Integer 0
    //"pmSuccOutConnsRemoteQosClassA" Integer 0
    //"pmSuccOutConnsRemoteQosClassB" Integer 0
    //"pmSuccOutConnsRemoteQosClassC" Integer 0
    //"pmSuccOutConnsRemoteQosClassD" Integer 0
    //"pmUnRecMessages" Integer 0
    //"pmUnRecParams" Integer 0
    //"pmUnSuccInConnsLocalQosClassA" Integer 0
    //"pmUnSuccInConnsLocalQosClassB" Integer 0
    //"pmUnSuccInConnsLocalQosClassC" Integer 0
    //"pmUnSuccInConnsLocalQosClassD" Integer 0
    //"pmUnSuccInConnsRemoteQosClassA" Integer 0
    //"pmUnSuccInConnsRemoteQosClassB" Integer 0
    //"pmUnSuccInConnsRemoteQosClassC" Integer 0
    //"pmUnSuccInConnsRemoteQosClassD" Integer 0
    //"pmUnSuccOutConnsLocalQosClassA" Integer 0
    //"pmUnSuccOutConnsLocalQosClassB" Integer 0
    //"pmUnSuccOutConnsLocalQosClassC" Integer 0
    //"pmUnSuccOutConnsLocalQosClassD" Integer 0
    //"pmUnSuccOutConnsRemoteQosClassA" Integer 0
    //"pmUnSuccOutConnsRemoteQosClassB" Integer 0
    //"pmUnSuccOutConnsRemoteQosClassC" Integer 0
    //"pmUnSuccOutConnsRemoteQosClassD" Integer 0
    "reservedBy" Array Ref 0
    "rpuId" Ref "null"
    "secondarySigLinkId" Ref "null"
    "sigLinkId" Ref "null"
    "timerErq" Integer 5000
    "timerRel" Integer 2000
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,TransportNetwork=1,Aal2Sp=1,Aal2Ap=1"
    identity "1"
    moType Aal2PathDistributionUnit
    exception none
    nrOfAttributes 4
    "Aal2PathDistributionUnitId" String "1"
    "aal2PathVccTpList" Array Ref 0
    "rpuId" Ref "null"
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,TransportNetwork=1"
    identity "1"
    moType Aal2RoutingCase
    exception none
    nrOfAttributes 5
    "Aal2RoutingCaseId" String "1"
    "numberDirection" String ""
    "routeList" Array Ref 0
    "routePriorityList" Array Integer 0
    "userLabel" String ""
)

SET
(
    mo "ManagedElement=1,TransportNetwork=1,Aal2Sp=1,Aal2Ap=1,Aal2PathDistributionUnit=1"
    exception none
    nrOfAttributes 2
    "rpuId" Ref "ManagedElement=1,SwManagement=1,ReliableProgramUniter=ans_aal2cpsrc_11"
    "aal2PathVccTpList" Array Ref 1
        "ManagedElement=1,TransportNetwork=1,Aal2PathVccTp=ba1"
)

SET
(
    mo "ManagedElement=1,TransportNetwork=1,Aal2Sp=1,Aal2Ap=1"
    exception none
    nrOfAttributes 4
    "sigLinkId" Ref "ManagedElement=1,TransportNetwork=1,UniSaalTp=bqa"
    "secondarySigLinkId" Ref "ManagedElement=1,TransportNetwork=1,UniSaalTp=bqb"
    "rpuId" Ref "ManagedElement=1,SwManagement=1,ReliableProgramUniter=ans_aal2ap_11"
    "aal2QoSCodePointProfileId" Ref "ManagedElement=1,TransportNetwork=1,Aal2QosCodePointProfile=1"
)

SET
(
    mo "ManagedElement=1,TransportNetwork=1,Aal2PathVccTp=ba1"
    exception none
    nrOfAttributes 3
    "vclTpId" Ref "ManagedElement=1,TransportNetwork=1,AtmPort=1-1-1,VplTp=Vp1,VpcTp=1,VclTp=vc39"
    "reservedBy" Ref "ManagedElement=1,TransportNetwork=1,Aal2Sp=1,Aal2Ap=1,Aal2PathDistributionUnit=1"
    "aal2QoSProfileId" Ref "ManagedElement=1,TransportNetwork=1,Aal2QosProfile=1"
)

SET
(
    mo "ManagedElement=1,TransportNetwork=1,Aal2QosCodePointProfile=1"
    exception none
    nrOfAttributes 1
    "reservedBy" Array Ref 1
        "ManagedElement=1,TransportNetwork=1,Aal2Sp=1,Aal2Ap=1"
)

SET
(
    mo "ManagedElement=1,TransportNetwork=1,Aal2QosProfile=1"
    exception none
    nrOfAttributes 1
    "reservedBy" Array Ref 1
        "ManagedElement=1,TransportNetwork=1,Aal2PathVccTp=ba1"
)

SET
(
    mo "ManagedElement=1,TransportNetwork=1,Aal0TpVccTp=bsb"
    exception none
    nrOfAttributes 3
    "vclTpId" Ref "ManagedElement=1,TransportNetwork=1,AtmPort=1-1-1,VplTp=Vp1,VpcTp=1,VclTp=vc35"
    "reservedBy" Ref "ManagedElement=1,NodeBFunction=1,Iub=1,NodeSynchTp=1"
    "processorId" Ref "ManagedElement=1,Equipment=1,Subrack=1,Slot=4,PlugInUnit=1"
)

SET
(
    mo "ManagedElement=1,TransportNetwork=1,Aal0TpVccTp=bsa"
    exception none
    nrOfAttributes 3
    "vclTpId" Ref "ManagedElement=1,TransportNetwork=1,AtmPort=1-1-1,VplTp=Vp1,VpcTp=1,VclTp=vc34"
    "reservedBy" Ref "ManagedElement=1,NodeBFunction=1,Iub=1,NodeSynchTp=1"
    "processorId" Ref "ManagedElement=1,Equipment=1,Subrack=1,Slot=4,PlugInUnit=1"
)

SET
(
    mo "ManagedElement=1,TransportNetwork=1,UniSaalTp=bqb"
    exception none
    nrOfAttributes 3
    "uniSaalProfileId" Ref "ManagedElement=1,TransportNetwork=1,UniSaalProfile=3"
    "reservedBy" Ref "ManagedElement=1,TransportNetwork=1,Aal2Sp=1,Aal2Ap=1"
    "aal5TpVccTpId" Ref "ManagedElement=1,TransportNetwork=1,Aal5TpVccTp=bqb"
)

SET
(
    mo "ManagedElement=1,TransportNetwork=1,UniSaalTp=bqa"
    exception none
    nrOfAttributes 3
    "uniSaalProfileId" Ref "ManagedElement=1,TransportNetwork=1,UniSaalProfile=3"
    "reservedBy" Ref "ManagedElement=1,TransportNetwork=1,Aal2Sp=1,Aal2Ap=1"
    "aal5TpVccTpId" Ref "ManagedElement=1,TransportNetwork=1,Aal5TpVccTp=bqa"
)

SET
(
    mo "ManagedElement=1,TransportNetwork=1,UniSaalTp=bcb"
    exception none
    nrOfAttributes 3
    "uniSaalProfileId" Ref "ManagedElement=1,TransportNetwork=1,UniSaalProfile=2"
    "reservedBy" Ref "ManagedElement=1,NodeBFunction=1,Iub=1,NbapCommon=1"
    "aal5TpVccTpId" Ref "ManagedElement=1,TransportNetwork=1,Aal5TpVccTp=bcb"
)

SET
(
    mo "ManagedElement=1,TransportNetwork=1,UniSaalTp=bdb"
    exception none
    nrOfAttributes 3
    "uniSaalProfileId" Ref "ManagedElement=1,TransportNetwork=1,UniSaalProfile=2"
    "reservedBy" Ref "ManagedElement=1,NodeBFunction=1,Iub=1,NbapDedicated=1"
    "aal5TpVccTpId" Ref "ManagedElement=1,TransportNetwork=1,Aal5TpVccTp=bdb"
)

SET
(
    mo "ManagedElement=1,TransportNetwork=1,UniSaalTp=bca"
    exception none
    nrOfAttributes 3
    "uniSaalProfileId" Ref "ManagedElement=1,TransportNetwork=1,UniSaalProfile=1"
    "reservedBy" Ref "ManagedElement=1,NodeBFunction=1,Iub=1,NbapCommon=1"
    "aal5TpVccTpId" Ref "ManagedElement=1,TransportNetwork=1,Aal5TpVccTp=bca"
)

SET
(
    mo "ManagedElement=1,TransportNetwork=1,UniSaalTp=bda"
    exception none
    nrOfAttributes 3
    "uniSaalProfileId" Ref "ManagedElement=1,TransportNetwork=1,UniSaalProfile=1"
    "reservedBy" Ref "ManagedElement=1,NodeBFunction=1,Iub=1,NbapDedicated=1"
    "aal5TpVccTpId" Ref "ManagedElement=1,TransportNetwork=1,Aal5TpVccTp=bda"
)

SET
(
    mo "ManagedElement=1,TransportNetwork=1,UniSaalProfile=3"
    exception none
    nrOfAttributes 1
    "reservedBy" Array Ref 2
        "ManagedElement=1,TransportNetwork=1,UniSaalTp=bqb"
        "ManagedElement=1,TransportNetwork=1,UniSaalTp=bqa"
)

SET
(
    mo "ManagedElement=1,TransportNetwork=1,UniSaalProfile=2"
    exception none
    nrOfAttributes 1
    "reservedBy" Array Ref 2
        "ManagedElement=1,TransportNetwork=1,UniSaalTp=bcb"
        "ManagedElement=1,TransportNetwork=1,UniSaalTp=bdb"
)

SET
(
    mo "ManagedElement=1,TransportNetwork=1,UniSaalProfile=1"
    exception none
    nrOfAttributes 1
    "reservedBy" Array Ref 2
        "ManagedElement=1,TransportNetwork=1,UniSaalTp=bca"
        "ManagedElement=1,TransportNetwork=1,UniSaalTp=bda"
)

SET
(
    mo "ManagedElement=1,TransportNetwork=1,Aal5TpVccTp=bqb"
    exception none
    nrOfAttributes 3
    "vclTpId" Ref "ManagedElement=1,TransportNetwork=1,AtmPort=1-1-1,VplTp=Vp1,VpcTp=1,VclTp=vc45"
    "reservedBy" Ref "ManagedElement=1,TransportNetwork=1,UniSaalTp=bqb"
    "processorId" Ref "ManagedElement=1,Equipment=1,Subrack=1,Slot=20,PlugInUnit=1"
)

SET
(
    mo "ManagedElement=1,TransportNetwork=1,Aal5TpVccTp=bqa"
    exception none
    nrOfAttributes 3
    "vclTpId" Ref "ManagedElement=1,TransportNetwork=1,AtmPort=1-1-1,VplTp=Vp1,VpcTp=1,VclTp=vc38"
    "reservedBy" Ref "ManagedElement=1,TransportNetwork=1,UniSaalTp=bqa"
    "processorId" Ref "ManagedElement=1,Equipment=1,Subrack=1,Slot=20,PlugInUnit=1"
)

SET
(
    mo "ManagedElement=1,TransportNetwork=1,Aal5TpVccTp=bcb"
    exception none
    nrOfAttributes 3
    "vclTpId" Ref "ManagedElement=1,TransportNetwork=1,AtmPort=1-1-1,VplTp=Vp1,VpcTp=1,VclTp=vc43"
    "reservedBy" Ref "ManagedElement=1,TransportNetwork=1,UniSaalTp=bcb"
    "processorId" Ref "ManagedElement=1,Equipment=1,Subrack=1,Slot=20,PlugInUnit=1"
)

SET
(
    mo "ManagedElement=1,TransportNetwork=1,Aal5TpVccTp=bdb"
    exception none
    nrOfAttributes 3
    "vclTpId" Ref "ManagedElement=1,TransportNetwork=1,AtmPort=1-1-1,VplTp=Vp1,VpcTp=1,VclTp=vc44"
    "reservedBy" Ref "ManagedElement=1,TransportNetwork=1,UniSaalTp=bdb"
    "processorId" Ref "ManagedElement=1,Equipment=1,Subrack=1,Slot=20,PlugInUnit=1"
)

SET
(
    mo "ManagedElement=1,TransportNetwork=1,Aal5TpVccTp=bca"
    exception none
    nrOfAttributes 3
    "vclTpId" Ref "ManagedElement=1,TransportNetwork=1,AtmPort=1-1-1,VplTp=Vp1,VpcTp=1,VclTp=vc36"
    "reservedBy" Ref "ManagedElement=1,TransportNetwork=1,UniSaalTp=bca"
    "processorId" Ref "ManagedElement=1,Equipment=1,Subrack=1,Slot=20,PlugInUnit=1"
)

SET
(
    mo "ManagedElement=1,TransportNetwork=1,Aal5TpVccTp=bda"
    exception none
    nrOfAttributes 3
    "vclTpId" Ref "ManagedElement=1,TransportNetwork=1,AtmPort=1-1-1,VplTp=Vp1,VpcTp=1,VclTp=vc37"
    "reservedBy" Ref "ManagedElement=1,TransportNetwork=1,UniSaalTp=bda"
    "processorId" Ref "ManagedElement=1,Equipment=1,Subrack=1,Slot=20,PlugInUnit=1"
)

SET
(
    mo "ManagedElement=1,TransportNetwork=1,AtmPort=1-1-1,VplTp=Vp1,VpcTp=1,VclTp=vc45"
    exception none
    nrOfAttributes 2
    "reservedBy" Ref "ManagedElement=1,TransportNetwork=1,Aal5TpVccTp=bqb"
    "atmTrafficDescriptorId" Ref "ManagedElement=1,TransportNetwork=1,AtmTrafficDescriptor=U3P1000M80"
)

SET
(
    mo "ManagedElement=1,TransportNetwork=1,AtmPort=1-1-1,VplTp=Vp1,VpcTp=1,VclTp=vc44"
    exception none
    nrOfAttributes 2
    "reservedBy" Ref "ManagedElement=1,TransportNetwork=1,Aal5TpVccTp=bdb"
    "atmTrafficDescriptorId" Ref "ManagedElement=1,TransportNetwork=1,AtmTrafficDescriptor=U3P1000M80"
)

SET
(
    mo "ManagedElement=1,TransportNetwork=1,AtmPort=1-1-1,VplTp=Vp1,VpcTp=1,VclTp=vc43"
    exception none
    nrOfAttributes 2
    "reservedBy" Ref "ManagedElement=1,TransportNetwork=1,Aal5TpVccTp=bcb"
    "atmTrafficDescriptorId" Ref "ManagedElement=1,TransportNetwork=1,AtmTrafficDescriptor=U3P1000M80"
)

SET
(
    mo "ManagedElement=1,TransportNetwork=1,AtmPort=1-1-1,VplTp=Vp1,VpcTp=1,VclTp=vc39"
    exception none
    nrOfAttributes 2
    "reservedBy" Ref "ManagedElement=1,TransportNetwork=1,Aal2PathVccTp=ba1"
    "atmTrafficDescriptorId" Ref "ManagedElement=1,TransportNetwork=1,AtmTrafficDescriptor=C2P4000"
)

SET
(
    mo "ManagedElement=1,TransportNetwork=1,AtmPort=1-1-1,VplTp=Vp1,VpcTp=1,VclTp=vc38"
    exception none
    nrOfAttributes 2
    "reservedBy" Ref "ManagedElement=1,TransportNetwork=1,Aal5TpVccTp=bqa"
    "atmTrafficDescriptorId" Ref "ManagedElement=1,TransportNetwork=1,AtmTrafficDescriptor=U3P1000M80"
)

SET
(
    mo "ManagedElement=1,TransportNetwork=1,AtmPort=1-1-1,VplTp=Vp1,VpcTp=1,VclTp=vc37"
    exception none
    nrOfAttributes 2
    "reservedBy" Ref "ManagedElement=1,TransportNetwork=1,Aal5TpVccTp=bda"
    "atmTrafficDescriptorId" Ref "ManagedElement=1,TransportNetwork=1,AtmTrafficDescriptor=U3P1000M80"
)

SET
(
    mo "ManagedElement=1,TransportNetwork=1,AtmPort=1-1-1,VplTp=Vp1,VpcTp=1,VclTp=vc36"
    exception none
    nrOfAttributes 2
    "reservedBy" Ref "ManagedElement=1,TransportNetwork=1,Aal5TpVccTp=bca"
    "atmTrafficDescriptorId" Ref "ManagedElement=1,TransportNetwork=1,AtmTrafficDescriptor=U3P1000M80"
)

SET
(
    mo "ManagedElement=1,TransportNetwork=1,AtmPort=1-1-1,VplTp=Vp1,VpcTp=1,VclTp=vc35"
    exception none
    nrOfAttributes 2
    "reservedBy" Ref "ManagedElement=1,TransportNetwork=1,Aal0TpVccTp=bsb"
    "atmTrafficDescriptorId" Ref "ManagedElement=1,TransportNetwork=1,AtmTrafficDescriptor=C1P5"
)

SET
(
    mo "ManagedElement=1,TransportNetwork=1,AtmPort=1-1-1,VplTp=Vp1,VpcTp=1,VclTp=vc34"
    exception none
    nrOfAttributes 2
    "reservedBy" Ref "ManagedElement=1,TransportNetwork=1,Aal0TpVccTp=bsa"
    "atmTrafficDescriptorId" Ref "ManagedElement=1,TransportNetwork=1,AtmTrafficDescriptor=C1P5"
)

SET
(
    mo "ManagedElement=1,TransportNetwork=1,AtmPort=1-1-1,VplTp=Vp1"
    exception none
    nrOfAttributes 1
    "atmTrafficDescriptor" Ref "ManagedElement=1,TransportNetwork=1,AtmTrafficDescriptor=C1P4528"
)

SET
(
    mo "ManagedElement=1,TransportNetwork=1,AtmTrafficDescriptor=U3P1000M80"
    exception none
    nrOfAttributes 1
    "reservedBy" Array Ref 6
        "ManagedElement=1,TransportNetwork=1,AtmPort=1-1-1,VplTp=Vp1,VpcTp=1,VclTp=vc45"
        "ManagedElement=1,TransportNetwork=1,AtmPort=1-1-1,VplTp=Vp1,VpcTp=1,VclTp=vc44"
        "ManagedElement=1,TransportNetwork=1,AtmPort=1-1-1,VplTp=Vp1,VpcTp=1,VclTp=vc43"
        "ManagedElement=1,TransportNetwork=1,AtmPort=1-1-1,VplTp=Vp1,VpcTp=1,VclTp=vc38"
        "ManagedElement=1,TransportNetwork=1,AtmPort=1-1-1,VplTp=Vp1,VpcTp=1,VclTp=vc37"
        "ManagedElement=1,TransportNetwork=1,AtmPort=1-1-1,VplTp=Vp1,VpcTp=1,VclTp=vc36"
)

SET
(
    mo "ManagedElement=1,TransportNetwork=1,AtmTrafficDescriptor=C2P4000"
    exception none
    nrOfAttributes 1
    "reservedBy" Array Ref 1
        "ManagedElement=1,TransportNetwork=1,AtmPort=1-1-1,VplTp=Vp1,VpcTp=1,VclTp=vc39"
)

SET
(
    mo "ManagedElement=1,TransportNetwork=1,AtmTrafficDescriptor=C1P5"
    exception none
    nrOfAttributes 1
    "reservedBy" Array Ref 2
        "ManagedElement=1,TransportNetwork=1,AtmPort=1-1-1,VplTp=Vp1,VpcTp=1,VclTp=vc35"
        "ManagedElement=1,TransportNetwork=1,AtmPort=1-1-1,VplTp=Vp1,VpcTp=1,VclTp=vc34"
)

SET
(
    mo "ManagedElement=1,TransportNetwork=1,AtmTrafficDescriptor=C1P4528"
    exception none
    nrOfAttributes 1
    "reservedBy" Array Ref 1
        "ManagedElement=1,TransportNetwork=1,AtmPort=1-1-1,VplTp=Vp1"
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

