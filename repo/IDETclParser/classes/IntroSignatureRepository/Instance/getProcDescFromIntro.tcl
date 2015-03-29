IntroSignatureRepository instproc getProcDescFromIntro procName {
    set argList [info args $procName]
    set types [list unknown]
    foreach a $argList {
        if {$a eq "args"} {
            lappend types [list * unknown $a]
        } elseif {[info default $procName $a var]} {
            lappend types [list ? unknown $a]
        } else {
            lappend types [list unknown $a]
        }
    }
    list $procName $types
}
