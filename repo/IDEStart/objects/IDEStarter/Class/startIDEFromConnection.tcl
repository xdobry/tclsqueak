IDEStarter proc startIDEFromConnection connection {
    my instvar sqlhandle
    set sqlhandle $connection
    my setWaitDialog
    my parseCommandLineArgs
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
