IDE::XOIntroProxy instproc getMethodParamDescForObject {object instproc} {
    if {![Object isobject $object] || ![Object isclass [$object info class]]} return
    set arguments [list]
    set defcount 0
    lassign [$object procsearch $instproc] class type method
    if {$type eq "proc"} {
        foreach arg [$class info args $instproc] {
            if {[$class info default $instproc $arg val]} {
                incr defcount
                lappend arguments [list $arg $val]
            } else {
                lappend arguments $arg
            }
        }
        list $arguments $defcount [$class info nonposargs $instproc]
    } else {
        foreach arg [$class info instargs $instproc] {
            if {[$class info instdefault $instproc $arg val]} {
                incr defcount
                lappend arguments [list $arg $val]
            } else {
                lappend arguments $arg
            }
        }
        list $arguments $defcount [$class info instnonposargs $instproc]
    }
}
