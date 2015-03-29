IDE::TclOOIntroProxy instproc getMethodParamDescForObject {object method} {
    if {![info object isa object $object]} return
    lassign [lindex [info object call $object $method] 0] generalTyp mname dobj mtype
    if {$mtype eq "filter"} {
        set arguments [info object filter $object $method]
    } elseif {$dobj eq "object"} {
        set arguments [lindex [info object definition $object $method] 0]
    } else {
        set arguments [lindex [info class definition $dobj $mname] 0]
    }
    set defcount 0
    foreach arg $arguments {
        if {[llength $arg]>1} {
            incr defcount
        } else {
        }
    }
    list $arguments $defcount {}
}
