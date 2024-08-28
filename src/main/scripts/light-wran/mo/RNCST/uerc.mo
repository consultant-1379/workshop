CREATE
(
    parent "ManagedElement=1,RncFunction=1"
    identity "1"
    moType UeRc
    exception none
    nrOfAttributes 14
    "UeRcId" String "1"
    "pmDlDchTrafficVolumeBeforeSplit" Integer 0
    "pmDlFachTrafficVolume" Integer 0
    "pmFaultyTransportBlocksAcUl" Integer 0
    "pmNoRabEstablishAttempts" Integer 0
    "pmNoRabEstablishSuccess" Integer 0
    "pmNoRabReleaseAttempts" Integer 0
    "pmNoRabReleaseSuccess" Integer 0
    "pmSamplesRabEstablish" Integer 0
    "pmSumRabEstablish" Integer 0
    "pmTransportBlocksAcUl" Integer 0
    "pmUlDchTrafficVolumeAfterComb" Integer 0
    "pmUlRachTrafficVolume" Integer 0
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,RncFunction=1,UeRc=1"
    identity "1"
    moType UeRcTrCh
    exception none
    nrOfAttributes 3
    "UeRcTrChId" String "1"
    "blerQualityTargetDl" Integer -63
    "blerQualityTargetUl" Integer -63
)

CREATE
(
    parent "ManagedElement=1,RncFunction=1,UeRc=1"
    identity "1"
    moType UeRcRab
    exception none
    nrOfAttributes 3
    "UeRcRabId" String "1"
//    "fcState" Integer 0
//    "trBearerQosClass" Integer 0
)


CREATE
(
    parent "ManagedElement=1,RncFunction=1"
    identity "1"
    moType UeRabType
    exception none
    nrOfAttributes 2
    "UeRabTypeId" String "1"
//    "trBearerQosClass" Integer 0
)














