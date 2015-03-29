PrsQuoted instproc isTkWidgetType context {
    my instvar list
    set literal [my getLiteralAfterVariable]
    if {[regexp {^\.} $literal]} {
        set first [lindex $list 0]
        if {[$first hasclass PrsVariable]} {
            set t [$context getTypeFromElem $first]
            set t0 [lindex $t 0]
            if {$t0 in {unknown tk}} {
                return 1
            }
        }
    }
    return 0
}
