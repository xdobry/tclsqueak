OOIntroSignatureRepository instproc getTypesFromArgs argList {
    set types [list]
    foreach a $argList {
        if {$a eq "args"} {
            lappend types [list * unknown $a]
        } elseif {[llength $a]>1} {
            lappend types [list ? unknown [lindex $a 0]]
        } else {
            lappend types [list unknown $a]
        }
    }
    return $types
}
