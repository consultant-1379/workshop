CREATE
(
    parent "ManagedElement=1"
    identity "1"
    moType SwManagement
    exception none
    nrOfAttributes 2
    "SwManagementId" String "1"
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,SwManagement=1"
    identity "ans_aal2ap_12_1"
    moType ReliableProgramUniter
    exception none
    nrOfAttributes 2
    reliableProgramLabel String ""
    admActiveSlot Ref ""
)


CREATE
(
    parent "ManagedElement=1,SwManagement=1"
    identity "ans_aal2cpsrc_12_1"
    moType ReliableProgramUniter
    exception none
    nrOfAttributes 2 
    reliableProgramLabel String ""
    admActiveSlot Ref ""
)


CREATE
(
    parent "ManagedElement=1,SwManagement=1"
    identity "1"
    moType ConfigurationVersion
    exception none
    nrOfAttributes 22
    "ConfigurationVersionId" String "1"
    "actionResult" Struct
        nrOfElements 6
        "time" String ""
        "invokedAction" Integer 3
        "pathToDetailedInformation" String ""
        "configurationVersionName" String ""
        "actionId" Integer 1
        "mainResult" Integer 0

    "additionalActionResultData" Array Struct 0
    "autoCreatedCVIsTurnedOn" Boolean true
    "corruptedUpgradePackages" Array Struct 0
    "currentDetailedActivity" Integer 0
    "currentLoadedConfigurationVersion" String ""
    "currentMainActivity" Integer 0
    "currentUpgradePackage" Ref "null"
    "executingCv" String ""
    "lastCreatedCv" String ""
    "listOfHtmlResultFiles" Array String 0
    "missingUpgradePackages" Array Struct 0
    "restoreConfirmationDeadline" String ""
    "rollbackInitCounterValue" Integer 5
    "rollbackInitTimerValue" Integer 30
    "rollbackList" Array String 0
    "rollbackOn" Boolean true
    "startableConfigurationVersion" String ""
    "storedConfigurationVersions" Array Struct 0
    "timeForAutoCreatedCV" String "04:00"
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,SwManagement=1"
    identity "SCB_R6"
    moType PiuType
    exception none
    nrOfAttributes 7
    "PiuTypeId" String "SCB_R6"
    "boardWidth" Integer 1
    "defAllowedSeqRestarts" Integer -1
    "productData" Struct
        nrOfElements 5
        "productNumber" String ""
        "productRevision" String ""
        "productName" String ""
        "productInfo" String ""
        "productionDate" String ""

    "reservedBy" Array Ref 0
    "role" Integer 2
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,SwManagement=1"
    identity "TU_R3"
    moType PiuType
    exception none
    nrOfAttributes 7
    "PiuTypeId" String "TU_R3"
    "boardWidth" Integer 1
    "defAllowedSeqRestarts" Integer -1
    "productData" Struct
        nrOfElements 5
        "productNumber" String ""
        "productRevision" String ""
        "productName" String ""
        "productInfo" String ""
        "productionDate" String ""

    "reservedBy" Array Ref 0
    "role" Integer 2
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,SwManagement=1"
    identity "TU_R4"
    moType PiuType
    exception none
    nrOfAttributes 7
    "PiuTypeId" String "TU_R4"
    "boardWidth" Integer 1
    "defAllowedSeqRestarts" Integer -1
    "productData" Struct
        nrOfElements 5
        "productNumber" String ""
        "productRevision" String ""
        "productName" String ""
        "productInfo" String ""
        "productionDate" String ""

    "reservedBy" Array Ref 0
    "role" Integer 2
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,SwManagement=1"
    identity "GPB_FD_R4"
    moType PiuType
    exception none
    nrOfAttributes 7
    "PiuTypeId" String "GPB_FD_R4"
    "boardWidth" Integer 1
    "defAllowedSeqRestarts" Integer -1
    "productData" Struct
        nrOfElements 5
        "productNumber" String ""
        "productRevision" String ""
        "productName" String ""
        "productInfo" String ""
        "productionDate" String ""

    "reservedBy" Array Ref 0
    "role" Integer 1
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,SwManagement=1"
    identity "RAX_R2"
    moType PiuType
    exception none
    nrOfAttributes 7
    "PiuTypeId" String "RAX_R2"
    "boardWidth" Integer 1
    "defAllowedSeqRestarts" Integer -1
    "productData" Struct
        nrOfElements 5
        "productNumber" String ""
        "productRevision" String ""
        "productName" String ""
        "productInfo" String ""
        "productionDate" String ""

    "reservedBy" Array Ref 0
    "role" Integer 2
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,SwManagement=1"
    identity "RAX_R1"
    moType PiuType
    exception none
    nrOfAttributes 7
    "PiuTypeId" String "RAX_R1"
    "boardWidth" Integer 1
    "defAllowedSeqRestarts" Integer -1
    "productData" Struct
        nrOfElements 5
        "productNumber" String ""
        "productRevision" String ""
        "productName" String ""
        "productInfo" String ""
        "productionDate" String ""

    "reservedBy" Array Ref 0
    "role" Integer 2
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,SwManagement=1"
    identity "TX_R1"
    moType PiuType
    exception none
    nrOfAttributes 7
    "PiuTypeId" String "TX_R1"
    "boardWidth" Integer 1
    "defAllowedSeqRestarts" Integer -1
    "productData" Struct
        nrOfElements 5
        "productNumber" String ""
        "productRevision" String ""
        "productName" String ""
        "productInfo" String ""
        "productionDate" String ""

    "reservedBy" Array Ref 0
    "role" Integer 2
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,SwManagement=1"
    identity "TX_R2"
    moType PiuType
    exception none
    nrOfAttributes 7
    "PiuTypeId" String "TX_R2"
    "boardWidth" Integer 1
    "defAllowedSeqRestarts" Integer -1
    "productData" Struct
        nrOfElements 5
        "productNumber" String ""
        "productRevision" String ""
        "productName" String ""
        "productInfo" String ""
        "productionDate" String ""

    "reservedBy" Array Ref 0
    "role" Integer 2
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,SwManagement=1"
    identity "RFIF_R3"
    moType PiuType
    exception none
    nrOfAttributes 7
    "PiuTypeId" String "RFIF_R3"
    "boardWidth" Integer 1
    "defAllowedSeqRestarts" Integer -1
    "productData" Struct
        nrOfElements 5
        "productNumber" String ""
        "productRevision" String ""
        "productName" String ""
        "productInfo" String ""
        "productionDate" String ""

    "reservedBy" Array Ref 0
    "role" Integer 2
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,SwManagement=1"
    identity "TRX_R1"
    moType PiuType
    exception none
    nrOfAttributes 7
    "PiuTypeId" String "TRX_R1"
    "boardWidth" Integer 1
    "defAllowedSeqRestarts" Integer -1
    "productData" Struct
        nrOfElements 5
        "productNumber" String ""
        "productRevision" String ""
        "productName" String ""
        "productInfo" String ""
        "productionDate" String ""

    "reservedBy" Array Ref 0
    "role" Integer 2
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,SwManagement=1"
    identity "TRX_R2"
    moType PiuType
    exception none
    nrOfAttributes 7
    "PiuTypeId" String "TRX_R2"
    "boardWidth" Integer 1
    "defAllowedSeqRestarts" Integer -1
    "productData" Struct
        nrOfElements 5
        "productNumber" String ""
        "productRevision" String ""
        "productName" String ""
        "productInfo" String ""
        "productionDate" String ""

    "reservedBy" Array Ref 0
    "role" Integer 2
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,SwManagement=1"
    identity "TRX_R3"
    moType PiuType
    exception none
    nrOfAttributes 7
    "PiuTypeId" String "TRX_R3"
    "boardWidth" Integer 1
    "defAllowedSeqRestarts" Integer -1
    "productData" Struct
        nrOfElements 5
        "productNumber" String ""
        "productRevision" String ""
        "productName" String ""
        "productInfo" String ""
        "productionDate" String ""

    "reservedBy" Array Ref 0
    "role" Integer 2
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,SwManagement=1"
    identity "AIU_R5"
    moType PiuType
    exception none
    nrOfAttributes 7
    "PiuTypeId" String "AIU_R5"
    "boardWidth" Integer 1
    "defAllowedSeqRestarts" Integer -1
    "productData" Struct
        nrOfElements 5
        "productNumber" String ""
        "productRevision" String ""
        "productName" String ""
        "productInfo" String ""
        "productionDate" String ""

    "reservedBy" Array Ref 0
    "role" Integer 2
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,SwManagement=1"
    identity "AIU_P5"
    moType PiuType
    exception none
    nrOfAttributes 7
    "PiuTypeId" String "AIU_P5"
    "boardWidth" Integer 1
    "defAllowedSeqRestarts" Integer -1
    "productData" Struct
        nrOfElements 5
        "productNumber" String ""
        "productRevision" String ""
        "productName" String ""
        "productInfo" String ""
        "productionDate" String ""

    "reservedBy" Array Ref 0
    "role" Integer 2
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,SwManagement=1"
    identity "MCPA_35_R1"
    moType PiuType
    exception none
    nrOfAttributes 7
    "PiuTypeId" String "MCPA_35_R1"
    "boardWidth" Integer 1
    "defAllowedSeqRestarts" Integer -1
    "productData" Struct
        nrOfElements 5
        "productNumber" String ""
        "productRevision" String ""
        "productName" String ""
        "productInfo" String ""
        "productionDate" String ""

    "reservedBy" Array Ref 0
    "role" Integer 3
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,SwManagement=1"
    identity "MCPA_39_R1"
    moType PiuType
    exception none
    nrOfAttributes 7
    "PiuTypeId" String "MCPA_39_R1"
    "boardWidth" Integer 1
    "defAllowedSeqRestarts" Integer -1
    "productData" Struct
        nrOfElements 5
        "productNumber" String ""
        "productRevision" String ""
        "productName" String ""
        "productInfo" String ""
        "productionDate" String ""

    "reservedBy" Array Ref 0
    "role" Integer 3
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,SwManagement=1"
    identity "MCPA_45_R1"
    moType PiuType
    exception none
    nrOfAttributes 7
    "PiuTypeId" String "MCPA_45_R1"
    "boardWidth" Integer 1
    "defAllowedSeqRestarts" Integer -1
    "productData" Struct
        nrOfElements 5
        "productNumber" String ""
        "productRevision" String ""
        "productName" String ""
        "productInfo" String ""
        "productionDate" String ""

    "reservedBy" Array Ref 0
    "role" Integer 3
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,SwManagement=1"
    identity "MCPA_49_R1"
    moType PiuType
    exception none
    nrOfAttributes 7
    "PiuTypeId" String "MCPA_49_R1"
    "boardWidth" Integer 1
    "defAllowedSeqRestarts" Integer -1
    "productData" Struct
        nrOfElements 5
        "productNumber" String ""
        "productRevision" String ""
        "productName" String ""
        "productInfo" String ""
        "productionDate" String ""

    "reservedBy" Array Ref 0
    "role" Integer 3
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,SwManagement=1"
    identity "XALM_P1"
    moType PiuType
    exception none
    nrOfAttributes 7
    "PiuTypeId" String "XALM_P1"
    "boardWidth" Integer 1
    "defAllowedSeqRestarts" Integer -1
    "productData" Struct
        nrOfElements 5
        "productNumber" String ""
        "productRevision" String ""
        "productName" String ""
        "productInfo" String ""
        "productionDate" String ""

    "reservedBy" Array Ref 0
    "role" Integer 3
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,SwManagement=1"
    identity "TMA_R2"
    moType PiuType
    exception none
    nrOfAttributes 7
    "PiuTypeId" String "TMA_R2"
    "boardWidth" Integer 1
    "defAllowedSeqRestarts" Integer -1
    "productData" Struct
        nrOfElements 5
        "productNumber" String ""
        "productRevision" String ""
        "productName" String ""
        "productInfo" String ""
        "productionDate" String ""

    "reservedBy" Array Ref 0
    "role" Integer 3
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,SwManagement=1"
    identity "FAN_BB/RF_R8"
    moType PiuType
    exception none
    nrOfAttributes 7
    "PiuTypeId" String "FAN_BB/RF_R8"
    "boardWidth" Integer 1
    "defAllowedSeqRestarts" Integer -1
    "productData" Struct
        nrOfElements 5
        "productNumber" String ""
        "productRevision" String ""
        "productName" String ""
        "productInfo" String ""
        "productionDate" String ""

    "reservedBy" Array Ref 0
    "role" Integer 3
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,SwManagement=1"
    identity "CU_R7"
    moType PiuType
    exception none
    nrOfAttributes 7
    "PiuTypeId" String "CU_R7"
    "boardWidth" Integer 1
    "defAllowedSeqRestarts" Integer -1
    "productData" Struct
        nrOfElements 5
        "productNumber" String ""
        "productRevision" String ""
        "productName" String ""
        "productInfo" String ""
        "productionDate" String ""

    "reservedBy" Array Ref 0
    "role" Integer 3
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,SwManagement=1"
    identity "RET_P1"
    moType PiuType
    exception none
    nrOfAttributes 7
    "PiuTypeId" String "RET_P1"
    "boardWidth" Integer 1
    "defAllowedSeqRestarts" Integer -1
    "productData" Struct
        nrOfElements 5
        "productNumber" String ""
        "productRevision" String ""
        "productName" String ""
        "productInfo" String ""
        "productionDate" String ""

    "reservedBy" Array Ref 0
    "role" Integer 3
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,SwManagement=1"
    identity "GpbBasic"
    moType LoadModule
    exception none
    nrOfAttributes 16
    "LoadModuleId" String "GpbBasic"
    "fileFormat" String ""
    "isDirectory" Boolean false
    "loadModuleFilePath" String "/d/loadmodules/"
    "loaderType" Integer 0
    "moppletEntries" Array String 0
    "oseProgramHeapSize" Integer 0
    "oseProgramLoadClass" Integer 10
    "oseProgramPoolSize" Integer 0
    "otherLoaderName" String ""
    "preLoad" Integer 0
    "productData" Struct
        nrOfElements 5
        "productNumber" String ""
        "productRevision" String ""
        "productName" String ""
        "productInfo" String ""
        "productionDate" String ""

    "programMustBeSingleton" Boolean false
    "reliableProgramLabel" String ""
    "reservedByUpgradePackage" Boolean false
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,SwManagement=1"
    identity "DbmBasic"
    moType LoadModule
    exception none
    nrOfAttributes 16
    "LoadModuleId" String "DbmBasic"
    "fileFormat" String ""
    "isDirectory" Boolean false
    "loadModuleFilePath" String "/c/loadmodules/"
    "loaderType" Integer 0
    "moppletEntries" Array String 0
    "oseProgramHeapSize" Integer 0
    "oseProgramLoadClass" Integer 10
    "oseProgramPoolSize" Integer 0
    "otherLoaderName" String ""
    "preLoad" Integer 0
    "productData" Struct
        nrOfElements 5
        "productNumber" String ""
        "productRevision" String ""
        "productName" String ""
        "productInfo" String ""
        "productionDate" String ""

    "programMustBeSingleton" Boolean false
    "reliableProgramLabel" String ""
    "reservedByUpgradePackage" Boolean false
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,SwManagement=1"
    identity "LoaderServer"
    moType LoadModule
    exception none
    nrOfAttributes 16
    "LoadModuleId" String "LoaderServer"
    "fileFormat" String ""
    "isDirectory" Boolean false
    "loadModuleFilePath" String "/d/loadmodules/"
    "loaderType" Integer 0
    "moppletEntries" Array String 0
    "oseProgramHeapSize" Integer 0
    "oseProgramLoadClass" Integer 100
    "oseProgramPoolSize" Integer 0
    "otherLoaderName" String ""
    "preLoad" Integer 0
    "productData" Struct
        nrOfElements 5
        "productNumber" String ""
        "productRevision" String ""
        "productName" String ""
        "productInfo" String ""
        "productionDate" String ""

    "programMustBeSingleton" Boolean false
    "reliableProgramLabel" String ""
    "reservedByUpgradePackage" Boolean false
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,SwManagement=1"
    identity "Database"
    moType LoadModule
    exception none
    nrOfAttributes 16
    "LoadModuleId" String "Database"
    "fileFormat" String ""
    "isDirectory" Boolean false
    "loadModuleFilePath" String "/d/loadmodules/"
    "loaderType" Integer 0
    "moppletEntries" Array String 0
    "oseProgramHeapSize" Integer 0
    "oseProgramLoadClass" Integer 200
    "oseProgramPoolSize" Integer 3000000
    "otherLoaderName" String ""
    "preLoad" Integer 0
    "productData" Struct
        nrOfElements 5
        "productNumber" String ""
        "productRevision" String ""
        "productName" String ""
        "productInfo" String ""
        "productionDate" String ""

    "programMustBeSingleton" Boolean false
    "reliableProgramLabel" String ""
    "reservedByUpgradePackage" Boolean false
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,SwManagement=1"
    identity "EqmRes"
    moType LoadModule
    exception none
    nrOfAttributes 16
    "LoadModuleId" String "EqmRes"
    "fileFormat" String ""
    "isDirectory" Boolean false
    "loadModuleFilePath" String "/d/loadmodules/"
    "loaderType" Integer 0
    "moppletEntries" Array String 0
    "oseProgramHeapSize" Integer 0
    "oseProgramLoadClass" Integer 200
    "oseProgramPoolSize" Integer 0
    "otherLoaderName" String ""
    "preLoad" Integer 0
    "productData" Struct
        nrOfElements 5
        "productNumber" String ""
        "productRevision" String ""
        "productName" String ""
        "productInfo" String ""
        "productionDate" String ""

    "programMustBeSingleton" Boolean false
    "reliableProgramLabel" String ""
    "reservedByUpgradePackage" Boolean false
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,SwManagement=1"
    identity "SysMan"
    moType LoadModule
    exception none
    nrOfAttributes 16
    "LoadModuleId" String "SysMan"
    "fileFormat" String ""
    "isDirectory" Boolean false
    "loadModuleFilePath" String "/d/loadmodules/"
    "loaderType" Integer 0
    "moppletEntries" Array String 0
    "oseProgramHeapSize" Integer 0
    "oseProgramLoadClass" Integer 200
    "oseProgramPoolSize" Integer 0
    "otherLoaderName" String ""
    "preLoad" Integer 0
    "productData" Struct
        nrOfElements 5
        "productNumber" String ""
        "productRevision" String ""
        "productName" String ""
        "productInfo" String ""
        "productionDate" String ""

    "programMustBeSingleton" Boolean false
    "reliableProgramLabel" String ""
    "reservedByUpgradePackage" Boolean false
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,SwManagement=1"
    identity "Http"
    moType LoadModule
    exception none
    nrOfAttributes 16
    "LoadModuleId" String "Http"
    "fileFormat" String ""
    "isDirectory" Boolean false
    "loadModuleFilePath" String "/d/loadmodules/"
    "loaderType" Integer 0
    "moppletEntries" Array String 0
    "oseProgramHeapSize" Integer 724000
    "oseProgramLoadClass" Integer 300
    "oseProgramPoolSize" Integer 0
    "otherLoaderName" String ""
    "preLoad" Integer 0
    "productData" Struct
        nrOfElements 5
        "productNumber" String ""
        "productRevision" String ""
        "productName" String ""
        "productInfo" String ""
        "productionDate" String ""

    "programMustBeSingleton" Boolean false
    "reliableProgramLabel" String "osa_http_server"
    "reservedByUpgradePackage" Boolean false
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,SwManagement=1"
    identity "SwInst"
    moType LoadModule
    exception none
    nrOfAttributes 16
    "LoadModuleId" String "SwInst"
    "fileFormat" String ""
    "isDirectory" Boolean false
    "loadModuleFilePath" String "/d/loadmodules/"
    "loaderType" Integer 0
    "moppletEntries" Array String 0
    "oseProgramHeapSize" Integer 0
    "oseProgramLoadClass" Integer 200
    "oseProgramPoolSize" Integer 0
    "otherLoaderName" String ""
    "preLoad" Integer 0
    "productData" Struct
        nrOfElements 5
        "productNumber" String ""
        "productRevision" String ""
        "productName" String ""
        "productInfo" String ""
        "productionDate" String ""

    "programMustBeSingleton" Boolean false
    "reliableProgramLabel" String "osa_sw_installation"
    "reservedByUpgradePackage" Boolean false
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,SwManagement=1"
    identity "SpasConn"
    moType LoadModule
    exception none
    nrOfAttributes 16
    "LoadModuleId" String "SpasConn"
    "fileFormat" String ""
    "isDirectory" Boolean false
    "loadModuleFilePath" String "/d/loadmodules/"
    "loaderType" Integer 0
    "moppletEntries" Array String 0
    "oseProgramHeapSize" Integer 0
    "oseProgramLoadClass" Integer 300
    "oseProgramPoolSize" Integer 150000
    "otherLoaderName" String ""
    "preLoad" Integer 0
    "productData" Struct
        nrOfElements 5
        "productNumber" String ""
        "productRevision" String ""
        "productName" String ""
        "productInfo" String ""
        "productionDate" String ""

    "programMustBeSingleton" Boolean false
    "reliableProgramLabel" String ""
    "reservedByUpgradePackage" Boolean false
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,SwManagement=1"
    identity "SpasLink"
    moType LoadModule
    exception none
    nrOfAttributes 16
    "LoadModuleId" String "SpasLink"
    "fileFormat" String ""
    "isDirectory" Boolean false
    "loadModuleFilePath" String "/d/loadmodules/"
    "loaderType" Integer 0
    "moppletEntries" Array String 0
    "oseProgramHeapSize" Integer 0
    "oseProgramLoadClass" Integer 300
    "oseProgramPoolSize" Integer 0
    "otherLoaderName" String ""
    "preLoad" Integer 0
    "productData" Struct
        nrOfElements 5
        "productNumber" String ""
        "productRevision" String ""
        "productName" String ""
        "productInfo" String ""
        "productionDate" String ""

    "programMustBeSingleton" Boolean false
    "reliableProgramLabel" String ""
    "reservedByUpgradePackage" Boolean false
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,SwManagement=1"
    identity "SpasRes"
    moType LoadModule
    exception none
    nrOfAttributes 16
    "LoadModuleId" String "SpasRes"
    "fileFormat" String ""
    "isDirectory" Boolean false
    "loadModuleFilePath" String "/d/loadmodules/"
    "loaderType" Integer 0
    "moppletEntries" Array String 0
    "oseProgramHeapSize" Integer 0
    "oseProgramLoadClass" Integer 200
    "oseProgramPoolSize" Integer 0
    "otherLoaderName" String ""
    "preLoad" Integer 0
    "productData" Struct
        nrOfElements 5
        "productNumber" String ""
        "productRevision" String ""
        "productName" String ""
        "productInfo" String ""
        "productionDate" String ""

    "programMustBeSingleton" Boolean false
    "reliableProgramLabel" String "spas_resource"
    "reservedByUpgradePackage" Boolean false
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,SwManagement=1"
    identity "SpasSm"
    moType LoadModule
    exception none
    nrOfAttributes 16
    "LoadModuleId" String "SpasSm"
    "fileFormat" String ""
    "isDirectory" Boolean false
    "loadModuleFilePath" String "/d/loadmodules/"
    "loaderType" Integer 0
    "moppletEntries" Array String 0
    "oseProgramHeapSize" Integer 0
    "oseProgramLoadClass" Integer 300
    "oseProgramPoolSize" Integer 0
    "otherLoaderName" String ""
    "preLoad" Integer 0
    "productData" Struct
        nrOfElements 5
        "productNumber" String ""
        "productRevision" String ""
        "productName" String ""
        "productInfo" String ""
        "productionDate" String ""

    "programMustBeSingleton" Boolean false
    "reliableProgramLabel" String ""
    "reservedByUpgradePackage" Boolean false
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,SwManagement=1"
    identity "Jvm"
    moType LoadModule
    exception none
    nrOfAttributes 16
    "LoadModuleId" String "Jvm"
    "fileFormat" String ""
    "isDirectory" Boolean false
    "loadModuleFilePath" String "/d/loadmodules/"
    "loaderType" Integer 0
    "moppletEntries" Array String 0
    "oseProgramHeapSize" Integer 13312640
    "oseProgramLoadClass" Integer 500
    "oseProgramPoolSize" Integer 4000000
    "otherLoaderName" String ""
    "preLoad" Integer 0
    "productData" Struct
        nrOfElements 5
        "productNumber" String ""
        "productRevision" String ""
        "productName" String ""
        "productInfo" String ""
        "productionDate" String ""

    "programMustBeSingleton" Boolean false
    "reliableProgramLabel" String "osa_jvm"
    "reservedByUpgradePackage" Boolean false
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,SwManagement=1"
    identity "Inet"
    moType LoadModule
    exception none
    nrOfAttributes 16
    "LoadModuleId" String "Inet"
    "fileFormat" String ""
    "isDirectory" Boolean false
    "loadModuleFilePath" String "/d/loadmodules/"
    "loaderType" Integer 0
    "moppletEntries" Array String 0
    "oseProgramHeapSize" Integer 0
    "oseProgramLoadClass" Integer 200
    "oseProgramPoolSize" Integer 0
    "otherLoaderName" String ""
    "preLoad" Integer 0
    "productData" Struct
        nrOfElements 5
        "productNumber" String ""
        "productRevision" String ""
        "productName" String ""
        "productInfo" String ""
        "productionDate" String ""

    "programMustBeSingleton" Boolean false
    "reliableProgramLabel" String "osa_inet"
    "reservedByUpgradePackage" Boolean false
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,SwManagement=1"
    identity "Ospf"
    moType LoadModule
    exception none
    nrOfAttributes 16
    "LoadModuleId" String "Ospf"
    "fileFormat" String ""
    "isDirectory" Boolean false
    "loadModuleFilePath" String "/d/loadmodules/"
    "loaderType" Integer 0
    "moppletEntries" Array String 0
    "oseProgramHeapSize" Integer 0
    "oseProgramLoadClass" Integer 200
    "oseProgramPoolSize" Integer 0
    "otherLoaderName" String ""
    "preLoad" Integer 0
    "productData" Struct
        nrOfElements 5
        "productNumber" String ""
        "productRevision" String ""
        "productName" String ""
        "productInfo" String ""
        "productionDate" String ""

    "programMustBeSingleton" Boolean false
    "reliableProgramLabel" String "osa_ospf"
    "reservedByUpgradePackage" Boolean false
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,SwManagement=1"
    identity "Sock"
    moType LoadModule
    exception none
    nrOfAttributes 16
    "LoadModuleId" String "Sock"
    "fileFormat" String ""
    "isDirectory" Boolean false
    "loadModuleFilePath" String "/d/loadmodules/"
    "loaderType" Integer 0
    "moppletEntries" Array String 0
    "oseProgramHeapSize" Integer 0
    "oseProgramLoadClass" Integer 200
    "oseProgramPoolSize" Integer 0
    "otherLoaderName" String ""
    "preLoad" Integer 0
    "productData" Struct
        nrOfElements 5
        "productNumber" String ""
        "productRevision" String ""
        "productName" String ""
        "productInfo" String ""
        "productionDate" String ""

    "programMustBeSingleton" Boolean false
    "reliableProgramLabel" String ""
    "reservedByUpgradePackage" Boolean false
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,SwManagement=1"
    identity "Ethernet"
    moType LoadModule
    exception none
    nrOfAttributes 16
    "LoadModuleId" String "Ethernet"
    "fileFormat" String ""
    "isDirectory" Boolean false
    "loadModuleFilePath" String "/d/loadmodules/"
    "loaderType" Integer 0
    "moppletEntries" Array String 0
    "oseProgramHeapSize" Integer 0
    "oseProgramLoadClass" Integer 200
    "oseProgramPoolSize" Integer 0
    "otherLoaderName" String ""
    "preLoad" Integer 0
    "productData" Struct
        nrOfElements 5
        "productNumber" String ""
        "productRevision" String ""
        "productName" String ""
        "productInfo" String ""
        "productionDate" String ""

    "programMustBeSingleton" Boolean false
    "reliableProgramLabel" String ""
    "reservedByUpgradePackage" Boolean false
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,SwManagement=1"
    identity "IpUtil"
    moType LoadModule
    exception none
    nrOfAttributes 16
    "LoadModuleId" String "IpUtil"
    "fileFormat" String ""
    "isDirectory" Boolean false
    "loadModuleFilePath" String "/d/loadmodules/"
    "loaderType" Integer 0
    "moppletEntries" Array String 0
    "oseProgramHeapSize" Integer 0
    "oseProgramLoadClass" Integer 200
    "oseProgramPoolSize" Integer 0
    "otherLoaderName" String ""
    "preLoad" Integer 0
    "productData" Struct
        nrOfElements 5
        "productNumber" String ""
        "productRevision" String ""
        "productName" String ""
        "productInfo" String ""
        "productionDate" String ""

    "programMustBeSingleton" Boolean false
    "reliableProgramLabel" String "osa_ip_util"
    "reservedByUpgradePackage" Boolean false
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,SwManagement=1"
    identity "48vpwrsup"
    moType LoadModule
    exception none
    nrOfAttributes 16
    "LoadModuleId" String "48vpwrsup"
    "fileFormat" String ""
    "isDirectory" Boolean false
    "loadModuleFilePath" String "/c/loadmodules/"
    "loaderType" Integer 0
    "moppletEntries" Array String 0
    "oseProgramHeapSize" Integer 0
    "oseProgramLoadClass" Integer 300
    "oseProgramPoolSize" Integer 0
    "otherLoaderName" String ""
    "preLoad" Integer 0
    "productData" Struct
        nrOfElements 5
        "productNumber" String ""
        "productRevision" String ""
        "productName" String ""
        "productInfo" String ""
        "productionDate" String ""

    "programMustBeSingleton" Boolean false
    "reliableProgramLabel" String ""
    "reservedByUpgradePackage" Boolean false
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,SwManagement=1"
    identity "CpyLoader"
    moType LoadModule
    exception none
    nrOfAttributes 16
    "LoadModuleId" String "CpyLoader"
    "fileFormat" String ""
    "isDirectory" Boolean false
    "loadModuleFilePath" String "/c/loadmodules/"
    "loaderType" Integer 0
    "moppletEntries" Array String 0
    "oseProgramHeapSize" Integer 0
    "oseProgramLoadClass" Integer 300
    "oseProgramPoolSize" Integer 0
    "otherLoaderName" String ""
    "preLoad" Integer 0
    "productData" Struct
        nrOfElements 5
        "productNumber" String ""
        "productRevision" String ""
        "productName" String ""
        "productInfo" String ""
        "productionDate" String ""

    "programMustBeSingleton" Boolean false
    "reliableProgramLabel" String ""
    "reservedByUpgradePackage" Boolean false
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,SwManagement=1"
    identity "Aal0StaticAdm"
    moType LoadModule
    exception none
    nrOfAttributes 16
    "LoadModuleId" String "Aal0StaticAdm"
    "fileFormat" String ""
    "isDirectory" Boolean false
    "loadModuleFilePath" String "/d/loadmodules/"
    "loaderType" Integer 0
    "moppletEntries" Array String 0
    "oseProgramHeapSize" Integer 0
    "oseProgramLoadClass" Integer 400
    "oseProgramPoolSize" Integer 0
    "otherLoaderName" String ""
    "preLoad" Integer 0
    "productData" Struct
        nrOfElements 5
        "productNumber" String ""
        "productRevision" String ""
        "productName" String ""
        "productInfo" String ""
        "productionDate" String ""

    "programMustBeSingleton" Boolean false
    "reliableProgramLabel" String "act_aal0_static_adm"
    "reservedByUpgradePackage" Boolean false
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,SwManagement=1"
    identity "Aal0TermMp"
    moType LoadModule
    exception none
    nrOfAttributes 16
    "LoadModuleId" String "Aal0TermMp"
    "fileFormat" String ""
    "isDirectory" Boolean false
    "loadModuleFilePath" String "/d/loadmodules/"
    "loaderType" Integer 0
    "moppletEntries" Array String 0
    "oseProgramHeapSize" Integer 0
    "oseProgramLoadClass" Integer 400
    "oseProgramPoolSize" Integer 0
    "otherLoaderName" String ""
    "preLoad" Integer 0
    "productData" Struct
        nrOfElements 5
        "productNumber" String ""
        "productRevision" String ""
        "productName" String ""
        "productInfo" String ""
        "productionDate" String ""

    "programMustBeSingleton" Boolean false
    "reliableProgramLabel" String ""
    "reservedByUpgradePackage" Boolean false
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,SwManagement=1"
    identity "Aal0TuBp"
    moType LoadModule
    exception none
    nrOfAttributes 16
    "LoadModuleId" String "Aal0TuBp"
    "fileFormat" String ""
    "isDirectory" Boolean false
    "loadModuleFilePath" String "/d/loadmodules/"
    "loaderType" Integer 0
    "moppletEntries" Array String 0
    "oseProgramHeapSize" Integer 0
    "oseProgramLoadClass" Integer 400
    "oseProgramPoolSize" Integer 0
    "otherLoaderName" String ""
    "preLoad" Integer 0
    "productData" Struct
        nrOfElements 5
        "productNumber" String ""
        "productRevision" String ""
        "productName" String ""
        "productInfo" String ""
        "productionDate" String ""

    "programMustBeSingleton" Boolean false
    "reliableProgramLabel" String ""
    "reservedByUpgradePackage" Boolean false
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,SwManagement=1"
    identity "Aal5StaticAdm"
    moType LoadModule
    exception none
    nrOfAttributes 16
    "LoadModuleId" String "Aal5StaticAdm"
    "fileFormat" String ""
    "isDirectory" Boolean false
    "loadModuleFilePath" String "/d/loadmodules/"
    "loaderType" Integer 0
    "moppletEntries" Array String 0
    "oseProgramHeapSize" Integer 175136
    "oseProgramLoadClass" Integer 400
    "oseProgramPoolSize" Integer 0
    "otherLoaderName" String ""
    "preLoad" Integer 0
    "productData" Struct
        nrOfElements 5
        "productNumber" String ""
        "productRevision" String ""
        "productName" String ""
        "productInfo" String ""
        "productionDate" String ""

    "programMustBeSingleton" Boolean false
    "reliableProgramLabel" String "act_aal5_static_adm"
    "reservedByUpgradePackage" Boolean false
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,SwManagement=1"
    identity "Aal5TermMp"
    moType LoadModule
    exception none
    nrOfAttributes 16
    "LoadModuleId" String "Aal5TermMp"
    "fileFormat" String ""
    "isDirectory" Boolean false
    "loadModuleFilePath" String "/d/loadmodules/"
    "loaderType" Integer 0
    "moppletEntries" Array String 0
    "oseProgramHeapSize" Integer 0
    "oseProgramLoadClass" Integer 400
    "oseProgramPoolSize" Integer 0
    "otherLoaderName" String ""
    "preLoad" Integer 0
    "productData" Struct
        nrOfElements 5
        "productNumber" String ""
        "productRevision" String ""
        "productName" String ""
        "productInfo" String ""
        "productionDate" String ""

    "programMustBeSingleton" Boolean false
    "reliableProgramLabel" String ""
    "reservedByUpgradePackage" Boolean false
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,SwManagement=1"
    identity "Aal5TermBp"
    moType LoadModule
    exception none
    nrOfAttributes 16
    "LoadModuleId" String "Aal5TermBp"
    "fileFormat" String ""
    "isDirectory" Boolean false
    "loadModuleFilePath" String "/c/loadmodules/"
    "loaderType" Integer 0
    "moppletEntries" Array String 0
    "oseProgramHeapSize" Integer 0
    "oseProgramLoadClass" Integer 400
    "oseProgramPoolSize" Integer 0
    "otherLoaderName" String ""
    "preLoad" Integer 0
    "productData" Struct
        nrOfElements 5
        "productNumber" String ""
        "productRevision" String ""
        "productName" String ""
        "productInfo" String ""
        "productionDate" String ""

    "programMustBeSingleton" Boolean false
    "reliableProgramLabel" String ""
    "reservedByUpgradePackage" Boolean false
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,SwManagement=1"
    identity "AtmMp"
    moType LoadModule
    exception none
    nrOfAttributes 16
    "LoadModuleId" String "AtmMp"
    "fileFormat" String ""
    "isDirectory" Boolean false
    "loadModuleFilePath" String "/d/loadmodules/"
    "loaderType" Integer 0
    "moppletEntries" Array String 0
    "oseProgramHeapSize" Integer 0
    "oseProgramLoadClass" Integer 400
    "oseProgramPoolSize" Integer 0
    "otherLoaderName" String ""
    "preLoad" Integer 0
    "productData" Struct
        nrOfElements 5
        "productNumber" String ""
        "productRevision" String ""
        "productName" String ""
        "productInfo" String ""
        "productionDate" String ""

    "programMustBeSingleton" Boolean false
    "reliableProgramLabel" String "atmmp"
    "reservedByUpgradePackage" Boolean false
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,SwManagement=1"
    identity "AtmBp"
    moType LoadModule
    exception none
    nrOfAttributes 16
    "LoadModuleId" String "AtmBp"
    "fileFormat" String ""
    "isDirectory" Boolean false
    "loadModuleFilePath" String "/c/loadmodules/"
    "loaderType" Integer 0
    "moppletEntries" Array String 0
    "oseProgramHeapSize" Integer 0
    "oseProgramLoadClass" Integer 400
    "oseProgramPoolSize" Integer 0
    "otherLoaderName" String ""
    "preLoad" Integer 0
    "productData" Struct
        nrOfElements 5
        "productNumber" String ""
        "productRevision" String ""
        "productName" String ""
        "productInfo" String ""
        "productionDate" String ""

    "programMustBeSingleton" Boolean false
    "reliableProgramLabel" String ""
    "reservedByUpgradePackage" Boolean false
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,SwManagement=1"
    identity "Aal2Mp"
    moType LoadModule
    exception none
    nrOfAttributes 16
    "LoadModuleId" String "Aal2Mp"
    "fileFormat" String ""
    "isDirectory" Boolean false
    "loadModuleFilePath" String "/d/loadmodules/"
    "loaderType" Integer 0
    "moppletEntries" Array String 0
    "oseProgramHeapSize" Integer 0
    "oseProgramLoadClass" Integer 400
    "oseProgramPoolSize" Integer 0
    "otherLoaderName" String ""
    "preLoad" Integer 0
    "productData" Struct
        nrOfElements 5
        "productNumber" String ""
        "productRevision" String ""
        "productName" String ""
        "productInfo" String ""
        "productionDate" String ""

    "programMustBeSingleton" Boolean false
    "reliableProgramLabel" String "aal2mp"
    "reservedByUpgradePackage" Boolean false
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,SwManagement=1"
    identity "Aal2Bp"
    moType LoadModule
    exception none
    nrOfAttributes 16
    "LoadModuleId" String "Aal2Bp"
    "fileFormat" String ""
    "isDirectory" Boolean false
    "loadModuleFilePath" String "/c/loadmodules/"
    "loaderType" Integer 0
    "moppletEntries" Array String 0
    "oseProgramHeapSize" Integer 0
    "oseProgramLoadClass" Integer 400
    "oseProgramPoolSize" Integer 0
    "otherLoaderName" String ""
    "preLoad" Integer 0
    "productData" Struct
        nrOfElements 5
        "productNumber" String ""
        "productRevision" String ""
        "productName" String ""
        "productInfo" String ""
        "productionDate" String ""

    "programMustBeSingleton" Boolean false
    "reliableProgramLabel" String ""
    "reservedByUpgradePackage" Boolean false
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,SwManagement=1"
    identity "EquipMp"
    moType LoadModule
    exception none
    nrOfAttributes 16
    "LoadModuleId" String "EquipMp"
    "fileFormat" String ""
    "isDirectory" Boolean false
    "loadModuleFilePath" String "/d/loadmodules/"
    "loaderType" Integer 0
    "moppletEntries" Array String 0
    "oseProgramHeapSize" Integer 0
    "oseProgramLoadClass" Integer 400
    "oseProgramPoolSize" Integer 0
    "otherLoaderName" String ""
    "preLoad" Integer 0
    "productData" Struct
        nrOfElements 5
        "productNumber" String ""
        "productRevision" String ""
        "productName" String ""
        "productInfo" String ""
        "productionDate" String ""

    "programMustBeSingleton" Boolean false
    "reliableProgramLabel" String "equip_mp"
    "reservedByUpgradePackage" Boolean false
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,SwManagement=1"
    identity "Aal2Adm"
    moType LoadModule
    exception none
    nrOfAttributes 16
    "LoadModuleId" String "Aal2Adm"
    "fileFormat" String ""
    "isDirectory" Boolean false
    "loadModuleFilePath" String "/d/loadmodules/"
    "loaderType" Integer 0
    "moppletEntries" Array String 0
    "oseProgramHeapSize" Integer 0
    "oseProgramLoadClass" Integer 400
    "oseProgramPoolSize" Integer 0
    "otherLoaderName" String ""
    "preLoad" Integer 0
    "productData" Struct
        nrOfElements 5
        "productNumber" String ""
        "productRevision" String ""
        "productName" String ""
        "productInfo" String ""
        "productionDate" String ""

    "programMustBeSingleton" Boolean false
    "reliableProgramLabel" String "aal2_adm"
    "reservedByUpgradePackage" Boolean false
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,SwManagement=1"
    identity "Aal2Rh"
    moType LoadModule
    exception none
    nrOfAttributes 16
    "LoadModuleId" String "Aal2Rh"
    "fileFormat" String ""
    "isDirectory" Boolean false
    "loadModuleFilePath" String "/d/loadmodules/"
    "loaderType" Integer 0
    "moppletEntries" Array String 0
    "oseProgramHeapSize" Integer 0
    "oseProgramLoadClass" Integer 400
    "oseProgramPoolSize" Integer 0
    "otherLoaderName" String ""
    "preLoad" Integer 0
    "productData" Struct
        nrOfElements 5
        "productNumber" String ""
        "productRevision" String ""
        "productName" String ""
        "productInfo" String ""
        "productionDate" String ""

    "programMustBeSingleton" Boolean false
    "reliableProgramLabel" String "aal2_rh"
    "reservedByUpgradePackage" Boolean false
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,SwManagement=1"
    identity "Aal05Ncc"
    moType LoadModule
    exception none
    nrOfAttributes 16
    "LoadModuleId" String "Aal05Ncc"
    "fileFormat" String ""
    "isDirectory" Boolean false
    "loadModuleFilePath" String "/d/loadmodules/"
    "loaderType" Integer 0
    "moppletEntries" Array String 0
    "oseProgramHeapSize" Integer 0
    "oseProgramLoadClass" Integer 400
    "oseProgramPoolSize" Integer 0
    "otherLoaderName" String ""
    "preLoad" Integer 0
    "productData" Struct
        nrOfElements 5
        "productNumber" String ""
        "productRevision" String ""
        "productName" String ""
        "productInfo" String ""
        "productionDate" String ""

    "programMustBeSingleton" Boolean false
    "reliableProgramLabel" String "aal05_ncc"
    "reservedByUpgradePackage" Boolean false
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,SwManagement=1"
    identity "AalCc"
    moType LoadModule
    exception none
    nrOfAttributes 16
    "LoadModuleId" String "AalCc"
    "fileFormat" String ""
    "isDirectory" Boolean false
    "loadModuleFilePath" String "/d/loadmodules/"
    "loaderType" Integer 0
    "moppletEntries" Array String 0
    "oseProgramHeapSize" Integer 0
    "oseProgramLoadClass" Integer 400
    "oseProgramPoolSize" Integer 0
    "otherLoaderName" String ""
    "preLoad" Integer 0
    "productData" Struct
        nrOfElements 5
        "productNumber" String ""
        "productRevision" String ""
        "productName" String ""
        "productInfo" String ""
        "productionDate" String ""

    "programMustBeSingleton" Boolean false
    "reliableProgramLabel" String "aal_cc"
    "reservedByUpgradePackage" Boolean false
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,SwManagement=1"
    identity "NssMp"
    moType LoadModule
    exception none
    nrOfAttributes 16
    "LoadModuleId" String "NssMp"
    "fileFormat" String ""
    "isDirectory" Boolean false
    "loadModuleFilePath" String "/d/loadmodules/"
    "loaderType" Integer 0
    "moppletEntries" Array String 0
    "oseProgramHeapSize" Integer 0
    "oseProgramLoadClass" Integer 400
    "oseProgramPoolSize" Integer 0
    "otherLoaderName" String ""
    "preLoad" Integer 0
    "productData" Struct
        nrOfElements 5
        "productNumber" String ""
        "productRevision" String ""
        "productName" String ""
        "productInfo" String ""
        "productionDate" String ""

    "programMustBeSingleton" Boolean false
    "reliableProgramLabel" String "nss_nss_mp"
    "reservedByUpgradePackage" Boolean false
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,SwManagement=1"
    identity "NssScb"
    moType LoadModule
    exception none
    nrOfAttributes 16
    "LoadModuleId" String "NssScb"
    "fileFormat" String ""
    "isDirectory" Boolean false
    "loadModuleFilePath" String "/d/loadmodules/"
    "loaderType" Integer 0
    "moppletEntries" Array String 0
    "oseProgramHeapSize" Integer 0
    "oseProgramLoadClass" Integer 400
    "oseProgramPoolSize" Integer 0
    "otherLoaderName" String ""
    "preLoad" Integer 0
    "productData" Struct
        nrOfElements 5
        "productNumber" String ""
        "productRevision" String ""
        "productName" String ""
        "productInfo" String ""
        "productionDate" String ""

    "programMustBeSingleton" Boolean false
    "reliableProgramLabel" String ""
    "reservedByUpgradePackage" Boolean false
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,SwManagement=1"
    identity "NssSyciBp"
    moType LoadModule
    exception none
    nrOfAttributes 16
    "LoadModuleId" String "NssSyciBp"
    "fileFormat" String ""
    "isDirectory" Boolean false
    "loadModuleFilePath" String "/c/loadmodules/"
    "loaderType" Integer 0
    "moppletEntries" Array String 0
    "oseProgramHeapSize" Integer 0
    "oseProgramLoadClass" Integer 400
    "oseProgramPoolSize" Integer 0
    "otherLoaderName" String ""
    "preLoad" Integer 0
    "productData" Struct
        nrOfElements 5
        "productNumber" String ""
        "productRevision" String ""
        "productName" String ""
        "productInfo" String ""
        "productionDate" String ""

    "programMustBeSingleton" Boolean false
    "reliableProgramLabel" String ""
    "reservedByUpgradePackage" Boolean false
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,SwManagement=1"
    identity "NssSyciMp"
    moType LoadModule
    exception none
    nrOfAttributes 16
    "LoadModuleId" String "NssSyciMp"
    "fileFormat" String ""
    "isDirectory" Boolean false
    "loadModuleFilePath" String "/d/loadmodules/"
    "loaderType" Integer 0
    "moppletEntries" Array String 0
    "oseProgramHeapSize" Integer 0
    "oseProgramLoadClass" Integer 400
    "oseProgramPoolSize" Integer 0
    "otherLoaderName" String ""
    "preLoad" Integer 0
    "productData" Struct
        nrOfElements 5
        "productNumber" String ""
        "productRevision" String ""
        "productName" String ""
        "productInfo" String ""
        "productionDate" String ""

    "programMustBeSingleton" Boolean false
    "reliableProgramLabel" String ""
    "reservedByUpgradePackage" Boolean false
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,SwManagement=1"
    identity "Pms"
    moType LoadModule
    exception none
    nrOfAttributes 16
    "LoadModuleId" String "Pms"
    "fileFormat" String ""
    "isDirectory" Boolean false
    "loadModuleFilePath" String "/d/loadmodules/"
    "loaderType" Integer 0
    "moppletEntries" Array String 0
    "oseProgramHeapSize" Integer 0
    "oseProgramLoadClass" Integer 400
    "oseProgramPoolSize" Integer 0
    "otherLoaderName" String ""
    "preLoad" Integer 0
    "productData" Struct
        nrOfElements 5
        "productNumber" String ""
        "productRevision" String ""
        "productName" String ""
        "productInfo" String ""
        "productionDate" String ""

    "programMustBeSingleton" Boolean false
    "reliableProgramLabel" String "pms"
    "reservedByUpgradePackage" Boolean false
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,SwManagement=1"
    identity "UsaalAdm"
    moType LoadModule
    exception none
    nrOfAttributes 16
    "LoadModuleId" String "UsaalAdm"
    "fileFormat" String ""
    "isDirectory" Boolean false
    "loadModuleFilePath" String "/d/loadmodules/"
    "loaderType" Integer 0
    "moppletEntries" Array String 0
    "oseProgramHeapSize" Integer 0
    "oseProgramLoadClass" Integer 400
    "oseProgramPoolSize" Integer 0
    "otherLoaderName" String ""
    "preLoad" Integer 0
    "productData" Struct
        nrOfElements 5
        "productNumber" String ""
        "productRevision" String ""
        "productName" String ""
        "productInfo" String ""
        "productionDate" String ""

    "programMustBeSingleton" Boolean false
    "reliableProgramLabel" String "usaal_adm"
    "reservedByUpgradePackage" Boolean false
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,SwManagement=1"
    identity "UsaalTerm"
    moType LoadModule
    exception none
    nrOfAttributes 16
    "LoadModuleId" String "UsaalTerm"
    "fileFormat" String ""
    "isDirectory" Boolean false
    "loadModuleFilePath" String "/d/loadmodules/"
    "loaderType" Integer 0
    "moppletEntries" Array String 0
    "oseProgramHeapSize" Integer 0
    "oseProgramLoadClass" Integer 400
    "oseProgramPoolSize" Integer 1000000
    "otherLoaderName" String ""
    "preLoad" Integer 0
    "productData" Struct
        nrOfElements 5
        "productNumber" String ""
        "productRevision" String ""
        "productName" String ""
        "productInfo" String ""
        "productionDate" String ""

    "programMustBeSingleton" Boolean false
    "reliableProgramLabel" String ""
    "reservedByUpgradePackage" Boolean false
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,SwManagement=1"
    identity "TuFpga"
    moType LoadModule
    exception none
    nrOfAttributes 16
    "LoadModuleId" String "TuFpga"
    "fileFormat" String ""
    "isDirectory" Boolean false
    "loadModuleFilePath" String "/c/loadmodules/CXC1321123_R4B01"
    "loaderType" Integer 4
    "moppletEntries" Array String 0
    "oseProgramHeapSize" Integer 0
    "oseProgramLoadClass" Integer 500
    "oseProgramPoolSize" Integer 0
    "otherLoaderName" String ""
    "preLoad" Integer 0
    "productData" Struct
        nrOfElements 5
        "productNumber" String ""
        "productRevision" String ""
        "productName" String ""
        "productInfo" String ""
        "productionDate" String ""

    "programMustBeSingleton" Boolean false
    "reliableProgramLabel" String ""
    "reservedByUpgradePackage" Boolean false
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,SwManagement=1"
    identity "Cs"
    moType LoadModule
    exception none
    nrOfAttributes 16
    "LoadModuleId" String "Cs"
    "fileFormat" String ""
    "isDirectory" Boolean false
    "loadModuleFilePath" String "/c/java/CXC1320961_R3G01.jar"
    "loaderType" Integer 2
    "moppletEntries" Array String 0
    "oseProgramHeapSize" Integer 0
    "oseProgramLoadClass" Integer 400
    "oseProgramPoolSize" Integer 0
    "otherLoaderName" String ""
    "preLoad" Integer 0
    "productData" Struct
        nrOfElements 5
        "productNumber" String ""
        "productRevision" String ""
        "productName" String ""
        "productInfo" String ""
        "productionDate" String ""

    "programMustBeSingleton" Boolean false
    "reliableProgramLabel" String ""
    "reservedByUpgradePackage" Boolean false
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,SwManagement=1"
    identity "Cma"
    moType LoadModule
    exception none
    nrOfAttributes 16
    "LoadModuleId" String "Cma"
    "fileFormat" String ""
    "isDirectory" Boolean false
    "loadModuleFilePath" String "/c/java/CXC1320959_R4S03.jar"
    "loaderType" Integer 2
    "moppletEntries" Array String 0
    "oseProgramHeapSize" Integer 0
    "oseProgramLoadClass" Integer 400
    "oseProgramPoolSize" Integer 0
    "otherLoaderName" String ""
    "preLoad" Integer 0
    "productData" Struct
        nrOfElements 5
        "productNumber" String ""
        "productRevision" String ""
        "productName" String ""
        "productInfo" String ""
        "productionDate" String ""

    "programMustBeSingleton" Boolean false
    "reliableProgramLabel" String ""
    "reservedByUpgradePackage" Boolean false
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,SwManagement=1"
    identity "Oms"
    moType LoadModule
    exception none
    nrOfAttributes 16
    "LoadModuleId" String "Oms"
    "fileFormat" String ""
    "isDirectory" Boolean false
    "loadModuleFilePath" String "/c/java/CXC1320960_R4F01.jar"
    "loaderType" Integer 2
    "moppletEntries" Array String 0
    "oseProgramHeapSize" Integer 0
    "oseProgramLoadClass" Integer 400
    "oseProgramPoolSize" Integer 0
    "otherLoaderName" String ""
    "preLoad" Integer 0
    "productData" Struct
        nrOfElements 5
        "productNumber" String ""
        "productRevision" String ""
        "productName" String ""
        "productInfo" String ""
        "productionDate" String ""

    "programMustBeSingleton" Boolean false
    "reliableProgramLabel" String ""
    "reservedByUpgradePackage" Boolean false
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,SwManagement=1"
    identity "VbjOrb"
    moType LoadModule
    exception none
    nrOfAttributes 16
    "LoadModuleId" String "VbjOrb"
    "fileFormat" String ""
    "isDirectory" Boolean false
    "loadModuleFilePath" String "/c/java/CXC1321689_R3A01.jar"
    "loaderType" Integer 2
    "moppletEntries" Array String 0
    "oseProgramHeapSize" Integer 0
    "oseProgramLoadClass" Integer 400
    "oseProgramPoolSize" Integer 0
    "otherLoaderName" String ""
    "preLoad" Integer 0
    "productData" Struct
        nrOfElements 5
        "productNumber" String ""
        "productRevision" String ""
        "productName" String ""
        "productInfo" String ""
        "productionDate" String ""

    "programMustBeSingleton" Boolean false
    "reliableProgramLabel" String ""
    "reservedByUpgradePackage" Boolean false
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,SwManagement=1"
    identity "Classes"
    moType LoadModule
    exception none
    nrOfAttributes 16
    "LoadModuleId" String "Classes"
    "fileFormat" String ""
    "isDirectory" Boolean false
    "loadModuleFilePath" String "/c/java/CXC1321442_R2B01.zip"
    "loaderType" Integer 2
    "moppletEntries" Array String 0
    "oseProgramHeapSize" Integer 0
    "oseProgramLoadClass" Integer 400
    "oseProgramPoolSize" Integer 0
    "otherLoaderName" String ""
    "preLoad" Integer 0
    "productData" Struct
        nrOfElements 5
        "productNumber" String ""
        "productRevision" String ""
        "productName" String ""
        "productInfo" String ""
        "productionDate" String ""

    "programMustBeSingleton" Boolean false
    "reliableProgramLabel" String ""
    "reservedByUpgradePackage" Boolean false
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,SwManagement=1"
    identity "Optional"
    moType LoadModule
    exception none
    nrOfAttributes 16
    "LoadModuleId" String "Optional"
    "fileFormat" String ""
    "isDirectory" Boolean false
    "loadModuleFilePath" String "/c/java/CXC1322363_R2A01.zip"
    "loaderType" Integer 2
    "moppletEntries" Array String 0
    "oseProgramHeapSize" Integer 0
    "oseProgramLoadClass" Integer 400
    "oseProgramPoolSize" Integer 0
    "otherLoaderName" String ""
    "preLoad" Integer 0
    "productData" Struct
        nrOfElements 5
        "productNumber" String ""
        "productRevision" String ""
        "productName" String ""
        "productInfo" String ""
        "productionDate" String ""

    "programMustBeSingleton" Boolean false
    "reliableProgramLabel" String ""
    "reservedByUpgradePackage" Boolean false
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,SwManagement=1"
    identity "Asms"
    moType LoadModule
    exception none
    nrOfAttributes 16
    "LoadModuleId" String "Asms"
    "fileFormat" String ""
    "isDirectory" Boolean false
    "loadModuleFilePath" String "/c/java/CXC1340297_R1B02.jar"
    "loaderType" Integer 2
    "moppletEntries" Array String 0
    "oseProgramHeapSize" Integer 0
    "oseProgramLoadClass" Integer 400
    "oseProgramPoolSize" Integer 0
    "otherLoaderName" String ""
    "preLoad" Integer 0
    "productData" Struct
        nrOfElements 5
        "productNumber" String ""
        "productRevision" String ""
        "productName" String ""
        "productInfo" String ""
        "productionDate" String ""

    "programMustBeSingleton" Boolean false
    "reliableProgramLabel" String ""
    "reservedByUpgradePackage" Boolean false
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,SwManagement=1"
    identity "EmasAsmcStub"
    moType LoadModule
    exception none
    nrOfAttributes 16
    "LoadModuleId" String "EmasAsmcStub"
    "fileFormat" String ""
    "isDirectory" Boolean false
    "loadModuleFilePath" String "/c/public_html/cello/common/stubbed_security/asm/jarfiles/asmc.jar"
    "loaderType" Integer 2
    "moppletEntries" Array String 0
    "oseProgramHeapSize" Integer 0
    "oseProgramLoadClass" Integer 400
    "oseProgramPoolSize" Integer 0
    "otherLoaderName" String ""
    "preLoad" Integer 0
    "productData" Struct
        nrOfElements 5
        "productNumber" String ""
        "productRevision" String ""
        "productName" String ""
        "productInfo" String ""
        "productionDate" String ""

    "programMustBeSingleton" Boolean false
    "reliableProgramLabel" String ""
    "reservedByUpgradePackage" Boolean false
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,SwManagement=1"
    identity "EmasVbjOrb"
    moType LoadModule
    exception none
    nrOfAttributes 16
    "LoadModuleId" String "EmasVbjOrb"
    "fileFormat" String ""
    "isDirectory" Boolean false
    "loadModuleFilePath" String "/c/public_html/cello/common/stubbed_security/asm/jarfiles/vbjorb.jar"
    "loaderType" Integer 2
    "moppletEntries" Array String 0
    "oseProgramHeapSize" Integer 0
    "oseProgramLoadClass" Integer 400
    "oseProgramPoolSize" Integer 0
    "otherLoaderName" String ""
    "preLoad" Integer 0
    "productData" Struct
        nrOfElements 5
        "productNumber" String ""
        "productRevision" String ""
        "productName" String ""
        "productInfo" String ""
        "productionDate" String ""

    "programMustBeSingleton" Boolean false
    "reliableProgramLabel" String ""
    "reservedByUpgradePackage" Boolean false
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,SwManagement=1"
    identity "EmasJavaHelp"
    moType LoadModule
    exception none
    nrOfAttributes 16
    "LoadModuleId" String "EmasJavaHelp"
    "fileFormat" String ""
    "isDirectory" Boolean false
    "loadModuleFilePath" String "/c/public_html/cello/common/stubbed_security/asm/jarfiles/jhall.jar"
    "loaderType" Integer 2
    "moppletEntries" Array String 0
    "oseProgramHeapSize" Integer 0
    "oseProgramLoadClass" Integer 400
    "oseProgramPoolSize" Integer 0
    "otherLoaderName" String ""
    "preLoad" Integer 0
    "productData" Struct
        nrOfElements 5
        "productNumber" String ""
        "productRevision" String ""
        "productName" String ""
        "productInfo" String ""
        "productionDate" String ""

    "programMustBeSingleton" Boolean false
    "reliableProgramLabel" String ""
    "reservedByUpgradePackage" Boolean false
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,SwManagement=1"
    identity "EmasAtmManager"
    moType LoadModule
    exception none
    nrOfAttributes 16
    "LoadModuleId" String "EmasAtmManager"
    "fileFormat" String ""
    "isDirectory" Boolean false
    "loadModuleFilePath" String "/c/public_html/cello/emas/atmmgr.jar"
    "loaderType" Integer 2
    "moppletEntries" Array String 0
    "oseProgramHeapSize" Integer 0
    "oseProgramLoadClass" Integer 400
    "oseProgramPoolSize" Integer 0
    "otherLoaderName" String ""
    "preLoad" Integer 0
    "productData" Struct
        nrOfElements 5
        "productNumber" String ""
        "productRevision" String ""
        "productName" String ""
        "productInfo" String ""
        "productionDate" String ""

    "programMustBeSingleton" Boolean false
    "reliableProgramLabel" String ""
    "reservedByUpgradePackage" Boolean false
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,SwManagement=1"
    identity "EmasEmServices"
    moType LoadModule
    exception none
    nrOfAttributes 16
    "LoadModuleId" String "EmasEmServices"
    "fileFormat" String ""
    "isDirectory" Boolean false
    "loadModuleFilePath" String "/c/public_html/cello/emas/emserv.jar"
    "loaderType" Integer 2
    "moppletEntries" Array String 0
    "oseProgramHeapSize" Integer 0
    "oseProgramLoadClass" Integer 400
    "oseProgramPoolSize" Integer 0
    "otherLoaderName" String ""
    "preLoad" Integer 0
    "productData" Struct
        nrOfElements 5
        "productNumber" String ""
        "productRevision" String ""
        "productName" String ""
        "productInfo" String ""
        "productionDate" String ""

    "programMustBeSingleton" Boolean false
    "reliableProgramLabel" String ""
    "reservedByUpgradePackage" Boolean false
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,SwManagement=1"
    identity "EmasEquipMan"
    moType LoadModule
    exception none
    nrOfAttributes 16
    "LoadModuleId" String "EmasEquipMan"
    "fileFormat" String ""
    "isDirectory" Boolean false
    "loadModuleFilePath" String "/c/public_html/cello/emas/eqmgr.jar"
    "loaderType" Integer 2
    "moppletEntries" Array String 0
    "oseProgramHeapSize" Integer 0
    "oseProgramLoadClass" Integer 400
    "oseProgramPoolSize" Integer 0
    "otherLoaderName" String ""
    "preLoad" Integer 0
    "productData" Struct
        nrOfElements 5
        "productNumber" String ""
        "productRevision" String ""
        "productName" String ""
        "productInfo" String ""
        "productionDate" String ""

    "programMustBeSingleton" Boolean false
    "reliableProgramLabel" String ""
    "reservedByUpgradePackage" Boolean false
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,SwManagement=1"
    identity "EmasFaultMan"
    moType LoadModule
    exception none
    nrOfAttributes 16
    "LoadModuleId" String "EmasFaultMan"
    "fileFormat" String ""
    "isDirectory" Boolean false
    "loadModuleFilePath" String "/c/public_html/cello/emas/fmmgr.jar"
    "loaderType" Integer 2
    "moppletEntries" Array String 0
    "oseProgramHeapSize" Integer 0
    "oseProgramLoadClass" Integer 400
    "oseProgramPoolSize" Integer 0
    "otherLoaderName" String ""
    "preLoad" Integer 0
    "productData" Struct
        nrOfElements 5
        "productNumber" String ""
        "productRevision" String ""
        "productName" String ""
        "productInfo" String ""
        "productionDate" String ""

    "programMustBeSingleton" Boolean false
    "reliableProgramLabel" String ""
    "reservedByUpgradePackage" Boolean false
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,SwManagement=1"
    identity "EmasIpMan"
    moType LoadModule
    exception none
    nrOfAttributes 16
    "LoadModuleId" String "EmasIpMan"
    "fileFormat" String ""
    "isDirectory" Boolean false
    "loadModuleFilePath" String "/c/public_html/cello/emas/ipmgr.jar"
    "loaderType" Integer 2
    "moppletEntries" Array String 0
    "oseProgramHeapSize" Integer 0
    "oseProgramLoadClass" Integer 400
    "oseProgramPoolSize" Integer 0
    "otherLoaderName" String ""
    "preLoad" Integer 0
    "productData" Struct
        nrOfElements 5
        "productNumber" String ""
        "productRevision" String ""
        "productName" String ""
        "productInfo" String ""
        "productionDate" String ""

    "programMustBeSingleton" Boolean false
    "reliableProgramLabel" String ""
    "reservedByUpgradePackage" Boolean false
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,SwManagement=1"
    identity "EmasSwMan"
    moType LoadModule
    exception none
    nrOfAttributes 16
    "LoadModuleId" String "EmasSwMan"
    "fileFormat" String ""
    "isDirectory" Boolean false
    "loadModuleFilePath" String "/c/public_html/cello/emas/smmgr.jar"
    "loaderType" Integer 2
    "moppletEntries" Array String 0
    "oseProgramHeapSize" Integer 0
    "oseProgramLoadClass" Integer 400
    "oseProgramPoolSize" Integer 0
    "otherLoaderName" String ""
    "preLoad" Integer 0
    "productData" Struct
        nrOfElements 5
        "productNumber" String ""
        "productRevision" String ""
        "productName" String ""
        "productInfo" String ""
        "productionDate" String ""

    "programMustBeSingleton" Boolean false
    "reliableProgramLabel" String ""
    "reservedByUpgradePackage" Boolean false
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,SwManagement=1"
    identity "EmasUtil"
    moType LoadModule
    exception none
    nrOfAttributes 16
    "LoadModuleId" String "EmasUtil"
    "fileFormat" String ""
    "isDirectory" Boolean false
    "loadModuleFilePath" String "/c/public_html/cello/emas/utils.jar"
    "loaderType" Integer 2
    "moppletEntries" Array String 0
    "oseProgramHeapSize" Integer 0
    "oseProgramLoadClass" Integer 400
    "oseProgramPoolSize" Integer 0
    "otherLoaderName" String ""
    "preLoad" Integer 0
    "productData" Struct
        nrOfElements 5
        "productNumber" String ""
        "productRevision" String ""
        "productName" String ""
        "productInfo" String ""
        "productionDate" String ""

    "programMustBeSingleton" Boolean false
    "reliableProgramLabel" String ""
    "reservedByUpgradePackage" Boolean false
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,SwManagement=1"
    identity "EmasBootStrapStub"
    moType LoadModule
    exception none
    nrOfAttributes 16
    "LoadModuleId" String "EmasBootStrapStub"
    "fileFormat" String ""
    "isDirectory" Boolean false
    "loadModuleFilePath" String "/c/public_html/cello/common/bootstrap_stubbed.jar"
    "loaderType" Integer 2
    "moppletEntries" Array String 0
    "oseProgramHeapSize" Integer 0
    "oseProgramLoadClass" Integer 400
    "oseProgramPoolSize" Integer 0
    "otherLoaderName" String ""
    "preLoad" Integer 0
    "productData" Struct
        nrOfElements 5
        "productNumber" String ""
        "productRevision" String ""
        "productName" String ""
        "productInfo" String ""
        "productionDate" String ""

    "programMustBeSingleton" Boolean false
    "reliableProgramLabel" String ""
    "reservedByUpgradePackage" Boolean false
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,SwManagement=1"
    identity "NssTuRBSBp"
    moType LoadModule
    exception none
    nrOfAttributes 16
    "LoadModuleId" String "NssTuRBSBp"
    "fileFormat" String ""
    "isDirectory" Boolean false
    "loadModuleFilePath" String "/c/loadmodules/"
    "loaderType" Integer 0
    "moppletEntries" Array String 0
    "oseProgramHeapSize" Integer 0
    "oseProgramLoadClass" Integer 400
    "oseProgramPoolSize" Integer 0
    "otherLoaderName" String ""
    "preLoad" Integer 0
    "productData" Struct
        nrOfElements 5
        "productNumber" String ""
        "productRevision" String ""
        "productName" String ""
        "productInfo" String ""
        "productionDate" String ""

    "programMustBeSingleton" Boolean false
    "reliableProgramLabel" String ""
    "reservedByUpgradePackage" Boolean false
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,SwManagement=1"
    identity "Aal2NccAdm11"
    moType LoadModule
    exception none
    nrOfAttributes 16
    "LoadModuleId" String "Aal2NccAdm11"
    "fileFormat" String ""
    "isDirectory" Boolean false
    "loadModuleFilePath" String "/d/loadmodules/"
    "loaderType" Integer 0
    "moppletEntries" Array String 0
    "oseProgramHeapSize" Integer 0
    "oseProgramLoadClass" Integer 400
    "oseProgramPoolSize" Integer 0
    "otherLoaderName" String ""
    "preLoad" Integer 0
    "productData" Struct
        nrOfElements 5
        "productNumber" String ""
        "productRevision" String ""
        "productName" String ""
        "productInfo" String ""
        "productionDate" String ""

    "programMustBeSingleton" Boolean false
    "reliableProgramLabel" String "ans_aal2nccadm_11"
    "reservedByUpgradePackage" Boolean false
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,SwManagement=1"
    identity "Aal2DisNcc11"
    moType LoadModule
    exception none
    nrOfAttributes 16
    "LoadModuleId" String "Aal2DisNcc11"
    "fileFormat" String ""
    "isDirectory" Boolean false
    "loadModuleFilePath" String "/d/loadmodules/"
    "loaderType" Integer 0
    "moppletEntries" Array String 0
    "oseProgramHeapSize" Integer 0
    "oseProgramLoadClass" Integer 400
    "oseProgramPoolSize" Integer 0
    "otherLoaderName" String ""
    "preLoad" Integer 0
    "productData" Struct
        nrOfElements 5
        "productNumber" String ""
        "productRevision" String ""
        "productName" String ""
        "productInfo" String ""
        "productionDate" String ""

    "programMustBeSingleton" Boolean false
    "reliableProgramLabel" String "ans_aal2disncc_11"
    "reservedByUpgradePackage" Boolean false
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,SwManagement=1"
    identity "Aal2CpsRc11"
    moType LoadModule
    exception none
    nrOfAttributes 16
    "LoadModuleId" String "Aal2CpsRc11"
    "fileFormat" String ""
    "isDirectory" Boolean false
    "loadModuleFilePath" String "/d/loadmodules/"
    "loaderType" Integer 0
    "moppletEntries" Array String 0
    "oseProgramHeapSize" Integer 0
    "oseProgramLoadClass" Integer 400
    "oseProgramPoolSize" Integer 0
    "otherLoaderName" String ""
    "preLoad" Integer 0
    "productData" Struct
        nrOfElements 5
        "productNumber" String ""
        "productRevision" String ""
        "productName" String ""
        "productInfo" String ""
        "productionDate" String ""

    "programMustBeSingleton" Boolean false
    "reliableProgramLabel" String "ans_aal2cpsrc_11"
    "reservedByUpgradePackage" Boolean false
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,SwManagement=1"
    identity "Aal2Ap11"
    moType LoadModule
    exception none
    nrOfAttributes 16
    "LoadModuleId" String "Aal2Ap11"
    "fileFormat" String ""
    "isDirectory" Boolean false
    "loadModuleFilePath" String "/d/loadmodules/"
    "loaderType" Integer 0
    "moppletEntries" Array String 0
    "oseProgramHeapSize" Integer 0
    "oseProgramLoadClass" Integer 400
    "oseProgramPoolSize" Integer 0
    "otherLoaderName" String ""
    "preLoad" Integer 0
    "productData" Struct
        nrOfElements 5
        "productNumber" String ""
        "productRevision" String ""
        "productName" String ""
        "productInfo" String ""
        "productionDate" String ""

    "programMustBeSingleton" Boolean false
    "reliableProgramLabel" String "ans_aal2ap_11"
    "reservedByUpgradePackage" Boolean false
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,SwManagement=1"
    identity "Atf"
    moType LoadModule
    exception none
    nrOfAttributes 16
    "LoadModuleId" String "Atf"
    "fileFormat" String ""
    "isDirectory" Boolean false
    "loadModuleFilePath" String "/d/loadmodules"
    "loaderType" Integer 0
    "moppletEntries" Array String 0
    "oseProgramHeapSize" Integer 0
    "oseProgramLoadClass" Integer 400
    "oseProgramPoolSize" Integer 0
    "otherLoaderName" String ""
    "preLoad" Integer 0
    "productData" Struct
        nrOfElements 5
        "productNumber" String ""
        "productRevision" String ""
        "productName" String ""
        "productInfo" String ""
        "productionDate" String ""

    "programMustBeSingleton" Boolean false
    "reliableProgramLabel" String ""
    "reservedByUpgradePackage" Boolean false
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,SwManagement=1"
    identity "DispaceTim"
    moType LoadModule
    exception none
    nrOfAttributes 16
    "LoadModuleId" String "DispaceTim"
    "fileFormat" String ""
    "isDirectory" Boolean false
    "loadModuleFilePath" String "/c/loadmodules"
    "loaderType" Integer 0
    "moppletEntries" Array String 0
    "oseProgramHeapSize" Integer 0
    "oseProgramLoadClass" Integer 50
    "oseProgramPoolSize" Integer 0
    "otherLoaderName" String ""
    "preLoad" Integer 0
    "productData" Struct
        nrOfElements 5
        "productNumber" String ""
        "productRevision" String ""
        "productName" String ""
        "productInfo" String ""
        "productionDate" String ""

    "programMustBeSingleton" Boolean false
    "reliableProgramLabel" String ""
    "reservedByUpgradePackage" Boolean false
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,SwManagement=1"
    identity "DbmFpgaLoader"
    moType LoadModule
    exception none
    nrOfAttributes 16
    "LoadModuleId" String "DbmFpgaLoader"
    "fileFormat" String ""
    "isDirectory" Boolean false
    "loadModuleFilePath" String "/c/loadmodules/CXC1322025_R2A04"
    "loaderType" Integer 0
    "moppletEntries" Array String 0
    "oseProgramHeapSize" Integer 0
    "oseProgramLoadClass" Integer 50
    "oseProgramPoolSize" Integer 0
    "otherLoaderName" String ""
    "preLoad" Integer 0
    "productData" Struct
        nrOfElements 5
        "productNumber" String ""
        "productRevision" String ""
        "productName" String ""
        "productInfo" String ""
        "productionDate" String ""

    "programMustBeSingleton" Boolean false
    "reliableProgramLabel" String ""
    "reservedByUpgradePackage" Boolean false
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,SwManagement=1"
    identity "inet"
    moType ReliableProgramUniter
    exception none
    nrOfAttributes 11
    "ReliableProgramUniterId" String "inet"
    "admActiveSlot" Ref "null"
    "admPassiveSlot" Ref "null"
    "normalisation" Integer 1
    "operationalMode" Integer 1
    "reliableProgramLabel" String "osa_inet"
    "replication" Integer 2
    "reservedBy" Array Ref 0
    "rpuId" Long 0
    "switchOver" Integer 2
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,SwManagement=1"
    identity "http"
    moType ReliableProgramUniter
    exception none
    nrOfAttributes 11
    "ReliableProgramUniterId" String "http"
    "admActiveSlot" Ref "null"
    "admPassiveSlot" Ref "null"
    "normalisation" Integer 1
    "operationalMode" Integer 1
    "reliableProgramLabel" String "osa_http_server"
    "replication" Integer 2
    "reservedBy" Array Ref 0
    "rpuId" Long 0
    "switchOver" Integer 2
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,SwManagement=1"
    identity "ip_util"
    moType ReliableProgramUniter
    exception none
    nrOfAttributes 11
    "ReliableProgramUniterId" String "ip_util"
    "admActiveSlot" Ref "null"
    "admPassiveSlot" Ref "null"
    "normalisation" Integer 1
    "operationalMode" Integer 1
    "reliableProgramLabel" String "osa_ip_util"
    "replication" Integer 2
    "reservedBy" Array Ref 0
    "rpuId" Long 0
    "switchOver" Integer 2
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,SwManagement=1"
    identity "jvm"
    moType ReliableProgramUniter
    exception none
    nrOfAttributes 11
    "ReliableProgramUniterId" String "jvm"
    "admActiveSlot" Ref "null"
    "admPassiveSlot" Ref "null"
    "normalisation" Integer 1
    "operationalMode" Integer 1
    "reliableProgramLabel" String "osa_jvm"
    "replication" Integer 2
    "reservedBy" Array Ref 0
    "rpuId" Long 0
    "switchOver" Integer 2
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,SwManagement=1"
    identity "sw_inst"
    moType ReliableProgramUniter
    exception none
    nrOfAttributes 11
    "ReliableProgramUniterId" String "sw_inst"
    "admActiveSlot" Ref "null"
    "admPassiveSlot" Ref "null"
    "normalisation" Integer 1
    "operationalMode" Integer 1
    "reliableProgramLabel" String "osa_sw_installation"
    "replication" Integer 2
    "reservedBy" Array Ref 0
    "rpuId" Long 0
    "switchOver" Integer 2
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,SwManagement=1"
    identity "ospf"
    moType ReliableProgramUniter
    exception none
    nrOfAttributes 11
    "ReliableProgramUniterId" String "ospf"
    "admActiveSlot" Ref "null"
    "admPassiveSlot" Ref "null"
    "normalisation" Integer 1
    "operationalMode" Integer 1
    "reliableProgramLabel" String "osa_ospf"
    "replication" Integer 2
    "reservedBy" Array Ref 0
    "rpuId" Long 0
    "switchOver" Integer 2
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,SwManagement=1"
    identity "spas_res"
    moType ReliableProgramUniter
    exception none
    nrOfAttributes 11
    "ReliableProgramUniterId" String "spas_res"
    "admActiveSlot" Ref "null"
    "admPassiveSlot" Ref "null"
    "normalisation" Integer 1
    "operationalMode" Integer 1
    "reliableProgramLabel" String "spas_resource"
    "replication" Integer 2
    "reservedBy" Array Ref 0
    "rpuId" Long 0
    "switchOver" Integer 2
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,SwManagement=1"
    identity "aal05_ncc"
    moType ReliableProgramUniter
    exception none
    nrOfAttributes 11
    "ReliableProgramUniterId" String "aal05_ncc"
    "admActiveSlot" Ref "null"
    "admPassiveSlot" Ref "null"
    "normalisation" Integer 1
    "operationalMode" Integer 1
    "reliableProgramLabel" String "aal05_ncc"
    "replication" Integer 2
    "reservedBy" Array Ref 0
    "rpuId" Long 0
    "switchOver" Integer 2
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,SwManagement=1"
    identity "aal_cc"
    moType ReliableProgramUniter
    exception none
    nrOfAttributes 11
    "ReliableProgramUniterId" String "aal_cc"
    "admActiveSlot" Ref "null"
    "admPassiveSlot" Ref "null"
    "normalisation" Integer 1
    "operationalMode" Integer 1
    "reliableProgramLabel" String "aal_cc"
    "replication" Integer 2
    "reservedBy" Array Ref 0
    "rpuId" Long 0
    "switchOver" Integer 2
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,SwManagement=1"
    identity "atmmp"
    moType ReliableProgramUniter
    exception none
    nrOfAttributes 11
    "ReliableProgramUniterId" String "atmmp"
    "admActiveSlot" Ref "null"
    "admPassiveSlot" Ref "null"
    "normalisation" Integer 1
    "operationalMode" Integer 1
    "reliableProgramLabel" String "atmmp"
    "replication" Integer 2
    "reservedBy" Array Ref 0
    "rpuId" Long 0
    "switchOver" Integer 2
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,SwManagement=1"
    identity "aal2mp"
    moType ReliableProgramUniter
    exception none
    nrOfAttributes 11
    "ReliableProgramUniterId" String "aal2mp"
    "admActiveSlot" Ref "null"
    "admPassiveSlot" Ref "null"
    "normalisation" Integer 1
    "operationalMode" Integer 1
    "reliableProgramLabel" String "aal2mp"
    "replication" Integer 2
    "reservedBy" Array Ref 0
    "rpuId" Long 0
    "switchOver" Integer 2
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,SwManagement=1"
    identity "aal2_adm"
    moType ReliableProgramUniter
    exception none
    nrOfAttributes 11
    "ReliableProgramUniterId" String "aal2_adm"
    "admActiveSlot" Ref "null"
    "admPassiveSlot" Ref "null"
    "normalisation" Integer 1
    "operationalMode" Integer 1
    "reliableProgramLabel" String "aal2_adm"
    "replication" Integer 2
    "reservedBy" Array Ref 0
    "rpuId" Long 0
    "switchOver" Integer 2
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,SwManagement=1"
    identity "usaal_adm"
    moType ReliableProgramUniter
    exception none
    nrOfAttributes 11
    "ReliableProgramUniterId" String "usaal_adm"
    "admActiveSlot" Ref "null"
    "admPassiveSlot" Ref "null"
    "normalisation" Integer 1
    "operationalMode" Integer 1
    "reliableProgramLabel" String "usaal_adm"
    "replication" Integer 2
    "reservedBy" Array Ref 0
    "rpuId" Long 0
    "switchOver" Integer 2
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,SwManagement=1"
    identity "equip_mp"
    moType ReliableProgramUniter
    exception none
    nrOfAttributes 11
    "ReliableProgramUniterId" String "equip_mp"
    "admActiveSlot" Ref "null"
    "admPassiveSlot" Ref "null"
    "normalisation" Integer 1
    "operationalMode" Integer 1
    "reliableProgramLabel" String "equip_mp"
    "replication" Integer 2
    "reservedBy" Array Ref 0
    "rpuId" Long 0
    "switchOver" Integer 2
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,SwManagement=1"
    identity "nss_mp"
    moType ReliableProgramUniter
    exception none
    nrOfAttributes 11
    "ReliableProgramUniterId" String "nss_mp"
    "admActiveSlot" Ref "null"
    "admPassiveSlot" Ref "null"
    "normalisation" Integer 1
    "operationalMode" Integer 1
    "reliableProgramLabel" String "nss_nss_mp"
    "replication" Integer 2
    "reservedBy" Array Ref 0
    "rpuId" Long 0
    "switchOver" Integer 2
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,SwManagement=1"
    identity "pms"
    moType ReliableProgramUniter
    exception none
    nrOfAttributes 11
    "ReliableProgramUniterId" String "pms"
    "admActiveSlot" Ref "null"
    "admPassiveSlot" Ref "null"
    "normalisation" Integer 1
    "operationalMode" Integer 1
    "reliableProgramLabel" String "pms"
    "replication" Integer 2
    "reservedBy" Array Ref 0
    "rpuId" Long 0
    "switchOver" Integer 2
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,SwManagement=1"
    identity "aal0d_adm"
    moType ReliableProgramUniter
    exception none
    nrOfAttributes 11
    "ReliableProgramUniterId" String "aal0d_adm"
    "admActiveSlot" Ref "null"
    "admPassiveSlot" Ref "null"
    "normalisation" Integer 1
    "operationalMode" Integer 1
    "reliableProgramLabel" String "act_aal0_dynamic_adm"
    "replication" Integer 2
    "reservedBy" Array Ref 0
    "rpuId" Long 0
    "switchOver" Integer 2
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,SwManagement=1"
    identity "aal0s_adm"
    moType ReliableProgramUniter
    exception none
    nrOfAttributes 11
    "ReliableProgramUniterId" String "aal0s_adm"
    "admActiveSlot" Ref "null"
    "admPassiveSlot" Ref "null"
    "normalisation" Integer 1
    "operationalMode" Integer 1
    "reliableProgramLabel" String "act_aal0_static_adm"
    "replication" Integer 2
    "reservedBy" Array Ref 0
    "rpuId" Long 0
    "switchOver" Integer 2
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,SwManagement=1"
    identity "aal5d_adm"
    moType ReliableProgramUniter
    exception none
    nrOfAttributes 11
    "ReliableProgramUniterId" String "aal5d_adm"
    "admActiveSlot" Ref "null"
    "admPassiveSlot" Ref "null"
    "normalisation" Integer 1
    "operationalMode" Integer 1
    "reliableProgramLabel" String "act_aal5_dynamic_adm"
    "replication" Integer 2
    "reservedBy" Array Ref 0
    "rpuId" Long 0
    "switchOver" Integer 2
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,SwManagement=1"
    identity "aal5s_adm"
    moType ReliableProgramUniter
    exception none
    nrOfAttributes 11
    "ReliableProgramUniterId" String "aal5s_adm"
    "admActiveSlot" Ref "null"
    "admPassiveSlot" Ref "null"
    "normalisation" Integer 1
    "operationalMode" Integer 1
    "reliableProgramLabel" String "act_aal5_static_adm"
    "replication" Integer 2
    "reservedBy" Array Ref 0
    "rpuId" Long 0
    "switchOver" Integer 2
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,SwManagement=1"
    identity "aal2rh"
    moType ReliableProgramUniter
    exception none
    nrOfAttributes 11
    "ReliableProgramUniterId" String "aal2rh"
    "admActiveSlot" Ref "null"
    "admPassiveSlot" Ref "null"
    "normalisation" Integer 1
    "operationalMode" Integer 1
    "reliableProgramLabel" String "ans_aal2rh"
    "replication" Integer 2
    "reservedBy" Array Ref 0
    "rpuId" Long 0
    "switchOver" Integer 2
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,SwManagement=1"
    identity "aal2ncc"
    moType ReliableProgramUniter
    exception none
    nrOfAttributes 11
    "ReliableProgramUniterId" String "aal2ncc"
    "admActiveSlot" Ref "null"
    "admPassiveSlot" Ref "null"
    "normalisation" Integer 1
    "operationalMode" Integer 1
    "reliableProgramLabel" String "ans_aal2nccadm_11"
    "replication" Integer 2
    "reservedBy" Array Ref 0
    "rpuId" Long 0
    "switchOver" Integer 2
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,SwManagement=1"
    identity "aal2dis"
    moType ReliableProgramUniter
    exception none
    nrOfAttributes 11
    "ReliableProgramUniterId" String "aal2dis"
    "admActiveSlot" Ref "null"
    "admPassiveSlot" Ref "null"
    "normalisation" Integer 1
    "operationalMode" Integer 1
    "reliableProgramLabel" String "ans_aal2disncc_11"
    "replication" Integer 2
    "reservedBy" Array Ref 0
    "rpuId" Long 0
    "switchOver" Integer 2
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,SwManagement=1"
    identity "ans_aal2cpsrc_11"
    moType ReliableProgramUniter
    exception none
    nrOfAttributes 11
    "ReliableProgramUniterId" String "ans_aal2cpsrc_11"
    "admActiveSlot" Ref "null"
    "admPassiveSlot" Ref "null"
    "normalisation" Integer 1
    "operationalMode" Integer 1
    "reliableProgramLabel" String "ans_aal2cpsrc_11"
    "replication" Integer 2
    "reservedBy" Array Ref 0
    "rpuId" Long 0
    "switchOver" Integer 2
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,SwManagement=1"
    identity "ans_aal2ap_11"
    moType ReliableProgramUniter
    exception none
    nrOfAttributes 11
    "ReliableProgramUniterId" String "ans_aal2ap_11"
    "admActiveSlot" Ref "null"
    "admPassiveSlot" Ref "null"
    "normalisation" Integer 1
    "operationalMode" Integer 1
    "reliableProgramLabel" String "ans_aal2ap_11"
    "replication" Integer 2
    "reservedBy" Array Ref 0
    "rpuId" Long 0
    "switchOver" Integer 2
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,SwManagement=1"
    identity "ETM1_R6"
    moType PiuType
    exception none
    nrOfAttributes 7
    "PiuTypeId" String "ETM1_R6"
    "boardWidth" Integer 1
    "defAllowedSeqRestarts" Integer -1
    "productData" Struct
        nrOfElements 5
        "productNumber" String ""
        "productRevision" String ""
        "productName" String ""
        "productInfo" String ""
        "productionDate" String ""

    "reservedBy" Array Ref 0
    "role" Integer 2
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,SwManagement=1"
    identity "PhyE1Mp"
    moType LoadModule
    exception none
    nrOfAttributes 16
    "LoadModuleId" String "PhyE1Mp"
    "fileFormat" String ""
    "isDirectory" Boolean false
    "loadModuleFilePath" String "/d/loadmodules/"
    "loaderType" Integer 0
    "moppletEntries" Array String 0
    "oseProgramHeapSize" Integer 0
    "oseProgramLoadClass" Integer 400
    "oseProgramPoolSize" Integer 0
    "otherLoaderName" String ""
    "preLoad" Integer 0
    "productData" Struct
        nrOfElements 5
        "productNumber" String ""
        "productRevision" String ""
        "productName" String ""
        "productInfo" String ""
        "productionDate" String ""

    "programMustBeSingleton" Boolean false
    "reliableProgramLabel" String "aet_phy_e1_mp"
    "reservedByUpgradePackage" Boolean false
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,SwManagement=1"
    identity "PhyE1Bp"
    moType LoadModule
    exception none
    nrOfAttributes 16
    "LoadModuleId" String "PhyE1Bp"
    "fileFormat" String ""
    "isDirectory" Boolean false
    "loadModuleFilePath" String "/c/loadmodules/"
    "loaderType" Integer 0
    "moppletEntries" Array String 0
    "oseProgramHeapSize" Integer 0
    "oseProgramLoadClass" Integer 400
    "oseProgramPoolSize" Integer 0
    "otherLoaderName" String ""
    "preLoad" Integer 0
    "productData" Struct
        nrOfElements 5
        "productNumber" String ""
        "productRevision" String ""
        "productName" String ""
        "productInfo" String ""
        "productionDate" String ""

    "programMustBeSingleton" Boolean false
    "reliableProgramLabel" String ""
    "reservedByUpgradePackage" Boolean false
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,SwManagement=1"
    identity "EqpM1Bp"
    moType LoadModule
    exception none
    nrOfAttributes 16
    "LoadModuleId" String "EqpM1Bp"
    "fileFormat" String ""
    "isDirectory" Boolean false
    "loadModuleFilePath" String "/c/loadmodules/"
    "loaderType" Integer 0
    "moppletEntries" Array String 0
    "oseProgramHeapSize" Integer 0
    "oseProgramLoadClass" Integer 400
    "oseProgramPoolSize" Integer 0
    "otherLoaderName" String ""
    "preLoad" Integer 0
    "productData" Struct
        nrOfElements 5
        "productNumber" String ""
        "productRevision" String ""
        "productName" String ""
        "productInfo" String ""
        "productionDate" String ""

    "programMustBeSingleton" Boolean false
    "reliableProgramLabel" String ""
    "reservedByUpgradePackage" Boolean false
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,SwManagement=1"
    identity "phy_e1_mp"
    moType ReliableProgramUniter
    exception none
    nrOfAttributes 11
    "ReliableProgramUniterId" String "phy_e1_mp"
    "admActiveSlot" Ref "null"
    "admPassiveSlot" Ref "null"
    "normalisation" Integer 1
    "operationalMode" Integer 1
    "reliableProgramLabel" String "aet_phy_e1_mp"
    "replication" Integer 2
    "reservedBy" Array Ref 0
    "rpuId" Long 0
    "switchOver" Integer 2
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,SwManagement=1"
    identity "rbsMp"
    moType LoadModule
    exception none
    nrOfAttributes 16
    "LoadModuleId" String "rbsMp"
    "fileFormat" String ""
    "isDirectory" Boolean false
    "loadModuleFilePath" String "/d/loadmodules"
    "loaderType" Integer 0
    "moppletEntries" Array String 0
    "oseProgramHeapSize" Integer 0
    "oseProgramLoadClass" Integer 500
    "oseProgramPoolSize" Integer 0
    "otherLoaderName" String ""
    "preLoad" Integer 0
    "productData" Struct
        nrOfElements 5
        "productNumber" String ""
        "productRevision" String ""
        "productName" String ""
        "productInfo" String ""
        "productionDate" String ""

    "programMustBeSingleton" Boolean false
    "reliableProgramLabel" String "rbs_mp"
    "reservedByUpgradePackage" Boolean false
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,SwManagement=1"
    identity "tuRnRbs"
    moType LoadModule
    exception none
    nrOfAttributes 16
    "LoadModuleId" String "tuRnRbs"
    "fileFormat" String ""
    "isDirectory" Boolean false
    "loadModuleFilePath" String "/d/loadmodules"
    "loaderType" Integer 0
    "moppletEntries" Array String 0
    "oseProgramHeapSize" Integer 0
    "oseProgramLoadClass" Integer 500
    "oseProgramPoolSize" Integer 0
    "otherLoaderName" String ""
    "preLoad" Integer 0
    "productData" Struct
        nrOfElements 5
        "productNumber" String ""
        "productRevision" String ""
        "productName" String ""
        "productInfo" String ""
        "productionDate" String ""

    "programMustBeSingleton" Boolean false
    "reliableProgramLabel" String "tu_rn_rbs"
    "reservedByUpgradePackage" Boolean false
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,SwManagement=1"
    identity "rfif"
    moType LoadModule
    exception none
    nrOfAttributes 16
    "LoadModuleId" String "rfif"
    "fileFormat" String ""
    "isDirectory" Boolean false
    "loadModuleFilePath" String "/d/loadmodules"
    "loaderType" Integer 0
    "moppletEntries" Array String 0
    "oseProgramHeapSize" Integer 0
    "oseProgramLoadClass" Integer 500
    "oseProgramPoolSize" Integer 0
    "otherLoaderName" String ""
    "preLoad" Integer 0
    "productData" Struct
        nrOfElements 5
        "productNumber" String ""
        "productRevision" String ""
        "productName" String ""
        "productInfo" String ""
        "productionDate" String ""

    "programMustBeSingleton" Boolean false
    "reliableProgramLabel" String "rfif"
    "reservedByUpgradePackage" Boolean false
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,SwManagement=1"
    identity "rfifDp"
    moType LoadModule
    exception none
    nrOfAttributes 16
    "LoadModuleId" String "rfifDp"
    "fileFormat" String ""
    "isDirectory" Boolean false
    "loadModuleFilePath" String "/c/dp_xp_loadmodules/CXP90131%1_R5A01"
    "loaderType" Integer 99
    "moppletEntries" Array String 0
    "oseProgramHeapSize" Integer 0
    "oseProgramLoadClass" Integer 500
    "oseProgramPoolSize" Integer 0
    "otherLoaderName" String ""
    "preLoad" Integer 0
    "productData" Struct
        nrOfElements 5
        "productNumber" String ""
        "productRevision" String ""
        "productName" String ""
        "productInfo" String ""
        "productionDate" String ""

    "programMustBeSingleton" Boolean false
    "reliableProgramLabel" String "rfif_dp"
    "reservedByUpgradePackage" Boolean false
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,SwManagement=1"
    identity "ubp"
    moType LoadModule
    exception none
    nrOfAttributes 16
    "LoadModuleId" String "ubp"
    "fileFormat" String ""
    "isDirectory" Boolean false
    "loadModuleFilePath" String "/d/loadmodules"
    "loaderType" Integer 0
    "moppletEntries" Array String 0
    "oseProgramHeapSize" Integer 0
    "oseProgramLoadClass" Integer 500
    "oseProgramPoolSize" Integer 0
    "otherLoaderName" String ""
    "preLoad" Integer 0
    "productData" Struct
        nrOfElements 5
        "productNumber" String ""
        "productRevision" String ""
        "productName" String ""
        "productInfo" String ""
        "productionDate" String ""

    "programMustBeSingleton" Boolean false
    "reliableProgramLabel" String "ubp"
    "reservedByUpgradePackage" Boolean false
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,SwManagement=1"
    identity "raxDp"
    moType LoadModule
    exception none
    nrOfAttributes 16
    "LoadModuleId" String "raxDp"
    "fileFormat" String ""
    "isDirectory" Boolean false
    "loadModuleFilePath" String "/c/dp_xp_loadmodules/CXP90165%1_R5K"
    "loaderType" Integer 99
    "moppletEntries" Array String 0
    "oseProgramHeapSize" Integer 0
    "oseProgramLoadClass" Integer 500
    "oseProgramPoolSize" Integer 0
    "otherLoaderName" String ""
    "preLoad" Integer 0
    "productData" Struct
        nrOfElements 5
        "productNumber" String ""
        "productRevision" String ""
        "productName" String ""
        "productInfo" String ""
        "productionDate" String ""

    "programMustBeSingleton" Boolean false
    "reliableProgramLabel" String "rax_dp"
    "reservedByUpgradePackage" Boolean false
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,SwManagement=1"
    identity "tx"
    moType LoadModule
    exception none
    nrOfAttributes 16
    "LoadModuleId" String "tx"
    "fileFormat" String ""
    "isDirectory" Boolean false
    "loadModuleFilePath" String "/d/loadmodules"
    "loaderType" Integer 0
    "moppletEntries" Array String 0
    "oseProgramHeapSize" Integer 0
    "oseProgramLoadClass" Integer 500
    "oseProgramPoolSize" Integer 0
    "otherLoaderName" String ""
    "preLoad" Integer 0
    "productData" Struct
        nrOfElements 5
        "productNumber" String ""
        "productRevision" String ""
        "productName" String ""
        "productInfo" String ""
        "productionDate" String ""

    "programMustBeSingleton" Boolean false
    "reliableProgramLabel" String "tx"
    "reservedByUpgradePackage" Boolean false
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,SwManagement=1"
    identity "txDp"
    moType LoadModule
    exception none
    nrOfAttributes 16
    "LoadModuleId" String "txDp"
    "fileFormat" String ""
    "isDirectory" Boolean false
    "loadModuleFilePath" String "/c/dp_xp_loadmodules/CXP901182%1_R11B02"
    "loaderType" Integer 99
    "moppletEntries" Array String 0
    "oseProgramHeapSize" Integer 0
    "oseProgramLoadClass" Integer 500
    "oseProgramPoolSize" Integer 0
    "otherLoaderName" String ""
    "preLoad" Integer 0
    "productData" Struct
        nrOfElements 5
        "productNumber" String ""
        "productRevision" String ""
        "productName" String ""
        "productInfo" String ""
        "productionDate" String ""

    "programMustBeSingleton" Boolean false
    "reliableProgramLabel" String "tx_dp"
    "reservedByUpgradePackage" Boolean false
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,SwManagement=1"
    identity "trx"
    moType LoadModule
    exception none
    nrOfAttributes 16
    "LoadModuleId" String "trx"
    "fileFormat" String ""
    "isDirectory" Boolean false
    "loadModuleFilePath" String "/d/loadmodules"
    "loaderType" Integer 0
    "moppletEntries" Array String 0
    "oseProgramHeapSize" Integer 0
    "oseProgramLoadClass" Integer 500
    "oseProgramPoolSize" Integer 0
    "otherLoaderName" String ""
    "preLoad" Integer 0
    "productData" Struct
        nrOfElements 5
        "productNumber" String ""
        "productRevision" String ""
        "productName" String ""
        "productInfo" String ""
        "productionDate" String ""

    "programMustBeSingleton" Boolean false
    "reliableProgramLabel" String "trx"
    "reservedByUpgradePackage" Boolean false
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,SwManagement=1"
    identity "trxDp"
    moType LoadModule
    exception none
    nrOfAttributes 16
    "LoadModuleId" String "trxDp"
    "fileFormat" String ""
    "isDirectory" Boolean false
    "loadModuleFilePath" String "/c/dp_xp_loadmodules/CXP901093%1_R1H01"
    "loaderType" Integer 99
    "moppletEntries" Array String 0
    "oseProgramHeapSize" Integer 0
    "oseProgramLoadClass" Integer 500
    "oseProgramPoolSize" Integer 0
    "otherLoaderName" String ""
    "preLoad" Integer 0
    "productData" Struct
        nrOfElements 5
        "productNumber" String ""
        "productRevision" String ""
        "productName" String ""
        "productInfo" String ""
        "productionDate" String ""

    "programMustBeSingleton" Boolean false
    "reliableProgramLabel" String "trx_dp"
    "reservedByUpgradePackage" Boolean false
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,SwManagement=1"
    identity "aiu"
    moType LoadModule
    exception none
    nrOfAttributes 16
    "LoadModuleId" String "aiu"
    "fileFormat" String ""
    "isDirectory" Boolean false
    "loadModuleFilePath" String "/d/loadmodules"
    "loaderType" Integer 0
    "moppletEntries" Array String 0
    "oseProgramHeapSize" Integer 0
    "oseProgramLoadClass" Integer 500
    "oseProgramPoolSize" Integer 0
    "otherLoaderName" String ""
    "preLoad" Integer 0
    "productData" Struct
        nrOfElements 5
        "productNumber" String ""
        "productRevision" String ""
        "productName" String ""
        "productInfo" String ""
        "productionDate" String ""

    "programMustBeSingleton" Boolean false
    "reliableProgramLabel" String "aiu"
    "reservedByUpgradePackage" Boolean false
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,SwManagement=1"
    identity "aiuDp"
    moType LoadModule
    exception none
    nrOfAttributes 16
    "LoadModuleId" String "aiuDp"
    "fileFormat" String ""
    "isDirectory" Boolean false
    "loadModuleFilePath" String "/c/dp_xp_loadmodules/CXP901236_R2A01"
    "loaderType" Integer 99
    "moppletEntries" Array String 0
    "oseProgramHeapSize" Integer 0
    "oseProgramLoadClass" Integer 500
    "oseProgramPoolSize" Integer 0
    "otherLoaderName" String ""
    "preLoad" Integer 0
    "productData" Struct
        nrOfElements 5
        "productNumber" String ""
        "productRevision" String ""
        "productName" String ""
        "productInfo" String ""
        "productionDate" String ""

    "programMustBeSingleton" Boolean false
    "reliableProgramLabel" String "aiu_dp"
    "reservedByUpgradePackage" Boolean false
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,SwManagement=1"
    identity "mcpaDp_gamma"
    moType LoadModule
    exception none
    nrOfAttributes 16
    "LoadModuleId" String "mcpaDp_gamma"
    "fileFormat" String ""
    "isDirectory" Boolean false
    "loadModuleFilePath" String "/c/dp_xp_loadmodules/CXP901397_R2B01"
    "loaderType" Integer 99
    "moppletEntries" Array String 0
    "oseProgramHeapSize" Integer 0
    "oseProgramLoadClass" Integer 500
    "oseProgramPoolSize" Integer 0
    "otherLoaderName" String ""
    "preLoad" Integer 0
    "productData" Struct
        nrOfElements 5
        "productNumber" String ""
        "productRevision" String ""
        "productName" String ""
        "productInfo" String ""
        "productionDate" String ""

    "programMustBeSingleton" Boolean false
    "reliableProgramLabel" String "mcpa_dp"
    "reservedByUpgradePackage" Boolean false
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,SwManagement=1"
    identity "mcpaDp"
    moType LoadModule
    exception none
    nrOfAttributes 16
    "LoadModuleId" String "mcpaDp"
    "fileFormat" String ""
    "isDirectory" Boolean false
    "loadModuleFilePath" String "/c/dp_xp_loadmodules/CXP901360_R3C02"
    "loaderType" Integer 99
    "moppletEntries" Array String 0
    "oseProgramHeapSize" Integer 0
    "oseProgramLoadClass" Integer 500
    "oseProgramPoolSize" Integer 0
    "otherLoaderName" String ""
    "preLoad" Integer 0
    "productData" Struct
        nrOfElements 5
        "productNumber" String ""
        "productRevision" String ""
        "productName" String ""
        "productInfo" String ""
        "productionDate" String ""

    "programMustBeSingleton" Boolean false
    "reliableProgramLabel" String "mcpa_dp"
    "reservedByUpgradePackage" Boolean false
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,SwManagement=1"
    identity "fanXp"
    moType LoadModule
    exception none
    nrOfAttributes 16
    "LoadModuleId" String "fanXp"
    "fileFormat" String ""
    "isDirectory" Boolean false
    "loadModuleFilePath" String "/c/dp_xp_loadmodules/CXP901090%1_R3E"
    "loaderType" Integer 99
    "moppletEntries" Array String 0
    "oseProgramHeapSize" Integer 0
    "oseProgramLoadClass" Integer 500
    "oseProgramPoolSize" Integer 0
    "otherLoaderName" String ""
    "preLoad" Integer 0
    "productData" Struct
        nrOfElements 5
        "productNumber" String ""
        "productRevision" String ""
        "productName" String ""
        "productInfo" String ""
        "productionDate" String ""

    "programMustBeSingleton" Boolean false
    "reliableProgramLabel" String "fan_xp"
    "reservedByUpgradePackage" Boolean false
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,SwManagement=1"
    identity "cuXp"
    moType LoadModule
    exception none
    nrOfAttributes 16
    "LoadModuleId" String "cuXp"
    "fileFormat" String ""
    "isDirectory" Boolean false
    "loadModuleFilePath" String "/c/dp_xp_loadmodules/CXP901088%1_R4E"
    "loaderType" Integer 99
    "moppletEntries" Array String 0
    "oseProgramHeapSize" Integer 0
    "oseProgramLoadClass" Integer 500
    "oseProgramPoolSize" Integer 0
    "otherLoaderName" String ""
    "preLoad" Integer 0
    "productData" Struct
        nrOfElements 5
        "productNumber" String ""
        "productRevision" String ""
        "productName" String ""
        "productInfo" String ""
        "productionDate" String ""

    "programMustBeSingleton" Boolean false
    "reliableProgramLabel" String "cu_xp"
    "reservedByUpgradePackage" Boolean false
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,SwManagement=1"
    identity "eacuXp"
    moType LoadModule
    exception none
    nrOfAttributes 16
    "LoadModuleId" String "eacuXp"
    "fileFormat" String ""
    "isDirectory" Boolean false
    "loadModuleFilePath" String "/c/dp_xp_loadmodules/CXP901172%2_R2D"
    "loaderType" Integer 99
    "moppletEntries" Array String 0
    "oseProgramHeapSize" Integer 0
    "oseProgramLoadClass" Integer 500
    "oseProgramPoolSize" Integer 0
    "otherLoaderName" String ""
    "preLoad" Integer 0
    "productData" Struct
        nrOfElements 5
        "productNumber" String ""
        "productRevision" String ""
        "productName" String ""
        "productInfo" String ""
        "productionDate" String ""

    "programMustBeSingleton" Boolean false
    "reliableProgramLabel" String "eacu_xp"
    "reservedByUpgradePackage" Boolean false
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,SwManagement=1"
    identity "tmaXp"
    moType LoadModule
    exception none
    nrOfAttributes 16
    "LoadModuleId" String "tmaXp"
    "fileFormat" String ""
    "isDirectory" Boolean false
    "loadModuleFilePath" String "/c/dp_xp_loadmodules/CXP901368_R2C01"
    "loaderType" Integer 99
    "moppletEntries" Array String 0
    "oseProgramHeapSize" Integer 0
    "oseProgramLoadClass" Integer 500
    "oseProgramPoolSize" Integer 0
    "otherLoaderName" String ""
    "preLoad" Integer 0
    "productData" Struct
        nrOfElements 5
        "productNumber" String ""
        "productRevision" String ""
        "productName" String ""
        "productInfo" String ""
        "productionDate" String ""

    "programMustBeSingleton" Boolean false
    "reliableProgramLabel" String "tma_xp"
    "reservedByUpgradePackage" Boolean false
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,SwManagement=1"
    identity "Boam"
    moType LoadModule
    exception none
    nrOfAttributes 16
    "LoadModuleId" String "Boam"
    "fileFormat" String ""
    "isDirectory" Boolean false
    "loadModuleFilePath" String "/c/java/CXC1322932%1_R2F16.jar"
    "loaderType" Integer 2
    "moppletEntries" Array String 0
    "oseProgramHeapSize" Integer 0
    "oseProgramLoadClass" Integer 400
    "oseProgramPoolSize" Integer 0
    "otherLoaderName" String ""
    "preLoad" Integer 0
    "productData" Struct
        nrOfElements 5
        "productNumber" String ""
        "productRevision" String ""
        "productName" String ""
        "productInfo" String ""
        "productionDate" String ""

    "programMustBeSingleton" Boolean false
    "reliableProgramLabel" String ""
    "reservedByUpgradePackage" Boolean false
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,SwManagement=1"
    identity "MeasApplMp"
    moType LoadModule
    exception none
    nrOfAttributes 16
    "LoadModuleId" String "MeasApplMp"
    "fileFormat" String ""
    "isDirectory" Boolean false
    "loadModuleFilePath" String "/d/loadmodules"
    "loaderType" Integer 0
    "moppletEntries" Array String 0
    "oseProgramHeapSize" Integer 0
    "oseProgramLoadClass" Integer 500
    "oseProgramPoolSize" Integer 0
    "otherLoaderName" String ""
    "preLoad" Integer 0
    "productData" Struct
        nrOfElements 5
        "productNumber" String ""
        "productRevision" String ""
        "productName" String ""
        "productInfo" String ""
        "productionDate" String ""

    "programMustBeSingleton" Boolean false
    "reliableProgramLabel" String "meas_appl_mp"
    "reservedByUpgradePackage" Boolean false
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,SwManagement=1"
    identity "110"
   moType ReliableProgramUniter
    exception none
    nrOfAttributes 4
    "ReliableProgramUniterId" String "110"
    "reliableProgramLabel" String "rbs_mp"
    "switchOver" Integer 2
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,SwManagement=1"
    identity "asms"
    moType LoadModule
    exception none
    nrOfAttributes 16
    "LoadModuleId" String "asms"
    "fileFormat" String ""
    "isDirectory" Boolean false
    "loadModuleFilePath" String "/c/java/CXC1340297_R1B02.jar"
    "loaderType" Integer 2
    "moppletEntries" Array String 0
    "oseProgramHeapSize" Integer 0
    "oseProgramLoadClass" Integer 400
    "oseProgramPoolSize" Integer 0
    "otherLoaderName" String ""
    "preLoad" Integer 0
    "productData" Struct
        nrOfElements 5
        "productNumber" String "CXC1323893"
        "productRevision" String "R1D"
        "productName" String "asms_stub"
        "productInfo" String ""
        "productionDate" String "20021122"

    "programMustBeSingleton" Boolean false
    "reliableProgramLabel" String ""
    "reservedByUpgradePackage" Boolean false
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,SwManagement=1"
    identity "asms_sharp"
    moType LoadModule
    exception none
    nrOfAttributes 16
    "LoadModuleId" String "asms_sharp"
    "fileFormat" String ""
    "isDirectory" Boolean false
    "loadModuleFilePath" String "/c/java/CXC1340297_R1B02.jar"
    "loaderType" Integer 2
    "moppletEntries" Array String 0
    "oseProgramHeapSize" Integer 0
    "oseProgramLoadClass" Integer 400
    "oseProgramPoolSize" Integer 0
    "otherLoaderName" String ""
    "preLoad" Integer 0
    "productData" Struct
        nrOfElements 5
        "productNumber" String "CXC1323613"
        "productRevision" String "R1D"
        "productName" String "asms_sharpstub"
        "productInfo" String ""
        "productionDate" String "20021122"

    "programMustBeSingleton" Boolean false
    "reliableProgramLabel" String ""
    "reservedByUpgradePackage" Boolean false
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,SwManagement=1"
    identity "1"
    moType UpgradePackage
    exception none
    nrOfAttributes 27
    "UpgradePackageId" String "1"
    "actionResult" Array Struct 0
    "administrativeData" Struct
        nrOfElements 5
        "productNumber" String ""
        "productRevision" String ""
        "productName" String ""
        "productInfo" String ""
        "productionDate" String ""

    "basedOnUpgradePackages" Array Struct 0
    "confirmationDeadline" String ""
    "cppUpVersion" Struct
        nrOfElements 5
        "productNumber" String ""
        "productRevision" String ""
        "productName" String ""
        "productInfo" String ""
        "productionDate" String ""

    "deletePreventingCVs" Array String 0
    "deletePreventingUPs" Array Struct 0
    "ftpServerIpAddress" String ""
    "isDeletable" Boolean true
    "loadModuleList" Array Ref 0
    "maxTimeBetweenUpgradeEvents" Integer 1
    "otherReferringCVs" Array String 0
    "password" String "anonymous"
    "progressCount" Integer 0
    "progressHeader" Integer 0
    "progressTotal" Integer 0
    "sendEvents" Boolean true
    "state" Integer 0
    "stepLabel" String ""
    "typeOfUP" Integer 0
    "upCompatibilityIndex" String ""
    "upFilePathOnFtpServer" String ""
    "upgradeControlFilePath" String ""
    "upgradePackageDocumentId" String ""
    "user" String "anonymous"
    "userLabel" String "UpgradePackage-1"
)


CREATE
(
parent "ManagedElement=1,Equipment=1"
identity "1"
moType Subrack
exception none
)

CREATE
(
parent "ManagedElement=1,Equipment=1,Subrack=1"
identity "20"
moType Slot
exception none
)


SET
(
    mo "ManagedElement=1,SwManagement=1,ReliableProgramUniter=110"
    exception none
    nrOfAttributes 1
    "admActiveSlot" Ref "ManagedElement=1,Equipment=1,Subrack=1,Slot=20"
)

SET
(
    mo "ManagedElement=1,SwManagement=1,ReliableProgramUniter=phy_e1_mp"
    exception none
    nrOfAttributes 1
    "admActiveSlot" Ref "ManagedElement=1,Equipment=1,Subrack=1,Slot=20"
)

SET
(
    mo "ManagedElement=1,SwManagement=1,ReliableProgramUniter=ans_aal2ap_11"
    exception none
    nrOfAttributes 1
    "admActiveSlot" Ref "ManagedElement=1,Equipment=1,Subrack=1,Slot=20"
)

SET
(
    mo "ManagedElement=1,SwManagement=1,ReliableProgramUniter=ans_aal2cpsrc_11"
    exception none
    nrOfAttributes 1
    "admActiveSlot" Ref "ManagedElement=1,Equipment=1,Subrack=1,Slot=20"
)

SET
(
    mo "ManagedElement=1,SwManagement=1,ReliableProgramUniter=aal2dis"
    exception none
    nrOfAttributes 1
    "admActiveSlot" Ref "ManagedElement=1,Equipment=1,Subrack=1,Slot=20"
)

SET
(
    mo "ManagedElement=1,SwManagement=1,ReliableProgramUniter=aal2ncc"
    exception none
    nrOfAttributes 1
    "admActiveSlot" Ref "ManagedElement=1,Equipment=1,Subrack=1,Slot=20"
)

SET
(
    mo "ManagedElement=1,SwManagement=1,ReliableProgramUniter=aal2rh"
    exception none
    nrOfAttributes 1
    "admActiveSlot" Ref "ManagedElement=1,Equipment=1,Subrack=1,Slot=20"
)

SET
(
    mo "ManagedElement=1,SwManagement=1,ReliableProgramUniter=aal5s_adm"
    exception none
    nrOfAttributes 1
    "admActiveSlot" Ref "ManagedElement=1,Equipment=1,Subrack=1,Slot=20"
)

SET
(
    mo "ManagedElement=1,SwManagement=1,ReliableProgramUniter=aal5d_adm"
    exception none
    nrOfAttributes 1
    "admActiveSlot" Ref "ManagedElement=1,Equipment=1,Subrack=1,Slot=20"
)

SET
(
    mo "ManagedElement=1,SwManagement=1,ReliableProgramUniter=aal0s_adm"
    exception none
    nrOfAttributes 1
    "admActiveSlot" Ref "ManagedElement=1,Equipment=1,Subrack=1,Slot=20"
)

SET
(
    mo "ManagedElement=1,SwManagement=1,ReliableProgramUniter=aal0d_adm"
    exception none
    nrOfAttributes 1
    "admActiveSlot" Ref "ManagedElement=1,Equipment=1,Subrack=1,Slot=20"
)

SET
(
    mo "ManagedElement=1,SwManagement=1,ReliableProgramUniter=pms"
    exception none
    nrOfAttributes 1
    "admActiveSlot" Ref "ManagedElement=1,Equipment=1,Subrack=1,Slot=20"
)

SET
(
    mo "ManagedElement=1,SwManagement=1,ReliableProgramUniter=nss_mp"
    exception none
    nrOfAttributes 1
    "admActiveSlot" Ref "ManagedElement=1,Equipment=1,Subrack=1,Slot=20"
)

SET
(
    mo "ManagedElement=1,SwManagement=1,ReliableProgramUniter=equip_mp"
    exception none
    nrOfAttributes 1
    "admActiveSlot" Ref "ManagedElement=1,Equipment=1,Subrack=1,Slot=20"
)

SET
(
    mo "ManagedElement=1,SwManagement=1,ReliableProgramUniter=usaal_adm"
    exception none
    nrOfAttributes 1
    "admActiveSlot" Ref "ManagedElement=1,Equipment=1,Subrack=1,Slot=20"
)

SET
(
    mo "ManagedElement=1,SwManagement=1,ReliableProgramUniter=aal2_adm"
    exception none
    nrOfAttributes 1
    "admActiveSlot" Ref "ManagedElement=1,Equipment=1,Subrack=1,Slot=20"
)

SET
(
    mo "ManagedElement=1,SwManagement=1,ReliableProgramUniter=aal2mp"
    exception none
    nrOfAttributes 1
    "admActiveSlot" Ref "ManagedElement=1,Equipment=1,Subrack=1,Slot=20"
)

SET
(
    mo "ManagedElement=1,SwManagement=1,ReliableProgramUniter=atmmp"
    exception none
    nrOfAttributes 1
    "admActiveSlot" Ref "ManagedElement=1,Equipment=1,Subrack=1,Slot=20"
)

SET
(
    mo "ManagedElement=1,SwManagement=1,ReliableProgramUniter=aal_cc"
    exception none
    nrOfAttributes 1
    "admActiveSlot" Ref "ManagedElement=1,Equipment=1,Subrack=1,Slot=20"
)

SET
(
    mo "ManagedElement=1,SwManagement=1,ReliableProgramUniter=aal05_ncc"
    exception none
    nrOfAttributes 1
    "admActiveSlot" Ref "ManagedElement=1,Equipment=1,Subrack=1,Slot=20"
)

SET
(
    mo "ManagedElement=1,SwManagement=1,ReliableProgramUniter=spas_res"
    exception none
    nrOfAttributes 1
    "admActiveSlot" Ref "ManagedElement=1,Equipment=1,Subrack=1,Slot=20"
)

SET
(
    mo "ManagedElement=1,SwManagement=1,ReliableProgramUniter=ospf"
    exception none
    nrOfAttributes 1
    "admActiveSlot" Ref "ManagedElement=1,Equipment=1,Subrack=1,Slot=20"
)

SET
(
    mo "ManagedElement=1,SwManagement=1,ReliableProgramUniter=sw_inst"
    exception none
    nrOfAttributes 1
    "admActiveSlot" Ref "ManagedElement=1,Equipment=1,Subrack=1,Slot=20"
)

SET
(
    mo "ManagedElement=1,SwManagement=1,ReliableProgramUniter=jvm"
    exception none
    nrOfAttributes 1
    "admActiveSlot" Ref "ManagedElement=1,Equipment=1,Subrack=1,Slot=20"
)

SET
(
    mo "ManagedElement=1,SwManagement=1,ReliableProgramUniter=ip_util"
    exception none
    nrOfAttributes 1
    "admActiveSlot" Ref "ManagedElement=1,Equipment=1,Subrack=1,Slot=20"
)

SET
(
    mo "ManagedElement=1,SwManagement=1,ReliableProgramUniter=http"
    exception none
    nrOfAttributes 1
    "admActiveSlot" Ref "ManagedElement=1,Equipment=1,Subrack=1,Slot=20"
)

SET
(
    mo "ManagedElement=1,SwManagement=1,ReliableProgramUniter=inet"
    exception none
    nrOfAttributes 1
    "admActiveSlot" Ref "ManagedElement=1,Equipment=1,Subrack=1,Slot=20"
)

SET
(
    mo "ManagedElement=1,SwManagement=1,ConfigurationVersion=1"
    exception none
    nrOfAttributes 1
    "currentUpgradePackage" Ref "ManagedElement=1,SwManagement=1,UpgradePackage=1"
)

