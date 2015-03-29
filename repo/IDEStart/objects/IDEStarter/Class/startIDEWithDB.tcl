IDEStarter proc startIDEWithDB {} {
    my parseCommandLineArgs
    my loadPreferences
    my establishDBConnection
    my requireBaseComponents
    ::IDE initSystem
    ::IDE::Component initFromInterpreter
    ::IDE::CommentsContainer parseAndCleanMeta
    ::IDE::CommentsContainer makeTclGroupsFromMeta
    ::IDE::DBPersistence setConnection [my set sqlhandle]
    ::IDE::System initDatabaseNoConnect
    my loadConfigMapDevel
    my startUpIDE
    my preexec
}
