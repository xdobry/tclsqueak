IDE::SyntaxChecker instproc protokollToFile args {
    my instvar errorsArr
    if {![array exists errorsArr]} {
        IDE::Dialog message "No errors to protokoll. Run a checker first"
        return
    }
    set file [IDE::Dialog getSaveFile errors.txt]
    if {$file eq ""} return
    set pfile [open $file w]
    for {set sid [array startsearch errorsArr]} {[array anymore errorsArr $sid]} {} {
        set method [array nextelement errorsArr $sid]
        set errors $errorsArr($method)
        set char 0
        set index 0
        set end 0
        foreach line [split [my getBodyForItem $method] \n] {
            puts $pfile $line
            incr char [string length $line]
            incr char
            if {!$end && $char>[lindex [lindex $errors $index] 0]} {
                puts $pfile "-----> [lindex [lindex $errors $index] 2]"
                incr index
                if {$index>=[llength $errors]} {
                    set end 1
                }
            }
        }
    }
    array donesearch errorsArr $sid
    close $pfile
}
