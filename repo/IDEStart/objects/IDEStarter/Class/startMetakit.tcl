IDEStarter proc startMetakit metakithandle {
    my instvar sqlhandle
    my setWaitDialog
    my parseCommandLineArgs
    set sqlhandle [XOMetakit new]
    $sqlhandle set handle $metakithandle
    $sqlhandle set connected 1
    $sqlhandle set unitOfWork 0
    my loadPreferences
    my loadIDECoreFromDB
    ::IDE initSystem
    ::IDE::Component initFromInterpreter
    ::IDE::CommentsContainer parseAndCleanMeta
    ::IDE::CommentsContainer makeTclGroupsFromMeta
    my initProcWrappersStruct
    ::IDE::DBPersistence setConnection [my set sqlhandle]
    ::IDE::System initDatabaseNoConnect
    ::IDE::ComponentPersistence synchronizeCoreSystem
    my loadConfigMapDevel
    my preloadComponents
    my startUpIDE
    my preexec
}
