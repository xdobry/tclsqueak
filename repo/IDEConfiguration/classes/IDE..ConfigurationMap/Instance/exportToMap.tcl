IDE::ConfigurationMap instproc exportToMap {{file {}}} {
    my instvar fileName
    if {![my exists fileName]} {
        my set fileName newconfig.cfmap
    }
    if {$file eq ""} {
        set file [IDE::Dialog getSaveFile $fileName]
    }
    if {$file eq ""} return
    set of [open $file w]
    puts $of [my getCMapString]
    close $of
}
