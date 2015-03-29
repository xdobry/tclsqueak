IDEStarter proc dumpConfId id {
    my loadPreferences
    my establishDBConnection
    puts [my getConfigMapBodyDeep $id]
    exit
}
