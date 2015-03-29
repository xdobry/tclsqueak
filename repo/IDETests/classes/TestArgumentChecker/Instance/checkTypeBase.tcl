TestArgumentChecker instproc checkTypeBase {elem type} {
    if {$type eq $elem || $type eq "unknown"} {
        return [list $type]
    }
    if {[llength $type]>1} {
        set otype [lindex $type 0]
        if {$otype eq "const"} {
            if {$elem eq [lindex $type 1]} {
                return _
            }
        }
    }
    my parseError $elem "unmatched type $type"
}
