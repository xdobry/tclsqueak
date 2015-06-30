PrsContext instproc checkExpectCmd {count command notifier options aoptions requiresPattern} {
    # it is expect from expect tcl based application
    if {$count==0} {
        return
    }
    if {$count==1} {
        set listElem [$command getElem 1]
        $listElem extractList
        set elems [$listElem getAsList]
        set start 0
        set ecount [llength $elems]
    } else {
        set elems [$command getAsList]
        set start 1
        set ecount [expr {$count+1}]
    }
    while {$start<$ecount} {
        set a [lindex $elems $start]
        # check if options
        while {$start<$ecount && [$a hasclass PrsLiteral]} {
            set cmd [$a prsString]
            if {$cmd in $options} {
                incr start
                set a [lindex $elems $start]
                set hasOptions 1
                continue
            }
            if {$cmd in $aoptions} {
                incr start
                if {$start>=$ecount} {
                    my addError "option requires argument" $a
                    return
                }
                incr start
                set a [lindex $elems $start]
                continue
            }
            break
        }
        # consume pattern
        if {$start<$ecount} {
            incr start
            if {$start<$ecount} {
                [lindex $elems $start] checkAsType body [self] $notifier
                incr start
                set a [lindex $elems $start]
            }
        } else {
            if {$requiresPattern} {
                my addError "no matching pattern after option" [lindex $elems [expr {$start-1}]]
            }
        }
    }
}
