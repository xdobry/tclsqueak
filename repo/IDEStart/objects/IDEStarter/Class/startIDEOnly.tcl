IDEStarter proc startIDEOnly {} {
    my parseCommandLineArgs
    my loadPreferences
    my requireBaseComponents
    IDE initSystem
    ::IDE::Component initFromInterpreter
    ::IDE::CommentsContainer parseAndCleanMeta
    ::IDE::CommentsContainer makeTclGroupsFromMeta
    my loadConfigMapDevel
    my startUpIDE
    my preexec
}
