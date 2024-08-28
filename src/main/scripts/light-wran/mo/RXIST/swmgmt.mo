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
    identity "1"
    moType ConfigurationVersion
    exception none
    nrOfAttributes 22
    "ConfigurationVersionId" String "1"
    //"actionResult" Struct
    //    nrOfElements 6
    //    "time" String ""
    //    "invokedAction" Integer 3
    //    "pathToDetailedInformation" String ""
    //    "configurationVersionName" String ""
    //    "actionId" Integer 1
    //    "mainResult" Integer 0

    "additionalActionResultData" Array Struct 0
    "autoCreatedCVIsTurnedOn" Boolean false
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
    "rollbackOn" Boolean false
    "startableConfigurationVersion" String ""
    "storedConfigurationVersions" Array Struct 0
    "timeForAutoCreatedCV" String "04:00"
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
    parent "ManagedElement=1,SwManagement=1"
    identity "RNC_SCB_R6"
    moType PiuType
    exception none
    nrOfAttributes 7
    "PiuTypeId" String "RNC_SCB_R6"
    "boardWidth" Integer 1
    "defAllowedSeqRestarts" Integer 3
    "productData" Struct
        nrOfElements 5
        "productNumber" String "ROJ1192108/2"
        "productRevision" String "R6"
        "productName" String "SCB"
        "productInfo" String "RNC_SCB"
        "productionDate" String "20010101"

    "reservedBy" Array Ref 0
    "role" Integer 2
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,SwManagement=1"
    identity "RNC_TU_R3"
    moType PiuType
    exception none
    nrOfAttributes 7
    "PiuTypeId" String "RNC_TU_R3"
    "boardWidth" Integer 1
    "defAllowedSeqRestarts" Integer 3
    "productData" Struct
        nrOfElements 5
        "productNumber" String "ROJ1192104/3"
        "productRevision" String "R3"
        "productName" String "TU"
        "productInfo" String "RNC_TU"
        "productionDate" String "20010101"

    "reservedBy" Array Ref 0
    "role" Integer 2
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,SwManagement=1"
    identity "RNC_ETM1_R5"
    moType PiuType
    exception none
    nrOfAttributes 7
    "PiuTypeId" String "RNC_ETM1_R5"
    "boardWidth" Integer 1
    "defAllowedSeqRestarts" Integer 3
    "productData" Struct
        nrOfElements 5
        "productNumber" String "ROJ1192101/2"
        "productRevision" String "R5"
        "productName" String "ET-M1"
        "productInfo" String "RNC_ETM1"
        "productionDate" String "20010101"

    "reservedBy" Array Ref 0
    "role" Integer 2
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,SwManagement=1"
    identity "RNC_ETM4_R3"
    moType PiuType
    exception none
    nrOfAttributes 7
    "PiuTypeId" String "RNC_ETM4_R3"
    "boardWidth" Integer 1
    "defAllowedSeqRestarts" Integer 3
    "productData" Struct
        nrOfElements 5
        "productNumber" String "ROJ1192102/1"
        "productRevision" String "R3"
        "productName" String "ET-M4"
        "productInfo" String "RNC_ETM4"
        "productionDate" String "20010101"

    "reservedBy" Array Ref 0
    "role" Integer 2
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,SwManagement=1"
    identity "RNC_GPB_FD_R4"
    moType PiuType
    exception none
    nrOfAttributes 7
    "PiuTypeId" String "RNC_GPB_FD_R4"
    "boardWidth" Integer 1
    "defAllowedSeqRestarts" Integer 3
    "productData" Struct
        nrOfElements 5
        "productNumber" String "ROJ1192106/2"
        "productRevision" String "R4"
        "productName" String "GPB-R4"
        "productInfo" String "RNC_GPB"
        "productionDate" String "20010101"

    "reservedBy" Array Ref 0
    "role" Integer 1
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,SwManagement=1"
    identity "RNC_GPB3_FD_R2"
    moType PiuType
    exception none
    nrOfAttributes 7
    "PiuTypeId" String "RNC_GPB3_FD_R2"
    "boardWidth" Integer 1
    "defAllowedSeqRestarts" Integer 3
    "productData" Struct
        nrOfElements 5
        "productNumber" String "ROJ1192106/3"
        "productRevision" String "R2"
        "productName" String "GPB-3-R2"
        "productInfo" String "RNC_GPB3"
        "productionDate" String "20010101"

    "reservedBy" Array Ref 0
    "role" Integer 1
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,SwManagement=1"
    identity "RNC_SPB_R6"
    moType PiuType
    exception none
    nrOfAttributes 7
    "PiuTypeId" String "RNC_SPB_R6"
    "boardWidth" Integer 1
    "defAllowedSeqRestarts" Integer 3
    "productData" Struct
        nrOfElements 5
        "productNumber" String "ROJ1192103/2"
        "productRevision" String "R6"
        "productName" String "SPB-R6"
        "productInfo" String "RNC_SPB"
        "productionDate" String "20010101"

    "reservedBy" Array Ref 0
    "role" Integer 2
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,SwManagement=1"
    identity "Gpb3Basic"
    moType LoadModule
    exception none
    nrOfAttributes 16
    "LoadModuleId" String "Gpb3Basic"
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
        "productNumber" String "CXC1321447"
        "productRevision" String "R4N03"
        "productName" String "gpb_cs_basic"
        "productInfo" String "gpb_cs_basic"
        "productionDate" String "20001221"

    "programMustBeSingleton" Boolean false
    "reliableProgramLabel" String "gpb_cs_basic"
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
        "productNumber" String "CXC1321451"
        "productRevision" String "R4N03"
        "productName" String "dbm_cs_basic"
        "productInfo" String "dbm_cs_basic"
        "productionDate" String "20001221"

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
    "loadModuleFilePath" String "/c/loadmodules/"
    "loaderType" Integer 0
    "moppletEntries" Array String 0
    "oseProgramHeapSize" Integer 0
    "oseProgramLoadClass" Integer 100
    "oseProgramPoolSize" Integer 0
    "otherLoaderName" String ""
    "preLoad" Integer 0
    "productData" Struct
        nrOfElements 5
        "productNumber" String "CXC1320785"
        "productRevision" String "R7G01"
        "productName" String "loaderserver"
        "productInfo" String "loaderserver"
        "productionDate" String "20010201"

    "programMustBeSingleton" Boolean false
    "reliableProgramLabel" String "loaderserver"
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
    "loadModuleFilePath" String "/c/loadmodules/"
    "loaderType" Integer 0
    "moppletEntries" Array String 0
    "oseProgramHeapSize" Integer 0
    "oseProgramLoadClass" Integer 200
    "oseProgramPoolSize" Integer 0
    "otherLoaderName" String ""
    "preLoad" Integer 0
    "productData" Struct
        nrOfElements 5
        "productNumber" String "CXC1320781"
        "productRevision" String "R6D01"
        "productName" String "database"
        "productInfo" String "database"
        "productionDate" String "20001207"

    "programMustBeSingleton" Boolean false
    "reliableProgramLabel" String "database"
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
    "loadModuleFilePath" String "/c/loadmodules/"
    "loaderType" Integer 0
    "moppletEntries" Array String 0
    "oseProgramHeapSize" Integer 0
    "oseProgramLoadClass" Integer 200
    "oseProgramPoolSize" Integer 0
    "otherLoaderName" String ""
    "preLoad" Integer 0
    "productData" Struct
        nrOfElements 5
        "productNumber" String "CXC1320782"
        "productRevision" String "R6J01"
        "productName" String "ero"
        "productInfo" String "ero"
        "productionDate" String "20001221"

    "programMustBeSingleton" Boolean false
    "reliableProgramLabel" String "eqm_res"
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
    "loadModuleFilePath" String "/c/loadmodules/"
    "loaderType" Integer 0
    "moppletEntries" Array String 0
    "oseProgramHeapSize" Integer 0
    "oseProgramLoadClass" Integer 200
    "oseProgramPoolSize" Integer 0
    "otherLoaderName" String ""
    "preLoad" Integer 0
    "productData" Struct
        nrOfElements 5
        "productNumber" String "CXC1320787"
        "productRevision" String "R7F01"
        "productName" String "sma"
        "productInfo" String "sma"
        "productionDate" String "20001207"

    "programMustBeSingleton" Boolean false
    "reliableProgramLabel" String "sys_man"
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
    "loadModuleFilePath" String "/c/loadmodules/"
    "loaderType" Integer 0
    "moppletEntries" Array String 0
    "oseProgramHeapSize" Integer 0
    "oseProgramLoadClass" Integer 200
    "oseProgramPoolSize" Integer 0
    "otherLoaderName" String ""
    "preLoad" Integer 0
    "productData" Struct
        nrOfElements 5
        "productNumber" String "CXC1321341"
        "productRevision" String "R4F01"
        "productName" String "sw_install"
        "productInfo" String "sw_install"
        "productionDate" String "20001207"

    "programMustBeSingleton" Boolean false
    "reliableProgramLabel" String "sw_inst"
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
    "loadModuleFilePath" String "/c/loadmodules/"
    "loaderType" Integer 0
    "moppletEntries" Array String 0
    "oseProgramHeapSize" Integer 0
    "oseProgramLoadClass" Integer 200
    "oseProgramPoolSize" Integer 0
    "otherLoaderName" String ""
    "preLoad" Integer 0
    "productData" Struct
        nrOfElements 5
        "productNumber" String "CXC1321315"
        "productRevision" String "R3K01"
        "productName" String "inet"
        "productInfo" String "inet"
        "productionDate" String "20001221"

    "programMustBeSingleton" Boolean false
    "reliableProgramLabel" String "inet"
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
    "loadModuleFilePath" String "/c/loadmodules/"
    "loaderType" Integer 0
    "moppletEntries" Array String 0
    "oseProgramHeapSize" Integer 0
    "oseProgramLoadClass" Integer 200
    "oseProgramPoolSize" Integer 0
    "otherLoaderName" String ""
    "preLoad" Integer 0
    "productData" Struct
        nrOfElements 5
        "productNumber" String "CXC1321317"
        "productRevision" String "R3C01"
        "productName" String "ospf"
        "productInfo" String "ospf"
        "productionDate" String "20001221"

    "programMustBeSingleton" Boolean false
    "reliableProgramLabel" String "ospf"
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
    "loadModuleFilePath" String "/c/loadmodules/"
    "loaderType" Integer 0
    "moppletEntries" Array String 0
    "oseProgramHeapSize" Integer 0
    "oseProgramLoadClass" Integer 200
    "oseProgramPoolSize" Integer 0
    "otherLoaderName" String ""
    "preLoad" Integer 0
    "productData" Struct
        nrOfElements 5
        "productNumber" String "CXC1321314"
        "productRevision" String "R3C01"
        "productName" String "sock"
        "productInfo" String "sock"
        "productionDate" String "20001207"

    "programMustBeSingleton" Boolean false
    "reliableProgramLabel" String "sock"
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
    "loadModuleFilePath" String "/c/loadmodules/"
    "loaderType" Integer 0
    "moppletEntries" Array String 0
    "oseProgramHeapSize" Integer 0
    "oseProgramLoadClass" Integer 200
    "oseProgramPoolSize" Integer 0
    "otherLoaderName" String ""
    "preLoad" Integer 0
    "productData" Struct
        nrOfElements 5
        "productNumber" String "CXC1321316"
        "productRevision" String "R3D02"
        "productName" String "ethernet"
        "productInfo" String "ethernet"
        "productionDate" String "20001207"

    "programMustBeSingleton" Boolean false
    "reliableProgramLabel" String "ethernet"
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
    "loadModuleFilePath" String "/c/loadmodules/"
    "loaderType" Integer 0
    "moppletEntries" Array String 0
    "oseProgramHeapSize" Integer 0
    "oseProgramLoadClass" Integer 200
    "oseProgramPoolSize" Integer 0
    "otherLoaderName" String ""
    "preLoad" Integer 0
    "productData" Struct
        nrOfElements 5
        "productNumber" String "CXC1322506"
        "productRevision" String "R1G01"
        "productName" String "ip_util"
        "productInfo" String "ip_util"
        "productionDate" String "20010420"

    "programMustBeSingleton" Boolean false
    "reliableProgramLabel" String "ip_util"
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
    "loadModuleFilePath" String "/c/loadmodules/"
    "loaderType" Integer 0
    "moppletEntries" Array String 0
    "oseProgramHeapSize" Integer 0
    "oseProgramLoadClass" Integer 200
    "oseProgramPoolSize" Integer 0
    "otherLoaderName" String ""
    "preLoad" Integer 0
    "productData" Struct
        nrOfElements 5
        "productNumber" String "CXC1321408"
        "productRevision" String "R3H02"
        "productName" String "spas_res"
        "productInfo" String "spas_res"
        "productionDate" String "20001207"

    "programMustBeSingleton" Boolean false
    "reliableProgramLabel" String "spas_res"
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
    "loadModuleFilePath" String "/c/loadmodules/"
    "loaderType" Integer 0
    "moppletEntries" Array String 0
    "oseProgramHeapSize" Integer 0
    "oseProgramLoadClass" Integer 200
    "oseProgramPoolSize" Integer 0
    "otherLoaderName" String ""
    "preLoad" Integer 0
    "productData" Struct
        nrOfElements 5
        "productNumber" String "CXC1320784"
        "productRevision" String "R6C01"
        "productName" String "jvm_lm"
        "productInfo" String "jvm_lm"
        "productionDate" String "20001207"

    "programMustBeSingleton" Boolean false
    "reliableProgramLabel" String "jvm"
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
        "productNumber" String "CXC1320742"
        "productRevision" String "R7B01"
        "productName" String "spas_conn"
        "productInfo" String "spas_conn"
        "productionDate" String "20001207"

    "programMustBeSingleton" Boolean false
    "reliableProgramLabel" String "spas_conn"
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
        "productNumber" String "CXC1321407"
        "productRevision" String "R4C01"
        "productName" String "spas_link"
        "productInfo" String "spas_link"
        "productionDate" String "20001207"

    "programMustBeSingleton" Boolean false
    "reliableProgramLabel" String "spas_link"
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
        "productNumber" String "CXC1320783"
        "productRevision" String "R5D01"
        "productName" String "http"
        "productInfo" String "http"
        "productionDate" String "20001221"

    "programMustBeSingleton" Boolean false
    "reliableProgramLabel" String "http"
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
        "productNumber" String "CXC1321409"
        "productRevision" String "R3C01"
        "productName" String "spas_sm"
        "productInfo" String "spas_sm"
        "productionDate" String "20001207"

    "programMustBeSingleton" Boolean false
    "reliableProgramLabel" String "spas_sm"
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
        "productNumber" String "CXC1322165"
        "productRevision" String "R2B02"
        "productName" String "48vpwrsup"
        "productInfo" String "48vpwrsup"
        "productionDate" String "20010201"

    "programMustBeSingleton" Boolean false
    "reliableProgramLabel" String "48vpwrsup"
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
        "productNumber" String "CXC1322246"
        "productRevision" String "R2B01"
        "productName" String "cpyloader"
        "productInfo" String "cpyloader"
        "productionDate" String "20010201"

    "programMustBeSingleton" Boolean false
    "reliableProgramLabel" String "cpyloader"
    "reservedByUpgradePackage" Boolean false
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,SwManagement=1"
    identity "tsafpga"
    moType LoadModule
    exception none
    nrOfAttributes 16
    "LoadModuleId" String "tsafpga"
    "fileFormat" String ""
    "isDirectory" Boolean false
    "loadModuleFilePath" String "/c/loadmodules/CXC1321668_R2A01"
    "loaderType" Integer 0
    "moppletEntries" Array String 0
    "oseProgramHeapSize" Integer 0
    "oseProgramLoadClass" Integer 400
    "oseProgramPoolSize" Integer 0
    "otherLoaderName" String ""
    "preLoad" Integer 0
    "productData" Struct
        nrOfElements 5
        "productNumber" String "CXC1321668"
        "productRevision" String "R2A01"
        "productName" String "tsa_fpga"
        "productInfo" String "tsa_fpga"
        "productionDate" String "20010213"

    "programMustBeSingleton" Boolean false
    "reliableProgramLabel" String "tsa_fpga"
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
        "productNumber" String "CXC1321520"
        "productRevision" String "R3F01"
        "productName" String "equipmp_lm"
        "productInfo" String "equipmp_lm"
        "productionDate" String "20001221"

    "programMustBeSingleton" Boolean false
    "reliableProgramLabel" String "equip_mp"
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
        "productNumber" String "CXC1320839"
        "productRevision" String "R4J01"
        "productName" String "atmmp"
        "productInfo" String "atmmp"
        "productionDate" String "20001221"

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
        "productNumber" String "CXC1320837"
        "productRevision" String "R4E01"
        "productName" String "atmbp"
        "productInfo" String "atmbp"
        "productionDate" String "20001221"

    "programMustBeSingleton" Boolean false
    "reliableProgramLabel" String ""
    "reservedByUpgradePackage" Boolean false
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,SwManagement=1"
    identity "Aal0DynAdm"
    moType LoadModule
    exception none
    nrOfAttributes 16
    "LoadModuleId" String "Aal0DynAdm"
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
        "productNumber" String "CXC1322211/1"
        "productRevision" String "R2F01"
        "productName" String "aal0_dyn_adm"
        "productInfo" String "aal0_dyn_adm"
        "productionDate" String "20010129"

    "programMustBeSingleton" Boolean false
    "reliableProgramLabel" String "aal0_dynamic_adm"
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
        "productNumber" String "CXC1322210/1"
        "productRevision" String "R2D01"
        "productName" String "aal0_st_adm"
        "productInfo" String "aal0_st_adm"
        "productionDate" String "20010129"

    "programMustBeSingleton" Boolean false
    "reliableProgramLabel" String "aal0_static_adm"
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
        "productNumber" String "CXC1321166/1"
        "productRevision" String "R6E01"
        "productName" String "aal0_term_mp"
        "productInfo" String "aal0_term_mp"
        "productionDate" String "20010129"

    "programMustBeSingleton" Boolean false
    "reliableProgramLabel" String "aal0_term_mp"
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
        "productNumber" String "CXC1321794/2"
        "productRevision" String "R3E01"
        "productName" String "aal0termtulm"
        "productInfo" String "aal0_term_tu_lm"
        "productionDate" String "20001221"

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
        "productNumber" String "CXC1320836"
        "productRevision" String "R4F01"
        "productName" String "aal2mp"
        "productInfo" String "aal2mp"
        "productionDate" String "20001221"

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
        "productNumber" String "CXC1320835"
        "productRevision" String "R4F03"
        "productName" String "aal2bp"
        "productInfo" String "aal2bp"
        "productionDate" String "20001221"

    "programMustBeSingleton" Boolean false
    "reliableProgramLabel" String ""
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
        "productNumber" String "CXC1320993"
        "productRevision" String "R8G01"
        "productName" String "aal2_rh"
        "productInfo" String "aal2_rh"
        "productionDate" String "20010319"

    "programMustBeSingleton" Boolean false
    "reliableProgramLabel" String "ans_aal2rh"
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
        "productNumber" String "CXC1320992"
        "productRevision" String "R8E01"
        "productName" String "aal2_adm"
        "productInfo" String "aal2_adm"
        "productionDate" String "20010319"

    "programMustBeSingleton" Boolean false
    "reliableProgramLabel" String "aal2_adm"
    "reservedByUpgradePackage" Boolean false
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,SwManagement=1"
    identity "Aal5DynAdm"
    moType LoadModule
    exception none
    nrOfAttributes 16
    "LoadModuleId" String "Aal5DynAdm"
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
        "productNumber" String "CXC1322209/1"
        "productRevision" String "R2F01"
        "productName" String "aal5_d_adm"
        "productInfo" String "aal5_d_adm"
        "productionDate" String "20010129"

    "programMustBeSingleton" Boolean false
    "reliableProgramLabel" String "aal5_dynamic_adm"
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
        "productNumber" String "CXC1322208/1"
        "productRevision" String "R2D01"
        "productName" String "aal5_s_adm"
        "productInfo" String "aal5_s_adm"
        "productionDate" String "20010129"

    "programMustBeSingleton" Boolean false
    "reliableProgramLabel" String "aal5_static_adm"
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
        "productNumber" String "CXC1320995/1"
        "productRevision" String "R7E01"
        "productName" String "aal5_term"
        "productInfo" String "aal5_term"
        "productionDate" String "20001221"

    "programMustBeSingleton" Boolean false
    "reliableProgramLabel" String "aal5_term_mp"
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
        "productNumber" String "CXC1320995/2"
        "productRevision" String "R7E01"
        "productName" String "aal5_term_bp"
        "productInfo" String "aal5_term_bp"
        "productionDate" String "20001221"

    "programMustBeSingleton" Boolean false
    "reliableProgramLabel" String ""
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
        "productNumber" String "CXC1320978"
        "productRevision" String "R6L01"
        "productName" String "aal05_ncc"
        "productInfo" String "aal05_ncc"
        "productionDate" String "20001207"

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
        "productNumber" String "CXC1320980"
        "productRevision" String "R7K01"
        "productName" String "aalcc"
        "productInfo" String "aalcc"
        "productionDate" String "20001221"

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
        "productNumber" String "CXC1321118/1"
        "productRevision" String "R6E01"
        "productName" String "nss_mp"
        "productInfo" String "nssmp"
        "productionDate" String "20001221"

    "programMustBeSingleton" Boolean false
    "reliableProgramLabel" String "nss_mp"
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
        "productNumber" String "CXC1321120/2"
        "productRevision" String "R5E01"
        "productName" String "nssscb_bp"
        "productInfo" String "nssscb_bp"
        "productionDate" String "20001221"

    "programMustBeSingleton" Boolean false
    "reliableProgramLabel" String "nssscb"
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
        "productNumber" String "CXC1321121/2"
        "productRevision" String "R5E01"
        "productName" String "nsssyci_bp"
        "productInfo" String "nsssyci_bp"
        "productionDate" String "20001221"

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
        "productNumber" String "CXC1321121/1"
        "productRevision" String "R5E01"
        "productName" String "nsssyci_mp"
        "productInfo" String "nsssyci_mp"
        "productionDate" String "20001221"

    "programMustBeSingleton" Boolean false
    "reliableProgramLabel" String "nsssycimp"
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
        "productNumber" String "CXC1321344"
        "productRevision" String "R3B01"
        "productName" String "pms"
        "productInfo" String "pms"
        "productionDate" String "20010201"

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
        "productNumber" String "CXC1320996"
        "productRevision" String "R7H01"
        "productName" String "usaal_adm"
        "productInfo" String "usaal_adm"
        "productionDate" String "20001221"

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
        "productNumber" String "CXC1320997"
        "productRevision" String "R7K01"
        "productName" String "usaal_term"
        "productInfo" String "usaal_term"
        "productionDate" String "20001221"

    "programMustBeSingleton" Boolean false
    "reliableProgramLabel" String "usaal_term"
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
        "productNumber" String "CXC1321123"
        "productRevision" String "R4B01"
        "productName" String "nsstu_fpga"
        "productInfo" String "nsstu_fpga"
        "productionDate" String "20001207"

    "programMustBeSingleton" Boolean false
    "reliableProgramLabel" String ""
    "reservedByUpgradePackage" Boolean false
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
        "productNumber" String "CXC1320840"
        "productRevision" String "R4F01"
        "productName" String "phye1mp"
        "productInfo" String "phye1mp"
        "productionDate" String "20001221"

    "programMustBeSingleton" Boolean false
    "reliableProgramLabel" String "phy_e1_mp"
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
        "productNumber" String "CXC1320838"
        "productRevision" String "R4H01"
        "productName" String "phye1bp"
        "productInfo" String "phye1bp"
        "productionDate" String "20001221"

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
        "productNumber" String "CXC1321518"
        "productRevision" String "R3E01"
        "productName" String "equipm1_lm"
        "productInfo" String "equipm1_bp403"
        "productionDate" String "20001221"

    "programMustBeSingleton" Boolean false
    "reliableProgramLabel" String ""
    "reservedByUpgradePackage" Boolean false
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,SwManagement=1"
    identity "amd_m1_fpga"
    moType LoadModule
    exception none
    nrOfAttributes 16
    "LoadModuleId" String "amd_m1_fpga"
    "fileFormat" String ""
    "isDirectory" Boolean false
    "loadModuleFilePath" String "/c/loadmodules/CXC1321363_R4B01"
    "loaderType" Integer 0
    "moppletEntries" Array String 0
    "oseProgramHeapSize" Integer 0
    "oseProgramLoadClass" Integer 400
    "oseProgramPoolSize" Integer 0
    "otherLoaderName" String ""
    "preLoad" Integer 0
    "productData" Struct
        nrOfElements 5
        "productNumber" String "CXC1321363"
        "productRevision" String "R4B01"
        "productName" String "amd_m1_fpga"
        "productInfo" String "amd_m1_fpga"
        "productionDate" String "20010213"

    "programMustBeSingleton" Boolean false
    "reliableProgramLabel" String "amd_m1_fpga"
    "reservedByUpgradePackage" Boolean false
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,SwManagement=1"
    identity "PhyStm1Mp"
    moType LoadModule
    exception none
    nrOfAttributes 16
    "LoadModuleId" String "PhyStm1Mp"
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
        "productNumber" String "CXC1321517"
        "productRevision" String "R3F01"
        "productName" String "phye1mp"
        "productInfo" String "phye1mp"
        "productionDate" String "20001221"

    "programMustBeSingleton" Boolean false
    "reliableProgramLabel" String "phy_stm1_mp"
    "reservedByUpgradePackage" Boolean false
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,SwManagement=1"
    identity "PhyStm1Bp"
    moType LoadModule
    exception none
    nrOfAttributes 16
    "LoadModuleId" String "PhyStm1Bp"
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
        "productNumber" String "CXC1320896"
        "productRevision" String "R3F01"
        "productName" String "phye1bp"
        "productInfo" String "phye1bp"
        "productionDate" String "20001221"

    "programMustBeSingleton" Boolean false
    "reliableProgramLabel" String ""
    "reservedByUpgradePackage" Boolean false
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,SwManagement=1"
    identity "EqpM4Bp"
    moType LoadModule
    exception none
    nrOfAttributes 16
    "LoadModuleId" String "EqpM4Bp"
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
        "productNumber" String "CXC1321519"
        "productRevision" String "R3E01"
        "productName" String "equipm4_lm"
        "productInfo" String "equipm4_bp403"
        "productionDate" String "20001221"

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
        "productNumber" String "CXC1320961"
        "productRevision" String "R3G01"
        "productName" String "cs.jar"
        "productInfo" String "cs.jar"
        "productionDate" String "20001214"

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
        "productNumber" String "CXC1320959"
        "productRevision" String "R4S03"
        "productName" String "cma.jar"
        "productInfo" String "cma.jar"
        "productionDate" String "20010111"

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
        "productNumber" String "CXC1320960"
        "productRevision" String "R4F01"
        "productName" String "oms.jar"
        "productInfo" String "oms.jar"
        "productionDate" String "20010104"

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
        "productNumber" String "CXC1321689"
        "productRevision" String "R3A01"
        "productName" String "vbjorb.jar"
        "productInfo" String "vbjorb.jar"
        "productionDate" String "20001116"

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
        "productNumber" String "CXC1321442"
        "productRevision" String "R2B01"
        "productName" String "classes.zip"
        "productInfo" String "classes.zip"
        "productionDate" String "20001116"

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
        "productNumber" String "CXC1340297"
        "productRevision" String "R1B02"
        "productName" String "asms"
        "productInfo" String "asms.jar"
        "productionDate" String "20001116"

    "programMustBeSingleton" Boolean false
    "reliableProgramLabel" String ""
    "reservedByUpgradePackage" Boolean false
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,SwManagement=1"
    identity "optional"
    moType LoadModule
    exception none
    nrOfAttributes 16
    "LoadModuleId" String "optional"
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
        "productNumber" String "CXC1322363"
        "productRevision" String "R2A01"
        "productName" String "optional"
        "productInfo" String "optional"
        "productionDate" String "20010419"

    "programMustBeSingleton" Boolean false
    "reliableProgramLabel" String ""
    "reservedByUpgradePackage" Boolean false
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,SwManagement=1"
    identity "NssTuRNCBp"
    moType LoadModule
    exception none
    nrOfAttributes 16
    "LoadModuleId" String "NssTuRNCBp"
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
        "productNumber" String "CXC1321122/21"
        "productRevision" String "R2E01"
        "productName" String "nsstu21bp"
        "productInfo" String "nsstu21bp"
        "productionDate" String "20001014"

    "programMustBeSingleton" Boolean false
    "reliableProgramLabel" String ""
    "reservedByUpgradePackage" Boolean false
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,SwManagement=1"
    identity "Aal2NccAdm12"
    moType LoadModule
    exception none
    nrOfAttributes 16
    "LoadModuleId" String "Aal2NccAdm12"
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
        "productNumber" String "CXC1322420/12"
        "productRevision" String "R1T01"
        "productName" String "aal2nccadm12"
        "productInfo" String "aal2nccadm12"
        "productionDate" String "20010213"

    "programMustBeSingleton" Boolean false
    "reliableProgramLabel" String "aal2ncc"
    "reservedByUpgradePackage" Boolean false
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,SwManagement=1"
    identity "Aal2DisNcc12"
    moType LoadModule
    exception none
    nrOfAttributes 16
    "LoadModuleId" String "Aal2DisNcc12"
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
        "productNumber" String "CXC1322419/12"
        "productRevision" String "R1L01"
        "productName" String "aal2disncc12"
        "productInfo" String "aal2disncc12"
        "productionDate" String "20010213"

    "programMustBeSingleton" Boolean false
    "reliableProgramLabel" String "aal2dis"
    "reservedByUpgradePackage" Boolean false
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,SwManagement=1"
    identity "Aal2CpsRc12"
    moType LoadModule
    exception none
    nrOfAttributes 16
    "LoadModuleId" String "Aal2CpsRc12"
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
        "productNumber" String "CXC1322418/12"
        "productRevision" String "R1M01"
        "productName" String "aal2cpsrc_12"
        "productInfo" String "aal2cpsrc_12"
        "productionDate" String "20010213"

    "programMustBeSingleton" Boolean false
    "reliableProgramLabel" String "aal2cpsrc"
    "reservedByUpgradePackage" Boolean false
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,SwManagement=1"
    identity "Aal2Ap12"
    moType LoadModule
    exception none
    nrOfAttributes 16
    "LoadModuleId" String "Aal2Ap12"
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
        "productNumber" String "CXC1322417/12"
        "productRevision" String "R1K01"
        "productName" String "aal2ap_12"
        "productInfo" String "aal2ap_12"
        "productionDate" String "20010213"

    "programMustBeSingleton" Boolean false
    "reliableProgramLabel" String "aal2ap12"
    "reservedByUpgradePackage" Boolean false
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,SwManagement=1"
    identity "Aal2Ap13"
    moType LoadModule
    exception none
    nrOfAttributes 16
    "LoadModuleId" String "Aal2Ap13"
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
        "productNumber" String "CXC1322417/13"
        "productRevision" String "R1K01"
        "productName" String "aal2ap_13"
        "productInfo" String "aal2ap_13"
        "productionDate" String "20010213"

    "programMustBeSingleton" Boolean false
    "reliableProgramLabel" String "aal2ap13"
    "reservedByUpgradePackage" Boolean false
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,SwManagement=1"
    identity "SppMp"
    moType LoadModule
    exception none
    nrOfAttributes 16
    "LoadModuleId" String "SppMp"
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
        "productNumber" String "CXC1321357"
        "productRevision" String "R7C03"
        "productName" String "spp_mp"
        "productInfo" String "spp_mp"
        "productionDate" String "20010201"

    "programMustBeSingleton" Boolean false
    "reliableProgramLabel" String "spp_mp"
    "reservedByUpgradePackage" Boolean false
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,SwManagement=1"
    identity "SppFpga"
    moType LoadModule
    exception none
    nrOfAttributes 16
    "LoadModuleId" String "SppFpga"
    "fileFormat" String ""
    "isDirectory" Boolean false
    "loadModuleFilePath" String "/c/loadmodules/CXC1321515_R6B01"
    "loaderType" Integer 4
    "moppletEntries" Array String 0
    "oseProgramHeapSize" Integer 0
    "oseProgramLoadClass" Integer 400
    "oseProgramPoolSize" Integer 0
    "otherLoaderName" String ""
    "preLoad" Integer 0
    "productData" Struct
        nrOfElements 5
        "productNumber" String "CXC1321515"
        "productRevision" String "R6B01"
        "productName" String "spp_fpga"
        "productInfo" String "spp_fpga"
        "productionDate" String "20001201"

    "programMustBeSingleton" Boolean false
    "reliableProgramLabel" String ""
    "reservedByUpgradePackage" Boolean false
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,SwManagement=1"
    identity "NsaalAdm"
    moType LoadModule
    exception none
    nrOfAttributes 16
    "LoadModuleId" String "NsaalAdm"
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
        "productNumber" String "CXC1321171"
        "productRevision" String "R6G01"
        "productName" String "nsaal_adm"
        "productInfo" String "nsaal_adm"
        "productionDate" String "20010212"

    "programMustBeSingleton" Boolean false
    "reliableProgramLabel" String "nsaal_adm"
    "reservedByUpgradePackage" Boolean false
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,SwManagement=1"
    identity "NsaalTerm"
    moType LoadModule
    exception none
    nrOfAttributes 16
    "LoadModuleId" String "NsaalTerm"
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
        "productNumber" String "CXC1321172"
        "productRevision" String "R6H02"
        "productName" String "nsaal_term"
        "productInfo" String "nsaal_term"
        "productionDate" String "20010212"

    "programMustBeSingleton" Boolean false
    "reliableProgramLabel" String "nsaal_term"
    "reservedByUpgradePackage" Boolean false
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,SwManagement=1"
    identity "SppBpBasic"
    moType LoadModule
    exception none
    nrOfAttributes 16
    "LoadModuleId" String "SppBpBasic"
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
        "productNumber" String "CXC1321046"
        "productRevision" String "R7D02"
        "productName" String "spp_bp_basic"
        "productInfo" String "spp_bp_basic"
        "productionDate" String "20010201"

    "programMustBeSingleton" Boolean false
    "reliableProgramLabel" String ""
    "reservedByUpgradePackage" Boolean false
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,SwManagement=1"
    identity "SppBpAal025"
    moType LoadModule
    exception none
    nrOfAttributes 16
    "LoadModuleId" String "SppBpAal025"
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
        "productNumber" String "CXC1322221"
        "productRevision" String "R2M01"
        "productName" String "spp_bpaal025"
        "productInfo" String "spp_bpaal025"
        "productionDate" String "20010306"

    "programMustBeSingleton" Boolean false
    "reliableProgramLabel" String ""
    "reservedByUpgradePackage" Boolean false
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,SwManagement=1"
    identity "SccServer"
    moType LoadModule
    exception none
    nrOfAttributes 16
    "LoadModuleId" String "SccServer"
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
        "productNumber" String "CXC1321142"
        "productRevision" String "R6S01"
        "productName" String "scc_server"
        "productInfo" String "scc_server"
        "productionDate" String "20010201"

    "programMustBeSingleton" Boolean false
    "reliableProgramLabel" String "scc_server"
    "reservedByUpgradePackage" Boolean false
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,SwManagement=1"
    identity "SccAdm"
    moType LoadModule
    exception none
    nrOfAttributes 16
    "LoadModuleId" String "SccAdm"
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
        "productNumber" String "CXC1321143"
        "productRevision" String "R6J01"
        "productName" String "scc_adm"
        "productInfo" String "scc_adm"
        "productionDate" String "20010201"

    "programMustBeSingleton" Boolean false
    "reliableProgramLabel" String "scc_adm"
    "reservedByUpgradePackage" Boolean false
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,SwManagement=1"
    identity "XPM"
    moType LoadModule
    exception none
    nrOfAttributes 16
    "LoadModuleId" String "XPM"
    "fileFormat" String ""
    "isDirectory" Boolean false
    "loadModuleFilePath" String "/c/loadmodules/"
    "loaderType" Integer 0
    "moppletEntries" Array String 0
    "oseProgramHeapSize" Integer 0
    "oseProgramLoadClass" Integer 200
    "oseProgramPoolSize" Integer 0
    "otherLoaderName" String ""
    "preLoad" Integer 0
    "productData" Struct
        nrOfElements 5
        "productNumber" String "CXC1322705"
        "productRevision" String "R1H01"
        "productName" String "XPM"
        "productInfo" String "XPM"
        "productionDate" String "20010529"

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
    "loadModuleFilePath" String "/c/loadmodules/"
    "loaderType" Integer 0
    "moppletEntries" Array String 0
    "oseProgramHeapSize" Integer 0
    "oseProgramLoadClass" Integer 50
    "oseProgramPoolSize" Integer 0
    "otherLoaderName" String ""
    "preLoad" Integer 0
    "productData" Struct
        nrOfElements 5
        "productNumber" String "CXC1322025"
        "productRevision" String "R2A04"
        "productName" String "dbm_fpgalodr"
        "productInfo" String "dbm_fpgalodr"
        "productionDate" String "20010625"

    "programMustBeSingleton" Boolean false
    "reliableProgramLabel" String ""
    "reservedByUpgradePackage" Boolean false
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,SwManagement=1"
    identity "scc_adm"
    moType ReliableProgramUniter
    exception none
    nrOfAttributes 11
    "ReliableProgramUniterId" String "scc_adm"
    "admActiveSlot" Ref "null"
    "admPassiveSlot" Ref "null"
    "normalisation" Integer 1
    "operationalMode" Integer 1
    "reliableProgramLabel" String "scc_adm"
    "replication" Integer 2
    "reservedBy" Array Ref 0
    "rpuId" Long 0
    "switchOver" Integer 2
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,SwManagement=1"
    identity "scc_server"
    moType ReliableProgramUniter
    exception none
    nrOfAttributes 11
    "ReliableProgramUniterId" String "scc_server"
    "admActiveSlot" Ref "null"
    "admPassiveSlot" Ref "null"
    "normalisation" Integer 1
    "operationalMode" Integer 1
    "reliableProgramLabel" String "scc_server"
    "replication" Integer 2
    "reservedBy" Array Ref 0
    "rpuId" Long 0
    "switchOver" Integer 2
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,SwManagement=1"
    identity "aal2ap13"
    moType ReliableProgramUniter
    exception none
    nrOfAttributes 11
    "ReliableProgramUniterId" String "aal2ap13"
    "admActiveSlot" Ref "null"
    "admPassiveSlot" Ref "null"
    "normalisation" Integer 1
    "operationalMode" Integer 1
    "reliableProgramLabel" String "aal2ap13"
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
    "reliableProgramLabel" String "sw_inst"
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
    "reliableProgramLabel" String "spas_res"
    "replication" Integer 2
    "reservedBy" Array Ref 0
    "rpuId" Long 0
    "switchOver" Integer 2
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
    "reliableProgramLabel" String "inet"
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
    "reliableProgramLabel" String "ospf"
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
    identity "phy_e1_mp"
    moType ReliableProgramUniter
    exception none
    nrOfAttributes 11
    "ReliableProgramUniterId" String "phy_e1_mp"
    "admActiveSlot" Ref "null"
    "admPassiveSlot" Ref "null"
    "normalisation" Integer 1
    "operationalMode" Integer 1
    "reliableProgramLabel" String "phy_e1_mp"
    "replication" Integer 2
    "reservedBy" Array Ref 0
    "rpuId" Long 0
    "switchOver" Integer 2
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,SwManagement=1"
    identity "phy_stm1_mp"
    moType ReliableProgramUniter
    exception none
    nrOfAttributes 11
    "ReliableProgramUniterId" String "phy_stm1_mp"
    "admActiveSlot" Ref "null"
    "admPassiveSlot" Ref "null"
    "normalisation" Integer 1
    "operationalMode" Integer 1
    "reliableProgramLabel" String "phy_stm1_mp"
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
    identity "aal2ncc"
    moType ReliableProgramUniter
    exception none
    nrOfAttributes 11
    "ReliableProgramUniterId" String "aal2ncc"
    "admActiveSlot" Ref "null"
    "admPassiveSlot" Ref "null"
    "normalisation" Integer 1
    "operationalMode" Integer 1
    "reliableProgramLabel" String "aal2ncc"
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
    "reliableProgramLabel" String "aal0_dynamic_adm"
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
    "reliableProgramLabel" String "aal0_static_adm"
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
    "reliableProgramLabel" String "aal5_dynamic_adm"
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
    "reliableProgramLabel" String "aal5_static_adm"
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
    identity "nsaal_adm"
    moType ReliableProgramUniter
    exception none
    nrOfAttributes 11
    "ReliableProgramUniterId" String "nsaal_adm"
    "admActiveSlot" Ref "null"
    "admPassiveSlot" Ref "null"
    "normalisation" Integer 1
    "operationalMode" Integer 1
    "reliableProgramLabel" String "nsaal_adm"
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
    "reliableProgramLabel" String "nss_mp"
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
    "reliableProgramLabel" String "ip_util"
    "replication" Integer 2
    "reservedBy" Array Ref 0
    "rpuId" Long 0
    "switchOver" Integer 2
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,SwManagement=1"
    identity "spp_mp"
    moType ReliableProgramUniter
    exception none
    nrOfAttributes 11
    "ReliableProgramUniterId" String "spp_mp"
    "admActiveSlot" Ref "null"
    "admPassiveSlot" Ref "null"
    "normalisation" Integer 1
    "operationalMode" Integer 1
    "reliableProgramLabel" String "spp_mp"
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
    "reliableProgramLabel" String "http"
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
    "reliableProgramLabel" String "jvm"
    "replication" Integer 2
    "reservedBy" Array Ref 0
    "rpuId" Long 0
    "switchOver" Integer 2
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,SwManagement=1"
    identity "ans_aal2rh_1"
    moType ReliableProgramUniter
    exception none
    nrOfAttributes 11
    "ReliableProgramUniterId" String "ans_aal2rh_1"
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
    identity "ans_aal2disncc_12_1"
    moType ReliableProgramUniter
    exception none
    nrOfAttributes 11
    "ReliableProgramUniterId" String "ans_aal2disncc_12_1"
    "admActiveSlot" Ref "null"
    "admPassiveSlot" Ref "null"
    "normalisation" Integer 1
    "operationalMode" Integer 1
    "reliableProgramLabel" String "aal2dis"
    "replication" Integer 2
    "reservedBy" Array Ref 0
    "rpuId" Long 0
    "switchOver" Integer 2
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,SwManagement=1"
    identity "ans_aal2cpsrc_12_1"
    moType ReliableProgramUniter
    exception none
    nrOfAttributes 11
    "ReliableProgramUniterId" String "ans_aal2cpsrc_12_1"
    "admActiveSlot" Ref "null"
    "admPassiveSlot" Ref "null"
    "normalisation" Integer 1
    "operationalMode" Integer 1
    "reliableProgramLabel" String "aal2cpsrc"
    "replication" Integer 2
    "reservedBy" Array Ref 0
    "rpuId" Long 0
    "switchOver" Integer 2
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,SwManagement=1"
    identity "ans_aal2ap_12_1"
    moType ReliableProgramUniter
    exception none
    nrOfAttributes 11
    "ReliableProgramUniterId" String "ans_aal2ap_12_1"
    "admActiveSlot" Ref "null"
    "admPassiveSlot" Ref "null"
    "normalisation" Integer 1
    "operationalMode" Integer 1
    "reliableProgramLabel" String "aal2ap12"
    "replication" Integer 2
    "reservedBy" Array Ref 0
    "rpuId" Long 0
    "switchOver" Integer 2
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,SwManagement=1"
    identity "tuRnRnc"
    moType LoadModule
    exception none
    nrOfAttributes 16
    "LoadModuleId" String "tuRnRnc"
    "fileFormat" String ""
    "isDirectory" Boolean false
    "loadModuleFilePath" String "/c/loadmodules/CXC1321242%1_R5G02"
    "loaderType" Integer 0
    "moppletEntries" Array String 0
    "oseProgramHeapSize" Integer 0
    "oseProgramLoadClass" Integer 500
    "oseProgramPoolSize" Integer 0
    "otherLoaderName" String ""
    "preLoad" Integer 0
    "productData" Struct
        nrOfElements 5
        "productNumber" String "CXC1321242%1"
        "productRevision" String "R5G02"
        "productName" String "tuRnRnc"
        "productInfo" String "tuRnRnc"
        "productionDate" String "20001020"

    "programMustBeSingleton" Boolean false
    "reliableProgramLabel" String "tuRnRnc"
    "reservedByUpgradePackage" Boolean false
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,SwManagement=1"
    identity "RncLmCenDh"
    moType LoadModule
    exception none
    nrOfAttributes 16
    "LoadModuleId" String "RncLmCenDh"
    "fileFormat" String ""
    "isDirectory" Boolean false
    "loadModuleFilePath" String "/c/loadmodules/CXC1323197_R2G05"
    "loaderType" Integer 0
    "moppletEntries" Array String 0
    "oseProgramHeapSize" Integer 0
    "oseProgramLoadClass" Integer 500
    "oseProgramPoolSize" Integer 0
    "otherLoaderName" String ""
    "preLoad" Integer 0
    "productData" Struct
        nrOfElements 5
        "productNumber" String "CXC1323197"
        "productRevision" String "R2G05"
        "productName" String "RncLmCenDh"
        "productInfo" String "RncLmCenDh"
        "productionDate" String "20001020"

    "programMustBeSingleton" Boolean false
    "reliableProgramLabel" String "rnc_cen_dh"
    "reservedByUpgradePackage" Boolean false
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,SwManagement=1"
    identity "RncLmCenRh"
    moType LoadModule
    exception none
    nrOfAttributes 16
    "LoadModuleId" String "RncLmCenRh"
    "fileFormat" String ""
    "isDirectory" Boolean false
    "loadModuleFilePath" String "/c/loadmodules/CXC1323196_R2H04"
    "loaderType" Integer 0
    "moppletEntries" Array String 0
    "oseProgramHeapSize" Integer 0
    "oseProgramLoadClass" Integer 500
    "oseProgramPoolSize" Integer 0
    "otherLoaderName" String ""
    "preLoad" Integer 0
    "productData" Struct
        nrOfElements 5
        "productNumber" String "CXC1323196"
        "productRevision" String "R2H04"
        "productName" String "RncLmCenRh"
        "productInfo" String "RncLmCenRh"
        "productionDate" String "20001020"

    "programMustBeSingleton" Boolean false
    "reliableProgramLabel" String "rnc_cen_rh"
    "reservedByUpgradePackage" Boolean false
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,SwManagement=1"
    identity "RncLmBdh"
    moType LoadModule
    exception none
    nrOfAttributes 16
    "LoadModuleId" String "RncLmBdh"
    "fileFormat" String ""
    "isDirectory" Boolean false
    "loadModuleFilePath" String "/c/loadmodules/CXC1323199_R2F01"
    "loaderType" Integer 0
    "moppletEntries" Array String 0
    "oseProgramHeapSize" Integer 0
    "oseProgramLoadClass" Integer 500
    "oseProgramPoolSize" Integer 0
    "otherLoaderName" String ""
    "preLoad" Integer 0
    "productData" Struct
        nrOfElements 5
        "productNumber" String "CXC1323199"
        "productRevision" String "R2F01"
        "productName" String "RncLmBdh"
        "productInfo" String "RncLmBdh"
        "productionDate" String "20001020"

    "programMustBeSingleton" Boolean false
    "reliableProgramLabel" String "rnc_bdh"
    "reservedByUpgradePackage" Boolean false
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,SwManagement=1"
    identity "RncLmDh"
    moType LoadModule
    exception none
    nrOfAttributes 16
    "LoadModuleId" String "RncLmDh"
    "fileFormat" String ""
    "isDirectory" Boolean false
    "loadModuleFilePath" String "/c/loadmodules/CXC1323198_R2G04"
    "loaderType" Integer 0
    "moppletEntries" Array String 0
    "oseProgramHeapSize" Integer 0
    "oseProgramLoadClass" Integer 500
    "oseProgramPoolSize" Integer 0
    "otherLoaderName" String ""
    "preLoad" Integer 0
    "productData" Struct
        nrOfElements 5
        "productNumber" String "CXC1323198"
        "productRevision" String "R2G04"
        "productName" String "RncLmDh"
        "productInfo" String "RncLmDh"
        "productionDate" String "20001020"

    "programMustBeSingleton" Boolean false
    "reliableProgramLabel" String "rnc_dh"
    "reservedByUpgradePackage" Boolean false
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,SwManagement=1"
    identity "RncLmCc"
    moType LoadModule
    exception none
    nrOfAttributes 16
    "LoadModuleId" String "RncLmCc"
    "fileFormat" String ""
    "isDirectory" Boolean false
    "loadModuleFilePath" String "/c/loadmodules/CXC1323202_R2G04"
    "loaderType" Integer 1
    "moppletEntries" Array String 0
    "oseProgramHeapSize" Integer 0
    "oseProgramLoadClass" Integer 500
    "oseProgramPoolSize" Integer 0
    "otherLoaderName" String ""
    "preLoad" Integer 0
    "productData" Struct
        nrOfElements 5
        "productNumber" String "CXC1323202"
        "productRevision" String "R2G04"
        "productName" String "RncLmCc"
        "productInfo" String "RncLmCc"
        "productionDate" String "20001020"

    "programMustBeSingleton" Boolean false
    "reliableProgramLabel" String "rnc_cc"
    "reservedByUpgradePackage" Boolean false
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,SwManagement=1"
    identity "RncLmDc"
    moType LoadModule
    exception none
    nrOfAttributes 16
    "LoadModuleId" String "RncLmDc"
    "fileFormat" String ""
    "isDirectory" Boolean false
    "loadModuleFilePath" String "/c/loadmodules/CXC1323203_R2G04"
    "loaderType" Integer 1
    "moppletEntries" Array String 0
    "oseProgramHeapSize" Integer 0
    "oseProgramLoadClass" Integer 500
    "oseProgramPoolSize" Integer 0
    "otherLoaderName" String ""
    "preLoad" Integer 0
    "productData" Struct
        nrOfElements 5
        "productNumber" String "CXC1323203"
        "productRevision" String "R2G04"
        "productName" String "RncLmDc"
        "productInfo" String "RncLmDc"
        "productionDate" String "20001020"

    "programMustBeSingleton" Boolean false
    "reliableProgramLabel" String "rnc_dc"
    "reservedByUpgradePackage" Boolean false
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,SwManagement=1"
    identity "RncLmPdr"
    moType LoadModule
    exception none
    nrOfAttributes 16
    "LoadModuleId" String "RncLmPdr"
    "fileFormat" String ""
    "isDirectory" Boolean false
    "loadModuleFilePath" String "/c/loadmodules/CXC1323204_R2G04"
    "loaderType" Integer 1
    "moppletEntries" Array String 0
    "oseProgramHeapSize" Integer 0
    "oseProgramLoadClass" Integer 500
    "oseProgramPoolSize" Integer 0
    "otherLoaderName" String ""
    "preLoad" Integer 0
    "productData" Struct
        nrOfElements 5
        "productNumber" String "CXC1323204"
        "productRevision" String "R2G04"
        "productName" String "RncLmPdr"
        "productInfo" String "RncLmPdr"
        "productionDate" String "20001020"

    "programMustBeSingleton" Boolean false
    "reliableProgramLabel" String "rnc_pdr"
    "reservedByUpgradePackage" Boolean false
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,SwManagement=1"
    identity "RncLmIurCc"
    moType LoadModule
    exception none
    nrOfAttributes 16
    "LoadModuleId" String "RncLmIurCc"
    "fileFormat" String ""
    "isDirectory" Boolean false
    "loadModuleFilePath" String "/c/loadmodules/CXC1323201_R2G02"
    "loaderType" Integer 1
    "moppletEntries" Array String 0
    "oseProgramHeapSize" Integer 0
    "oseProgramLoadClass" Integer 500
    "oseProgramPoolSize" Integer 0
    "otherLoaderName" String ""
    "preLoad" Integer 0
    "productData" Struct
        nrOfElements 5
        "productNumber" String "CXC1323201"
        "productRevision" String "R2G02"
        "productName" String "RncLmIurCc"
        "productInfo" String "RncLmIurCc"
        "productionDate" String "20001020"

    "programMustBeSingleton" Boolean false
    "reliableProgramLabel" String "rnc_iurcc"
    "reservedByUpgradePackage" Boolean false
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,SwManagement=1"
    identity "RncLmFro"
    moType LoadModule
    exception none
    nrOfAttributes 16
    "LoadModuleId" String "RncLmFro"
    "fileFormat" String ""
    "isDirectory" Boolean false
    "loadModuleFilePath" String "/c/loadmodules/CXC1323433_R9C01"
    "loaderType" Integer 0
    "moppletEntries" Array String 0
    "oseProgramHeapSize" Integer 0
    "oseProgramLoadClass" Integer 500
    "oseProgramPoolSize" Integer 0
    "otherLoaderName" String ""
    "preLoad" Integer 0
    "productData" Struct
        nrOfElements 5
        "productNumber" String "CXC1323433"
        "productRevision" String "R9C01"
        "productName" String "RncLmFro"
        "productInfo" String "RncLmFro"
        "productionDate" String "20001020"

    "programMustBeSingleton" Boolean false
    "reliableProgramLabel" String "rnc_fro"
    "reservedByUpgradePackage" Boolean false
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,SwManagement=1"
    identity "RncLmMao"
    moType LoadModule
    exception none
    nrOfAttributes 16
    "LoadModuleId" String "RncLmMao"
    "fileFormat" String ""
    "isDirectory" Boolean false
    "loadModuleFilePath" String "/c/java/CXC1323435_R9B01.jar"
    "loaderType" Integer 0
    "moppletEntries" Array String 0
    "oseProgramHeapSize" Integer 0
    "oseProgramLoadClass" Integer 500
    "oseProgramPoolSize" Integer 0
    "otherLoaderName" String ""
    "preLoad" Integer 0
    "productData" Struct
        nrOfElements 5
        "productNumber" String "CXC1323435"
        "productRevision" String "R9B01"
        "productName" String "RncLmMao"
        "productInfo" String "RncLmMao"
        "productionDate" String "20001020"

    "programMustBeSingleton" Boolean false
    "reliableProgramLabel" String ""
    "reservedByUpgradePackage" Boolean false
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,SwManagement=1"
    identity "RncLmUe"
    moType LoadModule
    exception none
    nrOfAttributes 16
    "LoadModuleId" String "RncLmUe"
    "fileFormat" String ""
    "isDirectory" Boolean false
    "loadModuleFilePath" String "/c/loadmodules/CXC1323431_R9E04"
    "loaderType" Integer 0
    "moppletEntries" Array String 0
    "oseProgramHeapSize" Integer 0
    "oseProgramLoadClass" Integer 500
    "oseProgramPoolSize" Integer 0
    "otherLoaderName" String ""
    "preLoad" Integer 0
    "productData" Struct
        nrOfElements 5
        "productNumber" String "CXC1323431"
        "productRevision" String "R9E04"
        "productName" String "RncLmUe"
        "productInfo" String "RncLmUe"
        "productionDate" String "20001020"

    "programMustBeSingleton" Boolean false
    "reliableProgramLabel" String "rnc_ue"
    "reservedByUpgradePackage" Boolean false
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,SwManagement=1"
    identity "RncLmModOm"
    moType LoadModule
    exception none
    nrOfAttributes 16
    "LoadModuleId" String "RncLmModOm"
    "fileFormat" String ""
    "isDirectory" Boolean false
    "loadModuleFilePath" String "/c/loadmodules/CXC1323432_R9D01"
    "loaderType" Integer 0
    "moppletEntries" Array String 0
    "oseProgramHeapSize" Integer 0
    "oseProgramLoadClass" Integer 500
    "oseProgramPoolSize" Integer 0
    "otherLoaderName" String ""
    "preLoad" Integer 0
    "productData" Struct
        nrOfElements 5
        "productNumber" String "CXC1323432"
        "productRevision" String "R9D01"
        "productName" String "RncLmModOm"
        "productInfo" String "RncLmModOm"
        "productionDate" String "20001020"

    "programMustBeSingleton" Boolean false
    "reliableProgramLabel" String "rnc_mod_om"
    "reservedByUpgradePackage" Boolean false
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,SwManagement=1"
    identity "RncLmCenOm"
    moType LoadModule
    exception none
    nrOfAttributes 16
    "LoadModuleId" String "RncLmCenOm"
    "fileFormat" String ""
    "isDirectory" Boolean false
    "loadModuleFilePath" String "/c/loadmodules/CXC1323434_R9C02"
    "loaderType" Integer 0
    "moppletEntries" Array String 0
    "oseProgramHeapSize" Integer 0
    "oseProgramLoadClass" Integer 500
    "oseProgramPoolSize" Integer 0
    "otherLoaderName" String ""
    "preLoad" Integer 0
    "productData" Struct
        nrOfElements 5
        "productNumber" String "CXC1323434"
        "productRevision" String "R9C02"
        "productName" String "RncLmCenOm"
        "productInfo" String "RncLmCenOm"
        "productionDate" String "20001020"

    "programMustBeSingleton" Boolean false
    "reliableProgramLabel" String "rnc_cen_om"
    "reservedByUpgradePackage" Boolean false
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,SwManagement=1"
    identity "RnhLmCenRnh"
    moType LoadModule
    exception none
    nrOfAttributes 16
    "LoadModuleId" String "RnhLmCenRnh"
    "fileFormat" String ""
    "isDirectory" Boolean false
    "loadModuleFilePath" String "/c/loadmodules/CXC1323406_R2F05"
    "loaderType" Integer 0
    "moppletEntries" Array String 0
    "oseProgramHeapSize" Integer 0
    "oseProgramLoadClass" Integer 500
    "oseProgramPoolSize" Integer 0
    "otherLoaderName" String ""
    "preLoad" Integer 0
    "productData" Struct
        nrOfElements 5
        "productNumber" String "CXC1323406"
        "productRevision" String "R2F05"
        "productName" String "RnhLmCenRnh"
        "productInfo" String "RnhLmCenRnh"
        "productionDate" String "20001020"

    "programMustBeSingleton" Boolean false
    "reliableProgramLabel" String "rnc_cen_rnh"
    "reservedByUpgradePackage" Boolean false
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,SwManagement=1"
    identity "RncLmRanap"
    moType LoadModule
    exception none
    nrOfAttributes 16
    "LoadModuleId" String "RncLmRanap"
    "fileFormat" String ""
    "isDirectory" Boolean false
    "loadModuleFilePath" String "/c/loadmodules/CXC1323407_R2F04"
    "loaderType" Integer 0
    "moppletEntries" Array String 0
    "oseProgramHeapSize" Integer 0
    "oseProgramLoadClass" Integer 500
    "oseProgramPoolSize" Integer 0
    "otherLoaderName" String ""
    "preLoad" Integer 0
    "productData" Struct
        nrOfElements 5
        "productNumber" String "CXC1323407"
        "productRevision" String "R2F04"
        "productName" String "RncLmRanap"
        "productInfo" String "RncLmRanap"
        "productionDate" String "20001020"

    "programMustBeSingleton" Boolean false
    "reliableProgramLabel" String "rnc_ranap"
    "reservedByUpgradePackage" Boolean false
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,SwManagement=1"
    identity "RncLmRnsap"
    moType LoadModule
    exception none
    nrOfAttributes 16
    "LoadModuleId" String "RncLmRnsap"
    "fileFormat" String ""
    "isDirectory" Boolean false
    "loadModuleFilePath" String "/c/loadmodules/CXC1323409_R2F04"
    "loaderType" Integer 0
    "moppletEntries" Array String 0
    "oseProgramHeapSize" Integer 0
    "oseProgramLoadClass" Integer 500
    "oseProgramPoolSize" Integer 0
    "otherLoaderName" String ""
    "preLoad" Integer 0
    "productData" Struct
        nrOfElements 5
        "productNumber" String "CXC1323409"
        "productRevision" String "R2F04"
        "productName" String "RncLmRnsap"
        "productInfo" String "RncLmRnsap"
        "productionDate" String "20001020"

    "programMustBeSingleton" Boolean false
    "reliableProgramLabel" String "rnc_rnsap"
    "reservedByUpgradePackage" Boolean false
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,SwManagement=1"
    identity "RncLmCell"
    moType LoadModule
    exception none
    nrOfAttributes 16
    "LoadModuleId" String "RncLmCell"
    "fileFormat" String ""
    "isDirectory" Boolean false
    "loadModuleFilePath" String "/c/loadmodules/CXC1323408_R2F06"
    "loaderType" Integer 0
    "moppletEntries" Array String 0
    "oseProgramHeapSize" Integer 0
    "oseProgramLoadClass" Integer 500
    "oseProgramPoolSize" Integer 0
    "otherLoaderName" String ""
    "preLoad" Integer 0
    "productData" Struct
        nrOfElements 5
        "productNumber" String "CXC1323408"
        "productRevision" String "R2F06"
        "productName" String "RncLmCell"
        "productInfo" String "RncLmCell"
        "productionDate" String "20001020"

    "programMustBeSingleton" Boolean false
    "reliableProgramLabel" String "rnc_cell"
    "reservedByUpgradePackage" Boolean false
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,SwManagement=1"
    identity "RncRpuCenDh"
    moType ReliableProgramUniter
    exception none
    nrOfAttributes 11
    "ReliableProgramUniterId" String "RncRpuCenDh"
    "admActiveSlot" Ref "null"
    "admPassiveSlot" Ref "null"
    "normalisation" Integer 1
    "operationalMode" Integer 1
    "reliableProgramLabel" String "rnc_cen_dh"
    "replication" Integer 2
    "reservedBy" Array Ref 0
    "rpuId" Long 0
    "switchOver" Integer 2
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,SwManagement=1"
    identity "RncRpuCenRh"
    moType ReliableProgramUniter
    exception none
    nrOfAttributes 11
    "ReliableProgramUniterId" String "RncRpuCenRh"
    "admActiveSlot" Ref "null"
    "admPassiveSlot" Ref "null"
    "normalisation" Integer 1
    "operationalMode" Integer 1
    "reliableProgramLabel" String "rnc_cen_rh"
    "replication" Integer 2
    "reservedBy" Array Ref 0
    "rpuId" Long 0
    "switchOver" Integer 2
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,SwManagement=1"
    identity "RncRpuDh"
    moType ReliableProgramUniter
    exception none
    nrOfAttributes 11
    "ReliableProgramUniterId" String "RncRpuDh"
    "admActiveSlot" Ref "null"
    "admPassiveSlot" Ref "null"
    "normalisation" Integer 1
    "operationalMode" Integer 1
    "reliableProgramLabel" String "rnc_dh"
    "replication" Integer 2
    "reservedBy" Array Ref 0
    "rpuId" Long 0
    "switchOver" Integer 2
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,SwManagement=1"
    identity "RncRpuFro"
    moType ReliableProgramUniter
    exception none
    nrOfAttributes 11
    "ReliableProgramUniterId" String "RncRpuFro"
    "admActiveSlot" Ref "null"
    "admPassiveSlot" Ref "null"
    "normalisation" Integer 1
    "operationalMode" Integer 1
    "reliableProgramLabel" String "rnc_fro"
    "replication" Integer 2
    "reservedBy" Array Ref 0
    "rpuId" Long 0
    "switchOver" Integer 2
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,SwManagement=1"
    identity "RncRpuCenOm"
    moType ReliableProgramUniter
    exception none
    nrOfAttributes 11
    "ReliableProgramUniterId" String "RncRpuCenOm"
    "admActiveSlot" Ref "null"
    "admPassiveSlot" Ref "null"
    "normalisation" Integer 1
    "operationalMode" Integer 1
    "reliableProgramLabel" String "rnc_cen_om"
    "replication" Integer 2
    "reservedBy" Array Ref 0
    "rpuId" Long 0
    "switchOver" Integer 2
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,SwManagement=1"
    identity "RncRpuUe"
    moType ReliableProgramUniter
    exception none
    nrOfAttributes 11
    "ReliableProgramUniterId" String "RncRpuUe"
    "admActiveSlot" Ref "null"
    "admPassiveSlot" Ref "null"
    "normalisation" Integer 1
    "operationalMode" Integer 1
    "reliableProgramLabel" String "rnc_ue"
    "replication" Integer 2
    "reservedBy" Array Ref 0
    "rpuId" Long 0
    "switchOver" Integer 2
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,SwManagement=1"
    identity "RncRpuModOm"
    moType ReliableProgramUniter
    exception none
    nrOfAttributes 11
    "ReliableProgramUniterId" String "RncRpuModOm"
    "admActiveSlot" Ref "null"
    "admPassiveSlot" Ref "null"
    "normalisation" Integer 1
    "operationalMode" Integer 1
    "reliableProgramLabel" String "rnc_mod_om"
    "replication" Integer 2
    "reservedBy" Array Ref 0
    "rpuId" Long 0
    "switchOver" Integer 2
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,SwManagement=1"
    identity "RncRpuRanap"
    moType ReliableProgramUniter
    exception none
    nrOfAttributes 11
    "ReliableProgramUniterId" String "RncRpuRanap"
    "admActiveSlot" Ref "null"
    "admPassiveSlot" Ref "null"
    "normalisation" Integer 1
    "operationalMode" Integer 1
    "reliableProgramLabel" String "rnc_ranap"
    "replication" Integer 2
    "reservedBy" Array Ref 0
    "rpuId" Long 0
    "switchOver" Integer 2
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,SwManagement=1"
    identity "RncRpuRnsap"
    moType ReliableProgramUniter
    exception none
    nrOfAttributes 11
    "ReliableProgramUniterId" String "RncRpuRnsap"
    "admActiveSlot" Ref "null"
    "admPassiveSlot" Ref "null"
    "normalisation" Integer 1
    "operationalMode" Integer 1
    "reliableProgramLabel" String "rnc_rnsap"
    "replication" Integer 2
    "reservedBy" Array Ref 0
    "rpuId" Long 0
    "switchOver" Integer 2
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,SwManagement=1"
    identity "RncRpuCenRnh"
    moType ReliableProgramUniter
    exception none
    nrOfAttributes 11
    "ReliableProgramUniterId" String "RncRpuCenRnh"
    "admActiveSlot" Ref "null"
    "admPassiveSlot" Ref "null"
    "normalisation" Integer 1
    "operationalMode" Integer 1
    "reliableProgramLabel" String "rnc_cen_rnh"
    "replication" Integer 2
    "reservedBy" Array Ref 0
    "rpuId" Long 0
    "switchOver" Integer 2
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,SwManagement=1"
    identity "RncRpuCell"
    moType ReliableProgramUniter
    exception none
    nrOfAttributes 11
    "ReliableProgramUniterId" String "RncRpuCell"
    "admActiveSlot" Ref "null"
    "admPassiveSlot" Ref "null"
    "normalisation" Integer 1
    "operationalMode" Integer 1
    "reliableProgramLabel" String "rnc_cell"
    "replication" Integer 2
    "reservedBy" Array Ref 0
    "rpuId" Long 0
    "switchOver" Integer 2
    "userLabel" String ""
)

SET
(
    mo "ManagedElement=1,SwManagement=1,ReliableProgramUniter=RncRpuCell"
    exception none
    nrOfAttributes 2
    "admPassiveSlot" Ref "ManagedElement=1,Equipment=1,Subrack=MS,Slot=15"
    "admActiveSlot" Ref "ManagedElement=1,Equipment=1,Subrack=MS,Slot=14"
)

SET
(
    mo "ManagedElement=1,SwManagement=1,ReliableProgramUniter=RncRpuCenRnh"
    exception none
    nrOfAttributes 2
    "admPassiveSlot" Ref "ManagedElement=1,Equipment=1,Subrack=MS,Slot=11"
    "admActiveSlot" Ref "ManagedElement=1,Equipment=1,Subrack=MS,Slot=10"
)

SET
(
    mo "ManagedElement=1,SwManagement=1,ReliableProgramUniter=RncRpuRnsap"
    exception none
    nrOfAttributes 2
    "admPassiveSlot" Ref "ManagedElement=1,Equipment=1,Subrack=MS,Slot=9"
    "admActiveSlot" Ref "ManagedElement=1,Equipment=1,Subrack=MS,Slot=8"
)

SET
(
    mo "ManagedElement=1,SwManagement=1,ReliableProgramUniter=RncRpuRanap"
    exception none
    nrOfAttributes 2
    "admPassiveSlot" Ref "ManagedElement=1,Equipment=1,Subrack=MS,Slot=9"
    "admActiveSlot" Ref "ManagedElement=1,Equipment=1,Subrack=MS,Slot=8"
)

SET
(
    mo "ManagedElement=1,SwManagement=1,ReliableProgramUniter=RncRpuModOm"
    exception none
    nrOfAttributes 2
    "admPassiveSlot" Ref "ManagedElement=1,Equipment=1,Subrack=MS,Slot=15"
    "admActiveSlot" Ref "ManagedElement=1,Equipment=1,Subrack=MS,Slot=14"
)

SET
(
    mo "ManagedElement=1,SwManagement=1,ReliableProgramUniter=RncRpuUe"
    exception none
    nrOfAttributes 2
    "admPassiveSlot" Ref "ManagedElement=1,Equipment=1,Subrack=MS,Slot=15"
    "admActiveSlot" Ref "ManagedElement=1,Equipment=1,Subrack=MS,Slot=14"
)

SET
(
    mo "ManagedElement=1,SwManagement=1,ReliableProgramUniter=RncRpuCenOm"
    exception none
    nrOfAttributes 2
    "admPassiveSlot" Ref "ManagedElement=1,Equipment=1,Subrack=MS,Slot=13"
    "admActiveSlot" Ref "ManagedElement=1,Equipment=1,Subrack=MS,Slot=12"
)

SET
(
    mo "ManagedElement=1,SwManagement=1,ReliableProgramUniter=RncRpuFro"
    exception none
    nrOfAttributes 2
    "admPassiveSlot" Ref "ManagedElement=1,Equipment=1,Subrack=MS,Slot=13"
    "admActiveSlot" Ref "ManagedElement=1,Equipment=1,Subrack=MS,Slot=12"
)

SET
(
    mo "ManagedElement=1,SwManagement=1,ReliableProgramUniter=RncRpuDh"
    exception none
    nrOfAttributes 2
    "admPassiveSlot" Ref "ManagedElement=1,Equipment=1,Subrack=MS,Slot=15"
    "admActiveSlot" Ref "ManagedElement=1,Equipment=1,Subrack=MS,Slot=14"
)

SET
(
    mo "ManagedElement=1,SwManagement=1,ReliableProgramUniter=RncRpuCenRh"
    exception none
    nrOfAttributes 2
    "admPassiveSlot" Ref "ManagedElement=1,Equipment=1,Subrack=MS,Slot=11"
    "admActiveSlot" Ref "ManagedElement=1,Equipment=1,Subrack=MS,Slot=10"
)

SET
(
    mo "ManagedElement=1,SwManagement=1,ReliableProgramUniter=RncRpuCenDh"
    exception none
    nrOfAttributes 2
    "admPassiveSlot" Ref "ManagedElement=1,Equipment=1,Subrack=MS,Slot=11"
    "admActiveSlot" Ref "ManagedElement=1,Equipment=1,Subrack=MS,Slot=10"
)

SET
(
    mo "ManagedElement=1,SwManagement=1,ReliableProgramUniter=ans_aal2ap_12_1"
    exception none
    nrOfAttributes 2
    "admPassiveSlot" Ref "ManagedElement=1,Equipment=1,Subrack=MS,Slot=15"
    "admActiveSlot" Ref "ManagedElement=1,Equipment=1,Subrack=MS,Slot=14"
)

SET
(
    mo "ManagedElement=1,SwManagement=1,ReliableProgramUniter=ans_aal2cpsrc_12_1"
    exception none
    nrOfAttributes 2
    "admPassiveSlot" Ref "ManagedElement=1,Equipment=1,Subrack=MS,Slot=15"
    "admActiveSlot" Ref "ManagedElement=1,Equipment=1,Subrack=MS,Slot=14"
)

SET
(
    mo "ManagedElement=1,SwManagement=1,ReliableProgramUniter=ans_aal2disncc_12_1"
    exception none
    nrOfAttributes 2
    "admPassiveSlot" Ref "ManagedElement=1,Equipment=1,Subrack=MS,Slot=15"
    "admActiveSlot" Ref "ManagedElement=1,Equipment=1,Subrack=MS,Slot=14"
)

SET
(
    mo "ManagedElement=1,SwManagement=1,ReliableProgramUniter=ans_aal2rh_1"
    exception none
    nrOfAttributes 2
    "admPassiveSlot" Ref "ManagedElement=1,Equipment=1,Subrack=MS,Slot=15"
    "admActiveSlot" Ref "ManagedElement=1,Equipment=1,Subrack=MS,Slot=14"
)

SET
(
    mo "ManagedElement=1,SwManagement=1,ReliableProgramUniter=jvm"
    exception none
    nrOfAttributes 2
    "admPassiveSlot" Ref "ManagedElement=1,Equipment=1,Subrack=MS,Slot=13"
    "admActiveSlot" Ref "ManagedElement=1,Equipment=1,Subrack=MS,Slot=12"
)

SET
(
    mo "ManagedElement=1,SwManagement=1,ReliableProgramUniter=http"
    exception none
    nrOfAttributes 2
    "admPassiveSlot" Ref "ManagedElement=1,Equipment=1,Subrack=MS,Slot=13"
    "admActiveSlot" Ref "ManagedElement=1,Equipment=1,Subrack=MS,Slot=12"
)

SET
(
    mo "ManagedElement=1,SwManagement=1,ReliableProgramUniter=spp_mp"
    exception none
    nrOfAttributes 2
    "admPassiveSlot" Ref "ManagedElement=1,Equipment=1,Subrack=MS,Slot=11"
    "admActiveSlot" Ref "ManagedElement=1,Equipment=1,Subrack=MS,Slot=10"
)

SET
(
    mo "ManagedElement=1,SwManagement=1,ReliableProgramUniter=ip_util"
    exception none
    nrOfAttributes 2
    "admPassiveSlot" Ref "ManagedElement=1,Equipment=1,Subrack=MS,Slot=11"
    "admActiveSlot" Ref "ManagedElement=1,Equipment=1,Subrack=MS,Slot=10"
)

SET
(
    mo "ManagedElement=1,SwManagement=1,ReliableProgramUniter=nss_mp"
    exception none
    nrOfAttributes 2
    "admPassiveSlot" Ref "ManagedElement=1,Equipment=1,Subrack=MS,Slot=11"
    "admActiveSlot" Ref "ManagedElement=1,Equipment=1,Subrack=MS,Slot=10"
)

SET
(
    mo "ManagedElement=1,SwManagement=1,ReliableProgramUniter=equip_mp"
    exception none
    nrOfAttributes 2
    "admPassiveSlot" Ref "ManagedElement=1,Equipment=1,Subrack=MS,Slot=11"
    "admActiveSlot" Ref "ManagedElement=1,Equipment=1,Subrack=MS,Slot=10"
)

SET
(
    mo "ManagedElement=1,SwManagement=1,ReliableProgramUniter=nsaal_adm"
    exception none
    nrOfAttributes 2
    "admPassiveSlot" Ref "ManagedElement=1,Equipment=1,Subrack=MS,Slot=11"
    "admActiveSlot" Ref "ManagedElement=1,Equipment=1,Subrack=MS,Slot=10"
)

SET
(
    mo "ManagedElement=1,SwManagement=1,ReliableProgramUniter=usaal_adm"
    exception none
    nrOfAttributes 2
    "admPassiveSlot" Ref "ManagedElement=1,Equipment=1,Subrack=MS,Slot=11"
    "admActiveSlot" Ref "ManagedElement=1,Equipment=1,Subrack=MS,Slot=10"
)

SET
(
    mo "ManagedElement=1,SwManagement=1,ReliableProgramUniter=aal5s_adm"
    exception none
    nrOfAttributes 2
    "admPassiveSlot" Ref "ManagedElement=1,Equipment=1,Subrack=MS,Slot=11"
    "admActiveSlot" Ref "ManagedElement=1,Equipment=1,Subrack=MS,Slot=10"
)

SET
(
    mo "ManagedElement=1,SwManagement=1,ReliableProgramUniter=aal5d_adm"
    exception none
    nrOfAttributes 2
    "admPassiveSlot" Ref "ManagedElement=1,Equipment=1,Subrack=MS,Slot=11"
    "admActiveSlot" Ref "ManagedElement=1,Equipment=1,Subrack=MS,Slot=10"
)

SET
(
    mo "ManagedElement=1,SwManagement=1,ReliableProgramUniter=aal0s_adm"
    exception none
    nrOfAttributes 2
    "admPassiveSlot" Ref "ManagedElement=1,Equipment=1,Subrack=MS,Slot=11"
    "admActiveSlot" Ref "ManagedElement=1,Equipment=1,Subrack=MS,Slot=10"
)

SET
(
    mo "ManagedElement=1,SwManagement=1,ReliableProgramUniter=aal0d_adm"
    exception none
    nrOfAttributes 2
    "admPassiveSlot" Ref "ManagedElement=1,Equipment=1,Subrack=MS,Slot=11"
    "admActiveSlot" Ref "ManagedElement=1,Equipment=1,Subrack=MS,Slot=10"
)

SET
(
    mo "ManagedElement=1,SwManagement=1,ReliableProgramUniter=aal2ncc"
    exception none
    nrOfAttributes 2
    "admPassiveSlot" Ref "ManagedElement=1,Equipment=1,Subrack=MS,Slot=11"
    "admActiveSlot" Ref "ManagedElement=1,Equipment=1,Subrack=MS,Slot=10"
)

SET
(
    mo "ManagedElement=1,SwManagement=1,ReliableProgramUniter=aal2_adm"
    exception none
    nrOfAttributes 2
    "admPassiveSlot" Ref "ManagedElement=1,Equipment=1,Subrack=MS,Slot=11"
    "admActiveSlot" Ref "ManagedElement=1,Equipment=1,Subrack=MS,Slot=10"
)

SET
(
    mo "ManagedElement=1,SwManagement=1,ReliableProgramUniter=aal2mp"
    exception none
    nrOfAttributes 2
    "admPassiveSlot" Ref "ManagedElement=1,Equipment=1,Subrack=MS,Slot=11"
    "admActiveSlot" Ref "ManagedElement=1,Equipment=1,Subrack=MS,Slot=10"
)

SET
(
    mo "ManagedElement=1,SwManagement=1,ReliableProgramUniter=atmmp"
    exception none
    nrOfAttributes 2
    "admPassiveSlot" Ref "ManagedElement=1,Equipment=1,Subrack=MS,Slot=11"
    "admActiveSlot" Ref "ManagedElement=1,Equipment=1,Subrack=MS,Slot=10"
)

SET
(
    mo "ManagedElement=1,SwManagement=1,ReliableProgramUniter=phy_stm1_mp"
    exception none
    nrOfAttributes 2
    "admPassiveSlot" Ref "ManagedElement=1,Equipment=1,Subrack=MS,Slot=11"
    "admActiveSlot" Ref "ManagedElement=1,Equipment=1,Subrack=MS,Slot=10"
)

SET
(
    mo "ManagedElement=1,SwManagement=1,ReliableProgramUniter=phy_e1_mp"
    exception none
    nrOfAttributes 2
    "admPassiveSlot" Ref "ManagedElement=1,Equipment=1,Subrack=MS,Slot=11"
    "admActiveSlot" Ref "ManagedElement=1,Equipment=1,Subrack=MS,Slot=10"
)

SET
(
    mo "ManagedElement=1,SwManagement=1,ReliableProgramUniter=aal_cc"
    exception none
    nrOfAttributes 2
    "admPassiveSlot" Ref "ManagedElement=1,Equipment=1,Subrack=MS,Slot=11"
    "admActiveSlot" Ref "ManagedElement=1,Equipment=1,Subrack=MS,Slot=10"
)

SET
(
    mo "ManagedElement=1,SwManagement=1,ReliableProgramUniter=aal05_ncc"
    exception none
    nrOfAttributes 2
    "admPassiveSlot" Ref "ManagedElement=1,Equipment=1,Subrack=MS,Slot=11"
    "admActiveSlot" Ref "ManagedElement=1,Equipment=1,Subrack=MS,Slot=10"
)

SET
(
    mo "ManagedElement=1,SwManagement=1,ReliableProgramUniter=ospf"
    exception none
    nrOfAttributes 2
    "admPassiveSlot" Ref "ManagedElement=1,Equipment=1,Subrack=MS,Slot=11"
    "admActiveSlot" Ref "ManagedElement=1,Equipment=1,Subrack=MS,Slot=10"
)

SET
(
    mo "ManagedElement=1,SwManagement=1,ReliableProgramUniter=inet"
    exception none
    nrOfAttributes 2
    "admPassiveSlot" Ref "ManagedElement=1,Equipment=1,Subrack=MS,Slot=11"
    "admActiveSlot" Ref "ManagedElement=1,Equipment=1,Subrack=MS,Slot=10"
)

SET
(
    mo "ManagedElement=1,SwManagement=1,ReliableProgramUniter=spas_res"
    exception none
    nrOfAttributes 2
    "admPassiveSlot" Ref "ManagedElement=1,Equipment=1,Subrack=MS,Slot=11"
    "admActiveSlot" Ref "ManagedElement=1,Equipment=1,Subrack=MS,Slot=10"
)

SET
(
    mo "ManagedElement=1,SwManagement=1,ReliableProgramUniter=sw_inst"
    exception none
    nrOfAttributes 2
    "admPassiveSlot" Ref "ManagedElement=1,Equipment=1,Subrack=MS,Slot=11"
    "admActiveSlot" Ref "ManagedElement=1,Equipment=1,Subrack=MS,Slot=10"
)

SET
(
    mo "ManagedElement=1,SwManagement=1,ReliableProgramUniter=aal2ap13"
    exception none
    nrOfAttributes 2
    "admPassiveSlot" Ref "ManagedElement=1,Equipment=1,Subrack=MS,Slot=9"
    "admActiveSlot" Ref "ManagedElement=1,Equipment=1,Subrack=MS,Slot=8"
)

SET
(
    mo "ManagedElement=1,SwManagement=1,ReliableProgramUniter=scc_server"
    exception none
    nrOfAttributes 2
    "admPassiveSlot" Ref "ManagedElement=1,Equipment=1,Subrack=MS,Slot=9"
    "admActiveSlot" Ref "ManagedElement=1,Equipment=1,Subrack=MS,Slot=8"
)

SET
(
    mo "ManagedElement=1,SwManagement=1,ReliableProgramUniter=scc_adm"
    exception none
    nrOfAttributes 2
    "admPassiveSlot" Ref "ManagedElement=1,Equipment=1,Subrack=MS,Slot=11"
    "admActiveSlot" Ref "ManagedElement=1,Equipment=1,Subrack=MS,Slot=10"
)



CREATE
(
    parent "ManagedElement=1,SwManagement=1"
    identity "ans_aal2ap_14"
    moType ReliableProgramUniter
    exception none
    nrOfAttributes 10
    "ReliableProgramUniterId" String "ans_aal2ap_14"
    "admActiveSlot" Ref "null"
    "admPassiveSlot" Ref "null"
    "normalisation" Integer 2
    "operationalMode" Integer 3
    "reliableProgramLabel" String "ans_aal2ap_14"
    "replication" Integer 4
    "reservedBy" Array Ref 0
    "switchOver" Integer 1
    "userLabel" String ""
)

SET
(
    mo "ManagedElement=1,SwManagement=1,ReliableProgramUniter=ans_aal2ap_14"
    exception none
    nrOfAttributes 2
    "admPassiveSlot" Ref "ManagedElement=1,Equipment=1,Subrack=MS,Slot=14"
    "admActiveSlot" Ref "ManagedElement=1,Equipment=1,Subrack=MS,Slot=15"
)



CREATE
(
    parent "ManagedElement=1,SwManagement=1"
    identity "ans_aal2cpsrc_14"
    moType ReliableProgramUniter
    exception none
    nrOfAttributes 10
    "ReliableProgramUniterId" String "ans_aal2cpsrc_14"
    "admActiveSlot" Ref "null"
    "admPassiveSlot" Ref "null"
    "normalisation" Integer 2
    "operationalMode" Integer 3
    "reliableProgramLabel" String "ans_aal2cpsrc_14"
    "replication" Integer 4
    "reservedBy" Array Ref 0
    "switchOver" Integer 1
    "userLabel" String ""
)

SET
(
    mo "ManagedElement=1,SwManagement=1,ReliableProgramUniter=ans_aal2cpsrc_14"
    exception none
    nrOfAttributes 2
    "admPassiveSlot" Ref "ManagedElement=1,Equipment=1,Subrack=MS,Slot=14"
    "admActiveSlot" Ref "ManagedElement=1,Equipment=1,Subrack=MS,Slot=15"
)

