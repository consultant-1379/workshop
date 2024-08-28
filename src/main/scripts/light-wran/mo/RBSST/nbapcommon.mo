CREATE
(
   parent "ManagedElement=1,TransportNetwork=1"
   identity "bsb"
   moType Aal0TpVccTp
   exception none
   nrOfAttributes
)
CREATE
(
   parent "ManagedElement=1,TransportNetwork=1"
   identity "bdb"
   moType UniSaalTp
   exception none
   nrOfAttributes
)
CREATE
(
   parent "ManagedElement=1,TransportNetwork=1"
   identity "bcb"
   moType UniSaalTp
   exception none
   nrOfAttributes
)

CREATE
(
   parent "ManagedElement=1,TransportNetwork=1"
   identity "bsa"
   moType Aal0TpVccTp
   exception none
   nrOfAttributes
)
CREATE
(
   parent "ManagedElement=1,TransportNetwork=1"
   identity "bda"
   moType UniSaalTp
   exception none
   nrOfAttributes
)
CREATE
(
   parent "ManagedElement=1,TransportNetwork=1"
   identity "bca"
   moType UniSaalTp
   exception none
   nrOfAttributes
)

CREATE
(
    parent "ManagedElement=1,NodeBFunction=1"
    identity "1"
    moType Iub
    exception none
    nrOfAttributes 3
    "IubId" String "1"
    "rbsId" Integer 1
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,NodeBFunction=1,Iub=1"
    identity "1"
    moType IubDataStreams
    exception none
    nrOfAttributes 14
    "IubDataStreamsId" String "1"
    "maxHsRate" Integer 15
    "noOfCommonStreams" Integer 0
    "noOfDedicatedStreams" Integer 0
    "pmCapAllocIubHsLimitingRatio" Integer 0
    "pmDchFramesCrcMismatch" Integer 0
    "pmDchFramesLate" Integer 0
    "pmDchFramesReceived" Integer 0
    "pmDchFramesTooLate" Integer 0
    "pmHsDataFramesLost" Integer 0
    "pmHsDataFramesReceived" Integer 0
    "pmIubMacdPduRbsReceivedBits" Array Integer 0
    "pmRbsHsPdschCodePrio" Integer 0
    "pmTargetHsRate" Array Integer 0
)

CREATE
(
    parent "ManagedElement=1,NodeBFunction=1,Iub=1"
    identity "1"
    moType NbapCommon
    exception none
    nrOfAttributes 11
    "NbapCommonId" String "1"
    "activeBearer" Integer 0
    "auditRetransmissionT" Integer 5
    "availabilityStatus" Integer 0
    "l2EstablishReqRetryT" Integer 1
    "l2EstablishSupervisionT" Integer 30
    "l3EstablishSupervisionT" Integer 30
    "operationalState" Integer 0
    "pmNoOfDiscardedMsg" Integer 0
    "uniSaalTpRef1" Ref "null"
    "uniSaalTpRef2" Ref "null"
)

CREATE
(
    parent "ManagedElement=1,NodeBFunction=1,Iub=1"
    identity "1"
    moType NbapDedicated
    exception none
    nrOfAttributes 8
    "NbapDedicatedId" String "1"
    "activeBearer" Integer 0
    "availabilityStatus" Integer 0
    "l2EstablishReqRetryT" Integer 1
    "l2EstablishSupervisionT" Integer 30
    "operationalState" Integer 0
    "uniSaalTpRef1" Ref "null"
    "uniSaalTpRef2" Ref "null"
)

CREATE
(
    parent "ManagedElement=1,NodeBFunction=1,Iub=1"
    identity "1"
    moType NodeSynchTp
    exception none
    nrOfAttributes 8
    "NodeSynchTpId" String "1"
    "aal0TpRef1" Ref "null"
    "aal0TpRef2" Ref "null"
    "aal0TpRef3" Ref "null"
    "aal0TpRef4" Ref "null"
    "availabilityStatus" Integer 0
    "operationalState" Integer 0
    "timDeviceRef" Ref "null"
)

SET
(
    mo "ManagedElement=1,NodeBFunction=1,Iub=1,NodeSynchTp=1"
    exception none
    nrOfAttributes 3
    "timDeviceRef" Ref "ManagedElement=1,Equipment=1,Subrack=1,Slot=4,PlugInUnit=1,TuDeviceGroup=1,TimDeviceSet=1,TimDevice=1"
    "aal0TpRef2" Ref "ManagedElement=1,TransportNetwork=1,Aal0TpVccTp=bsb"
    "aal0TpRef1" Ref "ManagedElement=1,TransportNetwork=1,Aal0TpVccTp=bsa"
)

SET
(
    mo "ManagedElement=1,NodeBFunction=1,Iub=1,NbapDedicated=1"
    exception none
    nrOfAttributes 2
    "uniSaalTpRef2" Ref "ManagedElement=1,TransportNetwork=1,UniSaalTp=bdb"
    "uniSaalTpRef1" Ref "ManagedElement=1,TransportNetwork=1,UniSaalTp=bda"
)

SET
(
    mo "ManagedElement=1,NodeBFunction=1,Iub=1,NbapCommon=1"
    exception none
    nrOfAttributes 2
    "uniSaalTpRef2" Ref "ManagedElement=1,TransportNetwork=1,UniSaalTp=bcb"
    "uniSaalTpRef1" Ref "ManagedElement=1,TransportNetwork=1,UniSaalTp=bca"
)

