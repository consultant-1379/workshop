CREATE
(
    parent "ManagedElement=1"
    identity "1"
    moType IpSystem
    exception none
    nrOfAttributes 2
    "IpSystemId" String "1"
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,IpOam=1"
    identity "1"
    moType Ip
    exception none
    nrOfAttributes 28
    "IpId" String "1"
    "availabilityStatus" Integer 1
    "connectionAttemptTimer" Integer 75
    "defDomainName" String ""
    "dnsServerAddresses" Array String "127.0.0.1"
    "dscp" Integer 0
    "icmpRedirect" Boolean true
    "isDefDomainName" Boolean false
    "isRecursiveSearch" Boolean true
    "isSubDomainName" Boolean true
    "maxRetransmissionAttempts" Integer 10
    "noOfRetrans" Integer 5
    "numberOfLinks" Integer 0
    "operationalState" Integer 0
    "pmNoOfHdrErrors" Integer 0
    "pmNoOfIpAddrErrors" Integer 0
    "pmNoOfIpForwDatagrams" Integer 0
    "pmNoOfIpInDiscards" Integer 0
    "pmNoOfIpInReceives" Integer 0
    "pmNoOfIpOutDiscards" Integer 0
    "pmNoOfIpReasmOKs" Integer 0
    "pmNoOfIpReasmReqds" Integer 0
    "reservedBy" Ref "null"
    "retransInterval" Integer 4
    "udpChecksumState" Integer 1
    "useHostFile" Boolean true
    "userLabel" String ""
    "workingMode" Integer 0
)

CREATE
(
    parent "ManagedElement=1,IpOam=1,Ip=1"
    identity "1"
    moType IpRoutingTable
    exception none
    nrOfAttributes 3
    "IpRoutingTableId" String "1"
    "indexOfDeletableStaticRoutes" Array Integer 1
        0
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,IpOam=1,Ip=1"
    identity "1"
    moType EthernetLink
    exception none
    nrOfAttributes 21
    "EthernetLinkId" String "1"
//    "activeMau" Ref "null"
    "availabilityStatus" Integer 1
//    "availableMaus" Array Ref 0
    "broadcastAddress" String ""
    "interfaceName" String ""
    "ipAddress" String ""
//    "macAddress" String ""
    "metric" Integer 1
    "mtuSize" Integer 1500
    "operationalState" Integer 0
    "pmNoOfIfInDiscards" Integer 0
    "pmNoOfIfInErrors" Integer 0
    "pmNoOfIfInNUcastPkts" Integer 0
    "pmNoOfIfInUcastPkts" Integer 0
    "pmNoOfIfOutNUcastPkts" Integer 0
    "pmNoOfIfOutUcastPkts" Integer 0
    "pmNoOfIfOutDiscards" Integer 0
    "reservedBy" Array Ref 0
    "subnetMask" String ""
    "userLabel" String ""
)

