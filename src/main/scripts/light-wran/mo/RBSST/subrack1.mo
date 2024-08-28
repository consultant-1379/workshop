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
    "reservedBy" Ref "null"
    "subrackPosition" String ""
    "subrackType" Integer 0
    "switchModule" Ref "null"
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1"
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
    // "upgradeGroupTypeName" String ""
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
    // "upgradeGroupId" Integer 0
    // "upgradeGroupTypeName" String ""
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1"
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
    // "upgradeGroupTypeName" String ""
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1"
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
    // "upgradeGroupTypeName" String ""
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1"
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
    // "upgradeGroupTypeName" String ""
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1"
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
    // "upgradeGroupTypeName" String ""
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1"
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
    // "upgradeGroupTypeName" String ""
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1"
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
    // "upgradeGroupTypeName" String ""
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1"
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
    // "upgradeGroupTypeName" String ""
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1"
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
    // "upgradeGroupTypeName" String ""
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1"
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
    // "upgradeGroupTypeName" String ""
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1"
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
    // "upgradeGroupTypeName" String ""
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1"
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
    // "upgradeGroupTypeName" String ""
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1"
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
    // "upgradeGroupTypeName" String ""
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1"
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
    // "upgradeGroupTypeName" String ""
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1"
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
    // "upgradeGroupTypeName" String ""
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1"
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
    // "upgradeGroupTypeName" String ""
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1"
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
    // "upgradeGroupTypeName" String ""
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1"
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
    // "upgradeGroupTypeName" String ""
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1"
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
    // "upgradeGroupTypeName" String ""
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1"
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
    // "upgradeGroupTypeName" String ""
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1"
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
    // "upgradeGroupTypeName" String ""
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1"
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
    // "upgradeGroupTypeName" String ""
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1"
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
    // "upgradeGroupTypeName" String ""
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1"
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
    // "upgradeGroupTypeName" String ""
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1"
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
    // "upgradeGroupTypeName" String ""
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1"
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
    // "upgradeGroupTypeName" String ""
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1"
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
    // "upgradeGroupTypeName" String ""
    "userLabel" String ""
)

