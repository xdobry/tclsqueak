IDE::SystemConfigMap proc saveAsFile {{file {}}} {
    my instvar fileName configName
    if {![my exists fileName]} {
        my set fileName newconfig.cfmap
    }
    if {$file eq ""} {
        set file [IDE::Dialog getSaveFile $fileName]
    }
    if {$file eq ""} return
    set of [open $file w]
    puts $of [my asScript]
    close $of
    set fileName $file
    set configName [file rootname [file tail $file]]
}
