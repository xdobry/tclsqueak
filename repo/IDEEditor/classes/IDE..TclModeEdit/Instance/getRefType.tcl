IDE::TclModeEdit instproc getRefType ref {
    set rtype [lindex $ref 0]
    if {$rtype eq "proc"} {
        if {[info command [lindex $ref 1]] ne ""} {
            return cmd
        }
    }
    return $rtype
}
