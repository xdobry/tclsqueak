IDE::System proc invokeProc {object proc} {
    if {![Object isobject $object]} return   
    set arguments {}
    set defarguments 0
    foreach arg [$object info args $proc] {
        if {[$object info default $proc $arg val]} {
            lappend arguments [list $arg $val]
            incr defarguments
        } else {
            lappend arguments $arg 
        }
    }
    my invokeProcWithArg $object $proc $arguments $defarguments
}
