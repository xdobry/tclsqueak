IDEStarter proc startLoader {} {
    my parseCommandLineArgs
    my set isDevelopingMode 0
    my loadPreferences
    my establishDBConnection
    if {![my loadConfigMap]} {
        puts "you must specify '-configmap ConfigMapFile' parameter"
        exit
    }
}
