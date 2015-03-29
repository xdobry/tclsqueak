IDEStarter proc dumpCompId id {
    my loadPreferences
    my establishDBConnection
    puts [my getComponentBody $id]
    exit
}
