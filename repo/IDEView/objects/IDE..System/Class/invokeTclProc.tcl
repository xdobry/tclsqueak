IDE::System proc invokeTclProc proc {
    set arguments [list]
    set defargCount 0
    foreach arg [::info args $proc] {
         if {[::info default $proc $arg val]} {
            lappend arguments [list $arg $val]
            incr defargCount
         } else {
            lappend arguments $arg 
         }
    }
    my invokeTclProcWithArg $proc $arguments $defargCount
}
