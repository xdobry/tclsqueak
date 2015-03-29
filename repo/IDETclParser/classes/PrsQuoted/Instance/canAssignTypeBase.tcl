PrsQuoted instproc canAssignTypeBase type {
    set type0 [lindex $type 0]
    if {$type0 eq "tk" ||  ($type0 eq "new" && [lindex $type 1] eq "tk")} {
        set literal [my getLiteralAfterVariable]
        if {[regexp {^\.[_a-z]} $literal]} {
            return 1
        }
    } elseif {$type eq "index"} {
        # TODO not exactrly var need to be int
        if {[regexp {^end-} [my prsString]]} {
            return 1
        }
    }
    return 0
}
