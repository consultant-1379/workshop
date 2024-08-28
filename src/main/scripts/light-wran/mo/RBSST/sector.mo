CREATE
(
    parent "ManagedElement=1,NodeBFunction=1"
    identity "S1"
    moType Sector
    exception none
    nrOfAttributes 17
    "SectorId" String "S1"
    "availabilityStatus" Integer 0
    "band" Integer 0
    "beamDirection" String "000"
    "geoDatum" String "WGS84"
    "height" String ""
    "latHemisphere" Integer 0
    "latitude" Integer 0
    "longitude" Integer 0
    "maxInternalUlGainOn" Boolean false
    "numberOfTxBranches" Integer -1
    "operationalState" Integer 0
    "proceduralStatus" Integer 1
    "retDeviceRef" Ref "null"
    "sectorAntennaRef" Ref "null"
    "tmaDeviceRef" Array Ref 0
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,NodeBFunction=1,Sector=S1"
    identity "C1"
    moType Carrier
    exception none
    nrOfAttributes 22
    "CarrierId" String "C1"
    "aiDeviceRef" Array Ref 0
    "airRateTypeSelector" Integer 1
    "availabilityStatus" Integer 0
    "cqiAdjustmentOn" Boolean false
    "cqiErrors" Integer 10
    "cqiErrorsAbsent" Integer 10
    "dbccDeviceRef" Array Ref 0
    "dpclDeviceRef" Ref "null"
    "frequencyPlane" Integer 2
    "hsPowerMargin" Integer 2
    "hsScchMaxCodePower" Integer -20
    "hsScchMinCodePower" Integer -150
    "operationalState" Integer 0
    "pmAverageRssi" Array Integer 1
        0
    "pmTransmittedCarrierPower" Array Integer 1
        0
    "qualityCheckPower" Integer 0
    "queueSelectAlgorithm" Integer 1
    "reservedBy" Array Ref 0
    "supportOf16qam" Boolean false
    "tpaDeviceRef" Array Ref 0
    "trDeviceRef" Array Ref 0
)

CREATE
(
    parent "ManagedElement=1,NodeBFunction=1,Sector=S1,Carrier=C1"
    identity "1"
    moType Pich
    exception none
    nrOfAttributes 4
    "PichId" String "1"
    "availabilityStatus" Integer 0
    "dbchDeviceSetRef" Ref "null"
    "operationalState" Integer 0
)

CREATE
(
    parent "ManagedElement=1,NodeBFunction=1,Sector=S1,Carrier=C1"
    identity "1"
    moType HsDschResources
    exception none
    nrOfAttributes 20
    "HsDschResourcesId" String "1"
    "availabilityStatus" Integer 0
    "operationalState" Integer 0
    "pmAckReceived" Integer 0
    "pmAverageUserRate" Array Integer 0
    "pmIubMacdPduCellReceivedBits" Integer 0
    "pmNackReceived" Integer 0
    "pmNoActiveSubFrames" Integer 0
    "pmNoInactiveRequiredSubFrames" Integer 0
    "pmNoOfHsUsersPerTti" Array Integer 0
    "pmRemainingResourceCheck" Array Integer 0
    "pmReportedCqi" Array Integer 0
    "pmSampleNumHsPdschCodesAdded" Integer 0
    "pmSumAckedBits" Integer 0
    "pmSumNonEmptyUserBuffers" Integer 0
    "pmSumNumHsPdschCodesAdded" Integer 0
    "pmSumOfHsScchUsedPwr" Array Integer 0
    "pmSumTransmittedBits" Integer 0
    "pmTransmittedCarrierPowerNonHs" Array Integer 0
    "pmUsedCqi" Array Integer 0
)

CREATE
(
    parent "ManagedElement=1,NodeBFunction=1,Sector=S1,Carrier=C1"
    identity "1"
    moType Aich
    exception none
    nrOfAttributes 6
    "AichId" String "1"
    "availabilityStatus" Integer 0
    "dbchDeviceSetRef" Ref "null"
    "operationalState" Integer 0
    "pmNegativeMessages" Integer 0
    "pmPositiveMessages" Integer 0
)

CREATE
(
    parent "ManagedElement=1,NodeBFunction=1,Sector=S1,Carrier=C1"
    identity "1"
    moType Psch
    exception none
    nrOfAttributes 3
    "PschId" String "1"
    "availabilityStatus" Integer 0
    "operationalState" Integer 0
)

CREATE
(
    parent "ManagedElement=1,NodeBFunction=1,Sector=S1,Carrier=C1"
    identity "1"
    moType Pccpch
    exception none
    nrOfAttributes 4
    "PccpchId" String "1"
    "availabilityStatus" Integer 0
    "dbchDeviceSetRef" Ref "null"
    "operationalState" Integer 0
)

CREATE
(
    parent "ManagedElement=1,NodeBFunction=1,Sector=S1,Carrier=C1,Pccpch=1"
    identity "1"
    moType Bch
    exception none
    nrOfAttributes 3
    "BchId" String "1"
    "availabilityStatus" Integer 0
    "operationalState" Integer 0
)

CREATE
(
    parent "ManagedElement=1,NodeBFunction=1,Sector=S1,Carrier=C1"
    identity "1"
    moType Ssch
    exception none
    nrOfAttributes 3
    "SschId" String "1"
    "availabilityStatus" Integer 0
    "operationalState" Integer 0
)

CREATE
(
    parent "ManagedElement=1,NodeBFunction=1,Sector=S1,Carrier=C1"
    identity "1"
    moType RadioLinks
    exception none
    nrOfAttributes 18
    "RadioLinksId" String "1"
    "noOfRadioLinks" Integer 0
    "pmAverageSir" Array Integer 0
    "pmAverageSirError" Array Integer 0
    "pmDpcchBer" Array Integer 0
    "pmDpchCodePowerSf128" Array Integer 0
    "pmDpchCodePowerSf16" Array Integer 0
    "pmDpchCodePowerSf256" Array Integer 0
    "pmDpchCodePowerSf32" Array Integer 0
    "pmDpchCodePowerSf4" Array Integer 0
    "pmDpchCodePowerSf64" Array Integer 0
    "pmDpchCodePowerSf8" Array Integer 0
    "pmDpdchBer" Array Integer 0
    "pmOutOfSynch" Array Integer 0
    "pmRLSSupSynchToUnsynch" Integer 0
    "pmRLSSupWaitToOutOfSynch" Integer 0
    "pmUlSynchTime" Array Integer 0
    "pmUlSynchTimeSHO" Array Integer 0
)

CREATE
(
    parent "ManagedElement=1,NodeBFunction=1,Sector=S1,Carrier=C1"
    identity "1"
    moType Pcpich
    exception none
    nrOfAttributes 3
    "PcpichId" String "1"
    "availabilityStatus" Integer 0
    "operationalState" Integer 0
)

CREATE
(
    parent "ManagedElement=1,NodeBFunction=1,Sector=S1,Carrier=C1"
    identity "1"
    moType Prach
    exception none
    nrOfAttributes 8
    "PrachId" String "1"
    "availabilityStatus" Integer 0
    "operationalState" Integer 0
    "pmNoPreambleFalseDetection" Integer 0
    "pmReceivedPreambleSir" Array Integer 0
    "pmSuccReceivedBlocks" Integer 0
    "pmUnsuccReceivedBlocks" Integer 0
    "ubchDeviceSetRef" Ref "null"
)

CREATE
(
    parent "ManagedElement=1,NodeBFunction=1,Sector=S1,Carrier=C1,Prach=1"
    identity "1"
    moType Rach
    exception none
    nrOfAttributes 3
    "RachId" String "1"
    "availabilityStatus" Integer 0
    "operationalState" Integer 0
)

CREATE
(
    parent "ManagedElement=1,NodeBFunction=1,Sector=S1,Carrier=C1"
    identity "1"
    moType Sccpch
    exception none
    nrOfAttributes 7
    "SccpchId" String "1"
    "availabilityStatus" Integer 0
    "dbchDeviceSetRef" Ref "null"
    "operationalState" Integer 0
    "pmNoOfTfc1OnFach1" Integer 0
    "pmNoOfTfc2OnFach1" Integer 0
    "pmNoOfTfc3OnFach2" Integer 0
)

CREATE
(
    parent "ManagedElement=1,NodeBFunction=1,Sector=S1,Carrier=C1,Sccpch=1"
    identity "1"
    moType Pch
    exception none
    nrOfAttributes 3
    "PchId" String "1"
    "availabilityStatus" Integer 0
    "operationalState" Integer 0
)

CREATE
(
    parent "ManagedElement=1,NodeBFunction=1,Sector=S1,Carrier=C1,Sccpch=1"
    identity "1"
    moType Fach
    exception none
    nrOfAttributes 3
    "FachId" String "1"
    "availabilityStatus" Integer 0
    "operationalState" Integer 0
)

CREATE
(
    parent "ManagedElement=1,NodeBFunction=1,Sector=S1,Carrier=C1,Sccpch=1"
    identity "2"
    moType Fach
    exception none
    nrOfAttributes 3
    "FachId" String "2"
    "availabilityStatus" Integer 0
    "operationalState" Integer 0
)

CREATE
(
    parent "ManagedElement=1,NodeBFunction=1,Sector=S1,Carrier=C1"
    identity "2"
    moType Sccpch
    exception none
    nrOfAttributes 7
    "SccpchId" String "2"
    "availabilityStatus" Integer 0
    "dbchDeviceSetRef" Ref "null"
    "operationalState" Integer 0
    "pmNoOfTfc1OnFach1" Integer 0
    "pmNoOfTfc2OnFach1" Integer 0
    "pmNoOfTfc3OnFach2" Integer 0
)

CREATE
(
    parent "ManagedElement=1,NodeBFunction=1,Sector=S1,Carrier=C1,Sccpch=2"
    identity "1"
    moType Pch
    exception none
    nrOfAttributes 3
    "PchId" String "1"
    "availabilityStatus" Integer 0
    "operationalState" Integer 0
)

CREATE
(
    parent "ManagedElement=1,NodeBFunction=1,Sector=S1,Carrier=C1,Sccpch=2"
    identity "1"
    moType Fach
    exception none
    nrOfAttributes 3
    "FachId" String "1"
    "availabilityStatus" Integer 0
    "operationalState" Integer 0
)

CREATE
(
    parent "ManagedElement=1,NodeBFunction=1,Sector=S1,Carrier=C1,Sccpch=2"
    identity "2"
    moType Fach
    exception none
    nrOfAttributes 3
    "FachId" String "2"
    "availabilityStatus" Integer 0
    "operationalState" Integer 0
)

SET
(
    mo "ManagedElement=1,NodeBFunction=1,Sector=S1,Carrier=C1"
    exception none
    nrOfAttributes 1
    "reservedBy" Array Ref 3
        "ManagedElement=1,NodeBFunction=1,RbsLocalCell=3"
        "ManagedElement=1,NodeBFunction=1,RbsLocalCell=2"
        "ManagedElement=1,NodeBFunction=1,RbsLocalCell=1"
)

